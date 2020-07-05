//
//  NewsCell.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 04/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    //MARK: -Public Properties
    
    var viewModel: NewsCellViewModel!
    
    //MARK: -IB Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    //MARK: -Public method
    
    func updateCell() {
        bind(to: viewModel)
        viewModel.cellDidAppear()
    }
    
    //MARK: -Private method
    
    private func bind(to viewModel: NewsCellViewModel) {
        viewModel.imageURL = { [weak self] url in
            if let data = try? Data( contentsOf: url) {
                guard let unwrappedImage = UIImage(data: data) else {return}
                self?.newsImage.image = unwrappedImage
            } else {
                self?.newsImage.image = UIImage(named:"omer") }
        }
        
        viewModel.title = { [weak self] title in
            self?.titleLabel.text = title
        }
        
        viewModel.description = { [weak self] description in
            self?.summary.text = description
        }
        
        viewModel.updateUI = { [weak self] in
            self?.setUI()
        }
    }
    
    private func setUI() {
        newsImage.roundCorners([.topRight, .bottomRight, .topLeft, .bottomLeft], radius: 15)
    }
}
