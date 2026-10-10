// Theme toggle shared with the portfolio (same 'color-scheme' key), and the
// docs sidebar toggle on small screens.
(function () {
  var root = document.documentElement;
  function current() {
    var set = root.getAttribute('data-color-scheme');
    if (set) return set;
    return window.matchMedia && matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }
  document.addEventListener('DOMContentLoaded', function () {
    var btn = document.querySelector('.theme-btn:not(.menu-btn)');
    if (btn) {
      var paint = function () { btn.textContent = current() === 'dark' ? '☽' : '☀'; };
      paint();
      btn.addEventListener('click', function () {
        var next = current() === 'dark' ? 'light' : 'dark';
        root.setAttribute('data-color-scheme', next);
        try { localStorage.setItem('color-scheme', next); } catch (e) {}
        paint();
      });
    }
    var menu = document.querySelector('.menu-btn');
    if (menu) {
      menu.addEventListener('click', function () {
        var open = document.body.classList.toggle('nav-open');
        menu.setAttribute('aria-expanded', open ? 'true' : 'false');
      });
      document.querySelectorAll('.sidebar a').forEach(function (a) {
        a.addEventListener('click', function () { document.body.classList.remove('nav-open'); });
      });
    }
  });
})();
