//
//  LoginView.swift
//  MemberProject
//
//  Created by 전성진 on 11/10/24.
//
import UIKit

import SnapKit

class LoginView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI() {
        self.addSubview(verticalStackView)
        
        [
         idTextField,
         passwordTextField,
         startButton
        ].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
//        verticalStackView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(100)
//            $0.left.right.equalToSuperview().inset(40)
//            $0.bottom.equalToSuperview().offset(-100)
//        }
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(150)
            $0.center.equalToSuperview()
        }
    }
}
