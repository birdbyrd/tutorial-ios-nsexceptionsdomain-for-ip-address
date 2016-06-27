//
//  ViewController.swift
//  NSExceptionDomains for I.P. Address
//
//  Created by Chakkapan Rapeepunpienpen on 6/27/16.
//  Copyright © 2016 free.as.a.birdbyrd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var localIp: UITextField!
    @IBOutlet weak var localIpforXipIo: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func performHttpGetToLocalIpAddress(sender: AnyObject) {
        performHttpGetWithUrl("http://\(localIp.text!)")
    }
    
    @IBAction func perfromHttpGetToXipIo(sender: AnyObject) {
        performHttpGetWithUrl("http://\(localIpforXipIo.text!).xip.io")
    }

    func performHttpGetWithUrl(url:String) {
        let url = NSURL(string: url)
        let request = NSURLRequest(URL:url!)
        print("url: \(url!)")
        NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            }.resume()
    }
}

