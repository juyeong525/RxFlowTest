import Foundation
import RxSwift
import RxCocoa
import RxFlow

class MainViewModel: BaseViewModel, Stepper {
    var steps = PublishRelay<Step>()
    
    private let disposeBag = DisposeBag()
    struct Input {
        let ButtonDidTap: Signal<Void>
    }
    struct Output {
    }
    
    func transform(_ input: Input) -> Output {
        input.ButtonDidTap.asObservable()
            .map { MainStep.loginIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
        return Output()
    }
}
