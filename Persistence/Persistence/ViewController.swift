//
//  ViewController.swift
//  Persistence
//
//  Created by oohira on 2018/01/22.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lineFields: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileURL = dataFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path)) {
            if let array = NSArray(contentsOf: fileURL as URL) as? [String] {
                for i in 0..<array.count {
                    lineFields[i].text = array[i]
                }
            }
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applicationWillResignActive(notification:)),
            name: Notification.Name.UIApplicationWillResignActive,
            object: UIApplication.shared)
    }

    @objc func applicationWillResignActive(notification: NSNotification) {
        let fileURL = dataFileURL()
        let array = (lineFields as NSArray).value(forKey: "text") as! NSArray
        array.write(to: fileURL as URL, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dataFileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.first!.appendingPathComponent("data.plist")
        return url
    }
}
