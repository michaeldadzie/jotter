import SwiftUI

struct CreateJotView: View {
    @StateObject var viewModel = CreateJotViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    CircularProfileImage(user: user, size: .small)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Jot what's on your mind...", text: $viewModel.jot, axis: .vertical)
                            .autocapitalization(.none)
                            .font(.footnote)
                        
                        Spacer()
                        
                        if !viewModel.jot.isEmpty {
                            Button {
                                viewModel.jot = ""
                            } label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Jot")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                        .font(.subheadline)
                        #if !os(visionOS)
                        .foregroundColor(Theme.primary)
                        #endif
                        #if os(visionOS)
                        .foregroundColor(.black)
                        #endif
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task {
                            try await viewModel.uploadJot()
                            dismiss()
                        }
                    }
                    .opacity(viewModel.jot.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.jot.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    #if !os(visionOS)
                    .foregroundColor(Theme.primary)
                    #endif
                    #if os(visionOS)
                    .foregroundColor(.black)
                    #endif
                }
            }
        }
    }
}

struct CreateJotView_Previews: PreviewProvider {
    static var previews: some View {
        CreateJotView()
    }
}
