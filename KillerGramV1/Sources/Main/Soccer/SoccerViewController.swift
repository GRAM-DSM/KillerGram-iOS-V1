import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SoccerViewController: SportsViewController {
    override func attribute() {
        
        self.navigationItem.title = "축구"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.memberView = KGMemberView(sumMember: "18", countMember: 1)
        
        self.ablityView.ablityView.changeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(SoccerAblityViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
}
