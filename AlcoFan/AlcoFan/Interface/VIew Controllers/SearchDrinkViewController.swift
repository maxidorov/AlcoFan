//
//  ViewController.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 08.07.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

class SearchDrinkViewController: UIViewController {
    
    var cocktailDataProvider: CocktailDataProvider!
    var cocktailApiManager: CocktailApiManager!
    
    let tableView = UITableView()
    let cellID = "cellID"

    var filteredDrinks = [Drink]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadAllDrinks()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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
}

extension SearchDrinkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailDataProvider.drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = cocktailDataProvider.drinks[indexPath.row].strDrink
        return cell
    }
}
