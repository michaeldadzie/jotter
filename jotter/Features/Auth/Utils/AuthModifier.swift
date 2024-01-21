import SwiftUI

struct AuthTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
        #else
            return content
            .font(.subheadline)
            .padding(12)
            .background()
            .cornerRadius(10)
            .padding(.horizontal, 24)
        #endif
    }
}

struct AuthButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 352, height: 44)
            .background(Theme.primary)
            .cornerRadius(8)
            .foregroundColor(Theme.secondary)
        #else
        return content
            .font(.subheadline)
            .fontWeight(.semibold)
            .cornerRadius(10)
        #endif
    }
}
