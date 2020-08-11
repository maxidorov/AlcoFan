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
    
    private var scrollView: UIScrollView!
    private var drinkImageView: CachedImageView!
    
    private var drink: Drink
    
    init(_ drink: Drink) {
        self.drink = drink
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUI()
        drinkImageView.loadImage(from: drink.strDrinkThumb)
    }
    
    private func setupUI() {
        setupBasicUI()
        setupScrollView()
        setupDrinkImageView()
        addCustomView()
    }
    
    private func setupBasicUI() {
        view.backgroundColor = .white
        title = drink.strDrink ?? "??"
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.fill(view)
        scrollView.isScrollEnabled = true
    }
    
    private func setupDrinkImageView() {
        drinkImageView = CachedImageView()
        scrollView.addSubview(drinkImageView)
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        drinkImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        drinkImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        drinkImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        drinkImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        drinkImageView.heightAnchor.constraint(equalTo: drinkImageView.widthAnchor).isActive = true
    }
    
    private func addCustomView() {
        let v = UIView()
        v.backgroundColor = .green
        scrollView.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor).isActive = true
        v.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        v.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        v.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        v.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}

extension CocktailDetailsViewController: UIScrollViewDelegate {
    
    // FIXME: Zoom image effect on drag down
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var scale = 1.0 + CGFloat(fabsf(Float(scrollView.contentOffset.y))) / CGFloat(scrollView.frame.size.height)
        scale = max(0.0, scale)
        drinkImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    
}
