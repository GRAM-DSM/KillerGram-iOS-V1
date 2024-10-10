import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class BaseballViewController: SportsViewController {
    override func attribute() {
        
        self.navigationItem.title = "야구"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.memberView = KGMemberView(sumMember: "16", countMember: 1)
        
        self.ablityView.ablityView.changeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(BaseViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
}
