//
//  Quote.swift
//  CrystalBall
//
//  Created by Michael Reining on 12/30/14.
//  Copyright (c) 2014 Mike Reining. All rights reserved.
//

import UIKit
import Foundation

class Quote: NSObject {
    var quotes = ["You can do it","Sweet as suguar","You will reach your goals"]
    
    func randomQuotes() -> String {
        var quotesCount = UInt32(quotes.count)
        var random = arc4random_uniform(quotesCount)
        return quotes[Int(random)]
    }
    
}
