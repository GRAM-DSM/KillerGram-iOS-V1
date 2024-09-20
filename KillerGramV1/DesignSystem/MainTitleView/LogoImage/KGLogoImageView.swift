import UIKit
import Then

class KGLogoImageView: UIStackView {
    private let KGLogoImage = UIImageView(frame: .zero).then {
        $0.image = .kgLogo
    }
    
    required init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 16, left: 12, bottom: 16, right: 12)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            KGLogoImage
        ].forEach(self.addArrangedSubview(_:))
    }
}
