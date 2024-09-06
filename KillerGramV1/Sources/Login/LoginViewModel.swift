import Foundation
import UIKit

final class LoginViewModel {
    var emailerrorheight: NSLayoutConstraint!
    
    var passworderrorheight: NSLayoutConstraint!
    
    func loginButtonDidTap(email: String, password: String, result: @escaping (String) -> Void) {
        if email.isEmpty || password.isEmpty {
            result("isEmpty")
            return
        }

        if self.isValidEmail(testStr: email) {
            print("check ok")
        } else {
            print(" error")
        }
    }

    private func textFieldEdited(textField: UITextField) {
        if textField == LoginViewController().emailTextField {
            if isValidEmail(testStr: textField.text) {
                emailerrorheight.isActive = true
            }
            else {
                emailerrorheight.isActive = false
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
            if hasPassword.count < 8{
                return false
            }
        }
        
        return true
    }
}
