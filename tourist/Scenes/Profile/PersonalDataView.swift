//
//  PersonalDataView.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation


import Foundation
import UIKit

final class PersonalDataView: UIView {
    private lazy var imageView = makeImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addlayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PersonalDataView {
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .personalData)
        return image
    }
}

private extension PersonalDataView {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        addSubview(imageView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
