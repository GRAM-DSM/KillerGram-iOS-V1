import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SportsViewController: BaseViewController {
    let ablityView = KGAbilityView()
    
    var memberView = KGMemberView(sumMember: "", countMember: 0)
    
    private let timeView = KGTimeView()
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
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
