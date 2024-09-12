import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LevelViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = SigninCheckViewModel()
    
   private  let titleLabel = KGLabel(title: "운동 실력을 알려주세요", explain: "평소 운동을 좋아하고 잘하시는지 알려주세요")
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "완료")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        view.backgroundColor = .BACK
        
        addView()
        setLayout()
        
        self.nextButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    private func addView() {
        [
            titleLabel,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    
}
