import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var largeTitle = makeLargeTitle()
    private lazy var backButton = makeBackButton()
    
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
}

private extension ProfileViewController {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(backButton)
        view.addSubview(largeTitle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            
            
        ])
    }
}
