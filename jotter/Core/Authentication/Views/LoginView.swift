import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            VStack {
                Text("Jotter")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(AuthTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(AuthTextFieldModifier())
            }
            
            NavigationLink {
                Text("ForgotView")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
                
            } label: {
                Text("Login")
                    .modifier(AuthButtonModifier())
            }
            
            Spacer()
            Divider()
            
            NavigationLink {
                Text("RegistrationView")
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.primary)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
