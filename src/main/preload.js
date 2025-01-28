const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("api", {
  gitCommand: (channel, args) => ipcRenderer.invoke(channel, args)
});
