import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    
    private let notYetLabel = KGLabel(title: "준비 중입니다", explain: "빠른 시일 내로 완성하겠습니다")
    override func attribute() {
        self.navigationItem.hidesBackButton = true
    }
    
    override func addView() {
        [
            notYetLabel
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        notYetLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
