//
//  ViewController.swift
//  Assignment3
//
//  Created by H.W. Hsiao on 2020/9/26.
//  Copyright © 2020 H.W. Hsiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    let correctAccount = "appworks_school@gmail.com"
    let correctPassword = "1234"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLabel.textColor = .lightGray
        checkTextField.isEnabled = false
        button.setTitle("Log in", for: .normal)
    }

    
    @IBAction func switchSegmented(_ sender: UISegmentedControl) {
        accountTextField.text = ""
        passwordTextField.text = ""
        checkTextField.text = ""
        
        switch segmented.selectedSegmentIndex {
        case 0:
            checkLabel.textColor = .lightGray
            checkTextField.isEnabled = false
            if let segmentTitle = segmented.titleForSegment(at: 0) {
                button.setTitle(segmentTitle, for: .normal)
            }
        case 1:
            checkLabel.textColor = .black
            checkTextField.isEnabled = true
            if let segmentTitle = segmented.titleForSegment(at: 1) {
                button.setTitle(segmentTitle, for: .normal)
            }
        default:
            break
        }
    }
    
    @IBAction func touchButton(_ sender: Any) {
        if segmented.selectedSegmentIndex == 0 {
            logIn(account: accountTextField, password: passwordTextField)
        } else {
            signUp(account: accountTextField, password: passwordTextField, check: checkTextField)
        }
    }
    
    func logIn(account: UITextField, password: UITextField) {
        if account.text == correctAccount && password.text == correctPassword {
            popAlert(title: "Welcome", message: "hello my friend")
        } else {
            popAlert(title: "Error", message: "Login fail")
        }
    }
    
    func signUp(account: UITextField, password: UITextField, check: UITextField) {
        if account.text == "" {
            popAlert(title: "Error", message: "Account should not be empty.")
        } else if password.text == "" {
            popAlert(title: "Error", message: "Password should not be empty.")
        } else if check.text == "" {
            popAlert(title: "Error", message: "Check Password should not be empty.")
        } else if password.text != check.text {
            popAlert(title: "Error", message: "Signup fail")
        } else {
            popAlert(title: "Welcome", message: "hello my friend")
        }
    }
    
    func popAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

