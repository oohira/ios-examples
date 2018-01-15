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
                style: .subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        cell?.imageView?.image = UIImage(named: "star")
        cell?.imageView?.highlightedImage = UIImage(named: "star2")

        cell?.textLabel?.text = dwarves[indexPath.row]
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Mr Disney"
        } else {
            cell?.detailTextLabel?.text = "Mr Tolkien"
        }
        return cell!
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // Make the first row unselectable
        return indexPath.row == 0 ? nil : indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let controller = UIAlertController(
            title: "Row Selected",
            message: "You selected \(rowValue)",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default, handler: nil)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}

