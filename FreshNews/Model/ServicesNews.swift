//
//  ServicesNews.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 02.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation

class ServicesNews {
    public static let shared = ServicesNews()
    private var requestForNews = "https://newsapi.org/v2/top-headlines?country=us&"
    private let apiKey = "1b9cf9318a7a463e8158b7e35ac33a9b"
    func loadNews(categoryNews: String, searchArticle: String, completionHandler: @escaping ([Article]) -> Void, errorHandler: @escaping (Error) -> Void) {
        if categoryNews == "" {
            requestForNews.append("apiKey=\(apiKey)")
        } else {
            requestForNews.append("category=\(categoryNews)&")
        }
        guard let urlNews = URL(string: requestForNews) else {return}
        let urlRequest = URLRequest(url: urlNews)
        let taske = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                let httpResponse = response as? HTTPURLResponse
                let errorMessage = httpResponse?.statusCode
                print(errorMessage!) // написать AlerrtController
                return
            }
            print(errorHandler)
            guard let data = data else {
                DispatchQueue.main.async { // выполняем в общем потоке
                    errorHandler(NSError(domain: "", code: 0, userInfo: nil))
                }
                return
            }
            do {
                let newsList = try JSONDecoder().decode(News.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(newsList.articles)
                }
            } catch {
                let errorMessage = "Failed JSONDecoder"
                print(errorMessage) // написать AlerrtController
                return
            }
        }
        taske.resume()
    }
}
