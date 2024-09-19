import UIKit
import Then
import SnapKit
import RxCocoa
import RxSwift


class SetNewPasswordViewController: BaseViewController {
    private let viewModel = SetNewPasswordViewModel()
    
    private let titleLabel = KGLabel(title: "새 비밀번호를 입력해 주세요", explain: "비밀번호는 영어와 숫자를 조합해 만들어 주세요")
    
    private let newPasswordTextField = KGTextField(explain: "비밀번호", placeholder: "비밀번호(8~12자)를 입력해 주세요")
    
    private let checkPasswordTextField = KGTextField(explain: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해 주세요")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
        
        self.viewModel.checkButtonDidTap(
            password: self.checkPasswordTextField.textfield.text!
        ) {
            switch $0 {
            case "password is empty":
                self.checkPasswordTextField.errorGenerate(error: "비밀번호를 다시 입력해 주세요")
                
            case "password check ok":
                if self.newPasswordTextField.textfield.text != self.checkPasswordTextField.textfield.text {
                    self.checkPasswordTextField.errorGenerate(error: "비밀번호가 일치하지 않습니다")
                }
                else {
                    self.checkPasswordTextField.errorGenerate(error: "")
                }
            default:
                return
            }
            
            if self.newPasswordTextField.errorLabel.isHidden == true && self.checkPasswordTextField.errorLabel.isHidden == true && self.newPasswordTextField.textfield.text == self.checkPasswordTextField.textfield.text {
                self.navigationController?.pushViewController(FillNameViewController(), animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
    override func addView() {
        [
            titleLabel,
            newPasswordTextField,
            checkPasswordTextField,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        newPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(newPasswordTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
