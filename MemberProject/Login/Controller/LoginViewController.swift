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
    }
    
    @objc
    func signUpPage() {
        let signUpView = SignUpView()
        let signUpViewContoroller = SignUpViewController(signUpView: signUpView)
        
        navigationController?.pushViewController(signUpViewContoroller, animated: true)
    }

}

