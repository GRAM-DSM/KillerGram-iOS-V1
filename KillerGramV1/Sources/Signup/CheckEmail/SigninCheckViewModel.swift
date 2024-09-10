import UIKit

final class SigninCheckViewModel {
    let checkViewController = SigninCheckEmailViewController()
    var limitTime: Int = 300

    func timerStart() {
        checkViewController.timerLabel.isHidden = false
        setTime()
    }
    
    @objc func setTime() {
        secToTime(sec: limitTime)
        limitTime -= 1
    }
    
    func secToTime(sec: Int) {
        let minute = (sec % 3600) / 60
        let second = (sec % 3600) % 6
        
        if second < 10 {
            checkViewController.timerLabel.text = String(minute) + ":" + "0" + String(second)
        } else {
            checkViewController.timerLabel.text = String(minute) + ":" + String(second)
        }
        
        if limitTime != 0 {
            checkViewController.perform(#selector(setTime), with: nil, afterDelay: 1)
        }
        else if limitTime == 0 {
            checkViewController.timerLabel.isHidden = true
        }
    }
}

