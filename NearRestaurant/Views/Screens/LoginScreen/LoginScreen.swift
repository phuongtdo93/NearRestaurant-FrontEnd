//
//  LoginScreen.swift
//  NearRestaurant
//
//  Created by Salmdo on 10/24/23.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var user = LoginViewModel(authorizationService: UserAuthorizationService.instance, keychainWrapper: KeychainWrapper())
    
    var checkValidForm: Bool {
        user.isValidPassword == .success &&
        user.isValidUserName == .success
    }
    
    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack (alignment: .center) {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                TextField("Email", text: $user.email)
                    .padding(10)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .onChange(of: user.email) {_ in
                        user.checkValidUserName()
                    }
                
                SecureField("Pasword", text: $user.password)
                    .padding(10)
                    .frame(width: 300, height: 40)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .onChange(of: user.password) {_ in
                        user.checkValidPassword()
                    }
                
                NavigationLink {
                    ForgetPasswordScreen()
                } label: {
                    Text("Forget password?")
                        .frame(width: 280, height: 40, alignment: .leading)
                        .foregroundColor(.white)
                        .italic()
                }
                
                VStack {
                    Button {
                        Task {
                            await user.login()
                        }
                    } label: {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(width: 150, height: 40)
                            .background(Color(.white))
                            .cornerRadius(10)
                    }
                    .disabled(!checkValidForm)
                    
                    Text("Have no account?")
                        .frame(width: 280, height: 40)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .italic()
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                    
                    NavigationLink {
                        SignUpScreen()
                    } label: {
                        Text("SignUp")
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding(10)
                            .frame(width: 150, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 1)
                            }
                    }
                }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationDestination(isPresented: $user.loginStatus, destination: {
            HomeScreen()
        })
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
