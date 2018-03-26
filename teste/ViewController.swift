//
//  ViewController.swift
//  teste
//
//  Created by Sávio Xavier on 23/03/18.
//  Copyright © 2018 Sávio Xavier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var viewTest = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

        
        label1.text = ""
        label2.text = ""
        label3.text = ""
        labelResult.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func send(_ sender: Any) {
        
        if let test1 = label1.text?.isEmpty, let test2 = label2.text?.isEmpty, let test3 = label3.text?.isEmpty{
            if test1 && test2 && test3{
                label1.text = textfield.text
                textfield.text = ""
            }
            else if ((test3 && test2) && !test1){
                label2.text = textfield.text
                textfield.text = ""
            }
            else if test3{
                label3.text = textfield.text
                textfield.text = ""
                if (label1.text == "Oi BB" && label2.text == "Crush" && label3.text == "Grito"){
                    labelResult.text = "ACERTOOOU"
                    viewTest.backgroundColor = UIColor.red
                    self.view.addSubview(viewTest)
                }else{
                    labelResult.text = "Tente novamente"
                }
            }else{
                viewTest.removeFromSuperview()
                label1.text = ""
                label2.text = ""
                label3.text = ""
            }
            
        }
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

