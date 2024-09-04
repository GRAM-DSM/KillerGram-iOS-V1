import UIKit

extension UIFont {
    static func killerGramFont(
        _ pretendardStyle: PretendardFontStyle,
        style: KillerGramFontStyle
    ) -> UIFont {
        return UIFont(
            name: pretendardStyle.rawValue,
            size: style.size()
        ) ?? .systemFont(ofSize: style.size())
    }
}


extension KillerGramFontStyle {
    func lineHeight() -> CGFloat {
        switch self {
        case .h1:
            return 38.4

        case .h2:
            return 33.6

        case .h3:
            return 31.2

        case .m1:
            return 30

        case .m2:
            return 27

        case .m3:
            return 24

        case .label:
            return 21
        }
    }

    func size() -> CGFloat {
        switch self {
        case .h1:
            return 32

        case .h2:
            return 28

        case .h3:
            return 24
        case .m1:
            return 20

        case .m2:
            return 18

        case .m3:
            return 16

        case .label:
            return 14
        }
    }
}
