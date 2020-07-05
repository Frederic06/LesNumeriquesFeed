//
//  AppCoordinator.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//


import UIKit
import SafariServices

final class AppCoordinator {
    
// MARK: - Private properties
    private var presenter: UIWindow
    private var navigator = UINavigationController()
    private var screens = Screens()
    private let container = UserDefaults.standard
    
// MARK: - Initializer
    init(presenter: UIWindow) {
        self.presenter = presenter
    }
    
// MARK: - Coordinator
    func start() {
        presenter.rootViewController = navigator
        
        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }
        showFeed()
    }
    
// MARK: -Private methods
    
    private func showFeed() {
        let viewController = screens.createFeedViewController(delegate: self)
        navigator.viewControllers = [viewController]
    }
    
    private func showDetail(news: NewsItem) {
        let viewController = screens.createDetailViewController(delegate: self, news: news)
        navigator.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: FeedViewModelDelegate {
    func requestError() {
    }
    
    func selected(news: NewsItem) {
        showDetail(news: news)
    }
}

extension AppCoordinator: DetailViewModelDelegate {
    func seeOnline(url: URL) {
        let vc = SFSafariViewController(url: url)
        navigator.present(vc, animated: true)
    }
    
    func dismissed() {
        navigator.popViewController(animated: true)
    }
}
