//
//  SettingsViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 12/9/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBAction func logOutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let SignOutError as NSError {
            print("Error signing out", SignOutError)
        }
        
        
        let alert = UIAlertController(title: "Logged out", message: "Successfully logged out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("logged out")
        }))
        self.present(alert, animated: true, completion: nil)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "sivc") as! signInViewController
        modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
          
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
