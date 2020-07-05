//
//  Screens.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

final class Screens {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

// MARK: - Research

extension Screens {
    func createFeedViewController(delegate: FeedViewModelDelegate) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        let repository = NewsRepository()
        let viewModel = FeedViewModel(delegate: delegate, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailViewController(delegate: DetailViewModelDelegate, news: NewsItem) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let repository = NewsRepository()
        let viewModel = DetailViewModel(delegate: delegate, news: news, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}
