import UIKit

class ViewController: UIViewController {
    
    private var counterView:CounterView!
    
    override func loadView() {
        counterView = CounterView()
        self.view = counterView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonActions()
        
        
    }
    
    private func setupButtonActions() {
        counterView.plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        counterView.minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        counterView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    @objc func plusButtonTapped() {
        let MAX_VALUE: Int = 10
        let MIN_PLUS_VALUE: Int = 1
        let MAX_VALUE_BOEDER_COLOR = UIColor.red.cgColor
        let AVERAGE_VALUE_BOEDER_COLOR = UIColor.black.cgColor
        
        if counterView.countInt < MAX_VALUE{
            counterView.countInt += MIN_PLUS_VALUE
            counterView.counterLabel.layer.borderColor = AVERAGE_VALUE_BOEDER_COLOR
        } else{
            counterView.counterLabel.layer.borderColor = MAX_VALUE_BOEDER_COLOR
            counterView.plusButton.isEnabled = true
        }
    }
    
    @objc func minusButtonTapped() {
        let MAX_VALUE: Int = -10
        let MIN_PLUS_VALUE: Int = 1
        let MIX_VALUE_BOEDER_COLOR = UIColor.blue.cgColor
        let AVERAGE_VALUE_BOEDER_COLOR = UIColor.black.cgColor
        
        if counterView.countInt > MAX_VALUE{
            counterView.countInt -= MIN_PLUS_VALUE
            counterView.counterLabel.layer.borderColor = AVERAGE_VALUE_BOEDER_COLOR
        } else{
            counterView.counterLabel.layer.borderColor = MIX_VALUE_BOEDER_COLOR
            counterView.plusButton.isEnabled = true
        }
    }
    
    
    @objc func resetButtonTapped() {
        let RESET_VALUE: Int = 0
        let RESET_BOEDER_COLOR: CGColor = UIColor.black.cgColor
        
        counterView.countInt = RESET_VALUE
        counterView.counterLabel.layer.borderColor = RESET_BOEDER_COLOR
    }
    
}


