import UIKit
import Then
import SnapKit

// MARK: - CustomDayCell (요일 셀)
class CustomDayCell: UICollectionViewCell {
    static let identifier = "CustomDayCell"
    
    private let datLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .clear
        contentView.addSubview(datLabel)
        datLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with text: String) {
        datLabel.text = text
    }
}


