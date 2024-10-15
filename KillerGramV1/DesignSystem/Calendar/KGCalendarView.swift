import UIKit
import SnapKit
import Then

class KGCalendarView: UIView {
    
    let weekDays = ["월", "화", "수", "목", "금"]
    var currentWeek: [Int] = []
    
    private let weekStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.spacing = 4 // 버튼과 날짜 간의 기본 간격
    }
    
    private let previousButton = UIButton().then {
        $0.setTitle("◀︎", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("▶︎", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    private var dateLabels: [UILabel] = []
    
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

        for weekDay in weekDays {
            let dayStackView = UIStackView().then {
                $0.axis = .vertical // 수직 스택으로 변경
                $0.alignment = .center
                $0.spacing = 4 // 요일과 날짜 간격을 4로 설정
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
            }
            
            dayStackView.addArrangedSubview(label)
            dayStackView.addArrangedSubview(dateLabel)
            weekStackView.addArrangedSubview(dayStackView)
            dateLabels.append(dateLabel)
        }

        weekStackView.addArrangedSubview(nextButton)
        
        // SnapKit을 사용한 오토레이아웃 설정
        weekStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 버튼 액션 설정
        previousButton.addTarget(self, action: #selector(previousWeek), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextWeek), for: .touchUpInside)
    }
    
    private func setupCurrentWeek() {
        let calendar = Calendar.current
        let today = Date()
        
        // 오늘의 주의 첫날(월요일) 계산
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
        currentWeek = currentWeek.map { $0 + 7 }
        updateWeek()
    }

    private func updateWeek() {
        for (index, dateLabel) in dateLabels.enumerated() {
            let dateText = "\(currentWeek[index])" // 날짜를 올바르게 설정
            dateLabel.text = dateText // 날짜를 레이블에 할당
        }
    }
}
