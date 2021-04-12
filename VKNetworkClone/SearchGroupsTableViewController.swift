//
//  SearchGroupsTableViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class SearchGroupsTableViewController: UITableViewController {
    
    let searchGroupCellNib = UINib(nibName: "GroupsTableViewCell", bundle: nil)
    
    let searchGroupCellIdentifier = "searchGroupCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(searchGroupCellNib, forCellReuseIdentifier: searchGroupCellIdentifier)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroupsDataStorage.shared.globalGroupsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchGroupCellIdentifier, for: indexPath) as! GroupsTableViewCell
        
        cell.configGlobalGroupsCell(index: indexPath)
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    //
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            GroupsDataStorage.shared.userGroupsArray.append(GroupsDataStorage.shared.globalGroupsArray[indexPath.row])
            GroupsDataStorage.shared.globalGroupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        addAction.backgroundColor = #colorLiteral(red: 0.1648246646, green: 0.40975371, blue: 0.5832718015, alpha: 1)
        let addConfig = UISwipeActionsConfiguration(actions: [addAction])
        addConfig.performsFirstActionWithFullSwipe = false
        return addConfig
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//            .insert
//        }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .insert {
//            GroupsDataStorage.shared.userGroupsArray.append(GroupsDataStorage.shared.globalGroupsArray[indexPath.row])
//        }
//    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
