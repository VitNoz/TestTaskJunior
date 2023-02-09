//
//  ArticlesListViewController.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 04.02.2023.
//

import UIKit
import SnapKit

class ArticlesListViewController: UIViewController {
    
    private var mainView = ArticlesListView()
    private var viewModel = ArticleListViewModel()
    private var articlesCategory: ArticleCategory?
    
    init(articlesCategory: ArticleCategory) {
        super.init(nibName: nil, bundle: nil)
        self.articlesCategory = articlesCategory
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.delegate = self
        viewModel.getArticles(articlesCategory: articlesCategory!)
    }
        
    private func setupView() {
        
        mainView.arcticlesTableView.dataSource = viewModel
        mainView.arcticlesTableView.delegate = viewModel
        mainView.arcticlesTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.cellId)
        
        mainView.arcticlesTableView.rowHeight = view.bounds.height / 7
        
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
extension ArticlesListViewController: ArticleListViewModelDelegate {
    
    func didLoadArticles() {
        mainView.downloadSpinner.stopAnimating()
        mainView.arcticlesTableView.isHidden = false
        mainView.arcticlesTableView.reloadData()
    }
    
    func didSelectArticle(viewModel: ArticleTableViewCellViewModel) {
        navigationController?.pushViewController(ArticleDetailsViewController(viewModel: viewModel), animated: true)
    }
    
}
