//
//  LikeUIControl.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 18.04.2021.
//

import UIKit

enum LikeButtonState {
    case like
    case dislike
}

@IBDesignable class LikeUIControl: UIControl {
    
    var likeState: LikeButtonState = .dislike
    
    // private var heartButton = UIButton(type: .system)
    
    //private var likeLabel = UILabel()
    
    private var stackView: UIStackView!
    let heartButton = UIButton(type: .system)
    let likeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.backgroundColor = UIColor.clear
        heartButton.tintColor = UIColor.blue
        heartButton.addTarget(self, action: #selector(pushLike(_:)), for: .touchUpInside)
        likeLabel.backgroundColor = UIColor.clear
        likeLabel.textColor = UIColor.blue
        likeLabel.text = "0"
        stackView = UIStackView(arrangedSubviews: [likeLabel, heartButton])
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    
    
    @objc private func pushLike(_ sender: UIButton) {
        if likeState == .dislike {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = UIColor.red
            likeState = .like
            likeLabel.textColor = UIColor.red
            likeLabel.text = "1"
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = UIColor.blue
            likeState = .dislike
            likeLabel.textColor = UIColor.blue
            likeLabel.text = "0"
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}
