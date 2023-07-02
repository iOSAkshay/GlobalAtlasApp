//
//  LoginView.swift
//  TableViewSwiftUI
//
//  Created by Akshay Nandane on 02/07/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            Image("app_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 50)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.horizontal, 50)
            
            Button(action: {
//                ContentView()
                print("here ")
                if validateEmail(email) {
                    // Perform login authentication here
                    print("here ")
                    if password.isEmpty {
                        showAlert = true
                    } else {
                        // Login logic
                        // Redirect to the next screen or perform any necessary actions
                        print("Login Success ")
                        self.isLoggedIn = true
                    }
                } else {
                    showAlert = true
                }
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isLoggedIn, content: {
                ContentView()
            })
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Invalid email address or password."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        print("emailPredicate : \(emailPredicate)")
        return emailPredicate.evaluate(with: email)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


