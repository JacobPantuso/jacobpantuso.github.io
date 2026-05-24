import Foundation
import Raptor

struct Home: Page {
    var title = "Home"
    var description = "Jacob Pantuso — Full Stack Developer at Bell, building delightful apps for Apple platforms."

    private let skills = ["Swift", "SwiftUI", "UIKit", "Core Data", "CloudKit", "TypeScript", "Node.js", "React"]

    // Compact pill that morphs in from the hero as it scrolls away
    private var miniNav: some HTML {
        let pill = Section {
            Link("Jacob Pantuso", destination: "#")
                .fontWeight(.bold)
                .style(.custom("background", value: "linear-gradient(135deg, #5fa8b9 0%, #3a7bd5 100%)"))
                .style(.custom("-webkit-background-clip", value: "text"))
                .style(.custom("-webkit-text-fill-color", value: "transparent"))
                .style(.custom("background-clip", value: "text"))
            HStack(spacing: .medium) {
                Link("Projects", destination: "#projects")
                    .foregroundStyle(.primary)
                Link("About", destination: "#about")
                    .foregroundStyle(.primary)
            }
            .id("nav-links")
            .style(.custom("display", value: "flex"))
            .style(.custom("gap", value: "16px"))
        }
        .id("mini-nav")
        .style(.custom("position", value: "fixed"))
        .style(.custom("top", value: "16px"))
        .style(.custom("left", value: "50%"))
        .style(.custom("transform", value: "translateX(-50%) scale(0.85)"))
        .style(.custom("display", value: "flex"))
        .style(.custom("align-items", value: "center"))
        .style(.custom("gap", value: "20px"))
        .padding(.vertical, 10)
        .padding(.horizontal, 20)

        return pill
            .style(.custom("background", value: "var(--bg-secondary)"))
            .style(.custom("backdrop-filter", value: "blur(12px)"))
            .style(.custom("border", value: "1px solid var(--divider)"))
            .cornerRadius(999)
            .style(.custom("box-shadow", value: "var(--card-shadow)"))
            .zIndex(1000)
            .opacity(0)
            .style(.custom("pointer-events", value: "none"))
            .style(.custom("white-space", value: "nowrap"))
    }

    private var heroLinks: some HTML {
        HStack() {
            Link(destination: "mailto:jacobpantuso@outlook.com") {
                Image(systemName: "envelope-fill")
                    .frame(width: 28, height: 28)
            }
            .hoverEffect { $0.foregroundStyle(.white) }
            Link(destination: "https://github.com/jacobpantuso") {
                Image(systemName: "github")
                    .frame(width: 28, height: 28)
            }
            .hoverEffect { $0.foregroundStyle(.white) }
            Link(destination: "https://www.linkedin.com/in/jacob-pantuso-054b06156/") {
                Image(systemName: "linkedin")
                    .frame(width: 28, height: 28)
            }
            .hoverEffect {
                $0.foregroundStyle(.white)
            }
        }
        .style(.gap(.px(24)))
        .id("hero-links")
    }

    private var scrollHint: some HTML {
        VStack {
            Image(systemName: "arrow-down")
                .style(.custom("font-size", value: "1.5rem"))
            Text("scroll to learn more")
                .foregroundStyle(.secondary)
        }
        .attribute("class", "scroll-hint")
    }

