//
//  FriendPhotoViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 18.04.2021.
//

import UIKit

class FriendPhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    let friendPhotoCellNib = UINib(nibName: "FriendsPhotoCollectionViewCell", bundle: nil)
    
    let friendPhotoCellIdentifier = "friendsPhotoCellID"
    
    var indexPathOfFriend: IndexPath = [0,0]
    
    var array = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(friendPhotoCellNib, forCellWithReuseIdentifier: friendPhotoCellIdentifier)
        
        if let check =
            usersDictionary[indexPathOfFriend.section].value[indexPathOfFriend.row].photoArray {
            array = check
        }
        
    }
    
}

extension FriendPhotoViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: friendPhotoCellIdentifier, for: indexPath) as! FriendsPhotoCollectionViewCell
        cell.friendPhotoImage.image = array[indexPath.row]
        return cell
    }
    
    
}

extension FriendPhotoViewController: UICollectionViewDelegate {
    
    
}

extension FriendPhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
