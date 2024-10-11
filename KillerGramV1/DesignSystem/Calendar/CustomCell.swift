import UIKit
import SnapKit
import Then

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    // 요일을 표시할 레이블
    private let dayLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 셀 설정
    func setupView() {
        backgroundColor = .darkGray
        contentView.addSubview(dayLabel)
        
        dayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 요일 텍스트 설정 함수
    func configure(with day: String) {
        dayLabel.text = day
    }
}