    private var heroSection: some HTML {
        let portrait: AnyHTML = AnyHTML(Group {
            Image("/me.jpeg", description: "Portrait of Jacob Pantuso")
                .imageFit(.cover, anchor: .top)
                .frame(width: 168, height: 168)
                .cornerRadius(999)
                .style(.custom("border", value: "1px solid var(--divider)"))
                .style(.custom("box-shadow", value: "var(--card-shadow)"))
                .background(.secondaryBackground)
        })
        let nameRow: AnyHTML = AnyHTML(
            HStack() {
                Text("Hey, I'm")
                    .font(.title1)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                Text("Jacob Pantuso")
                    .font(.title1)
                    .fontWeight(.bold)
                    .style(.custom("background", value: "linear-gradient(135deg, #5fa8b9 0%, #3a7bd5 100%)"))
                    .style(.custom("-webkit-background-clip", value: "text"))
                    .style(.custom("-webkit-text-fill-color", value: "transparent"))
                    .style(.custom("background-clip", value: "text"))
            }
            .id("hero-name-row")
            .style(.custom("gap", value: "0.5em"))
        )
        let roleBadge: AnyHTML = AnyHTML(Group {
            Label("Project Manager | AI Research & Performance @ Bell", systemImage: "building-fill")
                .id("hero-role-badge")
                .font(.small)
                .fontWeight(.semibold)
                .foregroundStyle(.accent)
                .padding(.vertical, .small)
                .padding(.horizontal, .medium)
                .background(.secondaryBackground)
                .cornerRadius(999)
        })
        let tagline: AnyHTML = AnyHTML(
            Text("i like to code pretty things")
                .font(.title4)
                .foregroundStyle(.secondary)
                .frame(maxWidth: 620)
                .style(.custom("margin", value: "0 auto"))
        )
        let base = Section {
            Spacer()
            portrait
            nameRow
            roleBadge
            tagline
            Spacer()
            heroLinks
            Spacer()
            scrollHint
        }
        .id("hero-section")
        .style(.custom("text-align", value: "center"))
        .style(.custom("display", value: "flex"))
        .style(.custom("flex-direction", value: "column"))
        .style(.custom("align-items", value: "center"))
        .style(.custom("justify-content", value: "center"))
        .padding(48)
        .style(.gap(.px(24)))
        .style(.custom("width", value: "70%"))
        .style(.custom("height", value: "calc(100vh - 135px)"))
        .style(.custom("flex-shrink", value: "0"))
        .style(.custom("scroll-snap-align", value: "start"))
        .style(.custom("scroll-snap-stop", value: "always"))
        .style(.custom("--mouse-x", value: "50%"))
        .style(.custom("--mouse-y", value: "0%"))

        return base
            .style(.custom("background", value: "radial-gradient(circle at var(--mouse-x) var(--mouse-y), var(--hero-glow-teal), transparent 46%), linear-gradient(180deg, var(--hero-glow-blue), transparent 32%)"))
            .style(.custom("border", value: "1px solid var(--divider)"))
            .cornerRadius(28)
            .style(.custom("box-shadow", value: "var(--hero-shadow)"))
            .script(code: """
            (function() {
                var section = document.getElementById('hero-section');
                if (!section) return;
                var animFrame = null;
                var entering = false;
                var entryTargetX = 50, entryTargetY = 0;

                function ease(t) { return 1 - Math.pow(1 - t, 3); }

                section.addEventListener('mouseenter', function(e) {
                    if (animFrame) { cancelAnimationFrame(animFrame); animFrame = null; }
                    var rect = section.getBoundingClientRect();
                    entryTargetX = (e.clientX - rect.left) / rect.width * 100;
                    entryTargetY = (e.clientY - rect.top) / rect.height * 100;
                    var startX = parseFloat(section.style.getPropertyValue('--mouse-x')) || 50;
                    var startY = parseFloat(section.style.getPropertyValue('--mouse-y')) || 0;
                    var duration = 200, startTime = null;
                    entering = true;

                    function animate(ts) {
                        if (!startTime) startTime = ts;
                        var t = ease(Math.min((ts - startTime) / duration, 1));
                        section.style.setProperty('--mouse-x', (startX + (entryTargetX - startX) * t).toFixed(1) + '%');
                        section.style.setProperty('--mouse-y', (startY + (entryTargetY - startY) * t).toFixed(1) + '%');
                        if (t < 1) { animFrame = requestAnimationFrame(animate); }
                        else { animFrame = null; entering = false; }
                    }
                    animFrame = requestAnimationFrame(animate);
                });

                section.addEventListener('mousemove', function(e) {
                    var rect = section.getBoundingClientRect();
                    var x = ((e.clientX - rect.left) / rect.width * 100).toFixed(1);
                    var y = ((e.clientY - rect.top) / rect.height * 100).toFixed(1);
                    if (entering) {
                        entryTargetX = parseFloat(x);
                        entryTargetY = parseFloat(y);
                    } else {
                        if (animFrame) { cancelAnimationFrame(animFrame); animFrame = null; }
                        section.style.setProperty('--mouse-x', x + '%');
                        section.style.setProperty('--mouse-y', y + '%');
                    }
                });

                section.addEventListener('mouseleave', function() {
                    entering = false;
                    if (animFrame) { cancelAnimationFrame(animFrame); animFrame = null; }
                    var startX = parseFloat(section.style.getPropertyValue('--mouse-x')) || 50;
                    var startY = parseFloat(section.style.getPropertyValue('--mouse-y')) || 0;
                    var targetX = 50, targetY = 0;
                    var duration = 700, startTime = null;

                    function animate(ts) {
                        if (!startTime) startTime = ts;
                        var t = ease(Math.min((ts - startTime) / duration, 1));
                        section.style.setProperty('--mouse-x', (startX + (targetX - startX) * t).toFixed(1) + '%');
                        section.style.setProperty('--mouse-y', (startY + (targetY - startY) * t).toFixed(1) + '%');
                        if (t < 1) animFrame = requestAnimationFrame(animate);
                    }
                    animFrame = requestAnimationFrame(animate);
                });
            })();
            """)
    }

