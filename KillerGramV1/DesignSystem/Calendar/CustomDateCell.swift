import UIKit
import Then
import SnapKit
// MARK: - CustomDateCell (날짜 셀)
class CustomDateCell: UICollectionViewCell {
    static let identifier = "CustomDateCell"
    
    private let label = UILabel().then {
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
    
    func setupView() {
        backgroundColor = .darkGray
        contentView.addSubview(label)
        label.snp.makeConstraints { 
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(with text: String) {
        label.text = text
    }
}
