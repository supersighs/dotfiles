# Dotfiles

Personal configuration files and development environment setup.

## Structure

```
.dotfiles/
├── shell/          # Shell configuration
│   ├── .zshrc
│   ├── .zshenv
│   ├── .zprofile
│   └── .profile
├── git/            # Git configuration
│   └── .gitconfig
├── config/         # Application configs (mirroring ~/.config)
│   ├── nvim/
│   ├── kitty/
│   ├── fish/
│   ├── aerospace/
│   ├── btop/
│   ├── gh/
│   ├── iterm2/
│   ├── karabiner/
│   ├── starship.toml
│   └── .tmux.conf
├── ssh/            # SSH configuration (no private keys!)
│   └── config
└── scripts/        # Setup and utility scripts
    └── bootstrap.sh
```

## Installation

### Fresh Setup (New Machine)

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/.dotfiles
   ```

2. Run the bootstrap script:
   ```bash
   ~/.dotfiles/scripts/bootstrap.sh
   ```

   This will:
   - Create symlinks from your home directory to the dotfiles
   - Back up any existing files to `~/.dotfiles_backup_<timestamp>`
   - Set up all configurations

3. Restart your shell or source the configuration:
   ```bash
   source ~/.zshrc
   ```

### Updating Existing Setup

If you've made changes to your actual config files and want to update the repository:

```bash
# Copy updated configs back to .dotfiles
cp ~/.zshrc ~/.dotfiles/shell/.zshrc
cp ~/.gitconfig ~/.dotfiles/git/.gitconfig
# etc...

# Commit and push changes
cd ~/.dotfiles
git add -A
git commit -m "Update configurations"
git push
```

## Important Notes

### What's Included
- Shell configurations (zsh, fish)
- Git settings
- Editor configs (Neovim)
- Terminal emulator configs (Kitty, iTerm2)
- Window manager (Aerospace)
- System monitor (btop)
- Other CLI tools (gh, starship, karabiner)

### What's NOT Included (by design)
- SSH private keys (`.gitignore` prevents these)
- API tokens and credentials
- Shell command history
- Application caches
- Package manager data
- Any file matching patterns in `.gitignore`

### SSH Configuration
Only the SSH `config` file is included. Your private keys remain in `~/.ssh/` and are never tracked.

## Maintenance

### Adding New Configurations

1. Copy the config to the appropriate directory in `.dotfiles`:
   ```bash
   cp ~/.new-config ~/.dotfiles/shell/.new-config
   ```

2. Run bootstrap to create the symlink:
   ```bash
   ~/.dotfiles/scripts/bootstrap.sh
   ```

3. Commit the changes:
   ```bash
   cd ~/.dotfiles
   git add .
   git commit -m "Add new configuration"
   git push
   ```

### Checking Symlinks

To verify your symlinks are working:
```bash
ls -la ~ | grep "\.dotfiles"
ls -la ~/.config | grep "\.dotfiles"
```

## Backup Strategy

The bootstrap script automatically creates timestamped backups before creating symlinks. These backups are stored in `~/.dotfiles_backup_<timestamp>/`.

## Troubleshooting

### Symlinks not working
Run the bootstrap script again:
```bash
~/.dotfiles/scripts/bootstrap.sh
```

### Config changes not persisting
Make sure you're editing the files in `.dotfiles/`, not the symlinks in your home directory. Or edit the symlinks and copy them back to `.dotfiles/` when done.

### Merge conflicts
If you edit configs on multiple machines:
```bash
cd ~/.dotfiles
git pull --rebase
# Resolve conflicts if any
git push
```

## Platform-Specific Notes

This setup is designed for macOS (zsh). Some configurations may need adjustment for Linux or other platforms.

## License

Personal use only.
