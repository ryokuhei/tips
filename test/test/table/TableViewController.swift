//
//  TableViewController.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    enum TransitState {
        case none
        case toDetailView
    }
    
    private var transit: TransitState = .none
    
    private let rows = [1, 2, 3, 4, 5]
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.transit = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        if animated && transit == .toDetailView {
            self.transitionFeedInAnimation()
        }
        super.viewWillDisappear(animated)
    }
    
    // cellの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    // cellの設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.configure(number: rows[indexPath.row])
        
        return cell
    }
    
    // selected cell event
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let transitVC = UIStoryboard(name: "detailOfTable", bundle: nil).instantiateInitialViewController() as! DetailOfTableViewController
        transitVC.configure(number: rows[indexPath.row])

        self.transit = .toDetailView
        self.present(transitVC, animated: false, completion: nil)
    }
    
    
    // remove under bar
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
}
