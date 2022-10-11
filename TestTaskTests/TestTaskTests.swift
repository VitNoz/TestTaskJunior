//
//  TestTaskTests.swift
//  TestTaskTests
//
//  Created by Vitalik Nozhenko on 11.10.2022.
//

import XCTest
@testable import TestTask

class TestTaskTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPostViewModel() {
        let post = Post(postId: 0, timeshamp: 0, title: "First Post", preview_text: "", likes_count: 197)
        let postViewModel = PostViewModel(post: post)
        
        XCTAssertEqual(post.title, postViewModel.title)
        XCTAssertEqual(post.likes_count, postViewModel.likesCount)
    }
    
    func testTimeShampToPostDateConverter() {
        let post = Post(postId: 0, timeshamp: 1640995200, title: "", preview_text: "", likes_count: 0)
        let postDate = "January 1, 2022"
        let postViewModel = PostViewModel(post: post)
        
        XCTAssertEqual(postDate, postViewModel.postDate)
    }

}
