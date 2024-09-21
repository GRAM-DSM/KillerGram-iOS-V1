import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SoccerViewController: BaseViewController{
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
