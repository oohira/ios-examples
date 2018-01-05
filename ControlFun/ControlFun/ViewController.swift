//
//  ViewController.swift
//  ControlFun
//
//  Created by oohira on 2018/01/03.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
    }

    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
}
