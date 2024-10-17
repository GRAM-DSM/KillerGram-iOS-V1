import UIKit

class HealthAblityViewController: AblityViewController {
    override func attribute() {
        self.navigationItem.title = "헬스"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.killerGramFont(.semibold, style: .m2), .foregroundColor: UIColor.WHITE]
        
        backBarButtonItem.tintColor = .WHITE
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        highButton.setAttributedTitle(viewModel.highAttributedstr, for: .normal)
        middleButton.setAttributedTitle(viewModel.middleAttributedstr, for: .normal)
        lowButton.setAttributedTitle(viewModel.lowAttributedstr, for: .normal)
        
        
        self.highButton.rx.tap.subscribe(onNext: {
            self.highButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.middleButton.rx.tap.subscribe(onNext: {
            self.middleButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.lowButton.rx.tap.subscribe(onNext: {
            self.lowButtonDidTap()
        }).disposed(by: disposeBag)
        
        self.completeButton.rx.tap.subscribe(onNext: {
            self.ablityView.showMyAblityLabel.text = self.ablity
            self.ablityView.showMyAblityLabel.setNeedsDisplay()
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
}
