//
//  DetailViewController.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARKK: -Public properties
    
    var viewModel: DetailViewModel!
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsDescription: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var linkButton: UIButton!
    
    // MARK: -ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidAppear()
    }
    
    // MARK: -Private methods
    
    private func bind(to viewModel: DetailViewModel) {
        viewModel.navigationTitle = { [weak self] title in
            self?.navigationItem.title = title
            
        }
        
        viewModel.title = { [weak self] title in
            self?.newsTitle.text = title
        }
        
        viewModel.description = { [weak self] text in
            self?.newsDescription.text = text
        }
        
        viewModel.imageURL = { [weak self] url in
            if let data = try? Data( contentsOf: url) {
                guard let unwrappedImage = UIImage(data: data) else {return}
                self?.newsImage.image = unwrappedImage
            } else {
                self?.newsImage.image = UIImage(named:"omer");
                return
            }
        }
        
        viewModel.dateLabel = { [weak self] dateString in
            self?.dateLabel.text = dateString
        }
        
        viewModel.authorLabel = { [weak self] authorString in
            self?.authorLabel.text = authorString
        }
    }

    // MARK: -IB Actions
    
    @IBAction func pressedLin(_ sender: Any) {
        viewModel.pressedSeeButton()
    }
}
