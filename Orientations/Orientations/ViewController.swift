//
//  ViewController.swift
//  Orientations
//
//  Created by oohira on 2018/01/06.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(UIInterfaceOrientationMask.all.rawValue)
        print(UIInterfaceOrientationMask.portrait)
        print(UIInterfaceOrientationMask.landscapeLeft)
        print(UIInterfaceOrientationMask.landscapeRight)
        print(UIInterfaceOrientationMask.landscape)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return UIInterfaceOrientationMask(rawValue:
                UIInterfaceOrientationMask.portrait.rawValue
                    | UIInterfaceOrientationMask.landscapeLeft.rawValue)
        }
    }
}
