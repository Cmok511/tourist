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
    private lazy var largeTitle = makeLargeTitle()
   
    private var mapView = MainScreenItemView()
    private var trackerView = MainScreenItemView()
    private var templateView = MainScreenItemView()
    private var personalView = MainScreenItemView()
    
    // MARK: Properties
    
    private var viewModel: MainScreenViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods

private extension MainScreenViewController {
    func setupUI() {
        view.backgroundColor = UIColor(resource: .background)
        addLayout()
        mapView.setup(image: UIImage(resource: .mapItem))
        trackerView.setup(image: UIImage(resource: .checkPointsItem))
        templateView.setup(image: UIImage(resource: .templateItem))
        personalView.setup(image: UIImage(resource: .profileItem))
        mapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushMap)))
        personalView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushProfile)))
        templateView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushTemplateTracks)))
        trackerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushTracks)))
    }
    
    @objc func pushMap() {
        let vc = MapViewControllerAssembly.assemblyScene()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushProfile() {
        let vc = ProfileAssembly.assemblyScene()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushTracks() {
        let vc = TracksAssembly.assemblyScene()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pushTemplateTracks() {
        let vc = TemplateTracksAssembly.assemblyScene()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
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
    
    func makeLargeTitle() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Доброго пути!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .text
        return label
    }
}

private extension MainScreenViewController {
    func addLayout() {
        addViews()
        setConstarints()
    }
    
    func addViews() {
        view.addSubview(stackView)
        view.addSubview(largeTitle)
        stackView.addArrangedSubview(mapView)
        stackView.addArrangedSubview(trackerView)
        stackView.addArrangedSubview(templateView)
        stackView.addArrangedSubview(personalView)
    }
    
    func setConstarints() {
        NSLayoutConstraint.activate([
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
