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
    
    private let calendarView = KGCalendarView()
    
    private let stateView = KGStateView(sports: "축구", maxMember: "16", nowMember: 1, state: "진행 중")
    
    @objc func todaySportsDidTap() {
        self.navigationController?.pushViewController(BadmintonViewController(), animated: true)
    }
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
    @objc func stateViewDidTap() {
        self.navigationController?.pushViewController(SoccerViewController(), animated: true)
    }
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        
        let todaySportsEvent = UITapGestureRecognizer(target: self, action: #selector(todaySportsDidTap))
        
        let pingpongEvent = UITapGestureRecognizer(target: self, action: #selector(pingpongDidTap))
        let healthEvent = UITapGestureRecognizer(target: self, action: #selector(healthDidTap))
        let baseEvent = UITapGestureRecognizer(target: self, action: #selector(baseballDidTap))
        let soccerEvent = UITapGestureRecognizer(target: self, action: #selector(soccerDidTap))
        
        let stateEvent = UITapGestureRecognizer(target: self, action: #selector(stateViewDidTap))
        
        todaySprotsView.addGestureRecognizer(todaySportsEvent)
        
        everydaySports.pingpongImageView.addGestureRecognizer(pingpongEvent)
        everydaySports.healthImageView.addGestureRecognizer(healthEvent)
        everydaySports.baseballImageView.addGestureRecognizer(baseEvent)
        everydaySports.soccerImageView.addGestureRecognizer(soccerEvent)
        
        stateView.addGestureRecognizer(stateEvent)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func addView() {
        [
            titleView,
            todaySprotsView,
            everydaySports,
            calendarView,
            stateView
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        titleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        todaySprotsView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        everydaySports.snp.makeConstraints {
            $0.top.equalTo(todaySprotsView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        calendarView.snp.makeConstraints {
            $0.top.equalTo(everydaySports.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(58)
        }
        
        stateView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

