//
//  LoginViewController.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/12/20.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
    }
    
    // MARK: - @Functions
    
    func setupAttribute() {
        // 이미지(text)
        let textLabel = UILabel()
        textLabel.text = "동창생 커뮤니티 플랫폼,"
        textLabel.textAlignment = .center
        textLabel.textColor = UIColor(red: 98/255, green: 100/255, blue: 153/255, alpha: 1)
        textLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(textLabel)
        
        // text autolayout
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // 이미지(logo)
        let LogoImageView = UIImageView()
        LogoImageView.image = UIImage(named: "SchoolMateLogo")
        view.addSubview(LogoImageView)
        
        // logo autolayout
        LogoImageView.contentMode = .scaleAspectFit
        LogoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            LogoImageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 0),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        // login label
        let loginLabel = UILabel()
        loginLabel.text = "LOG IN"
        loginLabel.font = UIFont.systemFont(ofSize: 20)
        loginLabel.textAlignment = .center
        view.addSubview(loginLabel)
        
        // login autolayout
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 100),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // 카카오 로그인 버튼
        let kakaoButton = UIButton()
        kakaoButton.setImage(UIImage(named: "kakao_login_medium_wide"), for: .normal)
        kakaoButton.addTarget(self, action: #selector(kakaoSignInButtonPress), for: .touchUpInside)
        view.addSubview(kakaoButton)
        
        // 카카오 AutoLayout
        kakaoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kakaoButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            kakaoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // 카카오 로그인 버튼 클릭 시
    @objc
    func kakaoSignInButtonPress() {
        // 카카오톡 설치 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            loginWithApp()
        } else {
            // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
            loginWithWeb()
        }
    }
}

// MARK: - Kakao Login Extensions

extension LoginViewController {
    
    // 카카오톡 앱으로 로그인
    func loginWithApp() {
        UserApi.shared.loginWithKakaoTalk {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoTalk() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.presentToMain()
                    }
                }
            }
        }
    }
    
    // 카카오톡 웹으로 로그인
    func loginWithWeb() {
        UserApi.shared.loginWithKakaoAccount {(_, error) in
            if let error = error {
                print(error)
            } else {
                print("loginWithKakaoAccount() success.")
                
                UserApi.shared.me {(user, error) in
                    if let error = error {
                        print(error)
                    } else {
                        self.presentToMain()
                    }
                }
            }
        }
    }
    
    // 화면 전환 함수
    func presentToMain() {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
