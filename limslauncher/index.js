const shelljs = require("shelljs");
const program = require("commander");

const cdToFolder = "cd ~/Sites/lims";
const debug = "TG_INSPECT_BACKEND=1";
const restart = "TG_RESTART=1";
const refreshSchema = "refreshSchema=1";

const commonDeps =
  "yarn && yarn --cwd ./e2e-tests && yarn --cwd ./server && yarn --cwd ./app-proxy";

let moduleName = "lims";
let server = "TG_CLIENTS=b@host yarn start-app-proxy";
let client = "TG_CLIENTS=1 yarn start-build-client";
let deps = `${commonDeps} && yarn --cwd ./client && yarn --cwd ./tg-iso-lims`;

if (process.env.HDE) {
  moduleName = "hde";
  server = "TG_CLIENTS=d@host yarn start-app-proxy";
  client = "TG_CLIENTS=1 yarn start-design-client";
  deps = `${commonDeps} && yarn --cwd ./client-design  && yarn --cwd ./tg-iso-design`;
}

program.name(moduleName);

program
  .command("server")
  .option("-d, --debug", "inspect server")
  .option("-r, --reset", "reset database")
  .option("-k, --kill", "reset database and containers")
  .description(`launch ${moduleName} server`)
  .action(cmdObj => {
    let cmdToRun = `${restart} ${server}`;

    if (cmdObj.reset) {
      cmdToRun = `${restart} ${refreshSchema} ${server}`;
    } else if (cmdObj.kill) {
      cmdToRun = server;
    }

    if (cmdObj.debug) {
      cmdToRun = `${debug} ${cmdToRun}`;
    }

    cmdToRun = `${cdToFolder} && ${cmdToRun}`;
    shelljs.exec(cmdToRun);
  });

program
  .command("client")
  .description(`launch ${moduleName} client`)
  .action(() => {
    const cmdToRun = `${cdToFolder} && ${client}`;
    shelljs.exec(cmdToRun);
  });

program
  .command("deps")
  .description(`install ${moduleName} dependencies`)
  .action(() => {
    const cmdToRun = `${cdToFolder} && ${deps}`;
    shelljs.exec(cmdToRun);
  });

program.parse(process.argv);

// Check the program.args obj
const NO_COMMAND_SPECIFIED = !process.argv.slice(2).length;
// Handle it however you like
if (NO_COMMAND_SPECIFIED) {
  // e.g. display usage
  program.help();
}
