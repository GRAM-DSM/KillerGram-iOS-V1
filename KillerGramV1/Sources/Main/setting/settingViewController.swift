import UIKit
import SnapKit
import Then

class settingViewController: BaseViewController {
    private let alarmSelectView = KGAlarmSelectView()
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func attribute() {
        self.navigationItem.title = "설정"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
    }
    
    override func addView() {
        [
            alarmSelectView
        ].forEach{view.addSubview($0)}
        
        alarmSelectView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
}
