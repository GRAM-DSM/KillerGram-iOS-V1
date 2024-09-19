import UIKit

class FillStudentNumberViewModel {
    func nextButtonDidTap(number: String, result: @escaping (String) -> Void) {
        
        if self.isValidStudentNumber(number: number) {
            result("StudentNumber check ok")
            print("StudentNumber check")
        } else {
            if number.isEmpty {
                result("StudentNumber is empty")
                print("StudentNumber is empty")
            } else {
                result("StudentNumber error")
                print("StudentNumber error")
            }
        }
    }
    
    private func isValidStudentNumber(number: String?) -> Bool{
        if let hasNumber = number{
            if hasNumber.count != 4{
                return false
            }
        }
        
        return true
    }
}


