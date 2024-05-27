//
//  TravelViewController.swift
//  SeSac_0524_TravelMagazine
//
//  Created by gnksbm on 5/27/24.
//

import UIKit

final class TravelViewController: UIViewController {
    private let list = TravelInfo().travel
    @IBOutlet var travelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        travelTableView.dataSource = self
        travelTableView.registerNib(TravelTableViewItemCell.self)
        travelTableView.registerNib(TravelTableViewADCell.self)
    }
}

extension TravelViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        list.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let data = list[indexPath.row]
        var cell: UITableViewCell
        if data.ad {
            cell = tableView.dequeueReusableCell(
                TravelTableViewADCell.self,
                for: indexPath
            )
            (cell as? TravelTableViewADCell)?.configureCell(
                data: data
            )
        } else {
            cell = tableView.dequeueReusableCell(
                TravelTableViewItemCell.self,
                for: indexPath
            )
            (cell as? TravelTableViewItemCell)?.configureCell(
                data: data
            )
        }
        return cell
    }
}
