//
//  NewsItem.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import Foundation

struct NewsItem: Decodable {
    let imageDataLink: URL?
    let title: String
    let summary: String
    let descriptionl: String
    let link: String
    let author: String
    let date: Date
}
