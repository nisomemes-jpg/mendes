(function () {
  const menuButton = document.querySelector(".menu-toggle");
  const menu = document.querySelector(".site-menu");
  const links = window.SITE_LINKS || {};

  if (menuButton && menu) {
    menuButton.addEventListener("click", function () {
      const isOpen = menuButton.getAttribute("aria-expanded") === "true";
      menuButton.setAttribute("aria-expanded", String(!isOpen));
      menu.classList.toggle("is-open", !isOpen);
    });

    menu.addEventListener("click", function (event) {
      if (event.target.tagName === "A") {
        menuButton.setAttribute("aria-expanded", "false");
        menu.classList.remove("is-open");
      }
    });
  }

  document.querySelectorAll("[data-link]").forEach(function (element) {
    const key = element.getAttribute("data-link");
    const url = links[key];

    if (url && url.trim() !== "") {
      element.href = url.trim();
      element.target = "_blank";
      element.rel = "noopener noreferrer";
      return;
    }

    element.setAttribute("aria-disabled", "true");
    element.addEventListener("click", function (event) {
      event.preventDefault();
    });
  });
})();
