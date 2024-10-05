import UIKit
import SnapKit
import Then

class KGTimeView: UIStackView {
    private let titleLabel = UILabel().then {
        $0.text = "시간"
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .m2)
    }
    
    private let timeLabel = UILabel().then {
        $0.text = "점심시간"
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.regular, style: .m3)
    }
    
    required init() {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 8
        self.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 270)
        self.isLayoutMarginsRelativeArrangement = true
        self.backgroundColor = .GRAY_1100
        self.layer.cornerRadius = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            titleLabel,
            timeLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
