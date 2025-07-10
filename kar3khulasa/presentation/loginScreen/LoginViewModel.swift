//
//  LoginViewModel.swift
//  kar3khulasa
//
//  Created by Osama shallal on 29/07/2024.
//

import Foundation
import SwiftUI

extension LoginScreen {
    class ViewModelLogin: ObservableObject {
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet {objectWillChange.send()}
        }
        
        @AppStorage("USER_KEY") var username = ""
        //keep filled ONLY debugging
        
        @Published var password = ""
        @Published var invalid: Bool = false
        
        
        private var sampleUser = "username"
        private var samplePassword = "password"
        
        init() {
            // Debugging
            print("Currently logged on: \(authenticated)")
            print("Current user: \(username)")
        }
        
        func toggleAuthentication() {
                    // Make sure that the password does not save.
                    self.password = ""
                    
                    withAnimation(.spring()) {
                        authenticated.toggle()
                    }
                }
        
        func authenticate() {
            guard self.username.lowercased() == sampleUser else {
                self.invalid = true
                return
            }
            
            guard self.password.lowercased() == samplePassword else {
                self.invalid  = true
                return
            }
            toggleAuthentication()
        }
        
        func logout(){
            toggleAuthentication()
        }
        
        func logPressed(){
            print("button pressed.")
        }
    }
}
