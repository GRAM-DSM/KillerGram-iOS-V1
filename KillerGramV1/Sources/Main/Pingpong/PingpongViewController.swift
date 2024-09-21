import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class PingpongViewController: BaseViewController {
    
    override func attribute() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
