import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    private let titleView = KGMainTitleView()
    
    private let todaySprotsView = KGTodaySprotsView()
    
    private let everydaySports = KGEverydatSprotsView()
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func addView() {
        [
            titleView,
            todaySprotsView,
            everydaySports
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        todaySprotsView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        everydaySports.snp.makeConstraints {
            $0.top.equalTo(todaySprotsView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
