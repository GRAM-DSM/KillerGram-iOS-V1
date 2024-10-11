import UIKit

class KGTodaySprotsView: UIStackView {
    private let todaySpotsImage = UIImageView(frame: .zero).then {
        $0.image = .todaySportsBadminton
    }
    
    init() {
        super.init(frame: .zero)
        todaySpotsImage.isUserInteractionEnabled = true
        
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
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
