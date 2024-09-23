import UIKit
import Then

class KGAbilityView: UIStackView {
    private let ablityView = KGAbility()
    
    let showMyAblityLabel = UILabel().then {
        $0.text = "상"
        $0.textColor = .MAIN
        $0.font = .killerGramFont(.regular, style: .m3)
    }
    
    
    init() {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 8
        self.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        self.isLayoutMarginsRelativeArrangement = true
        self.backgroundColor = .GRAY_1100
        self.layer.cornerRadius = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            ablityView,
            showMyAblityLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
