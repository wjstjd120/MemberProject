//
//  SignUpViewController.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//

import UIKit

class SignUpViewController: UIViewController {

    private var signUpView: UIView
    
    init(signUpView: UIView) {
        self.signUpView = signUpView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = signUpView
    }
}

