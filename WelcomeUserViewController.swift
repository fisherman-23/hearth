//
//  WelcomeUserViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 11/9/21.
//

import UIKit

class WelcomeUserViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBAction func findPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "fcvc") as! FindCounViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
        
        // send data
        
        
    }
    @IBAction func settingsPressed(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "svc") as! SettingsViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = name
        print(foundCoun)
        
        if foundCoun == 1{
            let alert = UIAlertController(title: "Found!", message: "Counsellor found! Please wait for him to contact you.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Counsellor found")
            }))
            self.present(alert, animated: true, completion: nil)
            statusLabel.text = "Found counsellor! please hold on while he contacts you"
        }
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
