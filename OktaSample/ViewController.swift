//
//  ViewController.swift
//  OktaSample
//
//  Created by Koushik on 21/08/18.
//  Copyright © 2018 Wolken Software Pvt Ltd. All rights reserved.
//

import UIKit
import OktaAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        OktaAuth
            .login()
            .start(self) { response, error in
                if error != nil { print(error!) }
                
                // Success
                if let tokenResponse = response {
                    OktaAuth.tokens?.set(value: tokenResponse.accessToken!, forKey: "accessToken")
                    OktaAuth.tokens?.set(value: tokenResponse.idToken!, forKey: "idToken")
                    print("Success! Received accessToken: \(tokenResponse.accessToken!)")
                    print("Success! Received idToken: \(tokenResponse.idToken!)")
                    
                    OktaAuth.userinfo() { response, error in
                        if error != nil { print("Error: \(error!)") }
                        
                        if let userinfo = response {
                            userinfo.forEach { print("\($0): \($1)") }
                        }
                    }
                    
                    // get the base url from the response
                    let baseURL = "https://brdcom-stg-api.wolkenservicedesk.com"
                    
                    // send API request to get the okta url
                    WSDWebService.sharedInstance.oktaAuth(baseURL,idToken:tokenResponse.idToken!, success: {
                        (isCompleted,JSONResponse) -> Void in
                    
                        
                        
                    }) {
                        (error) -> Void in
                        
                    }
                    // send API request to get the okta url
                   /* WSDWebService.sharedInstance.oktaLogin("wolken", success: {
                        (isCompleted,JSONResponse) -> Void in
                        
                        //print("got response in API:\(JSONResponse)")
                        
                        if (isCompleted) {
                            // handle the API response
                            self.handleDomainAPIResponse(JSONResponse,idToken:tokenResponse.idToken!)
                            
                        }else{
                            // not get response
                            
                        }
                        
                        
                    }) {
                        (error) -> Void in
                        
                    }*/
                }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // used to handle the api response
    private func handleDomainAPIResponse(_ json:JSON,idToken:String){
        // get the status message
        let status = json["status"].stringValue
        // get the message status
        let message = json["message"].stringValue
        // check the status
        if(status == "Success" && message == "Success"){
            let data = json["data"]["companyDomainDetails"].arrayValue
            
            // get the data from the JSON response
            //let oktaEnabled = data[0]["oktaEnabled"].boolValue
            
            
        }else{
    
            
        }
        
        
    }

}

