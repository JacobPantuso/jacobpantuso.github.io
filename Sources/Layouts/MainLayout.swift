import Foundation
import Raptor

private let themeScript = """
(function() {
    var style = document.createElement('style');
    style.textContent = [
        ':root, [data-color-scheme="light"] {',
        '  --hero-glow-teal: rgba(95, 168, 185, 0.08);',
        '  --hero-glow-blue: rgba(58, 123, 213, 0.05);',
        '  --card-shadow: 0 4px 16px rgba(15, 23, 42, 0.10);',
        '  --card-shadow-hover: 0 8px 28px rgba(15, 23, 42, 0.16);',
        '  --hero-shadow: 0 8px 32px rgba(15, 23, 42, 0.10);',
        '}',
        '[data-color-scheme="dark"] {',
        '  --hero-glow-teal: rgba(95, 168, 185, 0.18);',
        '  --hero-glow-blue: rgba(58, 123, 213, 0.08);',
        '  --card-shadow: 0 18px 40px rgba(15, 23, 42, 0.06);',
        '  --card-shadow-hover: 0 24px 52px rgba(15, 23, 42, 0.16);',
        '  --hero-shadow: 0 24px 60px rgba(15, 23, 42, 0.10);',
        '}',
        '[data-card] {',
        '  transition: transform 0.2s ease, box-shadow 0.2s ease;',
        '}',
        '[data-card]:hover {',
        '  transform: translateY(-3px);',
        '  box-shadow: var(--card-shadow-hover) !important;',
        '}',
        '#theme-toggle {',
        '  position: fixed;',
        '  bottom: 20px;',
        '  right: 20px;',
        '  z-index: 1001;',
        '  width: 44px;',
        '  height: 44px;',
        '  border-radius: 50%;',
        '  cursor: pointer;',
        '  font-size: 16px;',
        '  display: flex;',
        '  align-items: center;',
        '  justify-content: center;',
        '  color: var(--fg);',
        '  background: rgba(255,255,255,0.15);',
        '  backdrop-filter: blur(24px) saturate(1.8);',
        '  -webkit-backdrop-filter: blur(24px) saturate(1.8);',
        '  border: 1px solid rgba(255,255,255,0.28);',
        '  box-shadow: 0 4px 24px rgba(0,0,0,0.10), inset 0 1.5px 0 rgba(255,255,255,0.45), inset 0 -1px 0 rgba(0,0,0,0.06);',
        '  transition: transform 0.18s ease, box-shadow 0.18s ease, background 0.18s ease;',
        '}',
        '[data-color-scheme="dark"] #theme-toggle {',
        '  background: rgba(255,255,255,0.08);',
        '  border: 1px solid rgba(255,255,255,0.14);',
        '  box-shadow: 0 4px 24px rgba(0,0,0,0.32), inset 0 1.5px 0 rgba(255,255,255,0.18), inset 0 -1px 0 rgba(0,0,0,0.18);',
        '}',
        '#theme-toggle:hover {',
        '  transform: scale(1.08);',
        '  background: rgba(255,255,255,0.26);',
        '  box-shadow: 0 8px 32px rgba(0,0,0,0.15), inset 0 1.5px 0 rgba(255,255,255,0.55), inset 0 -1px 0 rgba(0,0,0,0.06);',
        '}',
        '[data-color-scheme="dark"] #theme-toggle:hover {',
        '  background: rgba(255,255,255,0.14);',
        '}',
        '@keyframes scroll-bounce {',
        '  0%, 100% { transform: translateY(0); }',
        '  50% { transform: translateY(7px); }',
        '}',
        '.scroll-hint { animation: scroll-bounce 1.5s ease-in-out infinite; }',
        '#hero-links a { transition: color 0.18s ease, transform 0.18s ease; display: inline-flex; }',
        '#hero-links a:hover { color: white !important; transform: scale(1.15); }',
        /* --- Mobile (≤ 767px) --- */
        '@media (max-width: 767px) {',
        '  #scroll-container { padding: 16px !important; scroll-snap-type: y proximity !important; scroll-padding-top: 16px !important; -webkit-overflow-scrolling: touch; }',
        '  #hero-section { width: 100% !important; padding: 28px 20px !important; height: auto !important; min-height: calc(100svh - 32px); }',
        '  #hero-name-row { flex-direction: column !important; gap: 4px !important; }',
        '  #hero-name-row p, #hero-name-row div, #hero-name-row span { font-size: clamp(2rem, 9vw, 2.5rem) !important; line-height: 1.05 !important; }',
        '  #hero-role-badge { white-space: normal !important; text-align: center !important; justify-content: center !important; }',
        '  #projects-section { height: auto !important; min-height: 100svh; padding: 24px 0 !important; scroll-snap-stop: normal !important; }',
        '  #about-section { height: auto !important; min-height: 100svh; align-items: stretch !important; scroll-snap-align: none !important; scroll-snap-stop: normal !important; }',
        '  #who-am-i { flex-direction: column !important; align-items: center !important; gap: 24px !important; padding: 20px !important; width: 100% !important; box-sizing: border-box; }',
        '  #who-am-i-text { width: 100% !important; max-width: 100% !important; }',
        '  #who-am-i-text p, #who-am-i-text div { max-width: 100% !important; }',
        '  #exp-cards { flex-direction: column !important; align-items: stretch !important; }',
        '  [data-emp-card] { min-width: 0 !important; flex: none !important; width: 100% !important; box-sizing: border-box; }',
        '  #mini-nav { max-width: calc(100vw - 32px) !important; }',
        '  .scroll-hint { display: none; }',
        '}',
        /* --- Tablet (768px – 1100px) --- */
        '@media (min-width: 768px) and (max-width: 1100px) {',
        '  #scroll-container { padding: 40px !important; scroll-padding-top: 40px !important; scroll-snap-type: y proximity !important; }',
        '  #hero-section { width: 90% !important; }',
        '  #projects-section { height: auto !important; min-height: 100svh; }',
        '  #about-section { height: auto !important; min-height: 100svh; }',
        '  #who-am-i { gap: 28px !important; }',
        '  [data-emp-card] { min-width: 260px !important; }',
        '}'
    ].join('\\n');
    document.currentScript.parentNode.insertBefore(style, document.currentScript);

    document.addEventListener('DOMContentLoaded', function() {
        var btn = document.createElement('button');
        btn.id = 'theme-toggle';
        btn.setAttribute('aria-label', 'Toggle color scheme');
        var isDark = document.documentElement.getAttribute('data-color-scheme') === 'dark';
        btn.textContent = isDark ? '☽' : '☀';
        btn.addEventListener('click', function() {
            var cur = document.documentElement.getAttribute('data-color-scheme');
            var next = cur === 'dark' ? 'light' : 'dark';
            localStorage.setItem('color-scheme', next);
            document.documentElement.setAttribute('data-color-scheme', next);
            btn.textContent = next === 'dark' ? '☽' : '☀';
        });
        document.body.appendChild(btn);
    });
})();
"""

