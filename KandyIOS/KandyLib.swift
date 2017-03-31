import Alamofire

func sendSMS(key:String,device_id:String,message:String,destination:String,UUID:String){
    let smsURL="https://api.kandy.io/v1.2/devices/messages?key=\(key)&device_id=\(message)"
    
    let parameters: Parameters = [
        "message":[
            "content_type":"text",
            "destination":"\(destination)",
            "UUID":"\(UUID)",
            "message":[
                "mimeType":"text/plain",
                "text":"\(message)"
            ]
        ]
    ]
    let headers:HTTPHeaders=[
        "Accept":"application/json"
    ]
    Alamofire.request(smsURL, method:.post,parameters:parameters,encoding:JSONEncoding.default)
        .responseJSON{
            response in
            print(response.result)
            if let JSONResponse=response.result.value{
                print("JSON Response : \(JSONResponse)")
            }
            
    }
}
