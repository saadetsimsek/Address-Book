//
//  DetailsViewController.swift
//  AddressBooks
//
//  Created by Saadet Şimşek on 19/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsViewModel: DetailViewModel
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLable = UILabel()
    private let phoneLabel = UILabel()
    
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    private var stackView = UIStackView()
        
    
    init(detailsViewModel: DetailViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        displayUserInfo()
        
    }
    
    private func setupViews(){
        
        title = "User Details"
        view.backgroundColor = .systemBackground
        stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, emailLable, phoneLabel, streetLabel, suiteLabel, cityLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    private func displayUserInfo(){
        nameLabel.text = detailsViewModel.name
        usernameLabel.text = detailsViewModel.username
        emailLable.text = detailsViewModel.email
        phoneLabel.text = detailsViewModel.phone
        streetLabel.text = detailsViewModel.street
        suiteLabel.text = detailsViewModel.suite
        cityLabel.text = detailsViewModel.city
    }
    
    //MARK: - Set Constraints

    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
