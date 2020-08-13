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
    
    private var minimumDrinkImageViewOffset: CGFloat = 80
    private var drinkImageViewOffset: CGFloat = 300
    private var tableViewInitialContentOffset: CGPoint {
        return CGPoint(x: 0, y: -drinkImageViewOffset)
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
    
    private func setupUI() {
        setupTransparentNavigationBar()
        setupTableView()
        setupDrinkImageView()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
//        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
//        drinkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        drinkImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        drinkImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        drinkImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}

extension CocktailDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
}

extension CocktailDetailsViewController: UIScrollViewDelegate {
    
    // FIXME: Zoom image effect on drag down
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard drinkImageView != nil else { return }
        let currentTableViewOffsetY = -tableView.contentOffset.y
        let drinkImageViewHeight = max(minimumDrinkImageViewOffset, currentTableViewOffsetY)
        drinkImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: drinkImageViewHeight)
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    
}
