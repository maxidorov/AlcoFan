//
//  CocktailDetailsViewController.swift
//  AlcoFan
//
//  Created by Maxim Sidorov on 09.08.2020.
//  Copyright © 2020 MS. All rights reserved.
//

import UIKit

protocol CocktailDetailsViewProtocol: class {
    
}

class CocktailDetailsViewController: UIViewController {
    
    public var presenter: CocktailDetailsPresenter?
    
    private var drink: Drink
    
    private var scrollView: UIScrollView!
    private var tableView: UITableView!
    private var drinkImageView: CachedImageView!
    
    private var minimumDrinkImageViewOffset: CGFloat = 120
    private var drinkImageViewOffset: CGFloat = 300
    private var tableViewInitialContentOffset: CGPoint {
        return CGPoint(x: 0, y: -drinkImageViewOffset)
    }
    
    private var cellSeparatorInsets: UIEdgeInsets {
        let sideInset = view.frame.width * 0.3 / 2 - 10
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    init(_ drink: Drink) {
        self.drink = drink
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        drinkImageView.loadImage(from: drink.strDrinkThumb)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTransparentNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setupNontransparentNavigationBar()
    }
    
    private func setupUI() {
        setupTableView()
        setupDrinkImageView()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DrinkIngredientCell", bundle: nil), forCellReuseIdentifier: DrinkIngredientCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.fill(view)
        tableView.contentInset = UIEdgeInsets(top: drinkImageViewOffset, left: 0, bottom: 0, right: 0)
        tableView.setContentOffset(tableViewInitialContentOffset, animated: true)
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupDrinkImageView() {
        drinkImageView = CachedImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: drinkImageViewOffset))
        drinkImageView.contentMode = .scaleAspectFill
        drinkImageView.clipsToBounds = true
        view.addSubview(drinkImageView)
    }
}

extension CocktailDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.ingredientsNamesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DrinkIngredientCell.cellID, for: indexPath) as! DrinkIngredientCell
        cell.separatorInset = cellSeparatorInsets
        let ingredientNumber = indexPath.row + 1
        let viewModel = DrinkIngredientCell.DrinkIngredientCellViewModel(
            ingredientName: drink.getNumeratedProperty("strIngredient", index: ingredientNumber),
            ingredientMeasure: drink.getNumeratedProperty("strMeasure", index: ingredientNumber)
        )
        cell.configure(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40.0
    }
}

extension CocktailDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard drinkImageView != nil else { return }
        let currentTableViewOffsetY = -tableView.contentOffset.y
        let drinkImageViewHeight = max(minimumDrinkImageViewOffset, currentTableViewOffsetY)
        drinkImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: drinkImageViewHeight)
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    
}
