import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    private let viewModel = MainViewModel()
    
    private let titleView = KGMainTitleView()
    
    private let todaySprotsView = KGTodaySprotsView()
    
    private let everydaySports = KGEverydatSprotsView()
    
    @objc func pingpongDidTap() {
        self.navigationController?.pushViewController(PingpongViewController(), animated: true)
    }
    @objc func healthDidTap() {
        self.navigationController?.pushViewController(HealthViewController(), animated: true)
    }
    @objc func baseballDidTap() {
        self.navigationController?.pushViewController(BaseballViewController(), animated: true)
    }
    @objc func soccerDidTap() {
        self.navigationController?.pushViewController(SoccerViewController(), animated: true)
    }
    
    let pingpongEvent = UITapGestureRecognizer(target: self, action: #selector(pingpongDidTap))
    let healthEvent = UITapGestureRecognizer(target: self, action: #selector(healthDidTap))
    let baseEvent = UITapGestureRecognizer(target: self, action: #selector(baseballDidTap))
    let soccerEvent = UITapGestureRecognizer(target: self, action: #selector(soccerDidTap))
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
        
        everydaySports.pingpongImageView.addGestureRecognizer(pingpongEvent)
        everydaySports.healthImageView.addGestureRecognizer(healthEvent)
        everydaySports.baseballImageView.addGestureRecognizer(baseEvent)
        everydaySports.soccerImageView.addGestureRecognizer(soccerEvent)
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
