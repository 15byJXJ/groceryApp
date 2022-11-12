//
//  SettingsViewController.swift
//  groceryApp
//
//  Created by Jo on 11/12/22.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var notificationSelector: UISwitch!
    
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
    
    @IBAction func onBack(_ sender: Any) {
        let settings = PFObject(className: "Settings")
        settings["region"] = regionTextField.text
        settings["language"] = languageTextField.text
        
        if notificationSelector.isOn {
            settings["notification"] = "on"
        } else {
            settings["notification"] = "off"
        }

        
        settings.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error")
            }
        }

        dismiss(animated: true)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        
    }
    
    
}
