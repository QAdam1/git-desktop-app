# Create directories
New-Item -ItemType Directory -Path "./git-app/public" -Force | Out-Null
New-Item -ItemType Directory -Path "./git-app/src/components" -Force | Out-Null
New-Item -ItemType Directory -Path "./git-app/src/main" -Force | Out-Null
New-Item -ItemType Directory -Path "./git-app/src/utils" -Force | Out-Null

# File contents
$packageJson = @'
{
  "name": "git-desktop-app",
  "version": "1.0.0",
  "main": "src/main/main.js",
  "scripts": {
    "start": "concurrently \"npm:electron\" \"npm:react\"",
    "react": "react-scripts start",
    "electron": "wait-on http://localhost:3000 && electron .",
    "build": "electron-builder"
  },
  "dependencies": {
    "concurrently": "^7.6.0",
    "electron": "^24.4.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "simple-git": "^3.19.0",
    "dotenv": "^16.3.1"
  },
  "devDependencies": {
    "electron-builder": "^24.6.0",
    "wait-on": "^6.0.1"
  }
}
'@

$mainJs = @'
const { app, BrowserWindow } = require("electron");
const path = require("path");

let mainWindow;

app.on("ready", () => {
  mainWindow = new BrowserWindow({
    width: 1200,
    height: 800,
    webPreferences: {
      preload: path.join(__dirname, "preload.js"),
      contextIsolation: true,
      nodeIntegration: false
    }
  });

  mainWindow.loadURL("http://localhost:3000");
});

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();
  }
});
'@

$preloadJs = @'
const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("api", {
  gitCommand: (channel, args) => ipcRenderer.invoke(channel, args)
});
'@

$gitHelperJs = @'
const simpleGit = require("simple-git");
const git = simpleGit();

module.exports = {
  cloneRepo: async (url, path) => await git.clone(url, path),
  commitChanges: async (message) => await git.commit(message),
  pushChanges: async () => await git.push(),
  pullChanges: async () => await git.pull(),
};
'@

$appJsx = @'
import React from "react";
import RepoManager from "./RepoManager";

function App() {
  return (
    <div className="App">
      <h1>Git Desktop App</h1>
      <RepoManager />
    </div>
  );
}

export default App;
'@

$repoManagerJsx = @'
import React, { useState } from "react";

function RepoManager() {
  const [repoUrl, setRepoUrl] = useState("");
  const [localPath, setLocalPath] = useState("");

  const cloneRepository = async () => {
    const result = await window.api.gitCommand("clone", { url: repoUrl, path: localPath });
    console.log(result ? "Cloning successful!" : "Failed to clone.");
  };

  return (
    <div>
      <h2>Clone a Repository</h2>
      <input
        type="text"
        placeholder="Repository URL"
        value={repoUrl}
        onChange={(e) => setRepoUrl(e.target.value)}
      />
      <input
        type="text"
        placeholder="Local Path"
        value={localPath}
        onChange={(e) => setLocalPath(e.target.value)}
      />
      <button onClick={cloneRepository}>Clone Repo</button>
    </div>
  );
}

export default RepoManager;
'@

$envFile = @'
REACT_APP_GITHUB_CLIENT_ID=your-client-id
REACT_APP_GITHUB_CLIENT_SECRET=your-client-secret
'@

# Create files
Set-Content -Path "./git-app/package.json" -Value $packageJson
Set-Content -Path "./git-app/src/main/main.js" -Value $mainJs
Set-Content -Path "./git-app/src/main/preload.js" -Value $preloadJs
Set-Content -Path "./git-app/src/utils/gitHelper.js" -Value $gitHelperJs
Set-Content -Path "./git-app/src/components/App.jsx" -Value $appJsx
Set-Content -Path "./git-app/src/components/RepoManager.jsx" -Value $repoManagerJsx
Set-Content -Path "./git-app/.env" -Value $envFile

Write-Host "Project structure created successfully in the current directory!"
