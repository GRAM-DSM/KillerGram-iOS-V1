import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class FillNameViewController: BaseViewController {
    
    private let viewModel = FillNameViewModel()
    
    private let titleLabel = KGLabel(title: "이름을 입력해 주세요", explain: "원할한 서비스를 위해 이름을 입력해 주세요")
    
    private let nameTextField = KGTextField(explain: "이름", placeholder: "이름을 입력해 주세요")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    
    override func attribute() {
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.viewModel.nextButtonDidTap(
                name: self.nameTextField.textfield.text!
            ) {
                switch $0 {
                case "name is empty":
                    self.nameTextField.errorGenerate(error: "이름을 입력해 주세요")
                    
                case "name check ok":
                    self.nameTextField.errorGenerate(error: "")
                    self.navigationController?.pushViewController(FillStudentNumberViewController(), animated: true)
                default:
                    return
                }
            }
        }).disposed(by: disposeBag)
    }
        
        override func addView() {
            [
                titleLabel,
                nameTextField,
                nextButton
            ].forEach{view.addSubview($0)}
        }
        
        override func setLayout() {
            titleLabel.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                $0.leading.trailing.equalToSuperview()
            }
            nameTextField.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom)
                $0.leading.trailing.equalToSuperview()
            }
            nextButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(60)
                $0.leading.trailing.equalToSuperview().inset(24)
            }
        }
    }
