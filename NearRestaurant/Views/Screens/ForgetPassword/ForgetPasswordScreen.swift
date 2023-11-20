//
//  ForgetPassword.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import SwiftUI

struct ForgetPasswordScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Forgot password")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                    TextField("Email address", text: $username)
                        .padding(10)
                        .frame(width: 300, height: 40)
                        .background(Color(.white))
                    .cornerRadius(10)
                
                    
                    TextField("Confirmation code", text: $password)
                        .padding(10)
                        .frame(width: 300, height: 40)
                        .background(Color(.white))
                        .cornerRadius(10)
                    
                        
                
                VStack {

                    Button {
                        
                    } label: {
                        Text("Send code")
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(width: 150, height: 40)
                            .background(Color(.white))
                            .cornerRadius(10)
                            
                    }
                    
//                    NavigationLink {
//                        ResetPasswordView()
//                    } label: {
//                        Text("Reset password")
//                            .foregroundColor(.black)
//                            .padding(10)
//                            .frame(width: 150, height: 40)
//                            .background(Color(.white))
//                            .cornerRadius(10)
//                    }

                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 150, trailing: 0))
            
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ForgetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordScreen()
    }
}
