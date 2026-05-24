import Foundation
import Raptor

struct ProjectsSectionView: HTML {
    var body: some HTML {
        let headerBase = Section {
            Text("Projects")
                .font(.title1)
                .fontWeight(.bold)
        }
        .style(.custom("text-align", value: "center"))
        .padding(.horizontal, .large)
        .padding(.top, .small)

        let carousel = Section {
            Section {
                ProjectCard(
                    title: "myIONIQ",
                    category: "iOS App",
                    tags: ["iOS", "SwiftUI", "CloudKit"],
                    description: "A visually stuning SwiftUI native replacement to Hyundai's traditional myHyundai BlueLink service.",
                    links: [("Source", "https://github.com/JacobPantuso/myIONIQ")],
                    gradient: "linear-gradient(-20deg, #0a0f1a, #0e2d3a)",
                )
                ProjectCard(
                    title: "Portfolio Website",
                    category: "Website",
                    tags: ["SwiftUI", "Raptor", "JavaScript"],
                    description: "You're looking at it... and of course it's built with SwiftUI",
                    links: [],
                    gradient: "linear-gradient(-20deg, #d496e9, #a635a4)",
                )
                ProjectCard(
                    title: "Weather React",
                    category: "Utility",
                    tags: ["React", "JavaScript"],
                    description: "Weather React is a data-driven weather webpage built with ReactJS.",
                    links: [("Source", "https://github.com/JacobPantuso/weather-react")],
                    gradient: "linear-gradient(-20deg, #eaff00, #ff6600)",
                )
            }
            .style(.custom("display", value: "flex"))
            .style(.custom("flex-direction", value: "row"))
            .style(.custom("flex-wrap", value: "wrap"))
            .style(.custom("gap", value: "16px"))
            .style(.custom("align-items", value: "stretch"))
        }
        .style(.custom("display", value: "flex"))
        .style(.custom("flex-direction", value: "column"))
        .style(.custom("gap", value: "16px"))
        .padding(.vertical, .xLarge)

        let outer = Section {
            headerBase
            carousel
        }
        .id("projects-section")
        .style(.custom("scroll-snap-align", value: "start"))
        .style(.custom("scroll-snap-stop", value: "always"))
        .style(.custom("scroll-margin-top", value: "72px"))
        .style(.custom("flex-shrink", value: "0"))
        .style(.custom("width", value: "100%"))
        .style(.custom("display", value: "flex"))
        .style(.custom("flex-direction", value: "column"))
        .style(.height(.vh(100)))

        return outer
            .style(.custom("gap", value: "24px"))
            .style(.custom("padding", value: "50px 0 48px"))
    }
}

// MARK: - ProjectCard

struct ProjectCard: HTML {
    let title: String
    let category: String
    let tags: [String]
    let description: String
    let links: [(String, String)]
    let gradient: String

    var body: some HTML {
        let categoryBadge = Text(category)
            .font(.xSmall)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.vertical, .small)
            .padding(.horizontal, .medium)
            .style(.width(.fitContent))
            .style(.custom("background", value: "rgba(255,255,255,0.16)"))
            .cornerRadius(999)

        let titleText = Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.top)
            .style(.custom("color", value: "white"))

        let linkButtons = HStack(spacing: .xSmall) {
            ForEach(links) { link in
                Link(destination: link.1) {
                    Label(link.0, systemImage: "box-arrow-up-right")
                        .labelIconToTitleSpacing(6)
                }
                .attribute("target", "_blank")
                .style(.custom("color", value: "white"))
                .style(.custom("font-size", value: "0.8rem"))
                .style(.custom("background", value: "rgba(255,255,255,0.16)"))
                .style(.custom("padding", value: "4px 10px"))
                .style(.custom("border-radius", value: "999px"))
                .style(.custom("white-space", value: "nowrap"))
            }
        }
        .style(.custom("margin-left", value: "auto"))
        .style(.custom("white-space", value: "nowrap"))

        let cardHeader = Section {
            HStack(alignment: .center, spacing: .medium) {
                Section {
                    categoryBadge
                    titleText
                }
                linkButtons
            }
        }
        .style(.custom("background", value: gradient))
        .style(.custom("padding", value: "24px 24px 22px"))

        let tagRow = HStack(spacing: .xSmall) {
            ForEach(tags) { tag in
                Text(tag)
                    .font(.xSmall)
                    .fontWeight(.medium)
                    .foregroundStyle(.accent)
                    .padding(.vertical, .small)
                    .padding(.horizontal, .small)
                    .background(.tertiaryBackground)
                    .cornerRadius(999)
            }
        }
        .style(.custom("flex-wrap", value: "wrap"))

        let cardBody = Section {
            tagRow
            Text(description)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .style(.custom("display", value: "flex"))
        .style(.custom("flex-direction", value: "column"))
        .style(.custom("gap", value: "14px"))
        .padding(.all, .large)

        return Section {
            cardHeader
            cardBody
        }
        .style(.custom("display", value: "flex"))
        .style(.custom("flex-direction", value: "column"))
        .style(.custom("flex", value: "1"))
        .style(.custom("min-width", value: "240px"))
        .style(.custom("overflow", value: "hidden"))
        .background(.secondaryBackground)
        .style(.custom("border", value: "1px solid var(--divider)"))
        .style(.custom("border-radius", value: "18px"))
        .style(.custom("box-shadow", value: "var(--card-shadow)"))
        .attribute("data-card", "true")
    }
}