private let modalScript = """
(function() {
    var s = document.createElement('style');
    s.textContent = [
        '#emp-modal-overlay {',
        '  position: fixed; inset: 0; z-index: 2000;',
        '  background: rgba(0,0,0,0.5);',
        '  backdrop-filter: blur(6px);',
        '  -webkit-backdrop-filter: blur(6px);',
        '  display: flex; align-items: center; justify-content: center;',
        '  opacity: 0; pointer-events: none;',
        '  transition: opacity 0.22s ease;',
        '  padding: 24px; box-sizing: border-box;',
        '}',
        '#emp-modal-overlay.open { opacity: 1; pointer-events: auto; }',
        '#emp-modal {',
        '  background: var(--bg-secondary);',
        '  border: 1px solid var(--divider);',
        '  border-radius: 24px;',
        '  box-shadow: 0 32px 80px rgba(0,0,0,0.28);',
        '  overflow: hidden;',
        '  max-width: 500px; width: 100%;',
        '  transform: scale(0.92) translateY(12px);',
        '  transition: transform 0.24s cubic-bezier(0.34,1.56,0.64,1);',
        '}',
        '#emp-modal-overlay.open #emp-modal { transform: scale(1) translateY(0); }',
        '#emp-modal-header {',
        '  display: flex; align-items: center; justify-content: center;',
        '  padding: 36px 24px 32px; position: relative;',
        '}',
        '#emp-modal-logo-tile {',
        '  width: 88px; height: 88px; border-radius: 22px;',
        '  background: white; padding: 14px;',
        '  display: flex; align-items: center; justify-content: center;',
        '  box-shadow: 0 4px 20px rgba(0,0,0,0.18);',
        '}',
        '#emp-modal-logo-tile img { width: 100%; height: 100%; object-fit: contain; }',
        '#emp-modal-close {',
        '  position: absolute; top: 14px; right: 14px;',
        '  width: 32px; height: 32px; border-radius: 50%;',
        '  background: rgba(255,255,255,0.22); border: none;',
        '  color: white; font-size: 16px; cursor: pointer;',
        '  display: flex; align-items: center; justify-content: center;',
        '  transition: background 0.15s ease;',
        '}',
        '#emp-modal-close:hover { background: rgba(255,255,255,0.38); }',
        '#emp-modal-body {',
        '  padding: 24px 28px 28px;',
        '  display: flex; flex-direction: column; gap: 16px;',
        '}',
        '#emp-modal-role { font-size: 1.15rem; font-weight: 700; }',
        '#emp-modal-meta { font-size: 0.9rem; color: var(--fg-secondary); margin-top: -8px; }',
        '#emp-modal-summary { font-size: 0.92rem; color: var(--fg-secondary); line-height: 1.65; }',
        '#emp-modal-summary ul { margin: 0; padding-left: 1.25rem; }',
        '#emp-modal-summary li + li { margin-top: 0.35rem; }',
        '#emp-modal-chips { display: flex; flex-wrap: wrap; gap: 8px; }'
    ].join('\\n');
    document.head.appendChild(s);

    document.addEventListener('DOMContentLoaded', function() {
        var overlay = document.createElement('div');
        overlay.id = 'emp-modal-overlay';
        overlay.innerHTML = '<div id="emp-modal">'
            + '<div id="emp-modal-header">'
            +   '<div id="emp-modal-logo-tile"><img id="emp-modal-logo-img" src="" alt="" /></div>'
            +   '<button id="emp-modal-close">&#x2715;</button>'
            + '</div>'
            + '<div id="emp-modal-body">'
            +   '<div id="emp-modal-role"></div>'
            +   '<div id="emp-modal-meta"></div>'
            +   '<div id="emp-modal-summary"></div>'
            +   '<div id="emp-modal-chips"></div>'
            + '</div></div>';
        document.body.appendChild(overlay);

        function openModal(card) {
            var raw = (card.getAttribute('data-employment') || '').split('\\t');
            var role = raw[0] || '', company = raw[1] || '', period = raw[2] || '';
            var summary = raw[3] || '', gradient = raw[4] || '', logo = raw[5] || '';
            var skills = (raw[6] || '').split('|').filter(Boolean);
            document.getElementById('emp-modal-header').style.background = gradient;
            document.getElementById('emp-modal-logo-img').src = logo;
            document.getElementById('emp-modal-logo-img').alt = company;
            document.getElementById('emp-modal-role').textContent = role;
            document.getElementById('emp-modal-meta').textContent = company + ' · ' + period;
            var summaryEl = document.getElementById('emp-modal-summary');
            if (/<li\\b/i.test(summary)) {
                summaryEl.innerHTML = summary;
            } else if (/<br\\s*\\/?>(?:\\s*)/i.test(summary)) {
                var items = summary.split(/<br\\s*\\/?>(?:\\s*)/i).filter(Boolean);
                summaryEl.innerHTML = '<ul>' + items.map(function(item) { return '<li>' + item + '</li>'; }).join('') + '</ul>';
            } else {
                summaryEl.innerHTML = '<ul><li>' + summary + '</li></ul>';
            }
            var chips = document.getElementById('emp-modal-chips');
            chips.innerHTML = '';
            skills.forEach(function(skill) {
                var el = document.createElement('span');
                el.textContent = skill;
                el.style.cssText = 'font-size:0.75rem;font-weight:500;color:var(--accent);padding:4px 12px;background:var(--bg-tertiary);border-radius:999px;';
                chips.appendChild(el);
            });
            overlay.classList.add('open');
            document.body.style.overflow = 'hidden';
        }

        function closeModal() {
            overlay.classList.remove('open');
            document.body.style.overflow = '';
        }

        document.addEventListener('click', function(e) {
            var card = e.target.closest('[data-employment]');
            if (card) { openModal(card); return; }
            if (e.target === overlay) closeModal();
        });
        document.getElementById('emp-modal-close').addEventListener('click', closeModal);
        document.addEventListener('keydown', function(e) { if (e.key === 'Escape') closeModal(); });
    });
})();
"""

private let faviconScript = """
(function() {
    var head = document.head || document.getElementsByTagName('head')[0];
    if (!head) return;

    if (!head.querySelector('link[rel="icon"]')) {
        var icon = document.createElement('link');
        icon.rel = 'icon';
        icon.type = 'image/x-icon';
        icon.href = '/favicon.ico';
        head.appendChild(icon);
    }

    if (!head.querySelector('link[rel="shortcut icon"]')) {
        var shortcut = document.createElement('link');
        shortcut.rel = 'shortcut icon';
        shortcut.type = 'image/x-icon';
        shortcut.href = '/favicon.ico';
        head.appendChild(shortcut);
    }
})();
"""

struct MainLayout: Layout {
    var body: some Document {
        Main {
            content
        }
        .margin(48)
        .script(code: faviconScript)
        .script(code: themeScript)
        .script(code: modalScript)
    }
}
