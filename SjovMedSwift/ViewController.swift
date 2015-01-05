//
//  ViewController.swift
//  SjovMedSwift
//
//  Created by Kenneth  Geisshirt on 09/12/14.
//  Copyright (c) 2014 AltOmData. All rights reserved.
//

import UIKit
import Alamofire
import Realm

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Alamofire.request(.GET, "http://www.altomdata.dk")
            .responseString { (_, _, response, _) in
                var antal = 0
                if (response != nil) {
                    var tmp = response as String!
                    antal = countElements(tmp)
                } else {
                    antal = 0
                }
                var website = Website()
                website.website = "www.altomdata.dk"
                website.size = antal

                let realm = RLMRealm.defaultRealm()
                realm.beginWriteTransaction()
                realm.addObject(website)
                realm.commitWriteTransaction()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trykKnap() {
        let websites = Website.allObjects()
        let antal = websites.sumOfProperty("size")
        let message = "Hentede \(antal) tegn fra \(websites.count) sites"
        let beskedController = UIAlertController(title: "Alt om DATA", message: message,preferredStyle: UIAlertControllerStyle.Alert)
        beskedController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(beskedController, animated: true, completion: nil)
    }
}

