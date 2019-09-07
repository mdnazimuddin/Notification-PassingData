//
//  ActionController.swift
//  PassingData
//
//  Created by Nazim Uddin on 7/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ActionController: UIViewController {

    let facebookButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Facebook", for: .normal)
        button.addTarget(self, action: #selector(hendleFacebookActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let twitterButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Twitter", for: .normal)
        button.addTarget(self, action: #selector(hendleTwitterActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(hendleCancel))
        view.backgroundColor = UIColor.white
        self.setupContentConstraint()
    }
    @objc func hendleCancel(){
        dismiss(animated: true, completion: nil)
    }
    @objc func hendleFacebookActionButton(){
        print("Facebook")
    }
    @objc func hendleTwitterActionButton(){
        print("Twitter")
    }
}
extension ActionController
{
    func setupContentConstraint(){
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(content)
        
        // need x,y,width,height ancohors
        content.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        content.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        content.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        content.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        content.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // facbook button
        content.addSubview(facebookButton)
        // need x,y,width,height ancohors
        facebookButton.leftAnchor.constraint(equalTo: content.leftAnchor, constant: 20).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // twitter button
        content.addSubview(twitterButton)
        // need x,y,width,height ancohors
        twitterButton.rightAnchor.constraint(equalTo: content.rightAnchor, constant: -20).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
