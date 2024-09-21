import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class HealthViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
