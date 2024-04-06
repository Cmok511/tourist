//
//  PhotoView.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

final class PhotoView: UIView {
    
    private lazy var photo = makePhoto()
    private lazy var  name = makeName()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addlayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension PhotoView {
    func makePhoto() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        image.image = UIImage(resource: .photo)
        image.clipsToBounds = true
        return image
    }
    
    func makeName() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ирина"
        label.textColor = UIColor.text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }
}

private extension PhotoView {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        addSubview(photo)
        addSubview(name)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.heightAnchor.constraint(equalToConstant: 80),
            photo.widthAnchor.constraint(equalToConstant: 80),
            
            name.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            name.bottomAnchor.constraint(equalTo: bottomAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

