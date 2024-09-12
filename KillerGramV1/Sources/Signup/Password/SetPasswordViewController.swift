import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SetPasswordViewController: UIViewController {
    private let viewModel = SetPasswordViewModel()
    private let disposeBag = DisposeBag()
    
    private let titleLabel = KGLabel(title: "비밀번호를 입력해 주세요", explain: "비밀번호는 영어와 숫자를 조합해 만들어 주세요")
    
    private let passwordTextField = KGTextField(explain: "비밀번호", placeholder: "비밀번호(8~12자)를 입력해 주세요")
    
    private let checkpasswordTextField = KGTextField(explain: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해 주세요")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .BACK
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        addView()
        setLayout()
        
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(FillNameViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    private func addView() {
        [
            titleLabel,
            passwordTextField,
            checkpasswordTextField,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        checkpasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
