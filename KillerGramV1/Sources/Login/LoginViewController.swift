import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = LoginViewModel()
    private let logoImageVIew = UIImageView().then {
        $0.image = .logo
    }
    
    private let emailTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해 주세요", attributes: [.foregroundColor: UIColor.GRAY_800])
        $0.backgroundColor = .GRAY_1000
        $0.layer.cornerRadius = 8
        $0.leftPadding()
    }
    
    private let passwordTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호을 입력해 주세요", attributes: [.foregroundColor: UIColor.GRAY_800])
        $0.backgroundColor = .GRAY_1000
        $0.layer.cornerRadius = 8
        $0.leftPadding()
    }
    
    private let loginButtton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .MAIN
        $0.setTitleColor(.SECONDARY, for: .normal)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        addView()
        setLayout()

        self.loginButtton.rx.tap.subscribe(onNext: {
            self.viewModel.loginButtonDidTap()
        })
        .disposed(by: disposeBag)
    }
    
    private func addView() {
        [
            logoImageVIew, emailTextField, passwordTextField, loginButtton
        ].forEach{view.addSubview($0)}
    }
    
    private func setLayout() {
        logoImageVIew.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(130)
        }
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageVIew.snp.bottom).offset(60)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
        loginButtton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
            $0.width.equalToSuperview().inset(24)
            $0.height.equalTo(56)
        }
    }
}

private extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        
        self.leftView = paddingView
        
        self.leftViewMode = ViewMode.always
    }
}
