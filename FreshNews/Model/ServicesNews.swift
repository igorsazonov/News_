//
//  ServicesNews.swift
//  FreshNews
//
//  Created by Игорь Сазонов on 02.07.2020.
//  Copyright © 2020 Игорь Сазонов. All rights reserved.
//

import Foundation
import UIKit

class ServicesNews: UIViewController {
    // MARK: - Let and Var
    
    private var requestForNews = "https://newsapi.org/v2/top-headlines?country=us&"
    private let apiKey = "1b9cf9318a7a463e8158b7e35ac33a9b"
    let requestForSourceNews = "https://newsapi.org/v2/sources?apiKey=1b9cf9318a7a463e8158b7e35ac33a9b"
    
    // MARK: - Function
    
    func loadNews(categoryNews: String, searchArticle: String, completionHandler: @escaping ([Article]) -> Void, errorHandler: @escaping (Error) -> Void) {
        if categoryNews.isEmpty && searchArticle.isEmpty {
            requestForNews.append("apiKey=\(apiKey)")
        } else if !categoryNews.isEmpty {
            requestForNews.append("category=\(categoryNews)&apiKey=\(apiKey)")
        } else {
            requestForNews = "https://newsapi.org/v2/everything?q=\(searchArticle)&apiKey=\(apiKey)"
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
                let message = String(errorMessage!) // написать AlerrtController
                self.callingTheAlertViewController(transmitMessages: message)
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
                self.callingTheAlertViewController(transmitMessages: errorMessage) // написать AlerrtController
                return
            }
        }
        taske.resume()
    }
    
    func loadSourceNews(completionHandler: @escaping ([Source]) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let urlSourceNews = URL(string: requestForSourceNews) else {return}
        let urlRequest = URLRequest(url: urlSourceNews)
        let taske = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                let httpResponse = response as? HTTPURLResponse
                let errorMessage = httpResponse?.statusCode
                let message = String(errorMessage!) // написать AlerrtController
                self.callingTheAlertViewController(transmitMessages: message)
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
                let sourceNewsList = try JSONDecoder().decode(Sources.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(sourceNewsList.sources)
                }
            } catch {
                let errorMessage = "Failed JSONDecoder"
                self.callingTheAlertViewController(transmitMessages: errorMessage) // написать AlerrtController
                return
            }
        }
        taske.resume()
    }
}
