//
//  FindUserViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 12/9/21.
//

import UIKit
import FirebaseDatabase
public var passId = "a"
public var dataToPass = ""
public var passInfo = ""
public var passName = ""
public var passNumber = ""

class FindUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let user = userList[indexPath.row]
        passId = user.id!
        passName = user.name!
        passNumber = user.number!
        print(passId)
        
        passInfo = "\(passName) \(passNumber) \(passId)"

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let user : UserModel
        user = userList[indexPath.row]
        
        cell.nameLabel.text = user.name
        cell.phoneLabel.text = user.number
        cell.idLabel.text = user.id
        
        return cell
    }
    
    
    var userList = [UserModel]()
    @IBOutlet weak var userInfoList: UITableView!
    @IBAction func stopViewPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wcvc") as! WelcomeCounViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func startSessionPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wcvc") as! WelcomeCounViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
        passInfo = "\(passName) \(passNumber) \(passId)"
        database.child(passId).setValue(nil)
    }
    
    
    
    override func viewDidLoad() {
        // load data
        database.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0{
                self.userList.removeAll()
                
                for User in snapshot.children.allObjects as![DataSnapshot]{
                    let userObject = User.value as? [String: AnyObject]
                    let userName = userObject?["name"]
                    let userNumber = userObject?["number"]
                    let userId = userObject?["id"]
                    
                    let user = UserModel(id: userId as! String?, name: userName as! String?, number: userNumber as! String?)
                    
                    self.userList.append(user)
                }
                self.userInfoList.reloadData()
            }
                
        })
    
            
    
        super.viewDidLoad()

        // Do any additional setup after loadingthe view.
    
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

/*extension FindUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
*/
