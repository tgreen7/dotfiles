const glob = require("glob");
const fs = require("fs");
const semver = require("semver");
const { exec } = require("child_process");

const readFilePromise = (path, options) => {
  return new Promise((resolve, reject) => {
    fs.readFile(path, { encoding: "utf8", ...options }, (err, contents) => {
      if (err) reject(err);
      resolve(contents);
    });
  });
};
const writeFilePromise = (path, contents, options) => {
  return new Promise((resolve, reject) => {
    fs.writeFile(path, contents, { encoding: "utf8", ...options }, (err) => {
      if (err) reject(err);
      resolve();
    });
  });
};

// options is optional
glob(
  "/Users/taoh/Sites/lims/**/package.json",
  {
    ignore: "**/node_modules/**",
  },
  async function (err, files) {
    if (err) throw err;

    try {
      await Promise.all(
        files.map(async (file) => {
          const contents = await readFilePromise(file);
          if (contents.includes("<<<<<<<")) {
            await fixPackageConflict(file, contents);
          }
        })
      );
    } catch (error) {
      console.error(`error:`, error);
    }
  }
);

async function fixPackageConflict(file, contents) {
  const mergedPackageFile = contents.replace(
    /<<<<<<< HEAD.*[\s\S]*>>>>>>> origin\/.*/g,
    (match) => {
      if (match) {
        const split = match.split("\n");
        const left = [];
        const right = [];
        let onLeft = true;
        split.forEach((line) => {
          if (line.includes("<<<<<<<") || line.includes(">>>>>>>")) {
            return;
          }
          if (line.includes("=======")) {
            onLeft = false;
            return;
          }
          if (onLeft) {
            left.push(line);
          } else {
            right.push(line);
          }
        });
        let cleaned = "";
        const keyedLeft = keyByPackage(left);
        const keyedRight = keyByPackage(right);
        Object.keys(keyedLeft).forEach((package, i) => {
          if (!keyedRight[package])
            throw new Error(`Package ${package} was not in origin.`);
          const oldVersion = keyedLeft[package].version;
          const newVersion = keyedRight[package].version;
          const gt = semver.gt(
            semver.coerce(oldVersion),
            semver.coerce(newVersion)
          );
          cleaned += `    "${package}": "${gt ? oldVersion : newVersion}"`;
          if (keyedLeft[package].line.includes(",")) {
            cleaned += ",";
          }
          if (i !== left.length - 1) cleaned += "\n";
        });
        return cleaned;
      }
    }
  );
  console.log(`file:`, file);
  await writeFilePromise(file, mergedPackageFile);
  const yarnCmd = `yarn --cwd ${file.replace("/package.json", "")}`;
  console.log(`yarnCmd:`, yarnCmd);
  await new Promise((resolve, reject) => {
    exec(yarnCmd, (error, stdout, stderr) => {
      if (error) {
        reject(`error: ${error.message}`);
      }
      if (stderr) {
        console.log(`stderr: ${stderr}`);
      }
      console.log(`stdout: ${stdout}`);
      resolve();
    });
  });
}

function keyByPackage(lines) {
  const keyed = {};
  lines.forEach((line) => {
    const match = line.match(/"(.*)": "(.*)"/);
    if (match) {
      const packageName = match[1];
      const version = match[2];
      keyed[packageName] = { version, line };
    }
  });
  return keyed;
}
