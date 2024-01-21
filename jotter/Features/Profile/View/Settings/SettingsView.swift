import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Text("Logout")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding()
                        }
                        .buttonStyle(.plain)
                        
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
