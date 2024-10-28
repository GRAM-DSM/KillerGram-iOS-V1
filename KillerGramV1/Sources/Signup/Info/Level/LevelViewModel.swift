import UIKit

class LevelViewModel {
    public var ablity:String = ""
    
    let highAttributedstr = NSMutableAttributedString(string: "상  운동을 평소에 즐겨하며 잘 하는 편이에요")
    let middleAttributedstr = NSMutableAttributedString(string: "중  운동을 즐기진 않지만 못하지는 않아요")
    let lowAttributedstr = NSMutableAttributedString(string: "하  운동을 별로 좋아하지 않아요")
    
    init() {
        highAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.semibold, style: .m1), range: NSRange(location: 0, length: 1))
        
        highAttributedstr.addAttribute(.foregroundColor, value: UIColor.WHITE, range: NSRange(location: 0, length: 1))
        
        highAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.regular, style: .label), range: NSRange(location: 1, length: 24))
        
        
        middleAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.semibold, style: .m1), range: NSRange(location: 0, length: 1))
        
        middleAttributedstr.addAttribute(.foregroundColor, value: UIColor.WHITE, range: NSRange(location: 0, length: 1))
        
        
        middleAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.regular, style: .label), range: NSRange(location: 1, length: 22))
        
        
        lowAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.semibold, style: .m1), range: NSRange(location: 0, length: 1))
        
        lowAttributedstr.addAttribute(.foregroundColor, value: UIColor.WHITE, range: NSRange(location: 0, length: 1))
        
        
        lowAttributedstr.addAttribute(.font, value: UIFont.killerGramFont(.regular, style: .label), range: NSRange(location: 1, length: 17))
    }
}
