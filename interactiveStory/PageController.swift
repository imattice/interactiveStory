//
//  PageController.swift
//  interactiveStory
//
//  Created by Ike Mattice on 5/17/16.
//  Copyright © 2016 Michael Mattice. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page: Page?
    
    let artwork = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: .System)
    let secondChoiceButton = UIButton(type: .System)   
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init coder not implemented")
        super.init(coder: aDecoder)
    }
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let page = page {
            artwork.image = page.story.artwork
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillLayoutSubviews() {
        view.addSubview(artwork)
        artwork.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            artwork.topAnchor.constraintEqualToAnchor(view.topAnchor),
            artwork.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            artwork.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            artwork.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            ])
    }

}
