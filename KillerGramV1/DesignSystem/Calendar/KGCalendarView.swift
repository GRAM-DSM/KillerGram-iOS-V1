import UIKit
import SnapKit
import Then

class KGCalendarView: UIStackView {
    private let sorryLabel = UILabel().then {
        $0.text = "달력 준비중입니다"
        $0.font = .killerGramFont(.semibold, style: .m3)
        $0.textColor = .WHITE
        $0.textAlignment = .center
        $0.backgroundColor = .GRAY_1100
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
            sorryLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
