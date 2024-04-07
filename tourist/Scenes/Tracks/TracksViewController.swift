//
//  TracksViewController.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

final class TracksViewController: UIViewController {
    
    private lazy var backButton = makeBackButton()
    private lazy var largeTitle = makeLargeTitle()
    private lazy var imageView = makeImageView()
    private lazy var scrollView = makeScrollView()
    private lazy var containerView = makeConteinerView()
  //  private lazy var tableView = makeTableView()

    
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

private extension TracksViewController {
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

private extension TracksViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
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
        label.text = "Ваш маршрут"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .text
        return label
    }
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
    
    func makeConteinerView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(resource: .track)
        image.contentMode = .scaleAspectFit
        return image
    }
}

private extension TracksViewController {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        view.addSubview(backButton)
        view.addSubview(largeTitle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            scrollView.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
}
