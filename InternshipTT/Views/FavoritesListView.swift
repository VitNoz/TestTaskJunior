//
//  FavoritesListView.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 06.02.2023.
//

import UIKit
import SnapKit

class FavoritesListView: UIView {
    
    let favoritesArcticlesTableView: UITableView = {
        let view = UITableView()
        view.isHidden = true
        return view
    }()
    
    let emptyFavoritesLabel: UILabel = {
        let view = UILabel()
        view.text = """
                    There are no articles in favorites.
                    Add articles to your favorites to be able to read them offline
                    """
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(favoritesArcticlesTableView)
        addSubview(emptyFavoritesLabel)
        
        favoritesArcticlesTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        emptyFavoritesLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }
    }
}
