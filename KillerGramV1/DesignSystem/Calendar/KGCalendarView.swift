import UIKit
import SnapKit
import Then
import FSCalendar

class KGCalendarView: UIStackView, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    private let calendar: FSCalendar = FSCalendar(frame: .zero).then {
        $0.headerHeight = 28
    }
    
    init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
        calendar.scope = .week
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.weekdayTextColor = .gray
        calendar.appearance.titleSelectionColor = .blue
        calendar.appearance.titleDefaultColor = .white
        calendar.weekdayHeight = 20
        
        calendar.appearance.headerTitleColor = .clear
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.headerHeight = 66
        calendar.firstWeekday = 2
        calendar.appearance.weekdayFont = .systemFont(ofSize: 20)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            calendar,
        ].forEach(self.addArrangedSubview(_:))
    }
    
    // 토요일과 일요일 날짜 숨기기
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let weekday = Calendar.current.component(.weekday, from: date)
        if weekday == 1 || weekday == 7 { // 일요일(1)과 토요일(7)은 숨김
            return .clear
        }
        return nil // 월~금은 기본 색상으로 표시
    }
    
}
