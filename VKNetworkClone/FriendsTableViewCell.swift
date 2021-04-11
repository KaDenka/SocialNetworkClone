//
//  FriendsTableViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    func clearCell() {
        avatarImage.image = nil
        lastNameLabel.text = nil
        firstNameLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configFriendCell(index: IndexPath) {
        if let avatar = UsersDataStorage.shared.usersArray[index.row].avatar {
            avatarImage.image = avatar
        } else { avatarImage.image = UIImage(named: "noUserAvatarImage")}
        lastNameLabel.text = UsersDataStorage.shared.usersArray[index.row].lastName
        firstNameLabel.text = UsersDataStorage.shared.usersArray[index.row].firstName
    }
}
