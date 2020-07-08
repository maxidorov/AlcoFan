//
//  ViewController.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class SearchDrinkViewController: UIViewController {
    
    var cocktailApiManager: CocktailApiManager!
    var cocktailDataProvider: CocktailDataProvider!
    
    let tableView = UITableView()
    let cellID = "cellID"
    
    let searchBar = UISearchBar()

    var filteredDrinks = [Drink]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Cocktails"
        
        setupTableView()
        loadAllDrinks()
        setupSearchBar()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    private func loadAllDrinks() {
        cocktailApiManager.loadAllCocktails { (result) in
            switch result {
            case .success(let drinks):
                self.cocktailDataProvider.drinks = drinks
                self.filteredDrinks = drinks
            case .failure(let error):
                print("Error in \(#function): \(error)")
            }
        }
    }
    
    private func setupSearchBar() {
        self.navigationItem.titleView = searchBar
        searchBar.placeholder = "All coctails"
        searchBar.keyboardType = .default
        searchBar.delegate = self
    }
}

extension SearchDrinkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = filteredDrinks[indexPath.row].strDrink!
        return cell
    }
}

extension SearchDrinkViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDrinks = cocktailDataProvider.drinks.filter { $0.strDrink!.lowercased().hasPrefix(searchText.lowercased()) }
        print(filteredDrinks.count)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
