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
    
    init(sports: KGSports, maxMember: String, nowMember: Int) {
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
