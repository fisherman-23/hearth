//
//  PreWelcomeViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 12/9/21.
//

import UIKit

class PreWelcomeViewController: UIViewController {

    @IBAction func whenUserPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wuvc") as! WelcomeUserViewController
        vc.modalPresentationStyle = . fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func whenCounPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "wcvc") as! WelcomeCounViewController
        vc.modalPresentationStyle = . fullScreen
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
