//
//  ResetPasswordView.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(hex: CustomColor.lighterRed), Color(hex: CustomColor.moreRed)]), center: .center, startRadius: 100, endRadius: 470)
                .ignoresSafeArea()

            VStack {
                Text("Reset password")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                    TextField("New password", text: $username)
                        .padding(10)
                        .frame(width: 300, height: 40)
                        .background(Color(.white))
                    .cornerRadius(10)
                
                    
                    TextField("Confirm new password", text: $password)
                        .padding(10)
                        .frame(width: 300, height: 40)
                        .background(Color(.white))
                        .cornerRadius(10)
                    
                NavigationLink {
                    LoginScreen()
                } label: {
                    Text("Continue")
                        .foregroundColor(.black)
                        .padding(10)
                        .frame(width: 150, height: 40)
                        .background(Color(.white))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
            
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
