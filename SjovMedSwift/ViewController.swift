//
//  ViewController.swift
//  SjovMedSwift
//
//  Created by Kenneth  Geisshirt on 09/12/14.
//  Copyright (c) 2014 AltOmData. All rights reserved.
//

import UIKit

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
        let beskedController = UIAlertController(title: "Alt om DATA", message: "Velkommen", preferredStyle: UIAlertControllerStyle.Alert)
        beskedController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(beskedController, animated: true, completion: nil)
    }
}

