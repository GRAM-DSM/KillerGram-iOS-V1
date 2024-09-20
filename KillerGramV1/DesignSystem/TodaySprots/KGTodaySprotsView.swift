import UIKit

class KGTodaySprotsView: UIStackView {
    private let todaySpotsImage = UIImageView(frame: .zero).then {
        $0.image = .todaySportsBadminton
    }
    
    init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 8, left: 24, bottom: 16, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            todaySpotsImage
        ].forEach(self.addArrangedSubview(_:))
    }
}
