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

    public func addView() {}
    public func setLayout() {}
    public func attribute() {}
    public func bind() {}
}
