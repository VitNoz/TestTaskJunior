//
//  FavoritesListViewModel.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 06.02.2023.
//

import UIKit

class FavoritesListViewModel: NSObject {
    
    weak var delegate: FavoritesListViewModelDelegate?
    
    var favoritesArticle: [FavoriteArticle] = []
    
        ///filling favorites article from core data
    func getData() {

        favoritesArticle = CoreDataManager.shared.fecthData()
    }
}

extension FavoritesListViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.cellId,
                                                            for: indexPath) as! ArticleTableViewCell
        let article = favoritesArticle[indexPath.row]
        let viewModel = ArticleTableViewCellViewModel(articleTitle: article.title!, articlePublishedDate: article.publishedDate!, articleByline: article.byline!, articleImageUrl: nil, articleAbstract: "", articleImageData: article.image)
        cell.configureCellFavorites(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
        /// detele article from favorites via tableview cell right swipe
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _,_,_ in
            CoreDataManager.shared.deleteData(object: (self?.favoritesArticle[indexPath.row])!)
            self?.favoritesArticle.remove(at: indexPath.row)
            self?.delegate?.didLoadArticles()
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = favoritesArticle[indexPath.row]
        self.delegate?.didSelectArticle(article: article)
    }
    
}
