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

