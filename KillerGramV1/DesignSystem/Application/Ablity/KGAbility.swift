import UIKit
import Then

class KGAbility: UIStackView {
    private let myAblitiLabel = UILabel().then {
        $0.text = "내 실력"
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .m2)
    }
    
    let changeButton = UIButton().then {
        $0.setTitle("변경하기", for: .normal)
        $0.titleLabel?.textColor = .GRAY_400
        $0.titleLabel?.font = .killerGramFont(.regular, style: .label)
        $0.backgroundColor = .GRAY_1100
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 210
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            myAblitiLabel,
            changeButton
        ].forEach(self.addArrangedSubview(_:))
    }
}
