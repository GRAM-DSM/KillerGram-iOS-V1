import Foundation
import UIKit

final class SignupViewModel {
    var emailerrorheight: NSLayoutConstraint!
    
    var passworderrorheight: NSLayoutConstraint!
    
    func nextButtonDidTap(email: String, result: @escaping (String) -> Void) {
        
        if self.isValidEmail(testStr: email) {
            result("email check ok")
            print("email check")
        } else {
            if email.isEmpty {
                print("email is empty")
                result("email is empty")
            }
            else {
                print("email is error")
                result("email error")
            }
    }
}
    private func isValidEmail(testStr: String?) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    private func isValidPassword(pw: String?) -> Bool{
        if let hasPassword = pw{
            if hasPassword.count < 8 || hasPassword.count > 16{
                return false
            }
        }
        
        return true
    }
}


