#!/bin/bash

### With Slack 4.0, they are packing away ssb-interop.bundle.js in app.asar ###
### This bash script for Mac will unpack the app.asar, append your code to the file, repack it, and remove the unpacked directory ###
### You must have Node installed first in order to run npx with asar ###
### I got this idea from here – https://dev.to/mykeels/why-is-slack-changing-its-internals-4p4c ###

JS="
// First make sure the wrapper app is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Fetch our CSS in parallel ahead of time
  const cssPath = 'https://raw.githubusercontent.com/tgreen7/dotfiles/master/dark-slack.css';
  let cssPromise = fetch(cssPath).then((response) => response.text());

  // Insert a style tag into the wrapper view
  cssPromise.then((css) => {
    let s = document.createElement('style');
    s.type = 'text/css';
    s.innerHTML = css;
    document.head.appendChild(s);
  });
});"

# JS="
# // First make sure the wrapper app is loaded
# document.addEventListener('DOMContentLoaded', function() {
#   const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important\;}'
#   const homedir = require('os').homedir();
#   const pathToCss = require('path').join(
#     homedir,
#     'Sites/dotfiles/dark-slack.css'
#   );

#   require('fs').readFile(pathToCss, 'utf-8', (err, darkCss) => {
#     if (err) console.error('cant load custom css.');
#     $('<style></style>')
#       .appendTo('head')
#       .html(darkCss + tt__customCss);
#   });
# });"

SLACK_RESOURCES_DIR="/Applications/Slack.app/Contents/Resources"
SLACK_FILE_PATH="${SLACK_RESOURCES_DIR}/app.asar.unpacked/dist/ssb-interop.bundle.js"

echo "Adding Dark Theme Code to Slack... "
echo "This script requires sudo privileges." && echo "You'll need to provide your password."

sudo npx asar extract ${SLACK_RESOURCES_DIR}/app.asar ${SLACK_RESOURCES_DIR}/app.asar.unpacked
sudo tee -a "${SLACK_FILE_PATH}" >/dev/null <<<"$JS"
sudo npx asar pack ${SLACK_RESOURCES_DIR}/app.asar.unpacked ${SLACK_RESOURCES_DIR}/app.asar
