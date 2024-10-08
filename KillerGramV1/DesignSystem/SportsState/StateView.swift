import UIKit
import Then
import SnapKit

class StateView: UIStackView {
    private let stateLabel = UILabel().then {
        $0.text = "완료"
    }
}
