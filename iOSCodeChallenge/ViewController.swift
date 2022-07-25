//
//  ViewController.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {
    
    fileprivate let disposebag = DisposeBag()
    
    let homeViewModel = HomeViewmodel()
    let nasaList = BehaviorRelay<[NasaDataModel]>(value: [])
    let filteredList = BehaviorRelay<[NasaDataModel]>(value: [])

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        return tableView
    }()
    
    let data = Array(0...10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "The Milky Way"
        
        view.backgroundColor = .white
        
        configureTableView()
        setupViews()
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HomeTableViewCell")
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.rowHeight = 100
    }
    
    private func fetchData() {
        homeViewModel.fetchNasaDataCollection()
        bindUI()
    }
    
    private func bindUI() {
        homeViewModel.nasaDataViewModelObserver.subscribe(
            onNext: { [weak self] nasa in
                self?.nasaList.accept(nasa)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            },
            onError: { [weak self] error in
                self?.handleError(error)
            }
        ).disposed(by: disposebag)
    }
    
    private func setupViews() {
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func handleError(_ error: Error) {}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nasaList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.configure(withModel: nasaList.value[indexPath.row])
        return cell
    }
}

