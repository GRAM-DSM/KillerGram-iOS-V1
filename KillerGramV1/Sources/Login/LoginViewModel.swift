import Foundation
import UIKit

class LoginViewModel {
    func loginButtonDidTap() {
        print("Asdf")
    }
    
    @objc func signinButtonDidTap() {
        UINavigationController(rootViewController: SignupViewController())
    }
}
