

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
        let json_response = sendSMS(domain_api_key: "", domain_secret: "", user_id: "user1", source: "", destination: "", message: "Hello From Kandy")
        
        print("Message Sent \(message)")
        print("Response Json : \(json_response)")
        
        messageResponse.text = "You've just sent : \(message)"
        getDeviceId(user_access_token:"")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

