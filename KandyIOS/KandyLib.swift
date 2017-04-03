/*
 Copyright 2017 Sai Prasad,Harsha Alva,Ranjan Dailata
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 Report found bugs here : https://github.com/saiprasad1996/KandyIOSWrapper
 
 
 */


import Alamofire

let headers:HTTPHeaders=[
    "Accept":"application/json"
]

func sendSMS(domain_api_key:String,domain_secret:String,user_id:String,source:String,destination:String,message:String) -> String{
    
    //Check if the parameters given are valid or not
    if(check_init_error(domain_api_key: domain_api_key, domain_secret: domain_secret, user_id: user_id)){}
    
    //Get the user accesstoken using domain_api_key and domain_secret from the Kandy User account
    let userAccesstoken = getUserAccessToken(domain_api_key: domain_api_key, domain_secret: domain_secret, user_id: user_id)
    
    //Get the device_id using the user_access_token fetched from the previous function
    let deviceId = getDeviceId(user_access_token: userAccesstoken)
    
    //URL for sending sms to the deviceID
    let smsURL="https://api.kandy.io/v1.2/devices/smss?key=" + userAccesstoken + "&device_id=" + deviceId;

    //Constructing JSON body to send via the post request
    let parameters: Parameters = [
        "message":[
            "source":"\(source)",
            "destination":"\(destination)",
            "message":[
                "text":"\(message)"
            ]
        ]
    ]
    
    var smsStatus:String="";
   //Http Request using Alamofire Library (Swift)
    Alamofire.request(smsURL, method:.post,parameters:parameters,encoding:JSONEncoding.default,headers:headers)
        .responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print("JSON : \(json)")
                smsStatus = json.stringValue
                break
            case .failure(let value):
                smsStatus = "{\"status\":\"failed\"}"
                break
            }
    }
    return smsStatus //JSON String response
    
}



//Requesting the user access token
func getUserAccessToken(domain_api_key:String,domain_secret:String,user_id:String) -> String{
    
    //URL string for the HTTP Request
    let url = "https://api.kandy.io/v1.2/domains/users/accesstokens?key=" + domain_api_key
    + "&domain_api_secret=" + domain_secret + "&user_id=" + user_id;
    var json_:JSON = JSON.null
    
    //Request Building and reponse handling
    Alamofire.request(url,method:.get).responseJSON{
        response in
        switch response.result{
        case .success(let value):
            let json=JSON(value)
            json_=json
            print("JSON : \(json)")
            break
        case .failure(let error):
            json_=JSON.null
            print(error)
            break
        }
    
    }
    return json_["result"]["user_access_token"].stringValue
}
//Get the device ID using the user access token
func getDeviceId(user_access_token:String)-> String{
    
    //URL string for the HTTP Request
    let url="https://api.kandy.io/v1.2/users/devices?key=" + user_access_token
    var json_:JSON = JSON.null
    
    //Request Building and response handling
    Alamofire.request(url,method:.get).responseJSON{
        response in
        switch response.result{
        case .success(let value):
            let json=JSON(value)
            json_=json
            print("JSON : \(json)")
            break
        case .failure(let error):
            json_=JSON.null
            print(error)
            break
        }
    }
    
    return json_["result"]["devices"][0]["device_id"].stringValue
}

//Check the parameters for valid strings
func check_init_error(domain_api_key:String,domain_secret:String,user_id:String) -> Bool{
    if domain_api_key.isEmpty {return false}
    if domain_secret.isEmpty{return false}
    if user_id.isEmpty {return false}
    
    return true
    
}
