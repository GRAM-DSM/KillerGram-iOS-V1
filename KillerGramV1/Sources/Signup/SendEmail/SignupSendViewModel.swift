import Foundation
import UIKit
import Moya

enum SignupAPI {
    case createAccount(email: String)
}

final class SignupSendViewModel {
    public var userEmail: String = ""
    
    private var emailerrorheight: NSLayoutConstraint!
    private var passworderrorheight: NSLayoutConstraint!
    
    private let provider = MoyaProvider<SignupAPI>()
    
    func nextButtonDidTap(email: String, result: @escaping (String) -> Void) {
        if self.isValidEmail(testStr: email) {
            sendSignupData(email: email) { response in
                result(response)
            }
        } else {
            if email.isEmpty {
                print("email is empty")
                result("email is empty")
            } else {
                print("email is error")
                result("email error")
            }
        }
    }
    
    private func sendSignupData(email: String, completion: @escaping (String) -> Void) {
        provider.request(.createAccount(email: email)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 || response.data.isEmpty {
                    self.userEmail = email
                    print("Signup successful with no content")
                    print(response.statusCode)
                    completion("email check ok")
                    return
                }

                do {
                    let json = try JSONSerialization.jsonObject(with: response.data, options: [])
                    print("Success:", json)
                    completion("Signup successful")
                } catch {
                    print("Failed to parse JSON:", error)
                    print(response.statusCode)
                    completion("Response parsing error")
                }
                
            case .failure(let error):
                print("Request failed with error:", error)
                completion("Request failed")
            }
        }
    }


    
    private func isValidEmail(testStr: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

extension SignupAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://japan-8911-deploynow.ncloud.sbs")!
    }
    
    var path: String {
        switch self {
        case .createAccount:
            return "/users/send-verification"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createAccount:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .createAccount(let email):
            let parameters: [String: Any] = [
                "email": email
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
