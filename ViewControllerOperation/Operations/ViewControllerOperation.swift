
import PFoundation
import UIKit

protocol FunnelCompletionCoordinator {
}

struct MyCoordinator: FunnelCompletionCoordinator {}

protocol FunnelStep {
    var coordinator: FunnelCompletionCoordinator? { get set }
    var delegate: FunnelStepDelegate? { get set }
}

protocol FunnelStepDelegate {
    func viewController(viewController: FunnelStep, didFinishWithCoordinator outputCoordinator: FunnelCompletionCoordinator)
    func viewController(viewController: FunnelStep, didFinishWithErrors errors: [NSError])
}

class ViewControllerOperation: Operation {
    let viewController: OperableViewController?
    var outputCoordinator: FunnelCompletionCoordinator? {
        return viewController?.coordinator
    }
    
    init(
        viewController: OperableViewController
        )
    {
        self.viewController = viewController
    }
    
    override func execute() {
        guard
            let viewController = viewController else {
                finish()
                
                return
        }
        
        viewController.delegate = self
    }
}

extension ViewControllerOperation: FunnelStepDelegate {
    func viewController(viewController: FunnelStep, didFinishWithCoordinator outputCoordinator: FunnelCompletionCoordinator) {
        finish()
    }
    
    func viewController(viewController: FunnelStep, didFinishWithErrors errors: [NSError]) {
        finish(errors)
    }
}