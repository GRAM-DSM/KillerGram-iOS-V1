import UIKit
import Then
import SnapKit

class KGSettingImageView: UIStackView {
    private let settingButton = UIButton(frame: .zero).then {
        $0.setImage(UIImage(named: "SettingImage"), for: .normal) // 버튼에 이미지 설정
    }
    
    init() {
        super.init(frame: .zero)
        self.layoutMargins = .init(top: 12, left: 12, bottom: 12, right: 12)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        settingButton.addTarget(self, action: #selector(imageDidTap), for: .touchUpInside)
        
        [
            settingButton
        ].forEach(self.addArrangedSubview(_:))
        
        settingButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
    }
    
    @objc func imageDidTap() {
        let settings = UIAction(title: "설정") { _ in
        }
        let logout = UIAction(title: "로그아웃", attributes: .destructive) { _ in
        }
        let deleteAccount = UIAction(title: "회원 탈퇴", attributes: .destructive) { _ in
        }

        let menu = UIMenu(title: "", children: [settings, logout, deleteAccount])
        
        settingButton.menu = menu
        settingButton.showsMenuAsPrimaryAction = true
    }
}
