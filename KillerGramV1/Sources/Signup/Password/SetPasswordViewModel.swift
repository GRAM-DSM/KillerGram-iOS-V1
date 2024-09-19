import UIKit

class SetPasswordViewModel {
    func checkButtonDidTap(password: String, result: @escaping (String) -> Void) {
        
        if self.isValidPassword(pw: password) {
            result("password check ok")
            print("password check")
        } else {
            if password.isEmpty {
                result("password is empty")
                print("password is empty")
            }
            else {
                result("password error")
                print("password error")
            }
        }
    }
    
    private func isValidPassword(pw: String?) -> Bool{
        if let hasPassword = pw{
            if hasPassword.count < 8 || hasPassword.count > 16 {
                return false
            }
        }
        
        return true
    }
}
