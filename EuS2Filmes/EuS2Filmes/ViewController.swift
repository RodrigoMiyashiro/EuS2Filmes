//
//  ViewController.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        token()
        sessionGuest()
    }
    
    private func token()
    {
        APIManager.getToken { (token, error) in
            if let token = token
            {
                print("-->> Token: \(token.requestToke ?? "")")
            }
            else
            {
                print("-->> Error token: \(error)")
            }
        }
    }
    
    private func sessionGuest()
    {
        APIManager.getSessionGuest { (sessionGuest, error) in
            if let sessionGuest = sessionGuest
            {
                print("-->> Session: \(sessionGuest.guestSessionID ?? "")")
            }
            else
            {
                print("-->> Error session: \(error)")
            }
        }
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

