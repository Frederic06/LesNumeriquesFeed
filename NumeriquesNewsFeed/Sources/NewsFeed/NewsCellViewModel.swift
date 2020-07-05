//
//  NewsCellDataSource.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 04/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation

final class NewsCellViewModel {
    
    //MARK: -Public Properties
    
    var imageURL: ((URL) -> ())?
    var title: ((String) -> ())?
    var description: ((String) -> ())?
    var updateUI: (() -> ())?
        
    //MARK: -Private Properties
    
    private let news: NewsItem

    //MARK: -Init
    
    init(news: NewsItem) {
        self.news = news
    }
        
    //MARK: -Public method
    
    func cellDidAppear() {
        
        title?(news.title)
        description?(news.summary)
        guard let url = news.imageDataLink else {
            return
        }
        imageURL?(url)
        updateUI?()
    }
}


