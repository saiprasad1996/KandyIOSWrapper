

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
        let json_response = sendSMS(domain_api_key: "Your api key", domain_secret: "Your Domain secret", user_id: "Your userId", source: "Source", destination: "Destination", message: "Your Message here")
        
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

