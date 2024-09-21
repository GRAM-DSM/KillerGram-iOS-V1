import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SoccerViewController: BaseViewController{
    
    override func attribute() {
        self.navigationItem.title = "축구"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
