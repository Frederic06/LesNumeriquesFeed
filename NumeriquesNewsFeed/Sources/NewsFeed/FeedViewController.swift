//
//  FeedViewController.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: -Public Properties
    var viewModel: FeedViewModel!
    var dataSource: FeedTableDataSource!
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var newsTable: UITableView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: -ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = FeedTableDataSource(tableView: newsTable)
        bind(to: viewModel)
        bind(to: dataSource)
        viewModel.viewDidAppear()
    }
    
    //MARK: -Private methods
    private func bind(to viewModel: FeedViewModel) {
        viewModel.newsToDisplay = dataSource.update
        
        viewModel.navigationTitle = { [weak self] title in
            self?.navigationItem.title = title
        }
        
        viewModel.tableVisible = { [weak self] status in
            self?.newsTable.isHidden = !status
        }
        
        viewModel.indicatorVisible = { [weak self] status in
            self?.indicator.isHidden = !status
            status == true ? self?.indicator.startAnimating() : self?.indicator.stopAnimating()
        }
    }
    
    private func bind(to dataSource: FeedTableDataSource) {
        dataSource.open = viewModel.didSelect
    }
}
