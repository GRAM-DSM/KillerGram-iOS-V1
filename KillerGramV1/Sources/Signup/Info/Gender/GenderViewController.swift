import SnapKit
import Then
import UIKit
import RxSwift
import RxCocoa


class GenderViewController: BaseViewController {
    private let viewModel = GenderViewModel()
    
    private let titleLabel = KGLabel(title: "성별을 알려주세요", explain: "원활한 서비스를 위해 성별을 알려주세요")
    
    let maleImage = UIImageView().then {
        $0.backgroundColor = .GRAY_1100
        $0.image = .male
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.GRAY_1100.cgColor
    }
    
    let femaleImage = UIImageView().then {
        $0.backgroundColor = .GRAY_1100
        $0.image = .female
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.GRAY_1100.cgColor
    }
    
    private let nextButton = KGButton(style: .round, colorStyle: .green).then {
        $0.setText(text: "다음")
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    @objc func maleImageDidTap() {
        maleImage.layer.borderColor = UIColor.MAIN.cgColor
        femaleImage.layer.borderColor = UIColor.GRAY_1100.cgColor
    }
    
    @objc func femaleImageDidTap() {
        maleImage.layer.borderColor = UIColor.GRAY_1100.cgColor
        femaleImage.layer.borderColor = UIColor.MAIN.cgColor
    }
    

    
    override func attribute() {
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationItem.title = "정보입력"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        maleImage.isUserInteractionEnabled = true
        femaleImage.isUserInteractionEnabled = true
        
        let maleEvent = UITapGestureRecognizer(target: self, action: #selector(maleImageDidTap))
        let femaleEvent = UITapGestureRecognizer(target: self, action: #selector(femaleImageDidTap))
        
        maleImage.addGestureRecognizer(maleEvent)
        femaleImage.addGestureRecognizer(femaleEvent)
        
        
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
