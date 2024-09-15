import SnapKit
import Then
import UIKit
import RxSwift
import RxCocoa


class GenderViewController: BaseViewController {
    private let viewModel = SigninCheckViewModel()
    
    private let titleLabel = KGLabel(title: "성별을 알려주세요", explain: "원활한 서비스를 위해 성별을 알려주세요")
    
    private let maleImage = UIImageView().then {
        $0.backgroundColor = .GRAY_1100
        $0.image = .male
        $0.layer.cornerRadius = 8
    }
    
    private let femaleImage = UIImageView().then {
        $0.backgroundColor = .GRAY_1100
        $0.image = .female
        $0.layer.cornerRadius = 8
    }
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func attribute() {
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        addView()
        setLayout()
        self.nextButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(LevelViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    override func addView() {
        [
            titleLabel,
            maleImage,
            femaleImage,
            nextButton
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        maleImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(160)
        }
        femaleImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.height.equalTo(160)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
