//
//  WSDWebService+Auth.swift
//  OktaSample
//
//  Created by Koushik on 22/08/18.
//  Copyright © 2018 Wolken Software Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension WSDWebService {
    
    func oktaAuth(_ baseURL:String, idToken:String, success:@escaping (Bool,JSON) -> Void,failure:@escaping(Error) ->Void){
        
        // login url
        let url = "\(baseURL)/account_service/oktaoidcauth"
        
        // convert to json format
        /*let json = JSON(["id_token":idToken])
        // parameter for the get the video details from API
        //let parameters:Parameters=["data":json]
        // convert parameter to utf8 string format
        let jsonString=json.rawString(String.Encoding.utf8, options:.prettyPrinted)!
        // convert string to json enoded format
        let urlEncodedJson = jsonString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!*/
        // convert string to json enoded format
        let urlEncodedString = idToken.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        // parameter for post request
        let parameter:Parameters = ["id_token":urlEncodedString]
        // header for post request
        let header : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        // show network activity
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.postRequestURLEncodingWithURL(url, params: parameter, headers: header, success: {
            (JSONResponse) -> Void in
            
            print("got response in API:\(JSONResponse)")
            
            /*got response in API:{
                "status" : "success",
                "message" : "Successfully loggedin"
            }*/
           
            // hide network activity
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if (JSONResponse == JSON.null) {
                success(false,JSONResponse)
                return
            }
            let status = JSONResponse["status"].stringValue
            if (status == "success"){
                self.fetchCookies(url)
                success(true,JSONResponse)
            }else{
                success(false,JSONResponse)
            }
        }) {
            (error) -> Void in
            failure(error)
        }
        
    }
    
    func fetchCookies(_ url:String){
        do{
            if let cookies = try Alamofire.SessionManager.default.session.configuration.httpCookieStorage?.cookies(for: url.asURL()){
                print(cookies)
                if let JWTToken = cookies.filter({$0.name == "d-zz-a"}).first{
                    print("Token:\(JWTToken.value)")
                    
                }
            }
        }catch{
            
        }
    }
}
