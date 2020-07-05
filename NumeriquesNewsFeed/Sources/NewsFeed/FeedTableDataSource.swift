//
//  FeedTableDataSource.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

final class FeedTableDataSource: NSObject {
    
    //MARK: -Public Properties
    var open: ((Int) -> Void)?
    
    //MARK: -Private Properties
    private var tableView: UITableView
    private var news: [NewsItem]?
    
    //MARK: -Init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: -Public methods
    func update(array: [NewsItem]) {
        self.news = array
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FeedTableDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        open?(indexPath.row)
    }
}

extension FeedTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let number = news?.count else {return 0}
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let news = (news?[indexPath.row]) else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let viewModel = NewsCellViewModel(news: news)
        cell.viewModel = viewModel
        cell.updateCell()
        return cell
    }
}
