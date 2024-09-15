import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {
    private let viewModel = LoginViewModel()
    
    private let logoImageVIew = UIImageView().then {
        $0.image = .logo
    }
    
    let emailTextField = KGTextField(explain: "", placeholder: "이메일을 입력해 주세요")
    
    private let passwordTextField = KGTextField(explain: "", placeholder: "비밀번호을 입력해 주세요")
    
    private let loginButtton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "로그인")
    }

    private let signinButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.GRAY_700, for: .normal)
        $0.titleLabel?.font = .killerGramFont(.regular, style: .label)
    }
    
    private let middleView = UIView().then {
        $0.backgroundColor = .GRAY_900
    }
    
    private let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.backgroundColor = .clear
        $0.setTitleColor(.GRAY_700, for: .normal)
        $0.titleLabel?.font = .killerGramFont(.regular, style: .label)
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    

    override func attribute() {
        emailTextField.textfield.keyboardType = .emailAddress
        passwordTextField.textfield.keyboardType = .asciiCapable
        
        self.navigationItem.hidesBackButton = true
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.loginButtton.rx.tap.subscribe(onNext: {
            self.viewModel.loginButtonDidTap(
                email: self.emailTextField.textfield.text!,
                password: self.passwordTextField.textfield.text!
            ) {
                switch $0 {
                case "email is empty":
                    self.emailTextField.errorGenerate(error: "이메일을 입력해 주세요")
                    
                case "email error":
                    self.emailTextField.errorGenerate(error: "이메일 형식이 잘못되었습니다")
                    
                case "email check ok":
                    self.emailTextField.errorGenerate(error: "")
                    
                case "password is empty":
                    self.passwordTextField.errorGenerate(error: "비밀번호를 입력해 주세요")
                    
                case "password error":
                    self.passwordTextField.errorGenerate(error: "비밀번호 형식이 잘못되었습니다")
                
                case "password check ok":
                    self.passwordTextField.errorGenerate(error: "")
                    
                default:
                    return
                }
            }
        })
        .disposed(by: disposeBag)
        
        self.signinButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(
                SigninSendEmailViewController(),
                animated: true
            )
        })
        .disposed(by: disposeBag)
        
        self.findPasswordButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(FindPasswordSendEmailViewController(), animated: true)
        })
    }
    
    override func addView() {
        [
            logoImageVIew, emailTextField, passwordTextField, loginButtton, signinButton, middleView, findPasswordButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        logoImageVIew.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(130)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageVIew.snp.bottom).offset(60)
            $0.left.right.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        loginButtton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.left.trailing.equalToSuperview().inset(24)
        }
        signinButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(115.5)
            $0.top.equalTo(loginButtton.snp.bottom).offset(24)
        }
        middleView.snp.makeConstraints {
            $0.leading.equalTo(signinButton.snp.trailing).offset(16)
            $0.top.equalTo(loginButtton.snp.bottom).offset(30)
            $0.width.equalTo(1)
            $0.height.equalTo(16)
        }
        findPasswordButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(115.5)
            $0.top.equalTo(loginButtton.snp.bottom).offset(24)
            $0.leading.equalTo(middleView.snp.trailing).offset(16)
        }
    }
}
