//
//  Extensions.swift
//  NumeriquesNewsFeed
//
//  Created by Margarita Blanc on 04/07/2020.
//  Copyright © 2020 Frederic Blanc. All rights reserved.
//

import UIKit

extension String {
    
    func deleteAfter(character: String) -> String?{
        if let index = self.range(of: character)?.lowerBound {
            let substring = self[..<index]                 //
            
            let string = String(substring)
            return string
        }
        return self
    }
}

extension String {
    
    func getImageURL() -> URL?{
        let short = self.dropLast(26)
        let toto = String(short)
        let endOfSentence = toto.firstIndex(of: "=")!
        let firstSentence = toto[endOfSentence...]
        let jojo = String(firstSentence.dropFirst(2))
        guard let url = URL(string: jojo) else {return nil}
        return url
    }
    
    func transformToDescription() -> String?{
        let cleaned = self.deleteAfter(character: "<br")
        let replaced = cleaned?.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil)
        return replaced
    }
}

extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

extension Date {
    func transformToDayMonthString() -> String {
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd/MM"
        let finalDate = outputDateFormatter.string(from: self)
        
        return finalDate
    }
}


