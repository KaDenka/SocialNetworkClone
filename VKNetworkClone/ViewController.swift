//
//  ViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let loginScreenToAppSegue = "loginScreenToApp"
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    
    @IBOutlet weak var loginInputField: UITextField!
    
    @IBOutlet weak var passwordInputField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.loginScrollView?.endEditing(true)
    }
    
    func alertLogin(alertText: String) {
        let alertMessage = UIAlertController(title: "Ошибка!", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        guard let login = loginInputField.text, !login.isEmpty,
              let password = passwordInputField.text, !password.isEmpty else {
            alertLogin(alertText: "Заполните все поля")
            return
        }
        
        guard login == "admin", password == "admin" else {
            alertLogin(alertText: "Неверное имя пользователя или пароль")
            return
        }
        
        performSegue(withIdentifier: loginScreenToAppSegue, sender: nil)
        
    }
    
}

