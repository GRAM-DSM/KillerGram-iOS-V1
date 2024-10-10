import UIKit
import SnapKit
import Then

class KGEverydatSprotsView: UIStackView {
    let pingpongImageView = KGEverydaySprotsImageView(image: .pingpong, title: "탁구")
    
    let healthImageView = KGEverydaySprotsImageView(image: .health, title: "헬스")
    
    let baseballImageView = KGEverydaySprotsImageView(image: .baseball, title: "야구")
    
    let soccerImageView = KGEverydaySprotsImageView(image: .soccer, title: "축구")
    
    let todayImageView = KGEverydaySprotsImageView(image: .todaySportsBadminton, title: "배드민턴")
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = 12.67
        self.layoutMargins = .init(top: 0, left: 24, bottom: 0, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        [
            pingpongImageView,
            healthImageView,
            baseballImageView,
            soccerImageView,
            todayImageView
        ].forEach(self.addArrangedSubview(_:))
    }
}
