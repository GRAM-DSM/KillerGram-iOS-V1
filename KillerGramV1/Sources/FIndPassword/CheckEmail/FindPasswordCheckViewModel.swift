import Foundation
import RxRelay

final class FindPasswordCheckViewModel {
    let timerText = BehaviorRelay<String>(value: "5:00")
    private var limitTime: Int = 300
    private var timer: Timer?
    
    func startTimer() {
        
        timer?.invalidate()
        limitTime = 300
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTime() {
        guard limitTime > 0 else {
            timer?.invalidate()
            timer = nil
            return
        }
        limitTime -= 1
        let minutes = limitTime / 60
        let seconds = limitTime % 60
        timerText.accept(String(format: "%d:%02d", minutes, seconds))
    }
}
