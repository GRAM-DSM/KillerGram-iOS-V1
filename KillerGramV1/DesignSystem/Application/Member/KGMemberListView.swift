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
    
    private let countMemberLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .GRAY_800
        $0.font = .killerGramFont(.regular, style: .label)
    }
    
    init(sumMember: String, countMember: Int) {
        countMemberLabel.attributedText = NSAttributedString(string: "총 \(sumMember)명 중 \(countMember) 지원")
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 8
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
