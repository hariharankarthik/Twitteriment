import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/hari/Downloads/twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 6)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData)

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Hariharan Karthikeyan", shortDescription: "A model trained to perform sentiment analysis on tweets", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/hari/Downloads/SentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: "@Apple is a terrible company!")

try sentimentClassifier.prediction(from: "@Apple is a bad company!")

try sentimentClassifier.prediction(from: "I just found the best restaurant ever, and it's @DuckandWaffle")

try sentimentClassifier.prediction(from: "@Facebook is a terrible company!")
