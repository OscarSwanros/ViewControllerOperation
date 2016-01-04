
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
    private let viewController: OperableViewController?
    private let startingPoint: UIViewController?
    var outputCoordinator: Coordinator?
    
    init(
        viewController: OperableViewController,
        fromViewController starting: UIViewController? = nil
        )
    {
        self.viewController = viewController
        self.startingPoint = starting ?? UIApplication.sharedApplication().keyWindow?.rootViewController
    }
    
    override func execute() {
        guard
            let startingPoint = startingPoint,
            let viewController = viewController else {
                finish()
                
                return
        }
        
        viewController.delegate = self
        
        let nav = UINavigationController(rootViewController: viewController)
        
        executeOnMainThread {
            startingPoint.presentViewController(nav, animated: true, completion: nil)
        }
    }
    
    override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            self.startingPoint?.dismissViewControllerAnimated(true) { super.finish(errors) }
        }
    }
}


extension ViewControllerOperation: OperableDelegate {
    func viewController(viewController: Operable, didFinishWithCoordinator outputCoordinator: Coordinator) {
        self.outputCoordinator = outputCoordinator
        finish()
    }
    
    func viewController(viewController: Operable, didFinishWithErrors errors: [NSError]) {
        finish(errors)
    }
}