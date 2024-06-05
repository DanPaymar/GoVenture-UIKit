//
//  GearVC.swift
//  GoVenture
//
//  Created by Daniel Paymar on 6/1/24.
//

import UIKit

class ActivityVC: UIViewController {
    
    // MARK: - Variables
    var user: User!
    let gear = UITableView()
    
    private let image: [UIImage] = [
        UIImage(named: "0")!,
        UIImage(named: "1")!,
        UIImage(named: "2")!,
    
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavControl()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // MARK: - Create the UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CustomCell.identifer)
        
        return tableView
    }()
    
    
    
    
    // MARK: - Setup UI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
//    Only available in iOS 17 ?
//    func setupContentUnavailableConfig() {
//        if tableItems.count == 0 {
//            var config = UIContentUnavailableConfiguration.empty()
//            
//            config.image = UIImage(systemName: "figure.hiking")
//            config.text = "You don't have any gear"
//            config.secondaryText = "Add items and get hiking"
//            self.contentUnavailableConfiguration = config
//        } else {
//            self.contentUnavailableConfiguration = nil
//        }
//    }
    
    
    // MARK: - Setup navigation control
    private func setupNavControl() {
        self.navigationItem.title = "Gear"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addGearPressed))
    }
    
    @objc private func addGearPressed() {
        print("tapped")
        let vc = GearItemsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ActivityVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifer, for: indexPath) as? CustomCell else {
            fatalError("The table cell could not dequeue a CustomCell in ViewController")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image, and: indexPath.row.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.5
    }
}
