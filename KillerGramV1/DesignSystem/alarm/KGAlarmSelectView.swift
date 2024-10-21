import UIKit
import SnapKit
import Then

class KGAlarmSelectView: UIStackView {
    private let alarmLabel = UILabel().then {
        $0.text = "알림"
        $0.font = .killerGramFont(.semibold, style: .m2)
        $0.textColor = .WHITE
    }
    
    private let toggleButton = 
}
