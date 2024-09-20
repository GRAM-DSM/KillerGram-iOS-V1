import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    private let KGLogoImage = UIImageView(frame: .zero).then {
        $0.image = .kgLogo
    }
    
    override func attribute() {
        self.navigationItem.hidesBackButton = true
    }
    
    override func addView() {
        [
            KGLogoImage
        ].forEach{view.addSubview($0)}
    }
    
    override func setLayout() {
        KGLogoImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo(124)
            $0.height.equalTo(16)
        }
    }
}
