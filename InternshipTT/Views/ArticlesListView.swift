//
//  ArticlesListView.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 02.02.2023.
//

import UIKit
import SnapKit

class ArticlesListView: UIView { 
    
    let arcticlesTableView: UITableView = {
        let view = UITableView()
        view.isHidden = true
        return view
    }()
    
    let downloadSpinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.hidesWhenStopped = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        downloadSpinner.startAnimating()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(arcticlesTableView)
        addSubview(downloadSpinner)
        
        arcticlesTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        downloadSpinner.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
}
