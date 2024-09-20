import UIKit
import Then

class MainTitleView: UIStackView {
    private let logoImageView = KGLogoImageView()
    
    private let settingImageView = UIImageView(frame: .zero).then {
        $0.image = .setting
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 194
        self.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
