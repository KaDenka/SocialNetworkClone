//
//  FriendsPhotoCollectionViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class FriendsPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhotoImage: UIImageView!
    
    func clearCell() {
        friendPhotoImage = nil
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    func configFriendPhotoCell(photoArray: [UIImage]?) {
        
       
    }
}

