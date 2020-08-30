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
    
    private var tableViewRowsCount: Int {
        drink.ingredientsNamesCount + 2
    }
    
    private var minimumDrinkImageViewOffset: CGFloat = 120
    private var drinkImageViewOffset: CGFloat = 300
    private var tableViewInitialContentOffset: CGPoint {
        return CGPoint(x: 0, y: -drinkImageViewOffset)
    }
    
    private var cellWithIngredientInsets: UIEdgeInsets {
        let sideInset = view.frame.width * 0.2 / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    private var cellEmptySeparator: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: tableView.frame.width, bottom: 0, right: 0)
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
        tableView.register(UINib(nibName: "DrinkRecipeLabelCell", bundle: nil), forCellReuseIdentifier: DrinkRecipeLabelCell.cellID)
        tableView.register(UINib(nibName: "DrinkIngredientCell", bundle: nil), forCellReuseIdentifier: DrinkIngredientCell.cellID)
        tableView.register(UINib(nibName: "DrinkRecipeDescriptionCell", bundle: nil), forCellReuseIdentifier: DrinkRecipeDescriptionCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.fill(view)
        tableView.contentInset = UIEdgeInsets(top: drinkImageViewOffset, left: 0, bottom: 0, right: 0)
        tableView.setContentOffset(tableViewInitialContentOffset, animated: true)
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.separatorColor = Brandbook.drinkIngredientsTableViewSeparatorColor
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.allowsSelection = false
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
        tableViewRowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DrinkRecipeLabelCell.cellID, for: indexPath) as! DrinkRecipeLabelCell
            cell.separatorInset = cellEmptySeparator
            return cell
        case 1...tableViewRowsCount - 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DrinkIngredientCell.cellID, for: indexPath) as! DrinkIngredientCell
            let viewModel = DrinkIngredientCell.DrinkIngredientCellViewModel(
                ingredientName: drink.getNumeratedProperty("strIngredient", index: row),
                ingredientMeasure: drink.getNumeratedProperty("strMeasure", index: row)
            )
            cell.configure(viewModel)
            cell.separatorInset = (row == tableViewRowsCount - 2) ? cellEmptySeparator : cellWithIngredientInsets
            return cell
        case tableViewRowsCount - 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DrinkRecipeDescriptionCell.cellID, for: indexPath) as! DrinkRecipeDescriptionCell
            cell.setDrinkRecipeDescription(text: drink.strInstructions)
            cell.separatorInset = cellEmptySeparator
            return cell
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        case 1...drink.ingredientsNamesCount:
            return 40
        case drink.ingredientsNamesCount + 1:
            return 300
        default:
            return 0
        }
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
