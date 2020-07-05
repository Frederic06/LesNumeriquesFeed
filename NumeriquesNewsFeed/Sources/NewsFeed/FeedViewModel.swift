//
//  FeedViewModel.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation

protocol FeedViewModelDelegate {
    func selected(news: NewsItem)
    func requestError()
}

final class FeedViewModel {
    
    //MARK: -Public properties
    var pageTitle: ((String) -> Void)?
    var newsToDisplay: (([NewsItem]) -> Void)?
    var navigationTitle: ((String) -> ())?
    var indicatorVisible: ((Bool) -> ())?
    var tableVisible: ((Bool) -> ())?
    
    //MARK: -Private properties
    private let delegate: FeedViewModelDelegate
    private let repository: NewsRepositoryType
    private var news: [NewsItem]? {
        didSet {
            guard let news = news else { return }
            indicatorVisible?(false)
            tableVisible?(true)
            newsToDisplay?(news)
        }
    }
    
    //MARK: -Init
    init(delegate: FeedViewModelDelegate, repository: NewsRepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }
    
    //MARK: -Public methods
    func viewDidAppear() {
        indicatorVisible?(true)
        tableVisible?(false)
        navigationTitle?("News Feed")
        repository.downloadNews(requestType: .news) { (news) in
            guard let news = news else {self.delegate.requestError(); return}
            self.news = news
        }
    }
    
    func didSelect(index: Int) {
        guard let selectedNews = news?[index] else { return }
        delegate.selected(news: selectedNews)
    }
}
