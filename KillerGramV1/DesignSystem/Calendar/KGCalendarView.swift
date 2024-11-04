import UIKit
import SnapKit
import Then
import FSCalendar

class KGCalendarView: FSCalendar, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    init() {
        super.init(frame: .zero)
        
        self.scope = .week
        self.locale = Locale(identifier: "ko_KO")
        self.firstWeekday = 2
        self.delegate = self
        self.dataSource = self
        
        self.appearance.weekdayFont = .killerGramFont(.regular, style: .m3)
        self.weekdayHeight = 24
        self.appearance.weekdayTextColor = .GRAY_800
        
        self.appearance.titleFont = .killerGramFont(.regular, style: .m1)
        self.appearance.titleDefaultColor = .WHITE
        self.appearance.titleSelectionColor = .WHITE
        self.appearance.titleTodayColor = .WHITE
        
        self.headerHeight = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
