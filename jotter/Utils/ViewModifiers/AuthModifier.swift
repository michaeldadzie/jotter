import SwiftUI

struct AuthTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}

struct AuthButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.vertical)
            .padding(.trailing, 28)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
