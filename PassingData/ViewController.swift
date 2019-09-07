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
        button.addTarget(self, action: #selector(hendleActionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let textLabel:UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let imageView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chat.png")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ui constraints setup
        self.setupTextLabelConstraints()
        self.setupButtonConstraints()
        self.setupImageViewConstraints()
        
    }
    @objc func hendleActionButton(){
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
}
