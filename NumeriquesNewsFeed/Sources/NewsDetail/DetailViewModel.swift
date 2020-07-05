//
//  DetailViewModel.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation

protocol DetailViewModelDelegate {
    func dismissed()
    func seeOnline(url: URL)
}

final class DetailViewModel {
    
    //MARK: -Public properties
    var imageURL: ((URL) -> ())?
    var title: ((String) -> ())?
    var description: ((String) -> ())?
    var link: ((URL) -> ())?
    var navigationTitle: ((String) -> ())?
    var dateLabel: ((String) -> ())?
    var authorLabel :((String) -> ())?
    
    //MARK: -Private properties
    private let delegate: DetailViewModelDelegate
    private let repository: NewsRepositoryType
    private let selectedNews: NewsItem
    
    //MARK: -Init
    init(delegate: DetailViewModelDelegate, news: NewsItem, repository: NewsRepositoryType) {
        self.delegate = delegate
        self.selectedNews = news
        self.repository = repository
    }
    
    //MARK: -Public methods
    func viewDidAppear() {
        title?(selectedNews.title)
        description?(selectedNews.descriptionl)
        navigationTitle?("News Detail")
        guard let url = selectedNews.imageDataLink else {return}
        imageURL?(url)
        authorLabel?("Auteur: \(selectedNews.author)")
        dateLabel?("Le \(selectedNews.date.transformToDayMonthString())")
    }
    
    func didPressDismiss() {
        delegate.dismissed()
    }
    
    func pressedSeeButton() {
        guard let url = URL(string: selectedNews.link) else {return}
        delegate.seeOnline(url: url)
    }
}
