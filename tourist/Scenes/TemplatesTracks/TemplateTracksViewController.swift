//
//  TemplateTracksViewController.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation

import Foundation
import UIKit

final class TemplateTracksViewController: UIViewController {
    
    private lazy var backButton = makeBackButton()
    private lazy var largeTitle = makeLargeTitle()
    private lazy var tableView = makeTableView()
    
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

private extension TemplateTracksViewController {
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

private extension TemplateTracksViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            TemplateTracksTableViewCell.self,
            forCellReuseIdentifier: TemplateTracksTableViewCell.reuseID
        )
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
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
        label.text = "Готовенькое"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .text
        return label
    }
}

private extension TemplateTracksViewController {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(largeTitle)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 10),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension TemplateTracksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TemplateTracksTableViewCell.reuseID, for: indexPath) as! TemplateTracksTableViewCell
        return cell
    }
    
}
