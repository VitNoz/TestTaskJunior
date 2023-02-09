//
//  ArticleTableViewCell.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 03.02.2023.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    
    static let cellId = "ArticleTableViewCell"
    
    let titleImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "xmark.icloud")
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    let byLineLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    let publishedDateLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .secondarySystemBackground
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        
        contentView.addSubview(titleImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(byLineLabel)
        contentView.addSubview(publishedDateLabel)
        
        titleImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.leading.equalToSuperview().offset(5)
            make.width.equalTo(titleImage.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(titleImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        byLineLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalTo(titleLabel.snp.centerX).offset(30)
            make.leading.equalTo(titleImage.snp.trailing).offset(10)
            
        }
        
        publishedDateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.trailing.equalToSuperview().offset(-2)
        }
        
    }
        ///for configure articleListCell
    func configureCell(viewModel: ArticleTableViewCellViewModel) {
        
        titleLabel.text = viewModel.articleTitle
        byLineLabel.text = viewModel.articleByline
        publishedDateLabel.text = viewModel.articlePublishedDate
        viewModel.getImage(completion: { data, _ in
            DispatchQueue.main.async { [unowned self] in
                self.titleImage.image = UIImage(data: data!)
            }
        })
    }
    ///for configure FavouriteArticleListCell
    func configureCellFavorites(viewModel: ArticleTableViewCellViewModel) {
        
        titleLabel.text = viewModel.articleTitle
        byLineLabel.text = viewModel.articleByline
        publishedDateLabel.text = viewModel.articlePublishedDate
        if let data = viewModel.articleImageData {
            titleImage.image = UIImage(data: data)
        }
    }
}

