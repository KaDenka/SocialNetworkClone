//
//  FriendsTableViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: AvatarUIView!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    func clearCell() {
        avatarImage.userImage.image = nil
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
        if let avatar = usersDictionary[index.section].value[index.row].avatar {
            avatarImage.userImage.image = avatar
        } else { avatarImage.userImage.image = UIImage(named: "noUserAvatarImage")}
        lastNameLabel.text = usersDictionary[index.section].value[index.row].lastName
        firstNameLabel.text = usersDictionary[index.section].value[index.row].firstName
        
    }
}
