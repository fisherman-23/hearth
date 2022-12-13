//
//  signInViewController.swift
//  Hearth
//
//  Created by Ooi Jing Shun on 31/8/21.
//

import UIKit
import FirebaseCore
import FirebaseAuth

public var name = ""
public var number = ""

class signInViewController: UIViewController {

    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterNumber: UITextField!
    @IBOutlet weak var enterOTP: UITextField!
    @IBOutlet weak var choiceLabel: UILabel!
    var coun = 0
    var user = 0

    struct userInfo {
        let name: String
        let phoneNo: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterOTP.isHidden = true
        choiceLabel.text = "Selected:"
        

    }
        
        // Do any additional setup after loading the view.
    
    func updateLabel() {
        if coun == 1{
            // change label
            choiceLabel.text = "Selected: Counsellor"
        } else if user == 1{
            // change label
            choiceLabel.text = "Selected: User"
        } else {
            print("user-coun error")
            choiceLabel.text = "Please select an option"
        }

    }
    @IBAction func whenPressedOptionUser(_ sender: Any) {
        coun = 0
        user = 1
        // update label
        updateLabel()
    }
    @IBAction func whenPressedOptionCoun(_ sender: Any) {
        coun = 1
        user = 0
        updateLabel()
    }
    var verification_id: String? = nil
    @IBAction func submitButton(_ sender: Any) {
        name = enterName.text!
        number = enterNumber.text!
        
        
        if enterOTP.isHidden {
            if !enterNumber.text!.isEmpty{
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                PhoneAuthProvider.provider().verifyPhoneNumber(enterNumber.text!, uiDelegate: nil, completion: {verificationID, error in
                    if(error != nil){
                        return
                    } else {
                        self.verification_id = verificationID
                        self.enterOTP.isHidden = false
                        }
                    
                })
            } else {
                print("Please enter your number")
                let alert = UIAlertController(title: "Error", message: "Please enter a number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("number not entered")
                }))
                self.present(alert, animated: true, completion: nil)
            }

        } else {
            if verification_id != nil {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verification_id!, verificationCode: enterOTP.text!)
                Auth.auth().signIn(with: credential, completion: {authData, error in
                    if (error != nil){
                        print(error.debugDescription)
                    } else {
                        print("Authentication Success with - " + (authData?.user.phoneNumber! ?? "No phone number"))

                        
                        
                        // save user option
                        if self.coun == 1{
                            //change screen
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "wcvc") as! WelcomeCounViewController
                            vc.modalPresentationStyle = . fullScreen
                            self.present(vc, animated: true, completion: nil)
                            
                            let version = 1
                        } else if self.user == 1{
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "wuvc") as! WelcomeUserViewController
                            vc.modalPresentationStyle = . fullScreen
                            self.present(vc, animated: true, completion: nil)
                            
                            let version = 2
                        } else {
                            print("error")
                        }
                        
                        

                        
                    }
                })
            } else {
                print("Error Getting OTP")
                let alert = UIAlertController(title: "Error", message: "Error getting OTP", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }
        

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
