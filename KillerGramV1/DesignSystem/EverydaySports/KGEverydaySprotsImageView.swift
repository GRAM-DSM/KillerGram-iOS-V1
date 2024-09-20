import UIKit
import Then
import SnapKit

class KGEverydaySprotsImageView: UIStackView {
    private var image: UIImage
    private var title: String
    private let sportsImage = UIImageView(frame: .zero)
    private let sportsTitle = UILabel().then {
        $0.font = .killerGramFont(.regular, style: .label)
    }
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
        super.init(frame: .zero)
        
        sportsImage.image = image
        sportsTitle.attributedText = NSAttributedString(string: title)
        
        self.axis = .vertical
        self.spacing = 4
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            sportsImage,
            sportsTitle
        ].forEach(self.addArrangedSubview(_:))
        
        sportsImage.snp.makeConstraints{
            $0.width.height.equalTo(76)
        }
    }
}

