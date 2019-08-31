//
//  ViewController.swift
//  Twitteriment
//
//  Created by Hari on 2019-08-27.
//  Copyright © 2019 Hariharan Karthikeyan. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var sentimentLabel: UILabel!
    
    @IBOutlet weak var sentimentText: UITextField!
    
    let sentimentClassifier = SentimentClassifier()
    
    let tweetCount = 100
    
    let swifter = Swifter(consumerKey: "9oRxKmIDkT2HYxSaURxFd78Fn", consumerSecret: "ZMcm0UnUuyGlWcr2zT7BBp5lEs0osZP0BMxSSAEazH53pTTs83")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func sentimentButton(_ sender: Any) {
        
        getTweets()
        
    }
    
    func getTweets() {
        
        if let textEntered = sentimentText.text {
            
            swifter.searchTweet(using: textEntered, lang: "en", count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
                
                var tweets = [SentimentClassifierInput]()
                
                for i in 0..<self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetForClassification = SentimentClassifierInput(text: tweet)
                        tweets.append(tweetForClassification)
                    }
                }
                
                self.predict(with: tweets)
                
            }) { (error) in
                print("There was an error with the Twitter API Request, \(error)")
            }
        }
    }
    
    func predict(with tweets: [SentimentClassifierInput]) {
        
        do {
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            
            var sentimentScore = 0
            
            for prediction in predictions {
                if prediction.label == "Pos" {
                    sentimentScore += 1
                } else if prediction.label == "Neg" {
                    sentimentScore += -1
                }
            }
            
            updateUI(with: sentimentScore)
            
        } catch {
            print("There was an error with making a prediction, \(error)")
        }
        
    }
    
    func updateUI(with sentimentScore: Int) {
        
        if sentimentScore > 20 {
            self.sentimentLabel.text = "😁"
        } else if sentimentScore > 10 {
            self.sentimentLabel.text = "😄"
        } else if sentimentScore > 0 {
            self.sentimentLabel.text = "🙂"
        } else if sentimentScore == 0 {
            self.sentimentLabel.text = "😐"
        } else if sentimentScore > -10 {
            self.sentimentLabel.text = "😕"
        } else if sentimentScore > -20 {
            self.sentimentLabel.text = "😡"
        } else {
            self.sentimentLabel.text = "🤮"
        }
        
    }
        
    }
    
        
        

    

