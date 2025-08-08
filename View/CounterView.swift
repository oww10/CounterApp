import UIKit

class CounterView: UIView {
    
    var countInt:Int = 0{
        
        didSet{
            counterLabel.text = "\(countInt)"
        }
    }
    //화면 중앙에 현재 숫자를 표시
    var counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 값 ++ 버튼
    var plusButton: UIButton = {
        let plusButton = UIButton(type: .system)
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .systemBlue
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return plusButton
        
    }()
    
    // 값 -- 버튼
    var minusButton: UIButton = {
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .systemRed
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        return minusButton
        
    }()
    
    // 값 리셋 버튼
    var resetButton: UIButton = {
        let resetButton = UIButton(type: .system)
        resetButton.setTitle(">> RESET <<", for: .normal)
        resetButton.backgroundColor = .systemGray
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        return resetButton
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [plusButton, minusButton,resetButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        counterLabel.text = "\(countInt)"
        backgroundColor = .white
        SetupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func SetupUI(){
        self.backgroundColor = .white
        
        addSubview(buttonStackView)
        addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            counterLabel.widthAnchor.constraint(equalToConstant: 200),
            counterLabel.heightAnchor.constraint(equalToConstant: 50),
            
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            ])
        
    }
}
#Preview{
    CounterView()
}
