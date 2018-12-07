//
//  WSDWebServices+OktaLogin.swift
//  WSDAppSwift
//
//  Created by Koushik on 28/02/18.
//  Copyright © 2018 Wolken Software Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension WSDWebService {

    func oktaLogin(_ companyName:String, success:@escaping (Bool,JSON) -> Void, failure:@escaping(Error) ->Void){
            
            // login url
            let url = "http://wmaster.wolkenservicedesk.com/company/getCompanyOktaDetails"
            
            // header for okta details
            let header : HTTPHeaders = ["Authorization":"Basic Y1VyeWF0ZUlrU2U6YnVzdFRlV29sa2Vu","Content-Type": "application/x-www-form-urlencoded"]
            
            // trim white space and new lines
            let trimmedCompanyName = companyName.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // convert to json format
            let json = JSON(["domain":trimmedCompanyName])
            // parameters for post request
            let parameters: Parameters = ["data":json]
            
            // show network activity
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            // post request
            self.postRequestURLEncodingWithURL(url, params: parameters, headers: header, success: {
                (JSONResponse) -> Void in
                
               // print("got response in API:\(JSONResponse)")
                
                // hide network activity
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                // check for null response
                if (JSONResponse == JSON.null) {
                    success(false,JSONResponse)
                    return
                }
                //  get the status from API response
                let status = JSONResponse["status"].stringValue
                // check the status is success or not
                if (status == "Success") {
                    success(true,JSONResponse)
                }else{
                    success(false,JSONResponse)
                }
            }) {
                (error) -> Void in
                failure(error)
                // error
            }
        
    }
}
