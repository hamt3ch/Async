//
//  asSettingsViewController.swift
//  Async
//
//  Created by Regynald Augustin on 9/26/15.
//  Copyright © 2015 HAM. All rights reserved.
//

import UIKit

class asSettingsViewController: UIViewController {

    var titleView: UIImageView? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        var logo = UIImage(named: "settings")
        logo = logo?.imageWithRenderingMode(.AlwaysTemplate)
        titleView = UIImageView(image: logo)
        self.navigationItem.titleView = titleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var logo = UIImage(named: "settings")
        logo = logo?.imageWithRenderingMode(.AlwaysTemplate)
        titleView = UIImageView(image: logo)
        self.navigationItem.titleView = titleView
        // Do any additional setup after loading the view.
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print("Error: \(error)")
            } else {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as? NSString ?? "Need permission"
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as? NSString ?? "Need permission"
                print("User Email is: \(userEmail)")
            }
        }
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
