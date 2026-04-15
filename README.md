## QuickStart

### SET MY MAC TERMINAL

How To setup my MacOS ?

1. open Terminal.app
2. run this command:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/main/base_setup.sh)"
```

this setup will install `xcode command-line-tools` and `rosetta 2`

### SET MY MAC WITH BREW

How To setup my MacOS with '[Homebrew](https://brew.sh)'?

1. open Terminal.app
2. run this command:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/main/brew_setup.sh)"
```

this setup will install `Homebrew` and run `Brewfile setup`

### SET MY MAC WITH NEOVIM IDE

How To setup my Neovim IDE config?

1. open Terminal.app
2. make sure `neovim`, `git`, `node`, and `npm` are installed
3. run this command:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/main/neovim_setup.sh)"
```

this setup will back up existing `~/.config/nvim`, install the `neovim_template` config, and install `tree-sitter-cli` when `npm` is available

template structure:

```text
neovim_template/
├── init.lua
└── lua/
    ├── options.lua
    ├── keymaps.lua
    └── plugins/
        ├── treesitter.lua
        ├── lsp.lua
        ├── explorer.lua
        └── telescope.lua
```

### SET MY MAC WITH VIM

How To setup my vim with '[Vundle.vim](https://github.com/VundleVim/Vundle.vim)'?

1. open Terminal.app
2. run this command:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/main/vundle_setup.sh)"
```

this setup will install `vundle.vim` and run `.vimrc setup`

### SET MY MAC WITH GLOBAL GITIGNORE

How To setup my gitignore with block 'DS_Store'?

1. open Terminal.app
2. run this command:

```bash
/bin/bash -c "$(curl -s https://raw.githubusercontent.com/terria1020/my-dev-env/main/git_ignore_setup.sh)"
```

this setup will ignore `DS_Store` to global gitignore setting
