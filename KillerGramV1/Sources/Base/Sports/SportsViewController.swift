import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SportsViewController: BaseViewController {
    private let ablityView = KGAbilityView()
    
    var memberView = KGMemberView(sumMember: "12", countMember: 1)
    
    private let timeView = KGTimeView()
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func attribute() {
        self.navigationItem.title = "탁구"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.ablityView.ablityView.changeButton.rx.tap.subscribe(onNext: {
            self.navigationController?.pushViewController(PingPongAblityViewController(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func addView() {
        [
            ablityView,
            memberView,
            timeView
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        ablityView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        memberView.snp.makeConstraints {
            $0.top.equalTo(ablityView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        timeView.snp.makeConstraints {
            $0.top.equalTo(memberView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
