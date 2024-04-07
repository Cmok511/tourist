//
//  HelpCell.swift
//  tourist
//
//  Created by user on 07.04.2024.
//

import Foundation
import UIKit

final class HelpCell: UITableViewCell {
    static let reuseId = "HelpCell"
    private lazy var titleLabel: UILabel = makeTitleLabel()
    private lazy var nextImage = makeNextImage()
    private lazy var container = makeContainer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addlayout()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String?) {
        titleLabel.text = title
    }
    
}
extension HelpCell {
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }
    
    func makeNextImage() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .next)
        return image
    }
    
    func makeContainer() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

private extension HelpCell {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        contentView.addSubview(container)
        contentView.addSubview(nextImage)
        contentView.addSubview(titleLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            
            nextImage.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            nextImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: nextImage.leadingAnchor, constant: -16),
        ])
    }
}
