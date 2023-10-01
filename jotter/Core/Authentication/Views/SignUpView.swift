import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Jotter")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            
            VStack {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(AuthTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(AuthTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(AuthTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(AuthTextFieldModifier())
            }
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .modifier(AuthButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            Divider()
            
            Button {
                
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.primary)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
