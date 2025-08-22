# Dotfiles

A collection of Windows PowerShell configurations, themes, and productivity utilities to enhance your terminal experience.

## 📁 Repository Contents

- **`profile.ps1`** - PowerShell profile with custom functions and aliases
- **`huvix__c.json`** - Custom Oh-My-Posh theme configuration
- **`README.md`** - This documentation file

## ✨ Features

### 🎨 Terminal Customization
- **Oh-My-Posh** integration with custom theme
- **Terminal Icons** for enhanced file/folder visualization
- **PSReadLine** enhancements with history-based predictions
- Adaptive prediction view (ListView for tall terminals, InlineView for compact)

### 🚀 Development Shortcuts

#### Flutter Development
- `fpg` - `flutter pub get`
- `fpu` - `flutter pub upgrade`
- `fpa <package>` - `flutter pub add <package>`
- `fpr <package>` - `flutter pub remove <package>`
- `frun [args]` - `flutter run [args]`

#### Git Workflow
- `gls` - `git ls`
- `ga [files]` - `git add [files]`
- `gcm <message>` - `git commit -m <message>`
- `gp [args]` - `git push [args]`
- `gch <branch>` - `git checkout <branch>`
- `gchb <branch>` - `git checkout -b <branch>`
- `gg` - `git log --oneline --graph --all --decorate`
- `clipdiff` - Copy staged git diff to clipboard

#### Navigation & Utilities
- `z..` - Navigate up one directory (zoxide integration)
- `conan` - File browser with fzf and bat preview
- `this` - Open current directory in VS Code and exit terminal
- `v2` - Quick navigation to specific project directory

#### Clipboard Utilities
- `clipin [input] [-FileName <file>]` - Copy content to clipboard
- `clipin_v2 [input] [-FileName <file>] [-LineNumber <num>]` - Enhanced clipboard function

#### C++ Development
- `zpp [file]` - Compile and run C++ file (defaults to solution.cpp)

### 🎉 Fun Features
- `oi oi oi` - Special greeting function (try it!)

## 🛠️ Prerequisites

Before using these dotfiles, ensure you have the following installed:

- **PowerShell 7+** - Modern PowerShell version
- **Oh-My-Posh** - Terminal prompt theme engine
- **Terminal-Icons** - PowerShell module for file icons
- **PSReadLine** - Enhanced command line editing
- **zoxide** - Smart directory jumper
- **fzf** - Fuzzy finder (for `conan` function)
- **bat** - Better cat with syntax highlighting (for `conan` function)

### Installation Commands

```powershell
# Install Oh-My-Posh
winget install JanDeDobbeleer.OhMyPosh

# Install PowerShell modules
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSReadLine -Repository PSGallery

# Install zoxide
winget install ajeetdsouza.zoxide

# Install fzf
winget install junegunn.fzf

# Install bat
winget install sharkdp.bat
```

## 📥 Setup Instructions

1. **Clone this repository:**
   ```bash
   git clone https://github.com/RndmCodeGuy20/dotfiles.git
   ```

2. **Copy the PowerShell profile:**
   ```powershell
   # Create PowerShell profile directory if it doesn't exist
   New-Item -ItemType Directory -Force -Path (Split-Path $PROFILE)
   
   # Copy the profile
   Copy-Item "dotfiles/profile.ps1" $PROFILE
   ```

3. **Copy the Oh-My-Posh theme:**
   ```powershell
   # Copy theme to Oh-My-Posh themes directory
   Copy-Item "dotfiles/huvix__c.json" "$env:POSH_THEMES_PATH/huvix__c.omp.json"
   ```

4. **Restart PowerShell** or run:
   ```powershell
   . $PROFILE
   ```

## 🎨 Theme Features

The custom Oh-My-Posh theme (`huvix__c.json`) includes:

- **User session info** with hostname
- **Current path** with short style
- **Git branch status** with clean styling
- **Language runtime versions** (Go, Python, Node.js, Java)
- **Execution time** for commands
- **Current date and time**
- **Battery status** with charging indicators
- **System memory usage**
- **Spotify integration** (shows currently playing track)

## 🔧 Customization

Feel free to modify the files to suit your needs:

- Edit `profile.ps1` to add your own functions and aliases
- Customize `huvix__c.json` to change theme colors and segments
- Update directory paths in functions like `v2` to match your setup

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for any improvements or additional utilities!