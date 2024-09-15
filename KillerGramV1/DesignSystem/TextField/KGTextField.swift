import UIKit
import SnapKit
import Then

class KGTextField: UIStackView {
    var placeholder: String = ""
    var explain: String = ""
    
    let explainLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .GRAY_800
        $0.font = .killerGramFont(.regular, style: .label)
        $0.isHidden = true
    }
    
    let textfield = UITextField().then {
        $0.backgroundColor = .GRAY_1000
        $0.layer.cornerRadius = 8
        $0.textColor = .WHITE
        $0.leftPadding()
        $0.font = .killerGramFont(.regular, style: .m3)
    }

    let errorLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .SYSTEM
        $0.font = .killerGramFont(.regular, style: .label)
        $0.isHidden = true
    }

    init(explain: String,placeholder: String) {
        explainLabel.attributedText = NSAttributedString(string: explain)
        textfield.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.GRAY_800]
        )
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = 4
        self.layoutMargins = .init(top: 8, left: 24, bottom: 8, right: 24)
        self.isLayoutMarginsRelativeArrangement = true
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        [
            explainLabel,
            textfield,
            errorLabel
        ].forEach(self.addArrangedSubview(_:))

        textfield.snp.makeConstraints {
            $0.height.equalTo(56)
        }
    }

    func errorGenerate(error: String) {
        self.errorLabel.text = error
        if errorLabel.text == "" {
            UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCrossDissolve, animations: {
                self.errorLabel.layoutIfNeeded()
                self.textfield.layer.borderColor = UIColor.GRAY_1000.cgColor
                self.textfield.layer.borderWidth = 1
                self.errorLabel.isHidden = true
            })
        } else {
            self.errorLabel.isHidden = false
            UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCrossDissolve, animations: {
                self.errorLabel.layoutIfNeeded()
                self.textfield.layer.borderColor = UIColor.SYSTEM.cgColor
                self.textfield.layer.borderWidth = 1
            })
        }
    }
}


private extension UITextField {
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        
        self.leftView = paddingView
        
        self.leftViewMode = ViewMode.always
    }
}
