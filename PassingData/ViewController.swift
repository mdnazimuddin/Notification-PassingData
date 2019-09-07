//
//  ViewController.swift
//  PassingData
//
//  Created by Nazim Uddin on 7/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choose Social", for: .normal)
        button.addTarget(self, action: #selector(handleActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let textLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let imageView:UIImageView = {
        let image = UIImageView()
       // image.contentMode = 
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let returnTextLabel:UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(handleFacebook(notification:)), name: .facebook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTwitter(notification:)), name: .twitter, object: nil)
        
        // ui constraints setup
        self.setupTextLabelConstraints()
        self.setupButtonConstraints()
        self.setupImageViewConstraints()
        self.setupReturnTextLabelConstraints()
        
    }
    @objc func handleFacebook(notification:Notification)
    {
        let text = notification.userInfo!["name"] as? String
        self.textLabel.text = "Facebook"
        self.imageView.image = UIImage(named: "facebook.png")
        self.returnTextLabel.text = text!
    }
    @objc func handleTwitter(notification:Notification)
    {
        let text = notification.userInfo!["name"] as? String
        self.textLabel.text = "Twitter"
        self.imageView.image = UIImage(named: "twitter.png")
        self.returnTextLabel.text = text!
    }
    @objc func handleTextFieldLabel(notification:Notification)
    {
    }
    @objc func handleActionButton(){
        let actionController = ActionController()
        let navController = UINavigationController(rootViewController: actionController)
        present(navController, animated: true)
    }

}

extension ViewController {
    
    func setupTextLabelConstraints()  {
        view.addSubview(textLabel)
        
        //need x,y,width,height anchors
        
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    func setupButtonConstraints(){
        view.addSubview(button)
        
        //need x,y,width,height anchors
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func setupImageViewConstraints(){
        view.addSubview(imageView)
        
        //need x,y,width,height anchors
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func setupReturnTextLabelConstraints()  {
        view.addSubview(returnTextLabel)
        
        //need x,y,width,height anchors
        
        returnTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        returnTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
    }
}

extension Notification.Name{
    static let facebook = Notification.Name("facebook")
    static let twitter = Notification.Name("twitter")
}
