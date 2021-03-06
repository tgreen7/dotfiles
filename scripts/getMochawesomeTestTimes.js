var componentNodes = Array.from(
  document.querySelectorAll("[class^='test--component---']")
);

var timeInfos = [];

componentNodes.forEach(node => {
  const title = node.querySelector("[class^='test--title---']").innerText;
  const timeOriginal = node.querySelector("[class^='test--duration---']")
    .innerText;
  const timeText = timeOriginal.replace(/\./g, ":");
  const [ms, s, min] = timeText
    .split(":")
    .reverse()
    .map(num => parseInt(num, 10));
  if (!ms && !s && !min) return;
  const date = new Date(0, 0, 0, 0, min || 0, s || 0, ms || 0);
  timeInfos.push({
    title,
    timeOriginal,
    dateTime: date.getTime()
  });
});

var sortedTimeInfos = timeInfos
  .sort((a, b) => b.dateTime - a.dateTime)
  .map(t => ({
    title: t.title,
    duration: t.timeOriginal
  }));
var longestTest = sortedTimeInfos[0];
var alertMessage = "Tests with time information copied to clipboard.";
if (longestTest) {
  alertMessage += `\n\nThe longest running test was \n\n"${longestTest.title}"\n\n which ran for ${longestTest.duration}`;
}
alert(alertMessage);
copy(sortedTimeInfos);
