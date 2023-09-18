import UIKit
import RxFlow

class MainFlow: Flow {
    private let container = AppDelegate.continer
    
    var root: Presentable {
        return rootViewController
    }
    
    private let rootViewController = UINavigationController()
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .loginIsRequired:
            return navigateToLoginScreen()
        }
    }
    private func navigateToLoginScreen() -> FlowContributors {
        let mainViewController = container.resolve(MainViewController.self)!
        self.rootViewController.pushViewController(mainViewController, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: mainViewController,
            withNextStepper: mainViewController.viewModel
        ))
    }
}
