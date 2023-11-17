import Foundation

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case Large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 20
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .Large: return 64
        case .xLarge: return 80
        }
    }
}
