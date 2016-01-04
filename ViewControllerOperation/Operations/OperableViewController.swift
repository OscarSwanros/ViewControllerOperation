
import UIKit
import PFoundation

class OperableViewController: UIViewController, FunnelStep {
    var delegate: FunnelStepDelegate?
    var coordinator: FunnelCompletionCoordinator? = MyCoordinator()
    
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
        let error = ErrorSpecification(ec: OperationError.ExecutionFailed)
        delegate?.viewController(self, didFinishWithErrors: [NSError(error: error)])
    }
    
    func nextButtonTapped() {
        delegate?.viewController(self, didFinishWithCoordinator: coordinator!)
    }
}

class AnotherOperableViewController: OperableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blueColor()
    }
}

class YetAnother: OperableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellowColor()
    }
}