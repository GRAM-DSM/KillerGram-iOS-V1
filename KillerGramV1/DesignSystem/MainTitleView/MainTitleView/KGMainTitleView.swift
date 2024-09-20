import UIKit
import Then

class KGMainTitleView: UIStackView {
    private let logoImageView = KGLogoImageView()
    
    private let settingImageView = KGSettingImageView()
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 170
        self.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            logoImageView,
            settingImageView
        ].forEach(self.addArrangedSubview(_:))
    }
}
