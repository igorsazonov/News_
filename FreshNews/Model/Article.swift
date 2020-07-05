//
//  Article.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 01.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

struct Article: Codable {
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
