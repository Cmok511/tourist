//
//  TemplateTracksTableViewCell.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

final class TemplateTracksTableViewCell: UITableViewCell {
   
    static let reuseID = "TemplateTracksTableViewCell"
    
    private lazy var container = makeContainerView()
    private lazy var cellImage = makeImageView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var rating = makeRatingView()
    private lazy var descriptionLabel = makeDescriptionLabel()
    private lazy var goButton = makeGoButton()
    
    private var track: Tracks?
    
    // MARK: - Constructor
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addlayout()
        goButton.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func goButtonTapped() {
        
        guard let lonFrom = track?.locations.first?.lon else {return }
        guard let latFrom = track?.locations.first?.lat else {return }
        
        guard let lonTo = track?.locations.last?.lon else {return }
        guard let latTo = track?.locations.last?.lat else {return }
        print(latFrom, lonFrom )
        print(latTo, lonTo )
        
        UIApplication.shared.open(URL(string: "dgis://2gis.ru/routeSearch/rsType/car/from/\(38.995774),\(45.037588)/to/\(39.136426),\(44.634246)")!)

    }
    
    func setup(track: Tracks) {
        self.track = track
        titleLabel.text = track.name
        descriptionLabel.text = track.description
    }
}

private extension TemplateTracksTableViewCell {
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(resource: .tracks)
        imageView.layer.cornerRadius = 16
        return imageView
    }
    
    func makeContainerView() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 24
        container.backgroundColor = .white
        container.layer.cornerRadius = 24
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 1, height: 2)
        container.layer.shadowRadius = 3
        return container
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Краснодар - Сочи"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }
    
    func makeRatingView() -> UIView {
        let rating = UIView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.backgroundColor = .clear
        return rating
    }
    
    func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Описание"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }
    
    func makeGoButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.main
        button.setTitle("Построить маршрут", for: .normal)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        return button
    }
}

private extension TemplateTracksTableViewCell {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        contentView.addSubview(container)
        addSubview(container)
        container.addSubview(cellImage)
        container.addSubview(titleLabel)
        container.addSubview(rating)
        container.addSubview(descriptionLabel)
        container.addSubview(goButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -12),
            container.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            container.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            
            cellImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            cellImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            cellImage.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            cellImage.heightAnchor.constraint(equalToConstant: 83),
            
            titleLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            
            rating.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            rating.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            rating.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            rating.heightAnchor.constraint(equalToConstant: 1),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            
            goButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            goButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            goButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            goButton.heightAnchor.constraint(equalToConstant: 40),
            goButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
}
