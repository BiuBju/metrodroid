//
//  HwInfoViewController.swift
//
// Copyright 2019 Google
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//

import Foundation
import UIKit
import metrolib

class HWInfoViewController : UITableViewController, CardViewProtocol, ErrorLabelProtocol {
    var delegate: ListViewDataSource?
    @IBOutlet weak var errorLabel: UILabel!

    func setErrorLabel(msg: String?, bgColor: UIColor?) {
        errorLabel?.text = msg
        errorLabel?.backgroundColor = bgColor
        if msg == nil {
            tableView.tableHeaderView = nil
        } else {
            tableView.tableHeaderView = errorLabel
        }
    }
    
    func setTransitData(card: Card, transitData: TransitData?) -> Bool {
        guard let info = card.manufacturingInfo else {
            return false
        }
        delegate = ListViewDataSource(items: info)
        tableView.delegate = delegate
        tableView.dataSource = delegate
        return true
    }
}
