import UIKit
import RxSwift

public class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BACK
        attribute()
        bind()
    }

    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addView()
        setLayout()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }

    public func addView() {}
    public func setLayout() {}
    public func attribute() {}
    public func bind() {}
}
