import UIKit

extension UIButton {
    func setUnderline(font: UIFont, fgColor: UIColor) {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        attributedString.addAttributes([.font: font, .foregroundColor: fgColor], range: .init(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
