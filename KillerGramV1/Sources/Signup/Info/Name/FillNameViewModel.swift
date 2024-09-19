import UIKit

final class FillNameViewModel {
    func nextButtonDidTap(name: String, result: @escaping (String) -> Void) {
        
        if self.isValidName(name: name) {
            result("name check ok")
            print("name check")
        } else {
            if name.isEmpty {
                result("name is empty")
                print("name is empty")
            }
        }
    }
    
    private func isValidName(name: String?) -> Bool{
        if let hasName = name{
            if hasName.count == 0{
                return false
            }
        }
        
        return true
    }
}
