//
//  ViewController.swift
//  Sections
//
//  Created by oohira on 2018/01/18.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var keys: [String]!
    var names: [String: [String]]!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)

        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        keys = (namesDict!.allKeys as! [String]).sorted()
        names = namesDict as! [String: [String]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        return names[key]!.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath)
        let key = keys[indexPath.section]
        let namesInSection = names[key]!
        cell.textLabel?.text = namesInSection[indexPath.row]
        return cell
    }
}
