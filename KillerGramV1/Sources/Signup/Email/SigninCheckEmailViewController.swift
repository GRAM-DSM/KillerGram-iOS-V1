import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class SigninCheckEmailViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = SignupViewModel()
    
    let titleLabel = KGLabel(title: "인증번호를 입력해 주세요", explain: "입력해주신 이메일로 인증번호를 전송해 드렸어요")
    
    let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        addView()
    }
    
    func addView() {
        [
            titleLabel
        ].forEach{view.addSubview($0)}
    }
}
