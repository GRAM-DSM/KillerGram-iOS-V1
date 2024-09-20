import UIKit
import Then

class KGSettingImageView: UIStackView {
    private let settingImage = UIImageView(frame: .zero).then {
        $0.image = .setting
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
        [
            settingImage
        ].forEach(self.addArrangedSubview(_:))
    }
}
