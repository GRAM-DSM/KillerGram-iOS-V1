import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SigninCheckEmailViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = SigninCheckViewModel()
    let buttonString = NSAttributedString(string: "인증번호 재전송")
    
    
    let titleLabel = KGLabel(title: "인증번호를 입력해 주세요", explain: "입력해주신 이메일로 인증번호를 전송해 드렸어요")
    
    
    let firstTextField = UITextField().then {
        $0.backgroundColor = .GRAY_1100
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .h1)
    }
    
    let secondTextField = UITextField().then {
        $0.backgroundColor = .GRAY_1100
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .h1)
    }
    
    let thirdTextField = UITextField().then {
        $0.backgroundColor = .GRAY_1100
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .h1)
    }
    
    let lastTextField = UITextField().then {
        $0.backgroundColor = .GRAY_1100
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .h1)
    }
    
    let timerLabel = UILabel().then {
        $0.textColor = .MAIN
        $0.text = ""
        $0.font = .killerGramFont(.regular, style: .label)
    }
    
    let resendButton = UIButton().then {
        $0.setTitle("인증번호 재전송", for: .normal)
        $0.backgroundColor = .clear
        $0.setUnderline(font: .killerGramFont(.regular, style: .label), fgColor: .GRAY_400)
    }
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        addView()
        setLayout()
        
        self.resendButton.rx.tap.subscribe(onNext: {
            self.viewModel.timerStart()
        })
        .disposed(by: disposeBag)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.timerStart()
    }
    
    func addView() {
        [
            titleLabel,
            firstTextField,
            secondTextField,
            thirdTextField,
            lastTextField,
            timerLabel,
            resendButton
        ].forEach{view.addSubview($0)}
    }
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(72)
            $0.height.equalTo(80)
        }
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(firstTextField.snp.trailing).offset(18)
            $0.width.equalTo(72)
            $0.height.equalTo(80)
        }
        thirdTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(secondTextField.snp.trailing).offset(18)
            $0.width.equalTo(72)
            $0.height.equalTo(80)
        }
        lastTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(thirdTextField.snp.trailing).offset(18)
            $0.width.equalTo(72)
            $0.height.equalTo(80)
        }
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        resendButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(lastTextField.snp.bottom).offset(24)
        }
    }
}


