import UIKit
import Then
import SnapKit

class StateView: UIStackView {
    private let stateLabel = UILabel().then {
        $0.text = "진행 중"
        $0.font = .killerGramFont(.regular, style: .m3)
        $0.textColor = .GRAY_600
    }
    
    init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            stateLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
