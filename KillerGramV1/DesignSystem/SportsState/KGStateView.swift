import UIKit
import SnapKit
import Then

class KGStateView: UIStackView {
    private let sportsLabel = UILabel().then {
        $0.font = .killerGramFont(.semibold, style: .m1)
        $0.textColor = .WHITE
    }
    
}
