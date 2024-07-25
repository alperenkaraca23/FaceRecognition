//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Alperen KARACA on 25.07.2024.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisButton(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Giriş yapmak istiyor musunuz? ") { success, error in
                if success == true{
//                    successful Auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil )
                    }
                }else{
                    DispatchQueue.main.async{
                        self.myLabel.text = "Error!!"
                    }
                  
                }
            }
            
        }
        
        
    }
    
}

