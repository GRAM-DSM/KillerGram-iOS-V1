import UIKit
import Then

class KGAbilityView: UIStackView {
    private let myAblitiLabel = UILabel().then {
        $0.text = "내 실력"
        $0.textColor = .WHITE
        $0.font = .killerGramFont(.semibold, style: .m2)
    }
    private let showMyAblituLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .MAIN
        $0.font = .killerGramFont(.regular, style: .m3)
    }
    private let changeButotn = UIButton().then {
        $0.setTitle("변경하기", for: <#T##UIControl.State#>)
    }
}
