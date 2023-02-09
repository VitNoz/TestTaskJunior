//
//  FavoritesListViewController.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 02.02.2023.
//

import UIKit
import SnapKit

class FavoritesListViewController: UIViewController {
    
    private var mainView = FavoritesListView()
    private var viewModel = FavoritesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        view.backgroundColor = .white
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        if !viewModel.favoritesArticle.isEmpty {
            mainView.emptyFavoritesLabel.isHidden = true
            mainView.favoritesArcticlesTableView.isHidden = false
        }

        viewModel.getData()
        mainView.favoritesArcticlesTableView.reloadData()
        
    }
    
    private func setupView() {
        
        mainView.favoritesArcticlesTableView.dataSource = viewModel
        mainView.favoritesArcticlesTableView.delegate = viewModel
        mainView.favoritesArcticlesTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.cellId)

        mainView.favoritesArcticlesTableView.rowHeight = view.bounds.height / 7
        
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

/// confotm to created protocol and execute func called in viewmodel
extension FavoritesListViewController: FavoritesListViewModelDelegate {
    
    func didLoadArticles() {
        mainView.favoritesArcticlesTableView.reloadData()
        if viewModel.favoritesArticle.isEmpty {
            mainView.emptyFavoritesLabel.isHidden = false
            mainView.favoritesArcticlesTableView.isHidden = true
        }
    }
    
    func didSelectArticle(article: FavoriteArticle) {
        let viewModel = FavoriteArticleDetailsViewModel(article: article)
        navigationController?.pushViewController(ArticleDetailsViewController(viewModel: viewModel), animated: true)
    }
    
}
