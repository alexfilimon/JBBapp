//
//  SchemesListController.swift
//  JBBApp
//
//  Created by Александр Филимонов on 03.06.2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

//class SchemesListController: UITableViewController {
//    
//    let model = SchemesListModel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        model.delegate = self
//        model.retrieveSchemes()
//    }
//
//    var schemes: [Scheme] = []
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return schemes.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "schemeCell", for: indexPath)
//
//        let curScheme = schemes[indexPath.row]
//        cell.textLabel?.text = curScheme.name
//
//        return cell
//    }
//    
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetailScheme" {
//            // initialize new view controller and cast it as your view controller
//            let viewController = segue.destination as! SchemeController
//            // your new view controller should have property that will store passed value
//            let myIndexPath = self.tableView.indexPathForSelectedRow!
//            let row = myIndexPath.row
//            viewController.scheme = schemes[row]
//        }
//    }
//    
////    var valueToPass: Scheme?
////    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////         valueToPass = schemes[indexPath.row]
////         self.performSegue(withIdentifier: "showDetailScheme", sender: indexPath)
////    }
//
//}
//
//extension SchemesListController: SchemesListDelegate {
//    func handle(schemes: [Scheme]) {
//        self.schemes = schemes
//        tableView.reloadData()
//    }
//    
//    
//}
