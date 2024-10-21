import UIKit
import SnapKit
import Then

class KGAlarmSelectView: UIStackView {
    private let alarmLabel = UILabel().then {
        $0.text = "알림"
        $0.font = .killerGramFont(.semibold, style: .m2)
        $0.textColor = .WHITE
    }
    
    private let toggleSwitch = UISwitch().then {
        $0.onTintColor = .SECONDARY
        $0.thumbTintColor = .MAIN
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 262
        self.layoutMargins = .init(top: 20, left: 24, bottom: 20, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            alarmLabel,
            toggleSwitch
        ].forEach(self.addArrangedSubview(_:))
    }
}
