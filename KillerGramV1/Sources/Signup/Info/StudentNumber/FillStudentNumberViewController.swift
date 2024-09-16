import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class FillStudentNumberViewController: BaseViewController {
    private let viewModel = SigninCheckViewModel()
    
    private let titleLabel = KGLabel(title: "학번을 입력해 주세요", explain: "원활한 서비스를 위해 학번을 입력해 주세요")
    
    private let studentNumberTextField = KGTextField(explain: "학번", placeholder: "학번을 입력해 주세요 ex) 1414")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func attribute() {
        studentNumberTextField.textfield.keyboardType = .numberPad
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(GenderViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    override func addView() {
        [
            titleLabel,
            studentNumberTextField,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        studentNumberTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
