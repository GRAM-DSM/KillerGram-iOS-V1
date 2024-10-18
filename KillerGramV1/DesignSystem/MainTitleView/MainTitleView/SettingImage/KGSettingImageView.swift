import UIKit
import Then
import SnapKit

class KGSettingImageView: UIStackView {
     let settingButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "SettingImage"), for: .normal) // 버튼에 이미지 설정
    }
    
    init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [
            settingButton
        ].forEach(self.addArrangedSubview(_:))
        
        settingButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
    }
    
    
}
