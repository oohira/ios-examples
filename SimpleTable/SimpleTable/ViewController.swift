//
//  ViewController.swift
//  SimpleTable
//
//  Created by oohira on 2018/01/14.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class ViewController:
UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori", "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur", "Bombur"
    ]

    private let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default, reuseIdentifier: simpleTableIdentifier)
        }
        cell?.imageView?.image = UIImage(named: "star")
        cell?.imageView?.highlightedImage = UIImage(named: "star2")
        cell?.textLabel?.text = dwarves[indexPath.row]
        return cell!
    }
}

