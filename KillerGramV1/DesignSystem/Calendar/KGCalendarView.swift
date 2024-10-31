import UIKit
import SnapKit
import Then
import FSCalendar

class KGCalendarView: FSCalendar {
    init() {
        super.init(frame: .zero)
        self.scope = .week
        self.weekdayHeight = 58
        self.appearance.weekdayFont = .killerGramFont(.regular, style: .m3)
        self.appearance.weekdayTextColor = .GRAY_800
        self.locale = Locale(identifier: "ko_KO")
        self.firstWeekday = 2
        self.appearance.titleFont = .killerGramFont(.regular, style: .m1)
        self.appearance.titleDefaultColor = .WHITE
        self.appearance.titleSelectionColor = .clear
        self.appearance.titleTodayColor = .WHITE
        self.headerHeight = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
