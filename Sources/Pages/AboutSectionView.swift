import Foundation
import Raptor

struct AboutSectionView: HTML {
    var body: some HTML {
        let bannerCard = Section {
            Text("About Me")
                .font(.title1)
                .fontWeight(.bold)
        }
        .style(.custom("text-align", value: "center"))
        .padding(.horizontal, .large)
        .padding(.top, .small)

        let outer = Section {
            bannerCard
            WhoAmI()
                .margin(.vertical, .large)
            ExperienceSection()
        }
        .id("about-section")
        .style(.custom("scroll-snap-align", value: "start"))
        .style(.custom("scroll-snap-stop", value: "always"))
        .style(.custom("scroll-margin-top", value: "40px"))
        .style(.custom("padding-top", value: "20px"))
        .style(.width(.percent(100)))
        .style(.display(.flex))
        .style(.flexDirection(.column))
        .style(.flexShrink(0))
        .style(.alignItems(.center))
        .style(.height(.vh(100)))

        return outer
    }
}

// MARK: - Who Am I?
struct WhoAmI: HTML {
    
    let portrait: AnyHTML = AnyHTML(Group {
        Image("/me.jpeg", description: "Portrait of Jacob Pantuso")
            .imageFit(.cover, anchor: .top)
            .frame(width: 168, height: 168)
            .cornerRadius(999)
            .style(.custom("border", value: "1px solid var(--divider)"))
            .style(.custom("box-shadow", value: "var(--card-shadow)"))
            .background(.secondaryBackground)
    })
    
    var body: some HTML {
        HStack {
            portrait
            VStack(alignment: .leading) {
                Text("Hey there!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .style(.alignSelf(.start))
                Section {
                    Text("Welcome to my personal website. I'm ")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                        .style(.custom("display", value: "inline"))
                        .style(.custom("margin", value: "0"))
                    Text("Jacob")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .style(.custom("display", value: "inline"))
                        .style(.custom("margin", value: "0"))
                        .style(.custom("background", value: "linear-gradient(135deg, #5fa8b9 0%, #3a7bd5 100%)"))
                        .style(.custom("-webkit-background-clip", value: "text"))
                        .style(.custom("-webkit-text-fill-color", value: "transparent"))
                        .style(.custom("background-clip", value: "text"))
                    Text(", a Full Stack developer with a passion for designing and implementing thoughtful digital experiences. I am currently working at Bell as a Project Manager, specializing in AI Research & Performance.")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                        .style(.custom("display", value: "inline"))
                        .style(.custom("margin", value: "0"))
                }
                .style(.custom("font-size", value: "0"))
                .style(.custom("max-width", value: "380px"))
            }
            .id("who-am-i-text")
            .style(.display(.flex))
            .style(.gap(.px(16)))
            .style(.textAlign(.start))
            .style(.width(.percent(70)))
        }
        .id("who-am-i")
        .style(.gap(.px(50)))
        .style(.justifyContent(.center))
        .padding(.xLarge)
        .style(.width(.fitContent))
        .background(.secondaryBackground)
        .cornerRadius(16)
        .style(.custom("border", value: "1px solid var(--divider)"))
        .style(.custom("box-shadow", value: "var(--card-shadow)"))
    }
}

// MARK: - Experience Section
struct ExperienceSection: HTML {
    
