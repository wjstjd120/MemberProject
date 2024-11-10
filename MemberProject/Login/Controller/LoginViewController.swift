//
//  ViewController.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginView: LoginView
    
    init(loginView: LoginView) {
        self.loginView = loginView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        self.navigationItem.title = "로그인"
        buttonEventSet()
    }
    
    private func buttonEventSet() {
        loginView.signUpButton.addTarget(self, action: #selector(signUpPage), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(doneAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    // objc
    @objc
    func login() {
        guard let id = loginView.idTextField.text,
              let password = loginView.passwordTextField.text,
              id != "",
              password != ""
        else {
            showAlert(message: "모든 내용을 입력해 주세요.")
            return
        }
        
        let dataManager = MemberCoreDataManager()
        
        guard let member = dataManager.selectMember(id: id) else {
            showAlert(message: "존재하지 않는 ID 입니다.")
            return
        }
        
        if member.password == password {
            UserDefaults.standard.set("\(id)" ,forKey: "loginMemberId")
            navigationController?.popViewController(animated: true)
            showAlert(message: "로그인 되었습니다.")
        } else {
            showAlert(message: "비밀번호가 일치하지 않습니다.")
        }
    }
    
    @objc
    func signUpPage() {
        let signUpView = SignUpView()
        let signUpViewContoroller = SignUpViewController(signUpView: signUpView)
        
        navigationController?.pushViewController(signUpViewContoroller, animated: true)
    }

}

