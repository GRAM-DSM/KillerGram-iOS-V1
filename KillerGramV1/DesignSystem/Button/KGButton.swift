import UIKit

class KGButton: UIButton {
    var labelText: String = ""
    let style: KGButtonStyle
    let colorStyle: KGButtonColorStyle

    var fgColor: UIColor {
        return colorStyle == .darkGray ? .GRAY_700 : colorStyle == .green ? .SECONDARY : .GRAY_100
    }

    var bgColor: UIColor {
        return colorStyle == .darkGray ? .GRAY_1000 : colorStyle == .green ? .MAIN : .SECONDARY
    }

    init(style: KGButtonStyle, colorStyle: KGButtonColorStyle) {
        self.style = style
        self.colorStyle = colorStyle
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setText(text: String) {
        self.labelText = text
        self.configureUI()
    }

    private func configureUI() {
        var config = UIButton.Configuration.plain()
        config.title = self.labelText
        config.attributedTitle?.foregroundColor = fgColor
        config.attributedTitle?.font = .killerGramFont(.semibold, style: .m3)
        config.contentInsets = .init(top: 16, leading: 0, bottom: 16, trailing: 0)

        self.configuration = config
        self.layer.cornerRadius = style == .round ? 8 : 0
        self.backgroundColor = bgColor
    }

}
