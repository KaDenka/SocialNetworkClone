//
//  FriendsTableViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friendsToPhotoSegue = "friendsToPhoto"
    
    let friendsCellNib = UINib(nibName: "FriendsTableViewCell", bundle: nil)
    
    let friendsCellIdentifier = "friendsCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(friendsCellNib, forCellReuseIdentifier: friendsCellIdentifier)
        
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
        return UsersDataStorage.shared.usersArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsCellIdentifier, for: indexPath) as! FriendsTableViewCell
        cell.configFriendCell(index: indexPath)
        return cell
    }
    
    func alertNoPhotoAvailable(alertText: String) {
        let alertMessage = UIAlertController(title: "Сообщение!", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == friendsToPhotoSegue else { return }
        guard let destination = segue.destination as? FriendsPhotoCollectionViewController else { return }
        destination.indexPathOfFriend = tableView.indexPathForSelectedRow!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UsersDataStorage.shared.usersArray[indexPath.row].photoArray != nil {
        performSegue(withIdentifier: friendsToPhotoSegue, sender: nil)
        } else {
        alertNoPhotoAvailable(alertText: "У этого пользователя нет фотографий.")
        }
    }
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    /*
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     tableView.deleteRows(at: [indexPath], with: .fade)
     }
     /*else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     */
     }
     */
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
