//
//  ViewController.swift
//  interactiveStory
//
//  Created by Ike Mattice on 5/17/16.
//  Copyright © 2016 Michael Mattice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    enum Error: ErrorType {
        case NoName
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let story = Page(story: .TouchDown)
//        story.firstChoice = (title: "some Title", page: Page(story: .Droid))
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startAdventure" {
            do {
                if let name = nameTextField.text {
                    if (name == "") {
                        throw Error.NoName
                    }
                    if let pageController = segue.destinationViewController as? PageController {
                        pageController.page = Adventure.story("\(name)")
                    }
                }
            } catch Error.NoName {
                let alertController = UIAlertController(title: "Name Not Provided", message: "Provide a name to start your story", preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(action)
                presentViewController(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error)")
            }
            
        }
    }

    func keyboardWillShow(notification: NSNotification) {
        if let userInfoDict = notification.userInfo, keyboardFrameValue = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardFrame = keyboardFrameValue.CGRectValue()
            
            UIView.animateWithDuration(0.8) {
                self.textFieldBottomConstraint.constant = keyboardFrame.size.height + 10
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {            
        UIView.animateWithDuration(0.8) {
            self.textFieldBottomConstraint.constant = 40
            self.view.layoutIfNeeded()
        }
    }  
    
    
    //need to remove observers for any iOS version below 9.  After 9, observers remove themselves
//    deinit {
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
//    }
    
    
    // MARK: UITextField Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

