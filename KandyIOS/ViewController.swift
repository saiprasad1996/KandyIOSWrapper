//
//  ViewController.swift
//  KandyIOS
//
//  Created by SAI PRASAD on 29/03/17.
//  Copyright © 2017 SAI PRASAD. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var messageResponse: UILabel!
    
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var userMessage: UITextField!
    
    
    @IBAction func sendMessageButton(_ sender: Any) {
        let message = userMessage.text
        messageResponse.text = message
        userMessage.resignFirstResponder()
        print("Message Sent \(message)")
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

