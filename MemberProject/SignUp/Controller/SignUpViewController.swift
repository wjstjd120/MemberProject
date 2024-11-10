//
//  SignUpViewController.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var signUpView: SignUpView
    
    init(signUpView: SignUpView) {
        self.signUpView = signUpView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = signUpView
        self.navigationItem.title = "회원가입"
        buttonEventSet()
    }
    
    private func buttonEventSet() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(doneAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc
    func signUp() {
        guard let id = signUpView.idTextField.text,
              let password = signUpView.passwordTextField.text,
              let nickName = signUpView.nickNameTextField.text,
              let name = signUpView.nameTextField.text,
              id != "",
              password != "",
              nickName != "",
              name != ""
        else {
            showAlert(message: "모든 내용을 입력해 주세요.")
            return
        }
        
        let dataManager = MemberCoreDataManager()
        
        guard dataManager.selectMember(id: id) == nil else {
            showAlert(message: "이미 가입된 ID입니다.")
            return
        }
        
        let member = MemberModel(
            id: id,
            password: password,
            nickName: nickName,
            name: name
        )
        
        dataManager.createMember(member: member)
        
        // 비동기 이벤트로 나중에 넘겨주게 수정
        navigationController?.popViewController(animated: true)
        
        showAlert(message: "회원가입이 완료 되었습니다.")
    }
    
}

