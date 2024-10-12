import UIKit
import SnapKit
import Then

class KGCalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let daysOfWeek = ["월", "화", "수", "목", "금"]
    private let datesInMonth = ["1", "2", "3", "4", "5"]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(CustomDayCell.self, forCellWithReuseIdentifier: CustomDayCell.identifier)
        cv.register(CustomDateCell.self, forCellWithReuseIdentifier: CustomDateCell.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI 설정
    private func setupView() {
        addSubview(collectionView)
        
        // 컬렉션 뷰 레이아웃 설정
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysOfWeek.count + datesInMonth.count // 요일과 날짜 개수 합산
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < daysOfWeek.count { // 요일 셀
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomDayCell.identifier, for: indexPath) as! CustomDayCell
            cell.configure(with: daysOfWeek[indexPath.item]) // 요일 설정
            return cell
        } else { // 날짜 셀
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomDateCell.identifier, for: indexPath) as! CustomDateCell
            let dateIndex = indexPath.item - daysOfWeek.count
            if dateIndex < datesInMonth.count {
                cell.configure(with: datesInMonth[dateIndex]) // 날짜 설정
            }
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - (4 * CGFloat(daysOfWeek.count - 1))) / CGFloat(daysOfWeek.count) // 셀 간격 조정
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
