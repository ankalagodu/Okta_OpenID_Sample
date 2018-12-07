//
//  WSDWebServices+Login.swift
//  WSDAppSwift
//
//  Created by Koushik on 27/02/18.
//  Copyright © 2018 Wolken Software Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension WSDWebService {
    
    /*func login(_ username:String, pwd:String, success:@escaping (Bool,JSON) -> Void,failure:@escaping(Error) ->Void){
       
            // get the base url
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,let baseApi = appDelegate.baseAPI else{
                return
            }
            
            // login url
            let url = "\(baseApi)/auth/login"
            
            var userDict:JSON = [:]
            if let deviceToken = UserDefaults.standard.value(forKey:"devicetoken") as? String{
                userDict = ["deviceToken":deviceToken]
            }else{
                userDict = ["deviceToken":"simulator"]
            }
            
            do{
                //let device = Device()
                //try userDict.merge(with:["userName":username,"password":pwd,"device":device.name,"deviceType":"apple","osVersion":device.systemVersion,"sdkVersion":"","appVersion":Bundle.version()])
            }catch{
                
            }
            
            // parameter for post request
            let parameter = ["data":userDict]
            // header for post request
            let header : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
            
            // show network activity
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            self.postRequestURLEncodingWithURL(url, params: parameter, headers: header, success: {
                (JSONResponse) -> Void in
                
                print("got response in API:\(JSONResponse)")
                // hide network activity
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if (JSONResponse == JSON.null) {
                    success(false,JSONResponse)
                    return
                }
                let error = JSONResponse["error"].boolValue
                if (!error) {
                    success(true,JSONResponse)
                }else{
                    success(false,JSONResponse)
                }
            }) {
                (error) -> Void in
                failure(error)
            }

        
    }*/
    
}
