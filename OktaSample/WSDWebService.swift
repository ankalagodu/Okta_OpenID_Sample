//
//  WSDWebService.swift
//  WSDAppSwift
//
//  Created by Koushik on 27/02/18.
//  Copyright © 2018 Wolken Software Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class WSDWebService {
    
    fileprivate var isFirstAccess:Bool = true
    
    class var sharedInstance : WSDWebService {
        struct Static {
            static let instance : WSDWebService = WSDWebService()
        }
        //Static.instance.setUPS()
        return Static.instance
    }
    
    // used to show alert view
    /*fileprivate func showMessage(_ message:String){
        // create the alert
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }*/
    
    // post request to API header
    func postRequestWithURL(_ strURL : String, params : [String : Any]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        // Alamofire post request
        Alamofire.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            
            // checking response from API is success
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            // checking response from API is failure
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // post request to API header
    func postRequestURLEncodingWithURL(_ strURL : String, params : [String : Any]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
       
        
        // Alamofire post request
        Alamofire.request(strURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            
            // checking response from API is success
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            // checking response from API is failure
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // post request to API header
    func postRequestURLEncodingHttpBodyWithURL(_ strURL : String, params : [String : Any]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
        
        // Alamofire post request
        Alamofire.request(strURL, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (responseObject) -> Void in
            
            // checking response from API is success
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            // checking response from API is failure
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    // get request to API without header
    func getRequestWithURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        // Alamofire get request
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
            // checking response from API is success
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            // checking response from API is failure
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    
}
