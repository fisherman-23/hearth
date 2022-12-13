//
//  WelcomeCounViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 11/9/21.
//

import UIKit
var userSelectInfo = [passInfo]

class WelcomeCounViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userSelectInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
        
        cell2.nameLabel!.text = userSelectInfo[indexPath.row]
        
        return cell2
    }
    


    @IBAction func viewPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "fuvc") as! FindUserViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func settingsPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "svc") as! SettingsViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBOutlet weak var nameOfCoun: UILabel!
    override func viewDidLoad() {
        userSelectInfo = [passInfo]
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return userSelectInfo.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
            
            cell2.nameLabel!.text = userSelectInfo[indexPath.row]
            
            return cell2
        }
        super.viewDidLoad()
        nameOfCoun.text = name

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        userSelectInfo.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        tableView.endUpdates()
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
