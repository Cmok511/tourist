import Foundation
import UIKit

final class MainScreenItemView: UIView {
    
    lazy var itemImage = makeImage()
    lazy var infoButton = makeInfoButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addlayout()
        layer.cornerRadius = 20
        backgroundColor = .white
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage) {
        itemImage.image = image
    }
}

private extension MainScreenItemView {
    func makeImage() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(resource: .logo)
        return image
    }
    
    func makeInfoButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            UIImage(resource: .questionButton),
            for: .normal
        )
        button.tintColor = UIColor(resource: .text)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = UIColor(resource: .text)
        return button
    }
}

private extension MainScreenItemView {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        addSubview(itemImage)
        addSubview(infoButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            itemImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            itemImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            infoButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            infoButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
