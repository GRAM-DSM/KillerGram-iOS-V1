import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class PingpongViewController: BaseViewController {
    
    override func attribute() {
        self.navigationItem.title = "탁구"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated) 
    }
}
