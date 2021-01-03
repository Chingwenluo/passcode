//
//  ViewController.swift
//  passcode
//
//  Created by eric on 2021/1/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passImageView2: UIImageView!

    @IBOutlet weak var passImageView1: UIImageView!
    @IBOutlet weak var passImageView3: UIImageView!
    @IBOutlet weak var passImageView4: UIImageView!
    
    
   let correctPassCode = [1,2,3,4]
   var guessPasscode = [Int]()
  
    func passcodeImage(){
        
        if  guessPasscode.count == 0 {
            passImageView1.isHidden = true
            passImageView2.isHidden = true
            passImageView3.isHidden = true
            passImageView4.isHidden = true
        } else if guessPasscode.count == 1 {
            passImageView1.isHidden = false
            passImageView2.isHidden = true
            passImageView3.isHidden = true
            passImageView4.isHidden = true
        } else if guessPasscode.count == 2 {
            passImageView1.isHidden = false
            passImageView2.isHidden = false
            passImageView3.isHidden = true
            passImageView4.isHidden = true
        } else if guessPasscode.count == 3 {
            passImageView1.isHidden = false
            passImageView2.isHidden = false
            passImageView3.isHidden = false
            passImageView4.isHidden = true
        } else if guessPasscode.count == 4 {
            passImageView1.isHidden = false
            passImageView2.isHidden = false
            passImageView3.isHidden = false
            passImageView4.isHidden = false
            checkPassCode()
        }
       
           
      
    }

    
    @IBAction func numberBtn(_ sender: UIButton) {
        
        let button = sender.tag
        guessPasscode.append(button)
        passcodeImage()
       
    }
    
    
    @IBAction func deleteBtn(_ sender: UIButton) {
       
//        let guessindex = guessPasscode.count
//        if guessindex > 0 {
//            guessPasscode.remove(at: guessindex - 1)
        
        if 0...3 ~= guessPasscode.count {
            guessPasscode.removeLast()
            passcodeImage()
            
        }
      
    }
    
    func checkPassCode(){
        if correctPassCode == guessPasscode {
       performSegue(withIdentifier: "correctPassCode", sender: self)
       } else {
        guessPasscode = []
        passImageView1.isHidden = true
        passImageView2.isHidden = true
        passImageView3.isHidden = true
        passImageView4.isHidden = true
        
        let alert = UIAlertController(title: "密碼錯誤", message: "輸入的密碼不正確!", preferredStyle: .alert)
        let action = UIAlertAction(title: "請重新輸入", style: .default) { (_) in
        }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        
    }
    }
    

    
    
    override func viewDidLoad() {
        
        passImageView1.isHidden = true
        passImageView2.isHidden = true
        passImageView3.isHidden = true
        passImageView4.isHidden = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

