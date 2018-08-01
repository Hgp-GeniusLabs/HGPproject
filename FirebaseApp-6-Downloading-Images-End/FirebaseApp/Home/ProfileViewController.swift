//
//  ProfileViewController.swift
//  FirebaseApp
//
//  Created by HGPMac65 on 7/31/18.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
    }
    
    var loggedInUser:AnyObject?
    var databaseRef = Database.database().reference().child("users/profile")
    override func viewDidLoad() {
        super.viewDidLoad()
      
             self.loggedInUser = Auth.auth().currentUser
        
            self.databaseRef.child(self.loggedInUser!.uid).observe(.value, with: { snapshot in
             
                
                if let snap = snapshot.value as? [String:AnyObject] {
                    self.username.text = snap["username"] as? String
                    
                  
                
     
       
           
        }
        
        })
    }
    
  
            
            
            



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
            


  



