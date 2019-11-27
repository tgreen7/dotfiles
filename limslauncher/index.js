const inquirer = require("inquirer");
const shelljs = require("shelljs");

// alias lims='osascript ~/Sites/dotfiles/scripts/lims.applescript'
// alias limss='cd ~/Sites/lims && TG_CLIENTS=b@host yarn start-app-proxy'
// alias limsd='cd ~/Sites/lims && TG_INSPECT_BACKEND=1 TG_CLIENTS=b@host yarn start-app-proxy'
// alias limsr='cd ~/Sites/lims && TG_RESTART=1 TG_CLIENTS=b@host yarn start-app-proxy'
// alias limsdr='cd ~/Sites/lims && TG_INSPECT_BACKEND=1 TG_RESTART=1 TG_CLIENTS=b@host yarn start-app-proxy'
// alias limsrd='cd ~/Sites/lims && TG_INSPECT_BACKEND=1 TG_RESTART=1 TG_CLIENTS=b@host yarn start-app-proxy'
// alias limsc='cd ~/Sites/lims && TG_CLIENTS=1 yarn start-build-client'
// alias limsdeps='cd ~/Sites/lims && yarn && yarn --cwd ./e2e-tests && yarn --cwd ./server && yarn --cwd ./client  && yarn --cwd ./tg-iso-lims && yarn --cwd ./app-proxy'

const cmdMap = {
  "Launch lims server and client":
    "osascript ~/Sites/dotfiles/scripts/lims.applescript",
  "Launch lims server":
    "cd ~/Sites/lims && TG_RESTART=1 TG_CLIENTS=b@host yarn start-app-proxy",
  "Launch lims server w/ debugging":
    "cd ~/Sites/lims && TG_RESTART=1 TG_INSPECT_BACKEND=1 TG_CLIENTS=b@host yarn start-app-proxy",
  "Launch lims server and drop and sync":
    "cd ~/Sites/lims && TG_CLIENTS=b@host yarn start-app-proxy",
  "Launch lims server w/ debugging and drop and sync":
    "cd ~/Sites/lims && TG_INSPECT_BACKEND=1  TG_CLIENTS=b@host yarn start-app-proxy",
  "Launch lims client":
    "cd ~/Sites/lims && TG_CLIENTS=1 yarn start-build-client",
  "Install dependencies":
    "cd ~/Sites/lims && yarn && yarn --cwd ./e2e-tests && yarn --cwd ./server && yarn --cwd ./client  && yarn --cwd ./tg-iso-lims && yarn --cwd ./app-proxy"
};
inquirer
  .prompt([
    {
      type: "list",
      name: "script",
      message:
        "What command do you want to run? (Arrow keys to select, enter to confirm)",
      choices: [
        "Launch lims server and client",
        "Launch lims server",
        "Launch lims server w/ debugging",
        "Launch lims server and drop and sync",
        "Launch lims server w/ debugging and drop and sync",
        "Launch lims client",
        "Install dependencies"
      ]
    }
  ])
  .then(answers => {
    const { script } = answers;
    const cmd = cmdMap[script];
    if (cmd) {
      shelljs.exec(cmd);
    }
  });
