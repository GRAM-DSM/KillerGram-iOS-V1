import UIKit
import FSCalendar
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
    
    private let stateScrollView = UIScrollView()
    
    private let stateView = KGStateView(sports: "축구", maxMember: "16", nowMember: 1)
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    @objc func settingImageDidTap() {
        let settings = UIAction(title: "설정") { _ in
            self.navigationController?.pushViewController(settingViewController(), animated: true)
        }
        let logout = UIAction(title: "로그아웃", attributes: .destructive) { _ in
            self.logoutAlert()
        }
        let deleteAccount = UIAction(title: "회원 탈퇴", attributes: .destructive) { _ in
            self.userExitAlert()
        }
        
        let menu = UIMenu(title: "", children: [settings, logout, deleteAccount])
        
        titleView.settingImageView.settingButton.menu = menu
        titleView.settingImageView.settingButton.showsMenuAsPrimaryAction = true
    }
    @objc func logoutAlert() {
        let alertController = UIAlertController(title: nil, message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "확인", style: .destructive, handler: {_ in
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
    }
    @objc func userExitAlert() {
        let alertController = UIAlertController(title: nil, message: "회원 탈퇴하시겠습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
    }
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
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        titleView.settingImageView.settingButton.addTarget(self, action: #selector(settingImageDidTap), for: .touchUpInside)
        
        
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
            stateScrollView,
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
        stateScrollView.snp.makeConstraints {
            $0.top.equalTo(calendarView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(64)
        }
        stateView.snp.makeConstraints {
            $0.top.equalTo(stateScrollView.snp.top)
            $0.leading.equalTo(stateScrollView.snp.leading)
            $0.trailing.equalTo(stateScrollView.snp.trailing)
            $0.width.equalTo(stateScrollView.snp.width)
        }
    }
}

