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
                    .modifier(AuthButtonModifier())
            }
            
            Button {
                
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
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
