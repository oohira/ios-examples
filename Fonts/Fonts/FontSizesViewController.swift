//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by oohira on 2018/01/28.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {

    private static let cellIdentifier = "FontNameAndSize"
    private static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    var font: UIFont!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FontSizesViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        return cell
    }

    func fontForDisplay(atIndexPath indexPath: IndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
}
