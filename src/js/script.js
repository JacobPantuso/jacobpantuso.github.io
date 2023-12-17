document.getElementById("nav-toggle").addEventListener('click', () => {
    const toggle = document.getElementById("nav-toggle");
    const menu = document.querySelector(".mobile-menu");
    if (toggle.className == "fas fa-bars") {
        toggle.className = "fas fa-times";
        menu.style.pointerEvents = "all";
        menu.classList.toggle("show");
    } else {
        toggle.className = "fas fa-bars";
        menu.style.pointerEvents = "none";
        menu.classList.toggle("show");
    }
});