//
//  ViewController.swift
//  buddies
//
//  Created by Sudheer Arakkal on 2/7/17.
//  Copyright © 2017 TEKsystems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                             action: #selector(ViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBOutlet weak var myTextView: UITextField!
  @IBOutlet weak var myLabel: UILabel!
  
  @IBAction func fetchButtonClicked(_ sender: AnyObject) {
    self.dismissKeyboard()
    
    let urlString = "http://localhost:8080/api/hello/\(myTextView.text!)"
    var request = URLRequest(url: URL(string: urlString)!)
    request.httpMethod = "GET"
    
    let session = URLSession.shared
    session.dataTask(with: request) {data, response, err in
      print(response)
      let strResponse = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
      print("Response String: \(strResponse)")
      self.myLabel.text = strResponse!
      
    }.resume()
    
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }

}

