//
//  SignUpScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import SwiftUI
import Combine

struct SignUpScreen: View {
    @StateObject var user = SignUpViewModel(authorizationService: UserAuthorizationService.instance, keychainWrapper: KeychainWrapper())
    
    var checkFormIsValid: Bool {
        return user.isValidUserName == .success &&
        user.isValidPassword == .success &&
        user.isValidConfirmPassword == .success
    }
    
    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Signup")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                TextField("Email", text: $user.email)
                    .padding(10)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .onChange(of: user.email) { _ in
                        user.checkValidUserName()
                    }
                if user.isValidUserName == .failed {
                    Text("Please enter a valid email address.")
                        .foregroundColor(.white)
                        .font(.caption2)
                        .frame(width: 300, height: 20, alignment: .leading)
                        .italic()
                }
                
                SecureField("Pasword", text: $user.password)
                    .padding(10)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .onChange(of: user.password) { _ in
                        user.checkValidPassword()
                    }
                if user.isValidPassword == .failed {
                    Text("Please enter a valid password.")
                        .foregroundColor(.white)
                        .font(.caption2)
                        .frame(width: 300, height: 20, alignment: .leading)
                        .italic()
                }
                
                SecureField("Confirm pasword", text: $user.confirmPassword)
                    .padding(10)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .onChange(of: user.confirmPassword, perform: { newValue in
                        user.checkValidConfirmPassword()
                    })
                if user.isValidConfirmPassword == .failed {
                    Text("Passwords do not match. Please try again.")
                        .foregroundColor(.white)
                        .font(.caption2)
                        .frame(width: 300, height: 20, alignment: .leading)
                        .italic()
                }
                
               Button {
                   Task {
                       await user.signUpThenLogin()
                   }
                   
               } label: {
                   Text("Signup")
                       .foregroundColor(.black)
                       .padding(10)
                       .frame(width: 150, height: 40)
                       .background(.white)
                       .cornerRadius(10)
               }
               .disabled(!checkFormIsValid)
               .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
               
               Text("Have an account?")
                   .frame(width: 280, height: 40)
                   .foregroundColor(.white)
                   .font(.subheadline)
                   .italic()
                   .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
               

               NavigationLink {
                   LoginScreen()
               } label: {
                   Text("Login")
                       .foregroundColor(.white)
                       .font(.title3)
                       .padding(10)
                       .frame(width: 150, height: 40)
                       .background {
                           RoundedRectangle(cornerRadius: 10)
                               .stroke(.white, lineWidth: 1)
                       }
               }
            }
        }
        .navigationDestination(isPresented: $user.signUpResponse) {
            HomeScreen()
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
