//
//  ViewController.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 07/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = AddresViewModel()
    
    var cellDataSource = [TableViewCellViewModel]()
    
    let activirtIndicaor =  UIActivityIndicatorView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Addres Book"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(activirtIndicaor)
        activirtIndicaor.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            activirtIndicaor.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activirtIndicaor.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func bindViewModel(){
        viewModel.isLoading.bind {[weak self] isLoading in
            guard let self, let isLoading else { return}
            DispatchQueue.main.async {
                isLoading ? self.activirtIndicaor.startAnimating() : self.activirtIndicaor.stopAnimating()
            }
        }
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else {return}
            cellDataSource = users
            reloadTableView()
       //     self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


