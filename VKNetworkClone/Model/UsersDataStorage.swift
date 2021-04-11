//
//  UsersDataStorage.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class UsersDataStorage: NSObject {
    
    static let shared = UsersDataStorage()
    
    private override init() {
        super.init()
    }

    var usersArray = [User]()
    
    func firstLoadFriendList() {
        UsersDataStorage.shared.usersArray = [
            User(lastName: "Ivanov", firstName: "Ivan", age: 24, avatar: UIImage(named: "ivanovAvatar"), photoArray: [UIImage(named: "ivanovPhotoOne")!, UIImage(named: "ivanovPhotoTwo")!]),
        User(lastName: "Petrova", firstName: "Anna", age: 22, avatar: UIImage(named: "petrovaAvatar"), photoArray: [UIImage(named: "petrovaPhotoOne")!]),
        User(lastName: "Sidorov", firstName: "Alex", age: 48, avatar: nil, photoArray: nil)
    ]
    
    }
}
 
