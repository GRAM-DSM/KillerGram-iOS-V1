import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class LevelViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = SigninCheckViewModel()
    
    private let titleLabel = KGLabel(title: "운동 실력을 알려주세요", explain: "평소 운동을 좋아하고 잘하시는지 알려주세요")
    
    private let completeButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "완료")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        addView()
        setLayout()
        
        self.completeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    private func addView() {
        [
            titleLabel,
            completeButton
        ].forEach{view.addSubview($0)}
    }
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
