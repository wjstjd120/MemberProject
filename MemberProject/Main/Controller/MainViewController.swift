//
//  MainViewController.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//

import UIKit

class MainViewController: UIViewController {

    private var mainView: MainView
    
    init(mainView: MainView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memberCheck()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.navigationItem.title = "메인페이지"
        buttonEventSet()
    }
    
    private func memberCheck() {
        guard let id = UserDefaults.standard.string(forKey: "loginMemberId") else {
            buttonUISet(stateMent: false)
            return
        }
        
        let dataManager = MemberCoreDataManager()
        
        let member = dataManager.selectMemberNickName(id: id)
        
        if let member = member,
           let nickName = member.nickName,
           let name = member.name{
            mainView.titleLabel.text = "\(name)/\(nickName) 님 환영합니다."
            buttonUISet(stateMent: true)
        } else {
            // 코어데이터에는 없고 유저디폴츠에만 있는경우 유저디폴츠 삭제
            UserDefaults.standard.removeObject(forKey: "loginMemberId")
            mainView.titleLabel.text = "로그인 해주세요."
            buttonUISet(stateMent: false)
        }
    }
    
    // 버튼 숨긴처리
    private func buttonUISet(stateMent: Bool) {
        mainView.loginButton.isHidden = stateMent
        mainView.verticalStackView.isHidden = !stateMent
    }
    
    private func buttonEventSet() {
        mainView.loginButton.addTarget(self, action: #selector(loginPage), for: .touchUpInside)
        mainView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        mainView.memberDeleteButton.addTarget(self, action: #selector(memberDelete), for: .touchUpInside)
    }
    
    // Objc
    @objc
    func loginPage() {
        let loginView = LoginView()
        let loginViewContoroller = LoginViewController(loginView: loginView)
        
        navigationController?.pushViewController(loginViewContoroller, animated: true)
    }
    
    @objc
    func logout() {
        UserDefaults.standard.removeObject(forKey: "loginMemberId")
        memberCheck()
    }
    
    @objc
    func memberDelete() {
        UserDefaults.standard.removeObject(forKey: "loginMemberId")
        memberCheck()
    }
}

