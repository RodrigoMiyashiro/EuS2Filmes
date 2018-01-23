//
//  UIViewController.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController
{
    func configTitle(title: String)
    {
        self.title = title
//        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Corbert-Bold", size: 17)!, NSForegroundColorAttributeName: UIColor().darkBlue()]
    }
    
    func translucentNavigationBar()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func notTranslucentNavigationBar()
    {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
    }
}
