import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SetPasswordViewController: BaseViewController {
    private let viewModel = SetPasswordViewModel()
    
    private let titleLabel = KGLabel(title: "비밀번호를 입력해 주세요", explain: "비밀번호는 영어와 숫자를 조합해 만들어 주세요")
    
    private let passwordTextField = KGTextField(explain: "비밀번호", placeholder: "비밀번호(8~12자)를 입력해 주세요")
    
    private let checkPasswordTextField = KGTextField(explain: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해 주세요")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    
    
    override func attribute() {
        passwordTextField.textfield.keyboardType = .asciiCapable
        checkPasswordTextField.textfield.keyboardType = .asciiCapable
        
        self.navigationItem.hidesBackButton = true
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.viewModel.checkButtonDidTap(
                password: self.passwordTextField.textfield.text!
            ) {
                switch $0 {
                case "password is empty":
                    self.passwordTextField.errorGenerate(error: "비밀번호를 입력해 주세요")
                    
                case "password error":
                    self.passwordTextField.errorGenerate(error: "비밀번혹 틀렸습니다")
                    
                case "password check ok":
                    self.passwordTextField.errorGenerate(error: "")
                default:
                    return
                }
            }
            
            self.viewModel.checkButtonDidTap(
                password: self.checkPasswordTextField.textfield.text!
            ) {
                switch $0 {
                case "password is empty":
                    self.checkPasswordTextField.errorGenerate(error: "비밀번호를 다시 입력해 주세요")

                case "password check ok":
                    if self.passwordTextField.textfield.text != self.checkPasswordTextField.textfield.text {
                        self.checkPasswordTextField.errorGenerate(error: "비밀번호가 일치하지 않습니다")
                    }
                    else {
                        self.checkPasswordTextField.errorGenerate(error: "")
                    }
                default:
                    return
                }
            }
            
            if self.passwordTextField.errorLabel.isHidden == true && self.checkPasswordTextField.errorLabel.isHidden == true && self.passwordTextField.textfield.text == self.checkPasswordTextField.textfield.text {
                self.navigationController?.pushViewController(FillNameViewController(), animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
    override func addView() {
        [
            titleLabel,
            passwordTextField,
            checkPasswordTextField,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
