//
//  Network.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 03/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import FeedKit

//APPError enum which shows all possible errors
enum APPError: Error {
    case networkError
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APPError)
}

final class Network{
    
    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest(with url: URL, completion: @escaping (Result<AtomFeed?>) -> Void) {

        let parser = FeedParser(URL: url)
        
        // Parse asynchronously, not to block the UI.
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in

            // Do your thing, then back to the Main thread
            DispatchQueue.main.async {
                // ..and update the UI
                switch result {
                case .success(let feed):
                    
                    // Or alternatively...
                    switch feed {     // Atom Syndication Format Feed Model
                    case let .atom(feed):
                        completion(.success(feed))
                    default:
                        break// JSON Feed Model
                    }
                    
                case .failure( _):
                    completion(.failure(.networkError))
                }
            }
        }
    }
}
