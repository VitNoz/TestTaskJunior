//
//  ArticleDetailsViewController.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 07.02.2023.
//

import UIKit
import SnapKit

class ArticleDetailsViewController: UIViewController {
    
    private var mainView = ArticleDetailsView()
    private var viewModel: ArticleTableViewCellViewModel?
    private var viewModelFavorites: FavoriteArticleDetailsViewModel?
    
    /// init VC with viewmodel for articles from api
    init(viewModel: ArticleTableViewCellViewModel) {
        self.viewModel = viewModel
        mainView.configureView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    /// init VC with viewmodel for favorites articles from coredata
    init(viewModel: FavoriteArticleDetailsViewModel) {
        self.viewModelFavorites = viewModel
        mainView.configureViewFavorites(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The New York Times"
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
