//
//  TokenReissueViewModel.swift
//  M2DM
//
//  Created by 최주리 on 7/9/24.
//

import Foundation

final class TokenReissueViewModel: ObservableObject {
    @Published var result : KakaoResponse = KakaoResponse(access_token: "", refresh_token: "")
    
    var dataManager: TokenReissueProtocol = TokenReissue()
    
    func reissue() async {
        self.result = await dataManager.reissue()
        setToken()
        print("토큰 재발급 성공!")
    }
    
    //MARK: - 토큰 저장하기
    
    func setToken() {
        KeyChain.create(key: "access_token", token: result.access_token)
        KeyChain.create(key: "refresh_token", token: result.refresh_token)
    }
}
