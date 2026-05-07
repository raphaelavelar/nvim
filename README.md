# nvim

## Installation and setup
### Installing neovim
In the scripts folder, execute the download script specifying the OS.
```bash
bash scripts/download-nvim.sh --linux
bash scripts/download-nvim.sh --windows
```

### Configuring neovim
1. Download packer

```bash
bash scripts/download-packer.sh --linux
bash scripts/download-packer.sh --windows
```

2. Move this repository to neovim's configuration path
```bash
# In linux
mv -r nvim ~/.config
# In windows
mv -r nvim "$env:LOCALAPPDATA\nvim"
```

3. Running neovim, source packer.lua and install the plugins
```
nvim ~/.config/nvim/lua/rpl/packer.lua
:so
:PackerInstall
````

## Key mapping
### CMP
| Command | Definition |
| ------- | ---------- | 
| Ctrl + p | Go to next item |
| Ctrl + n | Go to previous item |
| Tab | Confirm selection |
| Ctrl + Space | Preview suggestions |

### LSP
| Command | Definition |
| ------- | ---------- | 
| gd | Open definition |
| f | Format |
| h | Hover |
| od | Open float diagnostic |
| [d | Go to next diagnostic |
| ]d | Go to previous diagnostic |
| c | Open code actions |
| rr | Rename |
| Ctrl + h | Signature help |

### Telescope
A complete list of all the default mappings from telescope can be found [here](https://github.com/nvim-telescope/telescope.nvim#default-mappings) or using the command :help telescope.defaults.mappings  
**Live grep requires [ripgrep](https://github.com/BurntSushi/ripgrep#installation). Make sure to have it installed!**

| Command | Definition |
| ------- | ---------- | 
| fw | Grep string |
| s | Live grep |
| ff | Find files |
| fg | Find git files |
| gc | Display git commits |
| b | Display buffer |
| r | Display LSP references |
| gi | Display LSP implementations |
| ls | Display document symbols |
| D | Display diagnostics |
