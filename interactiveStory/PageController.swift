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
        view.backgroundColor = .blueColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