    var body: some HTML {
        VStack {
            miniNav
            heroSection
            ProjectsSectionView()
            AboutSectionView()
        }
        .id("scroll-container")
        .style(.custom("position", value: "fixed"))
        .style(.custom("top", value: "0"))
        .style(.custom("left", value: "0"))
        .style(.custom("width", value: "100%"))
        .style(.custom("height", value: "100vh"))
        .style(.custom("overflow-y", value: "scroll"))
        .style(.custom("scroll-snap-type", value: "y mandatory"))
        .style(.custom("scroll-padding-top", value: "72px"))
        .style(.custom("scrollbar-width", value: "none"))
        .style(.custom("padding", value: "72px"))
        .style(.custom("box-sizing", value: "border-box"))
        .script(code: """
            (function() {
                var s = document.createElement('style');
                s.textContent = '#scroll-container::-webkit-scrollbar { display: none; }';
                document.head.appendChild(s);

                var container = document.getElementById('scroll-container');
                var hero = document.getElementById('hero-section');
                var miniNav = document.getElementById('mini-nav');
                if (!container || !hero || !miniNav) return;

                var projectsEl = document.getElementById('projects-section');
                var aboutEl = document.getElementById('about-section');
                if (!projectsEl || !aboutEl) return;

                var nameLink = miniNav.querySelector('a');
                if (nameLink) {
                    nameLink.addEventListener('click', function(e) {
                        e.preventDefault();
                        container.scrollTo({ top: 0, behavior: 'smooth' });
                    });
                }

                var navLinksEl = document.getElementById('nav-links');
                var links = navLinksEl ? navLinksEl.querySelectorAll('a') : [];
                if (links.length >= 2) {
                    links[0].style.overflow = 'hidden';
                    links[1].style.overflow = 'hidden';
                    var w0 = links[0].offsetWidth;
                    var w1 = links[1].offsetWidth;
                    links[0].style.width = w0 + 'px';
                    links[1].style.width = w1 + 'px';
                    var t = 'opacity 0.25s ease, transform 0.25s ease, width 0.28s ease, margin 0.28s ease';
                    links[0].style.transition = t;
                    links[1].style.transition = t;

                    links[0].addEventListener('click', function(e) {
                        e.preventDefault();
                        container.scrollTo({ top: projectsEl.offsetTop - 72, behavior: 'smooth' });
                    });
                    links[1].addEventListener('click', function(e) {
                        e.preventDefault();
                        container.scrollTo({ top: aboutEl.offsetTop - 72, behavior: 'smooth' });
                    });
                }

                // Redirect wheel events from outside the container (black margins) into it
                document.addEventListener('wheel', function(e) {
                    if (!container.contains(e.target)) {
                        e.preventDefault();
                        container.scrollTop += e.deltaY;
                    }
                }, { passive: false });

                // iPhone gesture snapping: quick swipes advance sections, held drags snap back.
                function isSmallScreen() {
                    return window.matchMedia('(max-width: 767px)').matches;
                }
                var touchStartY = 0;
                var touchLastY = 0;
                var touchStartTime = 0;
                var touchStartTop = 0;

                function getSnapOffset() {
                    return isSmallScreen() ? 16 : 72;
                }

                function getAnchors() {
                    var snapOffset = getSnapOffset();
                    return [
                        0,
                        Math.max(0, projectsEl.offsetTop - snapOffset),
                        Math.max(0, aboutEl.offsetTop - snapOffset)
                    ];
                }

                function nearestAnchorIndex(value, anchors) {
                    var idx = 0;
                    var dist = Math.abs(value - anchors[0]);
                    for (var i = 1; i < anchors.length; i++) {
                        var d = Math.abs(value - anchors[i]);
                        if (d < dist) { dist = d; idx = i; }
                    }
                    return idx;
                }

                function smoothSnapTo(top) {
                    container.scrollTo({ top: Math.max(0, top), behavior: 'smooth' });
                }

                container.addEventListener('touchstart', function(e) {
                    if (!isSmallScreen() || !e.touches || e.touches.length === 0) return;
                    touchStartY = e.touches[0].clientY;
                    touchLastY = touchStartY;
                    touchStartTime = Date.now();
                    touchStartTop = container.scrollTop;
                }, { passive: true });

                container.addEventListener('touchmove', function(e) {
                    if (!isSmallScreen() || !e.touches || e.touches.length === 0) return;
                    touchLastY = e.touches[0].clientY;
                }, { passive: true });

                container.addEventListener('touchend', function() {
                    if (!isSmallScreen()) return;

                    var anchors = getAnchors();
                    var aboutTop = anchors[2];

                    // Once user is in About, keep free-scroll behavior there.
                    if (touchStartTop >= aboutTop - 8) return;

                    var duration = Date.now() - touchStartTime;
                    var deltaY = touchStartY - touchLastY;
                    var absDelta = Math.abs(deltaY);
                    var velocity = absDelta / Math.max(duration, 1); // px/ms

                    var startIdx = nearestAnchorIndex(touchStartTop, anchors);
                    var currentIdx = nearestAnchorIndex(container.scrollTop, anchors);

                    var isQuickSwipe = (duration < 260 && absDelta > 28) || velocity > 0.65;
                    var isHeldGesture = duration > 380;

                    if (isHeldGesture) {
                        smoothSnapTo(anchors[startIdx]);
                        return;
                    }

                    if (isQuickSwipe) {
                        var direction = deltaY > 0 ? 1 : -1;
                        var targetIdx = Math.max(0, Math.min(anchors.length - 1, startIdx + direction));
                        smoothSnapTo(anchors[targetIdx]);
                        return;
                    }

                    smoothSnapTo(anchors[currentIdx]);
                }, { passive: true });

                function setLinkVisible(link, visible, isFirst) {
                    link.style.opacity = visible ? '1' : '0';
                    link.style.transform = visible ? 'scale(1)' : 'scale(0.8)';
                    link.style.pointerEvents = visible ? 'auto' : 'none';
                    link.style.width = visible ? (isFirst ? w0 : w1) + 'px' : '0';
                    link.style.marginRight = (!visible && isFirst) ? '-16px' : '';
                    link.style.marginLeft = (!visible && !isFirst) ? '-16px' : '';
                }

                function update() {
                    var scrolled = container.scrollTop;
                    var heroH = container.clientHeight;
                    var progress = Math.min(scrolled / (heroH * 0.55), 1);

                    hero.style.opacity = String(1 - progress);
                    hero.style.transform = progress > 0
                        ? 'scale(' + (1 - 0.06 * progress) + ') translateY(' + (-progress * 24).toFixed(1) + 'px)'
                        : '';

                    if (progress > 0.3) {
                        var p = Math.min((progress - 0.3) / 0.35, 1);
                        miniNav.style.opacity = String(p);
                        miniNav.style.transform = 'translateX(-50%) scale(' + (0.85 + 0.15 * p).toFixed(3) + ')';
                        miniNav.style.pointerEvents = 'auto';
                    } else {
                        miniNav.style.opacity = '0';
                        miniNav.style.transform = 'translateX(-50%) scale(0.85)';
                        miniNav.style.pointerEvents = 'none';
                    }

                    if (links.length >= 2) {
                        var projectsTop = projectsEl.offsetTop;
                        var aboutTop = aboutEl.offsetTop;
                        var threshold = container.clientHeight * 0.3;
                        if (scrolled >= aboutTop - threshold) {
                            // In About: show Projects, hide About
                            setLinkVisible(links[0], true, true);
                            setLinkVisible(links[1], false, false);
                        } else if (scrolled >= projectsTop - threshold) {
                            // In Projects: hide Projects, show About
                            setLinkVisible(links[0], false, true);
                            setLinkVisible(links[1], true, false);
                        } else {
                            // Transitioning back to hero: hide both links, show name only
                            setLinkVisible(links[0], false, true);
                            setLinkVisible(links[1], false, false);
                        }
                    }
                }

                container.addEventListener('scroll', update, { passive: true });

                // Scroll-driven background gradient with "throw" momentum
                document.body.style.backgroundImage = [
                    'radial-gradient(ellipse 100% 60% at 50% var(--grad-y), rgba(95,168,185,var(--grad-a1)) 0%, transparent 65%)',
                    'radial-gradient(ellipse 70% 50% at 12% calc(var(--grad-y) + 40%), rgba(58,123,213,var(--grad-a2)) 0%, transparent 60%)'
                ].join(', ');
                document.body.style.setProperty('--grad-y', '-20%');
                document.body.style.setProperty('--grad-a1', '0.16');
                document.body.style.setProperty('--grad-a2', '0.12');

                var gradY = -20, gradVel = 0, prevGradST = 0, gradRaf = null;

                function gradNatural() {
                    var maxScroll = container.scrollHeight - container.clientHeight;
                    return maxScroll > 0 ? -20 + (container.scrollTop / maxScroll) * 160 : -20;
                }

                function gradTick() {
                    var nat = gradNatural();
                    var tgt = nat + gradVel;
                    gradY += (tgt - gradY) * 0.1;
                    gradVel *= 0.82;
                    document.body.style.setProperty('--grad-y', gradY.toFixed(2) + '%');

                    var maxScroll = container.scrollHeight - container.clientHeight;
                    var prog = maxScroll > 0 ? Math.min(container.scrollTop / maxScroll, 1) : 0;
                    var dark = document.documentElement.getAttribute('data-color-scheme') === 'dark';
                    var a1 = dark ? (0.22 + prog * 0.30) : (0.16 + prog * 0.24);
                    var a2 = dark ? (0.18 + prog * 0.26) : (0.12 + prog * 0.20);
                    document.body.style.setProperty('--grad-a1', a1.toFixed(3));
                    document.body.style.setProperty('--grad-a2', a2.toFixed(3));

                    if (Math.abs(tgt - gradY) > 0.1 || Math.abs(gradVel) > 0.2) {
                        gradRaf = requestAnimationFrame(gradTick);
                    } else {
                        gradY = nat;
                        document.body.style.setProperty('--grad-y', nat.toFixed(2) + '%');
                        gradRaf = null;
                    }
                }

                container.addEventListener('scroll', function() {
                    gradVel += (container.scrollTop - prevGradST) * 0.15;
                    prevGradST = container.scrollTop;
                    if (!gradRaf) gradRaf = requestAnimationFrame(gradTick);
                }, { passive: true });
            })();
            """)
    }
}
