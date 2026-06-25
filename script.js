(function () {
  const menuButton = document.querySelector(".menu-toggle");
  const nav = document.querySelector(".main-nav");
  const data = window.comunicadosParoquia || { semanais: [], fixos: [] };

  function setMenu(open) {
    menuButton.setAttribute("aria-expanded", String(open));
    nav.classList.toggle("is-open", open);
    document.body.classList.toggle("menu-open", open);
  }

  if (menuButton && nav) {
    menuButton.addEventListener("click", function () {
      setMenu(menuButton.getAttribute("aria-expanded") !== "true");
    });

    nav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        setMenu(false);
      });
    });

    window.addEventListener("resize", function () {
      if (window.innerWidth > 820) {
        setMenu(false);
      }
    });
  }

  function createLinks(links) {
    if (!links || links.length === 0) {
      return "";
    }

    return `
      <div class="notice-actions">
        ${links
          .map(
            function (link) {
              return `<a class="button small" href="${link.url}" target="_blank" rel="noopener">${link.texto}</a>`;
            }
          )
          .join("")}
      </div>
    `;
  }

  function createCalendar(items) {
    if (!items || items.length === 0) {
      return "";
    }

    return `
      <div class="calendar-list" aria-label="Calendário">
        ${items
          .map(function (item) {
            const parts = item.split(" ");
            return `<span><strong>${parts[0]}</strong>${parts.slice(1).join(" ")}</span>`;
          })
          .join("")}
      </div>
    `;
  }

  function createDetails(details) {
    if (!details || details.length === 0) {
      return "";
    }

    return `
      <ul class="notice-details">
        ${details.map(function (detail) {
          return `<li>${detail}</li>`;
        }).join("")}
      </ul>
    `;
  }

  function noticeCard(notice) {
    const image = notice.imagem
      ? `<img class="notice-image" src="${notice.imagem}" alt="${notice.titulo}">`
      : `<div class="notice-icon" aria-hidden="true">+</div>`;

    return `
      <article class="notice-card">
        ${image}
        <div class="notice-body">
          <p class="tag">${notice.etiqueta}</p>
          <h3>${notice.titulo}</h3>
          <p>${notice.texto}</p>
          ${createDetails(notice.detalhes)}
          ${createCalendar(notice.calendario)}
          ${createLinks(notice.links)}
        </div>
      </article>
    `;
  }

  function renderNotices(id, notices) {
    const container = document.getElementById(id);

    if (!container) {
      return;
    }

    container.innerHTML = notices.map(noticeCard).join("");
  }

  renderNotices("avisos-semanais", data.semanais);
  renderNotices("avisos-fixos", data.fixos);
})();
