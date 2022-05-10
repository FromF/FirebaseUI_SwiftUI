//
//  FirebaseAuthStateManager.swift
//  FirebaseUIAPP
//
//  Created by 藤 治仁 on 2020/08/28.
//  Copyright © 2020 FromF.github.com. All rights reserved.
//

import FirebaseAuth

class FirebaseAuthStateManager: ObservableObject {
    @Published var signInState: Bool = false
    private var handle: AuthStateDidChangeListenerHandle!
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("Sign-in")
                self.signInState = true
            } else {
                print("Sign-out")
                self.signInState = false
            }
        }
    }
    
    deinit {
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
