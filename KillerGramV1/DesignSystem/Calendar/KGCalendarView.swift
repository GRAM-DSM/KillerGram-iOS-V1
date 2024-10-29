import UIKit
import SnapKit
import Then
import FSCalendar

class KGCalendarView: StateView {
    private let calendar = FSCalendar(frame: .zero).then {
        $0.scope = .week
    }
}
