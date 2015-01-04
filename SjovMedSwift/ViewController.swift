//
//  ViewController.swift
//  SjovMedSwift
//
//  Created by Kenneth  Geisshirt on 09/12/14.
//  Copyright (c) 2014 AltOmData. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var n = 100
        var sum = 0
        for (var i = 1; i <= n; i++) {
            sum += i
        }
        println("Sum = " + String(sum))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func trykKnap() {
        var message = ""
        Alamofire.request(.GET, "http://www.altomdata.dk")
            .responseString { (_, _, response, _) in
                var message = ""
                if (response != nil) {
                    var tmp = response as String!
                    let antal = countElements(tmp)
                    message = "Hentede \(antal) tegn"
                } else {
                    message = "Fejl"
                }
                let beskedController = UIAlertController(title: "Alt om DATA", message: message, preferredStyle: UIAlertControllerStyle.Alert)
                beskedController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(beskedController, animated: true, completion: nil)
        }
    }
}

