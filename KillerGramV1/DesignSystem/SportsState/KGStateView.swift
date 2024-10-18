import UIKit
import SnapKit
import Then

class KGStateView: UIStackView {
    
    private let memberView = MemberView()
    
    private let stateLabel = StateView()
    
    init(sports: String, maxMember: String, nowMember: Int) {
        memberView.sportsLabel.attributedText = NSAttributedString(string: sports)
        memberView.memberLabel.attributedText = NSAttributedString(string: "\(maxMember)명 중 \(nowMember)명 참여")
        stateLabel.stateLabel.text = "진행 중"
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 163
        self.backgroundColor = .GRAY_1100
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.MAIN.cgColor
        self.layer.cornerRadius = 8
        self.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
        self.isLayoutMarginsRelativeArrangement = true
        stateLabel.stateLabel.textColor = .MAIN
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            memberView,
            stateLabel
        ].forEach(self.addArrangedSubview(_:))
    }
}


