const fs = require("fs");

const [filename, outputFilename] = process.argv.slice(2);

const fileContents = fs.readFileSync(filename, {
  encoding: "utf8"
});

const cleaned = fileContents
  .replace(/"sequence":".*?"/g, `"sequence":"redacted"`)
  .replace(
    /"final_assembled_vector":".*?"/g,
    `"final_assembled_vector":"redacted"`
  ).replace(/"warnings":\[.*?\],?/g, "")

fs.writeFileSync(outputFilename || "output.json", cleaned);
