import Foundation
import Raptor

struct PortfolioTheme: Theme {
    func theme(site: Content, colorScheme: ColorScheme) -> Content {
        switch colorScheme {
        case .light:
            return site.accent(Color(hex: "#2563eb"))
        case .dark:
            return site.accent(Color(hex: "#60a5fa"))
        case .any:
            return site.contentWidth(max: 1120)
        }
    }
}
