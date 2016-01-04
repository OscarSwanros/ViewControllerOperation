
import PFoundation
import UIKit

class FunnelOperation: GroupOperation {
    let context: UIViewController?
    var operations: [NSOperation]
    var nav: UINavigationController?
    
    init(context: UIViewController? = nil) {
        self.context = context ?? UIApplication.sharedApplication().keyWindow?.rootViewController
        
        let first = ViewControllerOperation(viewController: OperableViewController())
        let second = ViewControllerOperation(viewController: AnotherOperableViewController())
        
        let final = NSBlockOperation(block: {})
        
        second.addDependency(first)
        final.addDependency(second)
        
        operations = [first, second, final]
        
        super.init(operations: operations)
    }
    
    override func finish(errors: [NSError] = []) {
        executeOnMainThread {
            self.context?.dismissViewControllerAnimated(true, completion: { super.finish(errors) })
        }
    }
    
    override func execute() {
        super.execute()
        
        let root = operations.flatMap { $0 as? ViewControllerOperation }.first!.viewController!
        
        nav = UINavigationController(rootViewController: root)
        
        context?.presentViewController(nav!, animated: true, completion: nil)
    }
    
    override func operationDidFinish(operation: NSOperation, withErrors errors: [NSError]) {
        guard let viewControllerOperation = operation as? ViewControllerOperation else {
            finish(errors)
            return
        }
        
        guard let nextIndex = operations.indexOf(viewControllerOperation)?.successor() where nextIndex < operations.count - 1 else {
            return
        }
        
        guard let nextOperation = operations[nextIndex] as? ViewControllerOperation else {
            return
        }
        
        nextOperation.viewController?.coordinator = viewControllerOperation.outputCoordinator
        
        nav?.pushViewController(nextOperation.viewController!, animated: true)
    }
}
