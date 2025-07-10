//
//  LoginScreen.swift
//  kar3khulasa
//
//  Created by Osama shallal on 29/07/2024.
//

import SwiftUI

struct LoginScreen : View {
    @StateObject var vm = ViewModelLogin()
    
    var body: some View {
        if vm.authenticated {
            VStack(spacing : 20 ){
                Text("Welcome back **\(vm.username.lowercased())**!")
                Text("Today is : **\(Date().formatted(.dateTime))**")
                Button("log out", action: vm.logout)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        }else {
            ZStack{
                Image("images")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                Color.black.opacity(0.7) // Black transparent overlay
                       .ignoresSafeArea()
                VStack(alignment:.leading , spacing: 20){
                    Text("تسجيل الدخول")
                        .foregroundColor(.white)
                        .font(.system(size: 40,weight: .medium , design: .rounded))
                        .underline()
                    TextField("اسم المستخدم",
                              text: $vm.username)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    
                    SecureField("كلمة المرور", text: $vm.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    HStack{
                        Spacer()
                        Button("تسجيل الدخول",role: .cancel, action: vm.authenticate)
                                                    .buttonStyle(.bordered)
                         Spacer()
                    }
                    .alert("الدخول غير مسموح", isPresented:$vm.invalid){
                        Button ("تم",action : vm.logPressed)
                    }
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
        }
    }
}
struct LoginScreen_preview: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