    var body: some HTML {
        VStack {
            Text("Experience")
                .font(.title2)
                .fontWeight(.bold)
            Text("Click a card to view more information.")
                .font(.body)
                .foregroundStyle(.secondary)
                .style(.custom("max-width", value: "560px"))
            Section {
                EmploymentCard(
                    logoSrc: "/bell.png",
                    company: "Bell",
                    role: "Project Manager - AI Research & Performance",
                    period: "May 2026 – Present",
                    summary: "Leading strategic AI research and performance initiatives to optimize sales operations, leveraging automatic and intelligent insights to drive operational eﬃciency and revenue growth.",
                    gradient: "linear-gradient(-20deg, #ff4d4d, #b40000)",
                    skills: ["Project management", "Python", "Gemini Enterprise", "Google Cloud Platform", "Data Analysis"]
                )
                EmploymentCard(
                    logoSrc: "/bell.png",
                    company: "Bell",
                    role: "Full Stack Developer - Online Ordering Experience",
                    period: "Sep 2025 – May 2026",
                    summary: "Building responsive, component-driven UIs in cross-functional teams. <br>Rotating through multiple business units in Bell's Graduate Leadership Program — gaining experience across operations, strategy, and people management.",
                    gradient: "linear-gradient(-20deg, #ff4d4d, #b40000)",
                    skills: ["Angular", "TypeScript", "Node", "Containerization", "CI/CD", "Agile"]
                )
                EmploymentCard(
                    logoSrc: "/tmu-icon.png",
                    company: "Toronto Metropolitan University",
                    role: "Orientation & Events Facilitator - Student Affairs",
                    period: "Jan 2025 – Sep 2025",
                    summary: "Led Central Orientation Week programming for 5,000+ students, mentored a team of 10 staff, and implemented a digital experience that streamlined navigation for incoming first-years.",
                    gradient: "linear-gradient(-20deg, #005DA0, #FBBA00)",
                    skills: ["Organized", "Time-management", "People management", "High pressure"]
                )
            }
            .id("exp-cards")
            .style(.gap(.px(16)))
            .style(.alignItems(.stretch))
            .style(.display(.flex))
            .style(.flexDirection(.row))
            .style(.flexWrap(.wrap))
            .margin(.top, .medium)
        }
        .margin(.top, .large)
    }
}


// MARK: - Chip

struct Chip: HTML {
    let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some HTML {
        Text(text)
            .font(.small)
            .fontWeight(.medium)
            .padding(.vertical, .small)
            .padding(.horizontal, .medium)
            .background(.secondaryBackground)
            .cornerRadius(999)
    }
}

// MARK: - EmploymentCard

struct EmploymentCard: HTML {
    let logoSrc: String
    let company: String
    let role: String
    let period: String
    let summary: String
    let gradient: String
    let skills: [String]

    private var logoTile: some HTML {
        Section {
            Image(logoSrc, description: company)
                .style(.custom("width", value: "44px"))
                .style(.custom("height", value: "44px"))
                .style(.custom("object-fit", value: "contain"))
        }
        .style(.custom("margin", value: "auto"))
        .style(.custom("width", value: "60px"))
        .style(.custom("height", value: "60px"))
        .style(.custom("border-radius", value: "14px"))
        .style(.custom("background", value: "white"))
        .style(.custom("padding", value: "8px"))
        .style(.custom("display", value: "flex"))
        .style(.custom("align-items", value: "center"))
        .style(.custom("justify-content", value: "center"))
        .style(.custom("flex-shrink", value: "0"))
        .style(.custom("box-shadow", value: "0 2px 8px rgba(0,0,0,0.10)"))
    }

    private var rightColumn: some HTML {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(role).font(.title4).fontWeight(.semibold)
                Text("\(period)").font(.body).foregroundStyle(.secondary)
            }
            .style(.gap(.px(3)))
        }
        .style(.custom("margin", value: "auto"))
        .style(.custom("flex-direction", value: "column"))
        .style(.custom("align-items", value: "flex-start"))
        .style(.custom("gap", value: "12px"))
        .style(.custom("flex", value: "1"))
    }

    var body: some HTML {
        HStack(alignment: .top, spacing: .medium) {
            logoTile
            rightColumn
        }
        .padding(.all, .large)
        .cornerRadius(20)
        .frame(minWidth: 340)
        .style(.cursor(.pointer))
        .style(.custom("flex", value: "1"))
        .style(.gap(.px(20)))
        .background(.secondaryBackground)
        .style(.custom("border", value: "1px solid var(--divider)"))
        .style(.custom("box-shadow", value: "var(--card-shadow)"))
        .attribute("data-emp-card", "true")
        .attribute("data-card", "true")
        .attribute("data-employment", [role, company, period, summary, gradient, logoSrc, skills.joined(separator: "|")].joined(separator: "\t"))
    }
}

