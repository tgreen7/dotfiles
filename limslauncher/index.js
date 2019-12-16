const inquirer = require("inquirer");
const shelljs = require("shelljs");
const program = require("commander");

// program
//   .option("-d, --debug", "inspect server")
//   .option("-r, --reset", "reset database");

const cdToFolder = "cd ~/Sites/lims &&";
const debug = "TG_INSPECT_BACKEND=1";
const restart = "TG_RESTART=1";
const server = "TG_CLIENTS=b@host yarn start-app-proxy";
const client = "TG_CLIENTS=1 yarn start-build-client";
const deps =
  "yarn && yarn --cwd ./e2e-tests && yarn --cwd ./server && yarn --cwd ./client  && yarn --cwd ./tg-iso-lims && yarn --cwd ./app-proxy";

program
  .command("server")
  .option("-d, --debug", "inspect server")
  .option("-r, --reset", "reset database")
  .description("launch lims server")
  .action(cmdObj => {
    let cmdToRun = server;

    if (!cmdObj.reset) {
      cmdToRun = `${restart} ${cmdToRun}`;
    } else {
      console.log("Resetting database");
    }
    if (cmdObj.debug) {
      cmdToRun = `${debug} ${cmdToRun}`;
    }

    cmdToRun = `${cdToFolder} ${cmdToRun}`;
    shelljs.exec(cmdToRun);
  });

program
  .command("client")
  .description("launch lims client")
  .action(() => {
    const cmdToRun = `${cdToFolder} ${client}`;
    shelljs.exec(cmdToRun);
  });

program
  .command("deps")
  .description("install lims dependencies")
  .action(() => {
    const cmdToRun = `${cdToFolder} ${deps}`;
    shelljs.exec(cmdToRun);
  });

program.parse(process.argv);

// Check the program.args obj
const NO_COMMAND_SPECIFIED = program.args.length === 0;

// Handle it however you like
if (NO_COMMAND_SPECIFIED) {
  // e.g. display usage
  program.help();
}
