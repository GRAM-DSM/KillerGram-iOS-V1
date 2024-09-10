import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SigninSendEmailViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = SignupSendViewModel()
    
    private let titleLabel = KGLabel(title: "이메일을 입력해 주세요", explain: "이메일로 인증번호를 전송해 드릴게요")
    
    private let emailTextField = KGTextField(explain: "이메일", placeholder: "이메일을 입력해주세요").then {
        $0.explainLabel.isHidden = false
    }
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        addView()
        setLayout()
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.viewModel.nextButtonDidTap(
                email: self.emailTextField.textfield.text!
            ) {
                switch $0 {
                case "email is empty":
                    self.emailTextField.errorGenerate(error: "이메일을 입력해 주세요")
                case "email error":
                    self.emailTextField.errorGenerate(error: "이메일 형식이 잘못되었습니다")
                    
                case "email check ok":
                    self.emailTextField.errorGenerate(error: "")
                    self.navigationController?.pushViewController(SigninCheckEmailViewController(), animated: true)

                default:
                    return
                }
            }
        })
        .disposed(by: disposeBag)
    }
    
    private func addView() {
        [
            titleLabel,
            emailTextField,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(385)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
