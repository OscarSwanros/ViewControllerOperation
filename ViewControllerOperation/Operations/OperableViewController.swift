
import UIKit
import PFoundation

class OperableViewController: UIViewController, Operable {
    var delegate: OperableDelegate?
    var coordinator: Coordinator? = MyCoordinator()
    
    private var _cancelButton: UIBarButtonItem?
    private var cancelButton: UIBarButtonItem {
        if let c = _cancelButton { return c } else {
            _cancelButton = UIBarButtonItem(title: "Cancel", style: .Done, target: self, action: "cancelButtonTapped")
            
            return _cancelButton!
        }
    }
    
    private var _nextButton: UIBarButtonItem?
    private var nextButton: UIBarButtonItem {
        if let n = _nextButton { return n } else {
            _nextButton = UIBarButtonItem(title: "Next", style: .Done, target: self, action: "nextButtonTapped")
            
            return _nextButton!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .redColor()
        
        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    func cancelButtonTapped() {
        print("cancel")
        let error = ErrorSpecification(ec: OperationError.ExecutionFailed)
        delegate?.viewController(self, didFinishWithErrors: [NSError(error: error)])
    }
    
    func nextButtonTapped() {
        print("next")
        delegate?.viewController(self, didFinishWithCoordinator: coordinator!)
    }
}
