//
//  FeedbackViewController.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/3/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var txtSubjectDetail: UITextView!

    @IBOutlet weak var btnSubmit: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txtEmail.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 0.8).cgColor
        txtEmail.layer.borderWidth = 1.5
        txtEmail.layer.cornerRadius = 17
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: txtEmail.frame.size.height))
        
        txtEmail.leftView = padding
        txtEmail.leftViewMode = .always

        
        let padding1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: txtEmail.frame.size.height))

                txtSubject.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 0.8).cgColor
                txtSubject.layer.borderWidth = 1.5
                txtSubject.layer.cornerRadius = 17
        
        
                txtSubject.leftView = padding1
                txtSubject.leftViewMode = .always
        
        
        txtSubjectDetail.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 0.8).cgColor
        txtSubjectDetail.layer.borderWidth = 1.5
        txtSubjectDetail.layer.cornerRadius = 17

        
        btnSubmit.layer.borderColor = UIColor.init(colorLiteralRed: 248/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1.0).cgColor
        btnSubmit.layer.borderWidth = 1.5
        btnSubmit.layer.cornerRadius = 17

    }
    @IBAction func btnBackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submit(_ sender: Any) {
       
        
        if (txtEmail.text?.characters.count == 0 || txtSubject.text?.characters.count == 0 || txtSubjectDetail.text?.characters.count == 0 ){
            
            let alert = UIAlertController(title: "Empty", message: "Please enter all details.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        txtEmail.text = ""
        txtSubject.text = ""
        txtSubjectDetail.text = ""
        
        let alert = UIAlertController(title: "Success", message: "Your valuable feedback has been submitted.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
