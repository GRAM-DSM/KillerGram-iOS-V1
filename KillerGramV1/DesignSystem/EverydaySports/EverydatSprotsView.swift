import UIKit
import SnapKit
import Then

class EverydatSprotsView: UIStackView {
    private let pingpongImageView = EverydaySprotsImageView(image: .pingpong, title: "탁구")
    
    private let healthImageView = EverydaySprotsImageView(image: .health, title: "헬스")
    
    private let baseballImageView = EverydaySprotsImageView(image: .baseball, title: "야구")
    
    private let soccerImageView = EverydaySprotsImageView(image: .soccer, title: "축구")
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 12.67
        self.layoutMargins = .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            pingpongImageView,
            healthImageView,
            baseballImageView,
            soccerImageView
        ].forEach(self.addArrangedSubview(_:))
    }
}
