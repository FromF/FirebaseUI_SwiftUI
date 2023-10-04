//
//  LoginView.swift
//  FirebaseUIAPP
//
//  Created by 藤 治仁 on 2020/08/28.
//  Copyright © 2020 FromF.github.com. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    private var authenticationManager = AuthenticationManager()
    @State private var isShowSheet = false
    
    var body: some View {
        VStack {
            if authenticationManager.isSignIn == false {
                // Sign-Out状態なのでSign-Inボタンを表示する
                Button {
                    self.isShowSheet.toggle()
                } label: {
                    Text("Sign-In")
                }
            } else {
                // Sign-In状態なのでSign-Outボタンを表示する
                Button {
                    authenticationManager.signOut()
                } label: {
                    Text("Sign-Out")
                }
            }
        }
        .sheet(isPresented: $isShowSheet) {
            FirebaseAuthUIView()
        }
    }
}

#Preview {
    LoginView()
}
