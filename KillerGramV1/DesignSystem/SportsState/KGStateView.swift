import UIKit
import SnapKit
import Then

class KGStateView: UIStackView {
    
    private let sportsLabel = UILabel().then {
        $0.font = .killerGramFont(.semibold, style: .m1)
        $0.textColor = .WHITE
    }
    
    private let memberLabel = UILabel().then {
        $0.font = .killerGramFont(.regular, style: .label)
        $0.textColor = .MAIN
    }
    
    private let stateLabel = StateView()
    
    init(sports: String, maxMember: String, nowMember: Int) {
        sportsLabel.attributedText = NSAttributedString(string: sports)
        memberLabel.attributedText = NSAttributedString(string: "\(maxMember)명 중 \(nowMember)명 참여")
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 163
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


