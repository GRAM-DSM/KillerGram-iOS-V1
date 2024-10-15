import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class AblityViewController: BaseViewController {
    var ablity: String = ""
    
    private let ablityView = KGAbilityView()
        
    private let viewModel = LevelViewModel()
    
    private let titleLabel = KGLabel(title: "운동 실력을 알려주세요", explain: "평소 운동을 좋아하고 잘하시는지 알려주세요")
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    let highButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.layer.borderWidth = 1
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    let middleButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.layer.borderWidth = 1
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    let lowButton = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .GRAY_1100
        $0.setTitleColor(.GRAY_500, for: .normal)
        $0.layer.borderWidth = 1
        $0.contentHorizontalAlignment = .left
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    private let completeButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "확인")
    }
    
    private func highButtonDidTap() {
        highButton.layer.borderColor = UIColor.MAIN.cgColor
        middleButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        lowButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        ablity = "상"
        ablityView.showMyAblityLabel.setNeedsDisplay()
    }
    private func middleButtonDidTap() {
        middleButton.layer.borderColor = UIColor.MAIN.cgColor
        highButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        lowButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        ablity = "중"
        ablityView.showMyAblityLabel.setNeedsDisplay()
    }

    private func lowButtonDidTap() {
        lowButton.layer.borderColor = UIColor.MAIN.cgColor
        highButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        middleButton.layer.borderColor = UIColor.GRAY_1100.cgColor
        ablity = "하"
    }
    
    override func attribute() {
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        highButton.setAttributedTitle(viewModel.highAttributedstr, for: .normal)
        middleButton.setAttributedTitle(viewModel.middleAttributedstr, for: .normal)
        lowButton.setAttributedTitle(viewModel.lowAttributedstr, for: .normal)
        
        
        self.highButton.rx.tap.subscribe(onNext: {
            self.highButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.middleButton.rx.tap.subscribe(onNext: {
            self.middleButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.lowButton.rx.tap.subscribe(onNext: {
            self.lowButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.completeButton.rx.tap.subscribe(onNext: {
            self.ablityView.showMyAblityLabel.text = self.ablity
            self.ablityView.showMyAblityLabel.setNeedsDisplay()
            self.navigationController?.popViewController(animated: true)
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
            $0.height.equalTo(56)
        }
    }
}
