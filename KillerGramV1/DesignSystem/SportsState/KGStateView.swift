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

extension KGSports {
    func maxMember() -> String {
        switch self {
        case .soccer:
            return "16"
        case .basketball:
            return "14"
        case .vallyball:
            return "9"
        case.pingpong:
            return "10"
        case.badminton:
            return "16"
        case.women:
            return "20"
        case.baseball:
            return "20"
        case.health:
            return "15"
        }
    }
}
