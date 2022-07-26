//
//  HomeViewController.swift
//  iOSCodeChallenge
//
//  Created by Kevin Siundu on 24/07/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Network

class HomeViewController: BaseViewController, ActivityIndicatorProtocol {
    
    var didSelectRow: (NasaDataModel) -> Void = { _ in }
    var presentErrorAlert: (String) -> Void = { _ in }
    
    var activityIndicator = UIActivityIndicatorView()
    let refreshControl = UIRefreshControl()
    fileprivate let disposebag = DisposeBag()
    
    let homeViewModel = HomeViewmodel()
    let nasaList = BehaviorRelay<[NasaDataModel]>(value: [])

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showActivityIndicator()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "The Milky Way"
        
        view.backgroundColor = .white
        refreshControl.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
        
        configureTableView()
        setupViews()
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "HomeTableViewCell")
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.refreshControl = refreshControl
        tableView.alwaysBounceVertical = false
    }
    
    private func fetchData() {
        homeViewModel.fetchNasaDataCollection()
        bindUI()
    }
    
    private func bindUI() {
        homeViewModel.nasaDataViewModelObserver
            .do(
                onDispose: { [weak self] in
                    guard let self = self else { return }
                    self.hideActivityIndicator()
                    self.presentErrorAlert("There was an error... Try Again!")
                }
            )
            .subscribe(
                onNext: { [weak self] nasa in
                    guard let self = self else { return }
                    self.nasaList.accept(nasa)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    self.hideActivityIndicator()
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.hideActivityIndicator()
                    self.handleError(error)
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
    
    private func handleError(_ error: Error) {
        presentErrorAlert(error.localizedDescription)
    }
    
    @objc func onRefresh(_ sender: UIRefreshControl) {
        sender.endRefreshing()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = nasaList.value.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value = nasaList.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.configure(withModel: value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nasaItem = nasaList.value[indexPath.row]
        didSelectRow(nasaItem)
    }
}

