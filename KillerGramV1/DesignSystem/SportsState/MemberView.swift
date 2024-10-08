import Foundation

import UIKit
import SnapKit
import Then

class MemberView: UIStackView {
    
    private let sportsLabel = UILabel().then {
        $0.font = .killerGramFont(.semibold, style: .m1)
        $0.textColor = .WHITE
    }
    
    private let memberLabel = UILabel().then {
        $0.font = .killerGramFont(.regular, style: .label)
        $0.textColor = .MAIN
    }
        
    init(sports: String, maxMember: String, nowMember: Int) {
        sportsLabel.attributedText = NSAttributedString(string: sports)
        memberLabel.attributedText = NSAttributedString(string: "\(maxMember)명 중 \(nowMember)명 참여")
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 7
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
