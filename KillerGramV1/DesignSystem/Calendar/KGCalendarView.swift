import UIKit
import SnapKit
import Then

class KGCalendarView: UIView {
    
    let weekDays = ["월", "화", "수", "목", "금"]
    var currentWeek: [Int] = []
    var currentMonth: Int = Calendar.current.component(.month, from: Date())
    var currentYear: Int = Calendar.current.component(.year, from: Date())
    
    private let weekStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let previousButton = UIButton().then {
        $0.setTitle("❮", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("❯", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private var dateLabels: [UILabel] = []
    private var selectedDateIndex: Int? 

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCurrentWeek()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(weekStackView)

        weekStackView.addArrangedSubview(previousButton)

        for (index, weekDay) in weekDays.enumerated() {
            let dayStackView = UIStackView().then {
                $0.axis = .vertical
                $0.alignment = .center
                $0.spacing = 4
            }
            
            let label = UILabel().then {
                $0.textAlignment = .center
                $0.textColor = .GRAY_800
                $0.text = weekDay
            }
            
            let dateLabel = UILabel().then {
                $0.textAlignment = .center
                $0.textColor = .WHITE
                $0.numberOfLines = 1
                $0.isUserInteractionEnabled = true
            }
            
            // Tap Gesture 추가
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dateLabelTapped(_:)))
            dateLabel.addGestureRecognizer(tapGesture)
            dateLabel.tag = index
            
            dayStackView.addArrangedSubview(label)
            dayStackView.addArrangedSubview(dateLabel)
            weekStackView.addArrangedSubview(dayStackView)
            dateLabels.append(dateLabel)
        }

        weekStackView.addArrangedSubview(nextButton)
        
        weekStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        previousButton.addTarget(self, action: #selector(previousWeek), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextWeek), for: .touchUpInside)
    }
    
    private func setupCurrentWeek() {
        let calendar = Calendar.current
        let today = Date()
        let startOfWeek = calendar.date(byAdding: .day, value: -calendar.component(.weekday, from: today) + 2, to: today)!
        
        currentWeek = (0..<weekDays.count).map { dayOffset in
            calendar.component(.day, from: calendar.date(byAdding: .day, value: dayOffset, to: startOfWeek)!)
        }
        
        updateWeek()
    }

    @objc private func previousWeek() {
        currentWeek = currentWeek.map { $0 - 7 }
        updateWeek()
    }

    @objc private func nextWeek() {
        let lastDateInWeek = currentWeek.last ?? 1
        let daysInCurrentMonth = getDaysInMonth(month: currentMonth, year: currentYear)
        
        if lastDateInWeek >= daysInCurrentMonth {
            if currentMonth == 12 {
                currentMonth = 1
                currentYear += 1
            } else {
                currentMonth += 1
            }
            currentWeek = getFirstWeekInMonth(month: currentMonth, year: currentYear)
        } else {
            currentWeek = currentWeek.map { $0 + 7 }
        }
        
        updateWeek()
    }

    @objc private func dateLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedLabel = sender.view as? UILabel else { return }
        
        
        if let selectedIndex = selectedDateIndex {
            dateLabels[selectedIndex].textColor = .WHITE
        }
        
        
        tappedLabel.textColor = .MAIN
        
        
        selectedDateIndex = tappedLabel.tag
    }

    private func updateWeek() {
        for (index, dateLabel) in dateLabels.enumerated() {
            let dateText = "\(currentWeek[index])"
            dateLabel.text = dateText
        }
    }
    
    private func getDaysInMonth(month: Int, year: Int) -> Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    private func getFirstWeekInMonth(month: Int, year: Int) -> [Int] {
        let calendar = Calendar.current
        var week: [Int] = []
        
        let firstDateComponents = DateComponents(year: year, month: month, day: 1)
        guard let firstDate = calendar.date(from: firstDateComponents) else { return week }
        
        let weekday = calendar.component(.weekday, from: firstDate)
        let daysInMonth = getDaysInMonth(month: month, year: year)
        
        for day in 1...daysInMonth {
            week.append(day)
            if week.count == 5 { break }
        }
        
        return week
    }
}
