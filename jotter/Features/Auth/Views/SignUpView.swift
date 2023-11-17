import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
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
                
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(AuthTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(AuthTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .autocapitalization(.none)
                    .modifier(AuthTextFieldModifier())
            }
            
            Button {
                Task { try await viewModel.createUser()  }
            } label: {
                if viewModel.isSigningIn {
                    ProgressView()
                        .padding(.vertical, 12)
                } else {
                    Text("Sign Up")
                        .modifier(AuthButtonModifier())
                }
            }
            .padding(.vertical)
            
            Spacer()
            Divider()
            
            Button {
                dismiss() 
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(Theme.primary)
                .font(.footnote)
            }
            .padding(.vertical, 16)
        }
        .alert("Error", isPresented: $viewModel.showingAlert) {
            Button("OK") {}
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
