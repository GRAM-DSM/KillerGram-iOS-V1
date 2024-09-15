import Foundation
import UIKit

final class LoginViewModel {
    private var emailerrorheight: NSLayoutConstraint!
    
    private var passworderrorheight: NSLayoutConstraint!
    
    func loginButtonDidTap(email: String, password: String, result: @escaping (String) -> Void) {

        if self.isValidEmail(testStr: email) {
            print("email check ok")
            result("email check ok")
        } else {
            if email.isEmpty {
                result("email is empty")
                print("email is empty")
            }
            else {
                result("email error")
                print("email error")
            }
        }
        
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
            if hasPassword.count < 8 || hasPassword.count > 12{
                return false
            }
        }
        
        return true
    }
}
