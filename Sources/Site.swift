import Foundation
import Raptor

@main
struct PortfolioApp {
    static func main() async {
        var site = PortfolioSite()
        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PortfolioSite: Site {
    var name = "Jacob Pantuso"
    var titleSuffix = " – Jacob Pantuso"
    var url = URL(static: "https://jacobpantuso.ca")

    var author = "Jacob Pantuso"
    var description: String? = "Full Stack Developer at Bell, building delightful apps for Apple platforms."

    nonisolated var prettifyHTML: Bool { false }

    var homePage = Home()
    var layout = MainLayout()

    nonisolated var themes: [any Theme] { [PortfolioTheme()] }

    var pages: [any Page] { [] }
}
