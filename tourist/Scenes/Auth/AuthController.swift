import Foundation
import UIKit

final class AuthController: UIViewController {
    
    private lazy var logoImage = makeLogo()
    private lazy var loginLabel = makeLoginLabel()
    private lazy var passLabel = makePassLabel()
    private lazy var loginTextField = makeTextField()
    private lazy var passTextField = makeTextField()
    private lazy var backView = makeBackView()
    private lazy var greetLabel = makeGreetLabel()
    private lazy var loginButton = makeLoginButton()
    
    private var viewModel: AuthViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .main)
        addLayout()
    }
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AuthController {
    func makeLogo() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .logo)
        return image
    }
    
    func makeGreetLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать!"
        label.textColor = UIColor(resource: .text)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }
    
    func makeLoginLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Логин"
        label.textColor = UIColor(resource: .text)
        return label
    }
    
    func makePassLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пароль"
        label.textColor = UIColor(resource: .text)
        return label
    }
    
    func makeTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 8
        return textField
    }
    
    func makeBackView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }
    
    func makeLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(resource: .main)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 12
        return button
    }
}

private extension AuthController {
    func addLayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(logoImage)
        view.addSubview(backView)
        view.addSubview(greetLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passLabel)
        view.addSubview(passTextField)
        view.addSubview(loginButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20),
            
            greetLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            greetLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            
            loginLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            loginLabel.topAnchor.constraint(equalTo: greetLabel.bottomAnchor, constant: 12),
            
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            loginTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            passLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),

            passTextField.topAnchor.constraint(equalTo: passLabel.bottomAnchor, constant: 8),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passTextField.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
