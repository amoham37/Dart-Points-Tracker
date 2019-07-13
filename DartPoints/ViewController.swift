//
//  ViewController.swift
//  DartPoints
//
//  Created by Ahmet Mohammed on 4/19/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var multip1: UITextField!
    @IBOutlet weak var multip2: UITextField!
    @IBOutlet weak var multip3: UITextField!

    @IBOutlet weak var point1: UITextField!
    @IBOutlet weak var point2: UITextField!
    @IBOutlet weak var point3: UITextField!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBOutlet weak var remain1: UILabel!
    @IBOutlet weak var remain2: UILabel!
    
    @IBOutlet weak var multip4: UITextField!
    @IBOutlet weak var multip5: UITextField!
    @IBOutlet weak var multip6: UITextField!
    
    @IBOutlet weak var point4: UITextField!
    @IBOutlet weak var point5: UITextField!
    @IBOutlet weak var point6: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    
   
    
    @IBAction func add1(_ sender: Any) {
        let text1 = Int(point1.text!)
        let text2 = Int(point2.text!)
        let text3 = Int(point3.text!)
        
        let text11 = Int(multip1.text!)
        let text12 = Int(multip2.text!)
        let text13 = Int(multip3.text!)
        
        let a = text1! * text11!
        let b = text2! * text12!
        let c = text3! * text13!
        
//        let textfield: Int? Int(textfield.text)
        
        score1.text = String((a + b + c + Int(score1.text!)!))
        remain1.text = String(Int(textfield.text!)! - Int(score1.text!)!)
    }
    
    @IBAction func add2(_ sender: Any) {
        let text1 = Int(point4.text!)
        let text2 = Int(point5.text!)
        let text3 = Int(point6.text!)
        
        let text11 = Int(multip4.text!)
        let text12 = Int(multip5.text!)
        let text13 = Int(multip6.text!)
        
        let a = text1! * text11!
        let b = text2! * text12!
        let c = text3! * text13!
        
        score2.text = String((a + b + c + Int(score2.text!)!))
        remain2.text = String(Int(textfield.text!)! - Int(score2.text!)!)
        
    
    }
    @IBAction func reset(_ sender: Any) {
        multip1.text = "1"
        multip2.text = "1"
        multip3.text = "1"
        multip4.text = "1"
        multip5.text = "1"
        multip6.text = "1"
        
        point1.text = ""
        point2.text = ""
        point3.text = ""
        point4.text = ""
        point5.text = ""
        point6.text = ""
        
        score1.text = "0"
        score2.text = "0"
        
        remain1.text = textfield.text
        remain2.text = textfield.text
        
        
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.multip1.delegate = self;
        self.multip2.delegate = self;
        self.multip3.delegate = self;
        self.multip4.delegate = self;
        self.multip5.delegate = self;
        self.multip6.delegate = self;
        
//        self.point1.delegate = self;
//        self.point2.delegate = self;
//        self.point3.delegate = self;
//        self.point4.delegate = self;
//        self.point5.delegate = self;
//        self.point6.delegate = self;


        
        
//        picker.delegate = self;
//        picker.dataSource = self;
//        textfield.inputView = picker;
        
        remain1.text = textfield.text
        remain2.text = textfield.text
        self.hideKeyboard()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString

        let allowedChars = CharacterSet(charactersIn: "123")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedChars.isSuperset(of: characterSet) && newString.length <= maxLength
    }
    

    let points = ["501", "401", "301", "201", "101"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return points[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return points.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        textfield.text = points[row]
//        remain2.text = foods[row]
    }
    
    
    
    
    


}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

