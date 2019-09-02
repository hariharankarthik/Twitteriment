# THE STOCK PREDICTING APP 

* This iOS app uses a Machine Learning model that performs sentiment analysis on tweets using Natural Language Processing.
* First, a Machine Learning model is trained with a dataset of 1000 tweets by using CreateML.
* The Swifter framework is then used to call the Twitter search API to scrape data of the last 100 live tweets.
* Sentiment analysis is performed on these tweets using CoreML, our trained Machine Learning model does the Natural Language Processing.
* The tweet data we get back from the Twitter API is then parsed in JSON using the SwiftyJSON cocoapod.
* Finally, we make batch predictions on these tweets using our sentiment classifier ML model and keep score of the prediction results.
* The prediction results are labelled as "Pos" (+1), "Neutral" (0), or "Neg" (-1) for each of the last 100 tweets of the searched twitter handle (ex:- "@apple") or hashtag (ex:- "#blessed").
* The final sentiment score for the searched twitter handle/hashtag is reflected on the updated UI and hence, the stock can be predicted.

## SCREENSHOTS

1. Initial look of the app, with the text field to search for a handle/hashtag and the label (which uses an emoji) to reflect the results:
![Screenshot1](https://user-images.githubusercontent.com/30194665/64114743-5e7f1800-cdab-11e9-9e54-13f1599a56a1.png)

1. A sentiment score of between -10 and -20 results in the following emoji for @facebook:
![Screenshot2](https://user-images.githubusercontent.com/30194665/64114849-bcabfb00-cdab-11e9-82b4-0dc11f2aefe4.png)

1. A sentiment score of between 0 and -10 results in the following emoji for @manutd:
![Screenshot3](https://user-images.githubusercontent.com/30194665/64114898-e533f500-cdab-11e9-9f59-b68cb40744de.png)

1. A sentiment score of between 0 and 10 results in the following emoji for @liverpoolfc:
![Screenshot4](https://user-images.githubusercontent.com/30194665/64114922-f250e400-cdab-11e9-988e-110e70fb021f.png)

1. A sentiment score of between 10 and 20 results in the following emoji for @pewdiepie:
![Screenshot5](https://user-images.githubusercontent.com/30194665/64114954-072d7780-cdac-11e9-80d5-02e3442e1766.png)
