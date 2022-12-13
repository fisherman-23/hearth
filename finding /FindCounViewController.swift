//
//  FindCounViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 12/9/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase
var hasKey = true
public var foundCoun = 0
public let database = Database.database(url: "https://hearth-eb737-default-rtdb.asia-southeast1.firebasedatabase.app").reference().child("User")
let key = database.childByAutoId().key
let user = ["id": key,
            "name": name as String,
            "number": number as String

]


class FindCounViewController: UIViewController {

    @IBAction func refreshButton(_ sender: Any) {
        database.child(key!).observeSingleEvent(of: .value, with: { (snapshot) in

            if snapshot.exists(){

                 hasKey = true
                print("have key")
                print(key!)
                
             }else{

                 hasKey = false
                print("no have key")
                print(key!)
                foundCoun = 1
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "wuvc") as! WelcomeUserViewController
                vc.modalPresentationStyle = . fullScreen
                self.present(vc, animated: true, completion: nil)
                
                
             }

         })
    }
    @IBAction func StopFindingPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wuvc") as! WelcomeUserViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
        
        // stop finding
        database.child(key!).setValue(nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        database.child(key!).setValue(user)
        print("finding")
        

        

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
