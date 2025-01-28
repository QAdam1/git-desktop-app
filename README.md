Git Desktop App
===============

A simple Git desktop app built using **Electron** and **React**, designed to manage repositories, clone, pull, and push changes seamlessly.

Features
--------

*   Clone Git repositories to a local path.
    
*   Manage repositories via a simple user interface.
    
*   Built using modern tools:
    
    *   **React** for the user interface.
        
    *   **Electron** for the desktop app.
        
    *   **Simple-Git** for interacting with Git.
        

Project Structure
-----------------

```
git-app/
├── public/
│   └── index.html          # React entry point
├── src/
│   ├── components/
│   │   ├── App.jsx         # Main React component
│   │   └── RepoManager.jsx # Component for managing repositories
│   ├── main/
│   │   ├── main.js         # Electron main process
│   │   └── preload.js      # Preload script for IPC communication
│   ├── utils/
│   │   └── gitHelper.js    # Utility functions for Git commands
│   ├── App.css             # Styling for the app
│   └── index.js            # React app entry point
├── package.json            # Project configuration
├── .env                    # Environment variables for GitHub OAuth
└── README.md               # Project documentation

```

Prerequisites
-------------

Ensure the following are installed on your system:

*   **Node.js** (LTS version recommended)
    
*   **npm** (comes with Node.js)
    
*   **Git** (for managing repositories)
    

### Verify Installation

Run these commands to confirm installation:

```   
node -v  
npm -v  
git --version
```

Installation
------------

1.  Clone this repository or use the provided PowerShell script to generate it.
    
2.  ```cd git-app```
    
3.  ```npm install```
    
4.  ` REACT\_APP\_GITHUB\_CLIENT\_ID=your-client-id` </br>
    `REACT\_APP\_GITHUB\_CLIENT\_SECRET=your-client-secret `
    

To generate GitHub OAuth credentials:

*   Go to [GitHub Developer Settings](https://github.com/settings/developers).
    
*   Register a new OAuth app.
    
*   Use http://localhost:3000/auth/callback as the authorization callback URL.
    

Running the App
---------------

To start the app in development mode:

`npm run start`

This will:

1.  Launch the React development server at http://localhost:3000.
    
2.  Open the Electron app once the React app is ready.
    

Building the App for Distribution
---------------------------------

To create a production-ready executable (e.g., .exe for Windows):

`npm run build`

The packaged application will be located in the dist/ folder.

Usage
-----

1.  Launch the app.
    
2.  Enter the URL of a Git repository (e.g., https://github.com/your-repo.git).
    
3.  Specify the local directory where the repository should be cloned.
    
4.  Use the available buttons to:
    
    *   Clone a repository.
        
    *   Pull updates from the remote repository.
        
    *   Push changes to the remote repository.
        

Troubleshooting
---------------

### Common Issues

1.  `npm install react-scripts`
    
2.  **Missing index.html**
    Ensure public/index.html exists with a tag.
    
3.  `git --version`
    

Technologies Used
-----------------

*   [Electron](https://www.electronjs.org/) - Desktop app framework.
    
*   [React](https://reactjs.org/) - User interface library.
    
*   [Simple-Git](https://www.npmjs.com/package/simple-git) - Git operations library.
    

Future Enhancements
-------------------

*   Add support for GitHub authentication and repository browsing.
    
*   Improve UI/UX with better repository management.
    
*   Provide detailed logs for Git operations.
    
*   Enable multi-repository management.
    

License
-------

This project is licensed under the MIT License. Feel free to use, modify, and distribute it.

Author
------

Built with ❤️ by **\[Your Name\]**.