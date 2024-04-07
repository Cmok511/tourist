import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var largeTitle = makeLargeTitle()
    private lazy var backButton = makeBackButton()
    private lazy var quitButton = makeQuitButton()
    
    private lazy var stackView = makeStackView()
    private let photoView = PhotoView()
    private let userDataView = ProfileDataView()
    private let personalDataView = PersonalDataView()
    private let hobbyView = HobbyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addlayout()
        view.backgroundColor = UIColor(resource: .background)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

private extension ProfileViewController {
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func quitButtonTapped() {
        let vc = AuthAssembly.assemblyScene()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}

private extension ProfileViewController {
    func makeBackButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            UIImage(resource: .backButton),
            for: .normal
        )
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }
    
    func makeLargeTitle() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Профиль"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .text
        return label
    }
    
    func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }
    
    func makeQuitButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            UIImage(resource: .exitButton),
            for: .normal
        )
        button.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
        return button
    }
}

private extension ProfileViewController {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(backButton)
        view.addSubview(quitButton)
        view.addSubview(largeTitle)
        view.addSubview(stackView)
        stackView.addArrangedSubview(photoView)
        stackView.addArrangedSubview(userDataView)
        stackView.addArrangedSubview(personalDataView)
        stackView.addArrangedSubview(hobbyView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            quitButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            quitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
    }
}
