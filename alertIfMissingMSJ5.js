const fs = require("fs");
const path = require("path");
const { exec } = require("child_process");

const folderPath = path.join(
  process.env.HOME,
  "Sites/lims/microservice/microservices/node_modules/@teselagen/j5"
);

const interval = setInterval(checkFolder, 2000);
let i = 0;

process.title = "alertIfMissingMSJ5 watcher";

function checkFolder() {
  fs.access(folderPath, fs.constants.F_OK, (err) => {
    if (err) {
      const time = new Date().toLocaleString();
      exec(
        `osascript -e 'display notification "MISSING MS ${time}" with title "What did you just do?"'`
      );
      console.log("MISSING MS", time);
      clearInterval(interval);
    } else {
      if (i % 15 === 0) {
        console.log("MS is here!");
      }
    }
    i++;
  });
}
