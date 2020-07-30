//
//  ViewController.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol SearchDrinkViewProtocol: class {
    func updateDrinks(drinks: [Drink])
}

class SearchDrinkViewController: UIViewController {
    
    var presenter: SearchDrinkPresenter?
    
    let tableView = UITableView()
    private static let cellID = "cellID"
    
    let searchBar = UISearchBar()

    var filteredDrinks = [Drink]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
        setupSearchBar()
        
        self.presenter?.loadAllDrinks()
    }
    
    private func setupTitle() {
        title = "All Cocktails"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib.init(nibName: "DrinkTableViewCell", bundle: nil), forCellReuseIdentifier: SearchDrinkViewController.cellID)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupSearchBar() {
        self.navigationItem.titleView = searchBar
        searchBar.placeholder = "All cocktails"
        searchBar.keyboardType = .default
        searchBar.delegate = self
    }
}

extension SearchDrinkViewController: SearchDrinkViewProtocol {
    func updateDrinks(drinks: [Drink]) {
        self.filteredDrinks = drinks
    }
}

extension SearchDrinkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchDrinkViewController.cellID, for: indexPath) as! DrinkTableViewCell
        cell.configure(with: filteredDrinks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension SearchDrinkViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.loadDrinksContains(letters: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
