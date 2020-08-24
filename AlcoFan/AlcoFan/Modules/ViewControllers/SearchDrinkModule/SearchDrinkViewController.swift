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
    
    public var presenter: SearchDrinkPresenter?
    
    private var searchBar: UISearchBar!
    private var collectionView: UICollectionView!
    private static let cellID = "cellID"

    private var filteredDrinks = [Drink]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupSearchBar()
        setupCollectionView()
        
        self.presenter?.loadAllDrinks()
    }
    
    private func setupTitle() {
        title = "All Cocktails"
    }
    
    private func setupCollectionView() {
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 130)
            return layout
        }()
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DrinkCell", bundle: nil), forCellWithReuseIdentifier: DrinkCell.cellID)
        collectionView.backgroundColor = .white
    }
    
    private func setupSearchBar() {
        searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Search cocktail..."
        searchBar.keyboardType = .default
    }
}

extension SearchDrinkViewController: SearchDrinkViewProtocol {
    func updateDrinks(drinks: [Drink]) {
        self.filteredDrinks = drinks
    }
}

extension SearchDrinkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredDrinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DrinkCellModuleBuilder.build(collectionView: collectionView, cellID: DrinkCell.cellID, indexPath: indexPath)
        cell.configure(with: filteredDrinks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let drink = filteredDrinks[indexPath.row]
        presenter?.pushCocktailDetailsViewController(drink)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
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
