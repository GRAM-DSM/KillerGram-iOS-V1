import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class HealthViewController: SportsViewController {
    override func attribute() {
        
        self.navigationItem.title = "헬스"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.memberView = KGMemberView(sumMember: "12", countMember: 1)
        
        self.ablityView.ablityView.changeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(HealthAblityViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
}
