// Playground - noun: a place where people can play

import Cocoa

var predictions = ["It is Certain", "It is decidedly so","All signs say YES","Concentrate and ask again"]

func randomPrediction() -> Int {
    var predictionsCount = UInt32(predictions.count)
    var random = arc4random_uniform(predictionsCount)
    return Int(random)
}

randomPrediction()

predictions[randomPrediction()]

var backgroundImageArray = [String]()
for imageNumber in 1...60 {
    if imageNumber < 10 {
        backgroundImageArray.append("CB0000\(imageNumber)")
    } else {
        backgroundImageArray.append("CB000\(imageNumber)")
    }
}
backgroundImageArray

