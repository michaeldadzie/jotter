import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel =  LoginViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            VStack {
                Text("Jotter")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(AuthTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .autocapitalization(.none)
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
                Task { try await viewModel.login() }
            } label: {
                Text("Login")
                    .modifier(AuthButtonModifier())
            }
            
            Spacer()
            Divider()
            
            NavigationLink {
                SignUpView()
                    .navigationBarBackButtonHidden(true)
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
