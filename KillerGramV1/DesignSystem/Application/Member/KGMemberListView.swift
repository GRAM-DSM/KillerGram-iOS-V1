import UIKit
import Then

class KGMemberListView: UIStackView {
    var sumMember: String = ""
    var countMember:Int = 0
    
    private let memberLabel = UILabel().then {
        $0.text = "인원 목록"
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .m2)
    }
    
    let countMemberLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .GRAY_800
        $0.font = .killerGramFont(.regular, style: .label)
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 8
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            memberLabel,
            countMemberLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
