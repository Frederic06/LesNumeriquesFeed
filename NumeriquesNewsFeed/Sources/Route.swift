//
//  Route.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation

enum Request {
    case news
}

final class Route {
    private let newsFeedUrl = "https://www.lesnumeriques.com/rss.xml"
}

// MARK: - URL Return
extension Route {
    
    func getURL(request: Request) -> URL? {
        var urlString: String
        switch request {
        case .news:
            urlString = newsFeedUrl
        }
        return URL(string: urlString)
    }
}
