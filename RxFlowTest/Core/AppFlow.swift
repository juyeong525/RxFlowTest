import UIKit
import RxFlow

class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .mainIsRequired:
            return self.navigationToMain()
        }
    }
    private func navigationToMain() -> FlowContributors {
        
        let mainFlow = MainFlow()
        Flows.use(mainFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: MainStep.loginIsRequired)))
    }
}
