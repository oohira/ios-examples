//
//  FontListViewController.swift
//  Fonts
//
//  Created by oohira on 2018/01/27.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class FontListViewController: UITableViewController {

    private static let cellIdentifier = "FontName"

    var fontNames: [String]!
    var showsFavorites = false
    private var cellPointSize: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: .headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if showsFavorites {
            fontNames = FavoritesList.sharedFavoritesList.favorites
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FontListViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = fontNames[indexPath.row]
        cell.detailTextLabel?.text = fontNames[indexPath.row]
        return cell
    }

    func fontForDisplay(atIndexPath indexPath: IndexPath) -> UIFont {
        let fontName = fontNames[indexPath.row]
        return UIFont(name: fontName, size: cellPointSize)!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let sizesVC = segue.destination as! FontSizesViewController

        let font = fontForDisplay(atIndexPath: indexPath)
        sizesVC.font = font
        sizesVC.navigationItem.title = font.fontName
    }
}
