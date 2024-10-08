import Foundation

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
    
    func nowMember() -> Int {
        switch self {
        case .soccer:
            return 0
        case .basketball:
            return 0
        case .vallyball:
            return 0
        case.pingpong:
            return 0
        case.badminton:
            return 0
        case.women:
            return 0
        case.baseball:
            return 0
        case.health:
            return 0
        }
    }
}
