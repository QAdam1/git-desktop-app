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
