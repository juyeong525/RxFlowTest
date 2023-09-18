import UIKit
import SnapKit
import Then
import RxFlow
import RxSwift

class MainViewController: UIViewController {
    let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button = UIButton(type: .system).then {
        $0.setTitle("asdf", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        let input = MainViewModel.Input(ButtonDidTap: button.rx.tap.asSignal())
        _ = viewModel.transform(input)
    }
}
