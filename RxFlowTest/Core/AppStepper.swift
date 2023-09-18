import Foundation

import RxCocoa
import RxFlow
import RxSwift

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {}

    var initialStep: Step {
        return DemoStep.mainIsRequired
    }
}
