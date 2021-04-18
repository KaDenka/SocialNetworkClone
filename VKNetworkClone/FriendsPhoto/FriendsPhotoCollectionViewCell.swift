//
//  FriendsPhotoCollectionViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class FriendsPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhotoImage: UIImageView!
    
    @IBOutlet weak var likeControl: LikeUIControl!
    
    func clearCell() {
        friendPhotoImage = nil
        likeControl = nil
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

