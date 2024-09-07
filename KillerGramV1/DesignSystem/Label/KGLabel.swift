import Foundation
import Then
import SnapKit
import UIKit

class KGLabel: UIStackView {
    
    var title: String = ""
    var explain: String = ""
    let titleLabel = UILabel().then {
        $0.font = .killerGramFont(.semibold, style: .h3)
        $0.textColor = .WHITE
    }
    
    let explainLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .GRAY_600
        $0.font = .killerGramFont(.regular, style: .m3)
    }
    
    init(title: String, explain: String) {
        titleLabel.attributedText = NSAttributedString(string: title)
        explainLabel.attributedText = NSAttributedString(string: explain)
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 8
        self.layoutMargins = .init(top: 20, left: 24, bottom: 52, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            titleLabel,
            explainLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
