import UIKit
import SnapKit
import Then
import FSCalendar

class KGCalendarView: UIStackView, FSCalendarDelegate, FSCalendarDataSource {
    
    private let calendar = FSCalendar().then {
        $0.scope = .week
        
        $0.appearance.weekdayFont = .killerGramFont(.regular, style: .m3)
        $0.weekdayHeight = 24
        $0.appearance.weekdayTextColor = .GRAY_800
        $0.locale = Locale(identifier: "ko_KO")
        $0.firstWeekday = 2
        
        
        $0.appearance.titleFont = .killerGramFont(.regular, style: .m1)
        $0.appearance.titleDefaultColor = .WHITE
        $0.appearance.titleSelectionColor = .WHITE
        $0.appearance.titleTodayColor = .WHITE

        
        $0.headerHeight = 0
    }
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        
        calendar.delegate = self
        calendar.dataSource = self
        
        [
            calendar
        ].forEach(self.addArrangedSubview(_:))
    }
    
//    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
//        let weekday = Calendar.current.component(.weekday, from: date)
//        return !(weekday == 7 || weekday == 1)
//    }
//    
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//        let weekday = Calendar.current.component(.weekday, from: date)
//        if weekday == 7 || weekday == 1 {
//            return .clear
//            
//        }
//        return nil
//    }
}
