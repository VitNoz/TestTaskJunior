//
//  PostDetailsViewController.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 06.10.2022.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    static let shared = PostDetailsViewController()
    
    var post: Post! {
        didSet {
            guard let url = URL(string: post.postImage!) else {return}
            if let data = try? Data(contentsOf: url) {
                postImage.image = UIImage(data: data)
            }
            titleLabel.text = post.title
            textView.text = post.text
            likesLabel.text = String(post.likes_count)
            dateLabel.text = {
                let date = Date(timeIntervalSince1970: TimeInterval(post.timeshamp))
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = DateFormatter.Style.long
                dateFormatter.locale = Locale(identifier: "en_US")
                let dateText = dateFormatter.string(from: date)
                return dateText
            }()
        }
    }
    
    let postImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.font = .systemFont(ofSize: 17)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let likesImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bolt.heart.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setConstraints()
    }
    
    func setConstraints() {
        
        view.addSubview(postImage)
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/5)
        ])
        
        view.addSubview(likesImage)
        NSLayoutConstraint.activate([
            likesImage.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            likesImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])

        view.addSubview(likesLabel)
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            likesLabel.leadingAnchor.constraint(equalTo: likesImage.trailingAnchor)
        ])

        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
