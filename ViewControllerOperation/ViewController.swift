
import UIKit
import PFoundation

class ViewController: UIViewController {
    
    let queue = OperationQueue()
    
    private var _button: UIButton?
    private var button: UIButton {
        if let b = _button { return b } else {
            _button = UIButton()
            _button?.translatesAutoresizingMaskIntoConstraints = false
            _button?.setTitle("Init", forState: .Normal)
            _button?.setTitleColor(.redColor(), forState: .Normal)
            _button?.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
            
            return _button!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        
        button.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        button.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
    }
    
    func buttonTapped() {
        let v = OperableViewController()
        let op = ViewControllerOperation(viewController: v, fromViewController: self)
        
        queue.addOperation(op)
    }
}