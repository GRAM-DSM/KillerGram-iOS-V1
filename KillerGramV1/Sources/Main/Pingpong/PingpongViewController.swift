import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class PingpongViewController: SportsViewController {
    override func attribute() {
        
        self.navigationItem.title = "탁구"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
        
        self.memberView = KGMemberView(sumMember: "12", countMember: 1)
        
        self.ablityView.ablityView.changeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(PingPongAblityViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
}
