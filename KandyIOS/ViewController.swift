

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
        
        //This is the function which needs to be called to send sms via the api 
        //You need to include the file "KandyLib.swift" and pass valid params to the following function
        
        let json_response = sendSMS(domain_api_key: "Your API Key", domain_secret: "Domain Secret Token", user_id: "Your user ID", source: "Source Phone Number", destination: "Destination Phone Number", message: userMessage.text!)
        // Then click on run
        //The below terminal window shows the output response
        print("Message Sent \(message)")
        print("Response Json : \(json_response)")
        
        messageResponse.text = "You've just sent : \(message)"
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

