//
//  PostController.swift
//  TestTask
//
//  Created by Vitalik Nozhenko on 03.10.2022.
//

import UIKit

class PostController: UITableViewController {
    
    static let shared = PostController()
    
    var posts = [Post]()
    //var detailedPosts = [PostDetails]()
    let cellId = "\(String(describing: CustomPostCell.self))"//XIB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
        
    }
    
    fileprivate func fetchData() {
        //Parser.shared.getPosts { (posts, postsDetails, err) in
            Parser.shared.getPosts { (posts, err) in
            if let err = err {
                print("Failed to fetch posts:", err)
                return
            }
            
            self.posts = posts?.posts ?? []
                //print(self.posts[0])
                //print(self.posts)
            //self.detailedPosts = postsDetails ?? []
            //self.posts = self.posts.sorted(by: {$0.postId < $1.postId})
            //self.detailedPosts = self.detailedPosts.sorted(by: {$0.postId < $1.postId})
            //print(self.detailedPosts.count)
            //print(self.detailedPosts[1])
//            for index in 0..<self.posts.count {
//                self.posts[index].text = self.detailedPosts[index].text
//                self.posts[index].postImage = self.detailedPosts[index].postImage
//            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomPostCell
        cell.post = posts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        PostDetailsViewController.shared.post = posts[indexPath.row]
        navigationController?.pushViewController(PostDetailsViewController.shared, animated: true)
    }
    
    fileprivate func setupTableView() {
        //tableView.register(PostCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupNavBar() {
        title = "Posts"

        let sortByRatingMenuHandler: UIActionHandler = { [unowned self] _ in
            posts = posts.sorted(by:{ $0.likes_count > $1.likes_count })
            tableView.reloadData()
        }
        let sortByDateMenuHandler: UIActionHandler = { [unowned self] _ in
            posts = posts.sorted(by:{ $0.timeshamp > $1.timeshamp })
            tableView.reloadData()
        }
        
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("by date", comment: ""), image: UIImage(systemName: "calendar"), handler: sortByDateMenuHandler),
            UIAction(title: NSLocalizedString("by rating", comment: ""), image: UIImage(systemName: "heart"), handler: sortByRatingMenuHandler)
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "arrow.up.arrow.down"), primaryAction: nil, menu: barButtonMenu)
    }
}
