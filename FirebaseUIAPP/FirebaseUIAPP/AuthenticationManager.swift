//
//  AuthenticationManager.swift
//  FirebaseUIAPP
//
//  Created by 藤 治仁 on 2020/08/28.
//  Copyright © 2020 FromF.github.com. All rights reserved.
//
import Foundation
import FirebaseAuth

@Observable class AuthenticationManager: ObservableObject {
    private(set) var isSignIn: Bool = false
    private var handle: AuthStateDidChangeListenerHandle!
    
    init() {
        // ここで認証状態の変化を監視する（リスナー）
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("Sign-in")
                self.isSignIn = true
            } else {
                print("Sign-out")
                self.isSignIn = false
            }
        }
    }
    
    deinit {
        // ここで認証状態の変化の監視を解除する
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}
