//
//  FriendsListViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 19.04.2021.
//

import UIKit

var usersDictionary = Dictionary(grouping: UsersDataStorage.shared.usersArray, by: { String($0.lastName.trimmingCharacters(in: .whitespaces).first!) }).sorted(by: { $0.0 < $1.0 })
    
class FriendsListViewController: UIViewController {
    
    @IBOutlet weak var friendsList: UITableView!
    @IBOutlet weak var friendsListControl: AlphabetControl!
    let friendsToPhotoSegue = "friendsToPhoto"
    
    let friendsCellNib = UINib(nibName: "FriendsTableViewCell", bundle: nil)
    
    let friendsCellIdentifier = "friendsCellID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsList.register(friendsCellNib, forCellReuseIdentifier: friendsCellIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    func alertNoPhotoAvailable(alertText: String) {
        let alertMessage = UIAlertController(title: "Сообщение!", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == friendsToPhotoSegue else { return }
        guard let destination = segue.destination as? FriendPhotoViewController else { return }
        destination.indexPathOfFriend = self.friendsList.indexPathForSelectedRow!
    }
    
    
}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return usersDictionary.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return usersDictionary[section].key
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usersDictionary[section].value.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsCellIdentifier, for: indexPath) as! FriendsTableViewCell
        cell.configFriendCell(index: indexPath)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UsersDataStorage.shared.usersArray[indexPath.row].photoArray != nil {
            performSegue(withIdentifier: friendsToPhotoSegue, sender: nil)
        } else {
            alertNoPhotoAvailable(alertText: "У этого пользователя нет фотографий.")
        }
    }
    
    
    
    
}

extension FriendsListViewController: UITableViewDelegate {
    
    
}