//
//  NewsRepository.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation
import FeedKit

protocol NewsRepositoryType {
    func downloadNews(requestType: Request, callback: @escaping ([NewsItem]?) -> Void)
}

final class NewsRepository: NewsRepositoryType {
    
    private let route = Route()
    
    private let networkClient = Network()
    
    func downloadNews(requestType: Request, callback: @escaping ([NewsItem]?) -> Void) {
        
        guard let url = route.getURL(request: requestType) else {callback(nil); return}
        
        networkClient.dataRequest(with: url) { result in
            switch result {
            case .success(let feed):
                
                guard let feedNumber = feed?.entries?.count else {callback(nil); return}
                var news: [NewsItem] = []
                for index in 0 ... feedNumber - 1 {
                    let entry = feed?.entries?[index]
                    let description = entry?.content?.value?.transformToDescription()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                    let imageURLData = entry?.content?.value?.getImageURL()
                    let title = entry?.title?.replacingOccurrences(of: " Actualité : ", with: "").trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                    let authorName = entry?.authors?[0].name ?? ""
                    let urlString = entry?.links?[0].attributes?.href ?? ""
                    let summary = entry?.summary?.value ?? ""
                    let date = entry?.updated ?? Date()
                    
                    let newsItem = NewsItem(imageDataLink: imageURLData, title: title, summary: summary, descriptionl: description, link: urlString, author: authorName, date: date)
                    news.append(newsItem)
                }
                callback(news)

            default:
                break
            }
        }
        
    }
}


