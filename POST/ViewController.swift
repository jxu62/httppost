//
//  ViewController.swift
//  POST
//
//  Created by Jiqing Xu on 12/7/15.
//  Copyright © 2015 Jiqing Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    
        let postEndpoint: String = "https://gathur.herokuapp.com/api/users"
        
        
        let url = NSURL(string: postEndpoint)!
        
        let postParams = "first_name=\("firstname")&last_name=\("lastname")&email=\("jjij@wisc.edu")&phone=\("1234567890")&password=\("123456")"
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPBody = postParams.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
            {
                data, response, error in
                
                if error != nil{
                    print("*************error=\(error)")
                    return
                }
                
                
                
                
                
        
                
                print("************ response = \(response)")
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("*********** reponse data = \(responseString) ")
                
                
                // var err: NSError?
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
                    if let parseJSON = json
                    {
                        var firstNameValue = parseJSON["first_name"]as? String
                        print("first Name = \(firstNameValue)")
                    }
                    
                    
                    
                }
                catch{
                    print("json error: \(error)")
                    
                }
                
                
                
        }
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

