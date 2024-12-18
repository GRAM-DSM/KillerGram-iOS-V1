import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

enum checkAPI {
    check(email: userEmail)
}

class SigninCheckEmailViewController: BaseViewController {
    private let viewModel = SigninCheckViewModel()
    
    private let buttonString = NSAttributedString(string: "인증번호 재전송")
    
    
    private let titleLabel = KGLabel(title: "인증번호를 입력해 주세요", explain: "입력해주신 이메일로 인증번호를 전송해 드렸어요")
    
    private let checkTextField = KGTextField(explain: "인증번호", placeholder: "인증번호를 입력해 주세요").then {
        $0.textfield.textAlignment = .center
    }
    
    private let timerLabel = UILabel().then {
        $0.textColor = .MAIN
        $0.text = "5:00"
        $0.font = .killerGramFont(.regular, style: .label)
    }
    
    private let resendButton = UIButton().then {
        $0.setTitle("인증번호 재전송", for: .normal)
        $0.backgroundColor = .clear
        $0.setUnderline(font: .killerGramFont(.regular, style: .label), fgColor: .GRAY_400)
    }
    
    private let checkButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "인증")
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    
    
    
    override func attribute() {
        checkTextField.textfield.keyboardType = .numberPad
        
        self.checkButton.rx.tap.subscribe(onNext: {
                self.viewModel.checkButtonDidTap(
                    check: self.checkTextField.textfield.text!
                ) {
                    switch $0 {
                    case "password is empty":
                        self.checkTextField.errorGenerate(error: "인증번호를 입력해 주세요")
                        
                    case "password error":
                        self.checkTextField.errorGenerate(error: "인증번호가 틀렸습니다")
                        
                    case "password check ok":
                        self.checkTextField.errorGenerate(error: "")
                        self.navigationController?.pushViewController(SetPasswordViewController(), animated: true)
                    default:
                        return
                    }
                }
        }).disposed(by: disposeBag)
        
        self.resendButton.rx.tap.subscribe(onNext: {
            self.timerLabel.text = "5:00"
            self.viewModel.startTimer()
        }).disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.startTimer()
    }
    
    override func bind() {
        viewModel.timerText
            .bind(to: timerLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    override func addView() {
        [
            titleLabel,
            checkTextField,
            timerLabel,
            resendButton,
            checkButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        checkTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(checkTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(24)
        }
        resendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(checkTextField.snp.bottom).offset(16)
        }
        checkButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
