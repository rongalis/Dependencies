//
//  FirstViewController.swift
//  ServiceKit
//
//  Created by srikanth on 11/23/22.
//

import Foundation
import UIKit

public class FirstViewController: UIViewController{
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("Print this - FirstViewController")
    }
    
public func callThisFunction(){
        print("Print this - callThisFunction")
    
            let filePath = Bundle.main.url(forResource: "ServiceHandler", withExtension: "swift")
            print("File path - \(filePath?.absoluteString ?? "")")
    
//    let frameworkBundle = Bundle(identifier: "com.rongali.myapp.ServiceKit")
//    let storyboard = UIStoryboard(name: "Storyboard", bundle: frameworkBundle)
//    print("Changes test - \(storyboard)")
    }
}
