import UIKit
import Then

class KGMemberView: UIStackView {
    private let memberLabel = KGMemberListView()
    
    private let memberNameLabel = UILabel().then {
        $0.text = "1414 정현석"
        $0.font = .killerGramFont(.regular, style: .m3)
        $0.textColor = .WHITE
    }
    
    init(sumMember: String, countMember: Int) {
        memberLabel.countMemberLabel.attributedText = NSAttributedString(string: "총 \(sumMember)명 중 \(countMember) 지원")
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 8
        self.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 141)
        self.isLayoutMarginsRelativeArrangement = true
        self.backgroundColor = .GRAY_1100
        self.layer.cornerRadius = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            memberLabel,
            memberNameLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}
