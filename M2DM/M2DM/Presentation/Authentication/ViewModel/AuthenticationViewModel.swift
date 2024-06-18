//
//  AuthenticationViewModel.swift
//  M2DM
//
//  Created by 최주리 on 5/25/24.
//

import Foundation
import Combine
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class AuthenticationViewModel: ObservableObject {
    
    @Published var authToken: String = ""
    @Published var result : KakaoResponse = KakaoResponse(access_token: "", refresh_token: "")
    @Published private(set) var isLoggined: Bool
    
    var dataManager: AuthenticationProtocol
    
    init() {
        if KeyChain.read(key: "access_token") != nil {
            isLoggined = true
        } else {
            isLoggined = false
        }
        self.dataManager = Authentication.shared
    }
    
    //MARK: - 카카오 서버에서 토큰 받아오기
    
    @MainActor
    func getKakaoToken() {
        //카카오톡이 설치되어 있는지 확인
        if(UserApi.isKakaoTalkLoginAvailable()) {
            //카카오톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                if let oauthToken = oauthToken {
                    print("토큰 받아오기 성공")
                    
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            #if DEBUG
                            print("me() success.")
                            print("oauthToken: \(oauthToken) !")
                            
                            #endif
                            let token = String(describing: oauthToken.accessToken)
                            self.authToken = token
                            Task {
                                await self.joinKakao()
                            }
                        }
                    }
                    
                }
            }
        } else {
            //카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                if let oauthToken = oauthToken{
                    print("토큰 받아오기 성공")
                    
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            #if DEBUG
                            print("me() success.")
                            print("oauthToken: \(oauthToken) !")
                            
                            #endif
                            let token = String(describing: oauthToken.accessToken)
                            self.authToken = token
                            Task {
                                await self.joinKakao()
                            }
                        }
                    }
                }
            }
        }
    }
    
    //MARK: - 카카오 회원가입 / 로그인
    
    @MainActor
    func joinKakao() async {
        self.result = await dataManager.checkKakao(authToken)
        self.setToken()
        print("토큰 저장 성공!")
    }
    
    //MARK: - 토큰 저장하기
    
    func setToken() {
        KeyChain.create(key: "access_token", token: result.access_token)
        KeyChain.create(key: "refresh_token", token: result.refresh_token)
        isLoggined = true
    }
    
    //MARK: - 로그아웃
     
    @MainActor
    func logout() {
        KeyChain.delete(key: "access_token")
        KeyChain.delete(key: "refresh_token")
        isLoggined = false
    }
    
    //MARK: - 회원 탈퇴
    
    func withdrawal() {
        
    }
}

