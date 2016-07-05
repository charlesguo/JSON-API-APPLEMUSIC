//
//  ViewController.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController {

//    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicQueryTextField: UITextField!

    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var musicRandom: Music?
    var queryString: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        exerciseOne()
//        exerciseTwo()
//        exerciseThree()
        
//        queryString = musicQueryTextField.text ?? ""
//        
//        let apiToContact = "https://itunes.apple.com/search"
//        let parameters = ["term": String(queryString), "media": "music"]
//        
//        Alamofire.request(.GET, apiToContact, parameters: parameters) .validate().responseJSON() { response in
//                switch response.result {
//                case .Success:
//                    if let value = response.result.value {
//                        let json = JSON(value)
//                    
//                    // Do what you need to with JSON here!
//                    // The rest is all boiler plate code you'll use for API requests
//                    
//                    // modify based on the structure of the JSON file
//                    let reqMusicData = json["results"].arrayValue
//                    
//                    let iSelect = Int(arc4random_uniform(UInt32(reqMusicData.count)))
//                    
//                    self.musicRandom = Music(json: reqMusicData[iSelect])
//                    print(self.musicRandom)
//                    
//                    self.musicTitleLabel.text = self.musicRandom?.name
////                    self.rightsOwnerLabel.text = self.musicRandom?.rightsOwner
////                    self.releaseDateLabel.text = self.musicRandom?.releaseDate
//                    self.priceLabel.text = String(format:"%.2f", (self.musicRandom?.price)!)
//                    
//                    self.loadPoster((self.musicRandom?.poster)!)
//                    
//                }
//            case .Failure(let error):
//                print(error)
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Updates the image view when passed a url string
    func loadPoster(urlString: String) {
        posterImageView.af_setImageWithURL(NSURL(string: urlString)!)
    }
    
    @IBAction func viewOniTunesPressed(sender: AnyObject) {
        print(musicRandom?.link)
        UIApplication.sharedApplication().openURL(NSURL(string: (musicRandom?.link)!)!)
    }
//
    @IBAction func submitQueryPressed(sender: AnyObject) {
        queryString = musicQueryTextField.text ?? ""
        
        
        print(queryString)
        
        let apiToContact = "https://itunes.apple.com/search"
        let parameters = ["term": queryString!, "media": "music"]
        
        Alamofire.request(.GET, apiToContact, parameters: parameters) .validate().responseJSON() { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    
                    // modify based on the structure of the JSON file
                    let reqMusicData = json["results"].arrayValue
                    
                    let iSelect = Int(arc4random_uniform(UInt32(reqMusicData.count)))
                    
                    self.musicRandom = Music(json: reqMusicData[iSelect])
                    print(self.musicRandom)
                    
                    self.musicTitleLabel.text = self.musicRandom?.name
                    //                    self.rightsOwnerLabel.text = self.musicRandom?.rightsOwner
                    //                    self.releaseDateLabel.text = self.musicRandom?.releaseDate
                    self.priceLabel.text = String(format:"%.2f", (self.musicRandom?.price)!)
                    
                    self.loadPoster((self.musicRandom?.poster)!)
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}

