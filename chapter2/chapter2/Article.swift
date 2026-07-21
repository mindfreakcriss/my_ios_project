//
//  Article.swift
//  chapter2
//
//  Created by huangkaibo on 2026/7/21.
//
import SwiftUI

struct Article {
    var image: String
    var title: String
    var articleNum: Int
    var subcription: Int
    
    static let articles = [
        Article(image: "covershot", title: "Article_one", articleNum: 22, subcription: 245),
        Article(image: "covershot", title: "Article_two", articleNum: 37, subcription: 309),
        Article(image: "covershot", title: "Article_three", articleNum: 42, subcription: 425)
    ]
}
