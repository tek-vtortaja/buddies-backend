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
    
    myTextView.clearButtonMode = .always
    myTextView.autocorrectionType = .no
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBOutlet weak var myTextView: UITextField!
  @IBOutlet weak var myLabel: UILabel!
  
  @IBAction func fetchButtonClicked(_ sender: AnyObject) {
    self.dismissKeyboard()
    
    //check if the textbox has data
    guard let text = myTextView.text, !text.isEmpty else {
      
      let alertController = UIAlertController(title: "Buddies", message: "Please enter data", preferredStyle: .alert)
      let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(defaultAction)
      present(alertController, animated: true, completion: nil)
      
      return
    }
    
    self.fetchTheString()
    
  }
  
  func fetchTheString() {
    let urlString = "http://localhost:8080/api/hello/\(myTextView.text!)"
    let url = URL(string: urlString)
    
    let session = URLSession.shared
    session.dataTask(with: url!) { (data, response, err) in
      
      if(err != nil){
        
        //need to handle this part
        print("Error")
        
      } else {
        let strResponse = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        //      print(strResponse)
        self.performSelector(onMainThread: #selector(self.updateLabel), with: strResponse, waitUntilDone: true)
      }
      
    }.resume()
  }
  
  func updateLabel(text :String) {
    self.myLabel.text = text
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }

}

