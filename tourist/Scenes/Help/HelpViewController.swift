//
//  HelpViewController.swift
//  tourist
//
//  Created by user on 07.04.2024.
//

import Foundation
import UIKit

final class HelpViewController: UIViewController {
    
    private lazy var largeTitle = makeTitle()
    private lazy var tableView = makeTableView()
    
    private let dataArray = ["Чат с поддержкой", "Бронирование зон отдыха", "СТО", "Запись на экскурсию", "Цифровые сервисы", "Сервисы партнеров"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addlayout()
        view.backgroundColor = UIColor(resource: .background)
    }
}
private extension HelpViewController {
    func makeTitle() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Помощь"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .text
        return label
    }
    
    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            HelpCell.self,
            forCellReuseIdentifier: HelpCell.reuseId
        )
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }
}

private extension HelpViewController {
    func addlayout() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        view.addSubview(largeTitle)
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 20),
        ])
    }
}

extension HelpViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HelpCell.reuseId, for: indexPath) as! HelpCell
        cell.setup(title: dataArray[indexPath.row])
        return cell
    }
    
    
}
