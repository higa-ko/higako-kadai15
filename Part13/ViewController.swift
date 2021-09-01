//
//  ViewController.swift
//  Part13
//
//  Created by 葡萄酒 on 2021/08/23.
//

import UIKit

struct Item {
    var name: String
    var isChecked: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!

    private var items: [Item] = [
        Item(name: "りんご", isChecked: true),
        Item(name: "みかん", isChecked: false),
        Item(name: "バナナ", isChecked: true),
        Item(name: "パイナップル", isChecked: false)
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckCell", for: indexPath)

        cell.textLabel!.text = items[indexPath.row].name

        if items[indexPath.row].isChecked {
            cell.imageView?.tintColor = .white
        } else {
            cell.imageView?.tintColor = .orange
        }
        return cell
    }

    @IBAction private func exitCancel(segue: UIStoryboardSegue) {
    }

    @IBAction private func exitSave(segue: UIStoryboardSegue) {
        let inputViewController = segue.source as? InputViewController
        guard let addItem = inputViewController?.addItem else { return }

        items.append(contentsOf: addItem)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        items[indexPath.row].isChecked.toggle()

        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .fade)
    }
}
