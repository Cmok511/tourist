//
//  MainScreenViewController.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

final class MainScreenViewController: UIViewController {

    private lazy var stackView = makeStackView()
   
    private var mapView = MainScreenItemView()
    private var trackerView = MainScreenItemView()
    private var templateView = MainScreenItemView()
    private var personalView = MainScreenItemView()
    
    // MARK: Properties
    
    private var viewModel: MainScreenViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .background)
        title = "Доброго пути!"
        addLayout()
        mapView.setup(image: UIImage(resource: .mapItem))
        trackerView.setup(image: UIImage(resource: .checkPointsItem))
        templateView.setup(image: UIImage(resource: .templateItem))
        personalView.setup(image: UIImage(resource: .profileItem))
    }
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainScreenViewController {
    func makeStackView() -> UIStackView {
        let stakView = UIStackView()
        stakView.translatesAutoresizingMaskIntoConstraints = false
        stakView.distribution = .fillEqually
        stakView.spacing = 12
        stakView.axis = .vertical
        return stakView
    }
}

private extension MainScreenViewController {
    func addLayout() {
        addViews()
        setConstarints()
    }
    
    func addViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(mapView)
        stackView.addArrangedSubview(trackerView)
        stackView.addArrangedSubview(templateView)
        stackView.addArrangedSubview(personalView)
    }
    
    func setConstarints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
