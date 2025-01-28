const simpleGit = require("simple-git");
const git = simpleGit();

module.exports = {
  cloneRepo: async (url, path) => await git.clone(url, path),
  commitChanges: async (message) => await git.commit(message),
  pushChanges: async () => await git.push(),
  pullChanges: async () => await git.pull(),
};
