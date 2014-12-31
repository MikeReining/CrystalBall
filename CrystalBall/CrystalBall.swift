//
//  CrystalBall.swift
//  CrystalBall
//
//  Created by Michael Reining on 12/30/14.
//  Copyright (c) 2014 Mike Reining. All rights reserved.
//

import Foundation
import UIKit

class CrystalBall: NSObject {

    let predictions = ["It is Certain", "It is Decidedly so", "All signs say YES", "The stars are not aligned", "My reply is no", "It is doubtful", "Better not tell you now", "Concentrate and ask again", "Unable to answer now"]
    
    func randomPrediction() -> String {
        var predictionsCount = UInt32(predictions.count)
        var random = arc4random_uniform(predictionsCount)
        return predictions[Int(random)]
    }
}