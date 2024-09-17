import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class LevelViewController: BaseViewController {
    private let viewModel = LevelViewModel()
    
    private let titleLabel = KGLabel(title: "운동 실력을 알려주세요", explain: "평소 운동을 좋아하고 잘하시는지 알려주세요")
    
    private let highButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    private let middleButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    private let lowButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    private let completeButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "완료")
    }
    
    override func attribute() {
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        
        highButton.setAttributedTitle(viewModel.highAttributedstr, for: .normal)
        middleButton.setAttributedTitle(viewModel.middleAttributedstr, for: .normal)
        lowButton.setAttributedTitle(viewModel.lowAttributedstr, for: .normal)

        
        self.completeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    
    override func addView() {
        [
            titleLabel,
            highButton,
            middleButton,
            lowButton,
            completeButton
        ].forEach{view.addSubview($0)}
    }
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        highButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(342)
            $0.height.equalTo(70)
        }
        middleButton.snp.makeConstraints {
            $0.top.equalTo(highButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(342)
            $0.height.equalTo(70)
        }
        lowButton.snp.makeConstraints {
            $0.top.equalTo(middleButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(342)
            $0.height.equalTo(70)
        }
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.width.equalTo(342)
            $0.height.equalTo(70)
        }
    }
}
