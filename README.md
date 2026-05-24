# Portfolio Website

A personal portfolio website built with [Raptor](https://github.com/raptor-build/raptor) and Swift.

## Tech Stack

- Swift 6.2
- Raptor static site framework
- Custom Swift + inline CSS/JavaScript components

## Features

- Scroll-snap single-page layout (Hero, Projects, About)
- Responsive design for mobile/tablet/desktop
- Theme toggle (light/dark)
- Interactive employment modal in the About section
- Dynamic favicon support (`/favicon.ico`)

## Project Structure

- `Sources/Site.swift` - site entry point and metadata
- `Sources/Layouts/MainLayout.swift` - global layout and scripts
- `Sources/Pages/Home.swift` - page composition and scroll behavior
- `Sources/Pages/ProjectsSectionView.swift` - projects section/cards
- `Sources/Pages/AboutSectionView.swift` - about and experience section
- `Assets/` - static assets (images, icons, favicon)
- `Build/` - generated static output

## Requirements

- macOS 15+
- Xcode 16+ (or Swift toolchain with Swift 6.2)

## Getting Started

1. Clone the repository.
2. From the project root, fetch dependencies and build:

```bash
swift build
```

3. Generate the site:

```bash
swift run Portfolio
```

After publishing, output is generated in `Build/`.

## Customization

- Edit content in:
  - `Sources/Pages/ProjectsSectionView.swift`
  - `Sources/Pages/AboutSectionView.swift`
- Update theme/layout behavior in:
  - `Sources/Layouts/MainLayout.swift`
- Replace or add static files in:
  - `Assets/`

## Deployment

Deploy the contents of `Build/` to any static host, for example:

- GitHub Pages
- Netlify
- Vercel
- Cloudflare Pages

## License

Personal project. All rights reserved unless otherwise specified.
