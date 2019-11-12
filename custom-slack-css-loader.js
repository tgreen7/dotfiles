document.addEventListener("DOMContentLoaded", function() {
  const tt__customCss = `.menu ul li a:not(.inline_menu_link) {color: #fff !important;}`;
  const homedir = require("os").homedir();
  const pathToCss = require("path").join(
    homedir,
    "Sites/dotfiles/dark-slack.css"
  );

  require("fs").readFile(pathToCss, "utf-8", (err, darkCss) => {
    if (err) console.error("cant load custom css.");
    $("<style></style>")
      .appendTo("head")
      .html(darkCss + tt__customCss);
  });
});