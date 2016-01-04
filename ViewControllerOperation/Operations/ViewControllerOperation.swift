
import PFoundation
import UIKit

protocol Coordinator {
}

struct MyCoordinator: Coordinator {}

protocol Operable {
    var coordinator: Coordinator? { get set }
    var delegate: OperableDelegate? { get set }
}

protocol OperableDelegate {
    func viewController(viewController: Operable, didFinishWithCoordinator outputCoordinator: Coordinator)
    func viewController(viewController: Operable, didFinishWithErrors errors: [NSError])
}

class ViewControllerOperation: Operation {
    let viewController: OperableViewController?
    var outputCoordinator: Coordinator? {
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
    
    override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            super.finish(errors)
        }
    }
}


extension ViewControllerOperation: OperableDelegate {
    func viewController(viewController: Operable, didFinishWithCoordinator outputCoordinator: Coordinator) {
        finish()
    }
    
    func viewController(viewController: Operable, didFinishWithErrors errors: [NSError]) {
        finish(errors)
    }
}