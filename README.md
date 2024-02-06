# bharyang.nvim

Based on <a href="https://github.com/pratishshr/bharyang-vscode" target="_blank"> Bharyang</a> VS-Code extension

## Installation (Lazy.nvim)

```lua
{
    "maskudo/bharyang.nvim",
    config = function()
        require("bharyang").setup()
    end,
},
```

## Available Commands

1. BharyangAsc
1. BharyangDesc
1. BharyangGroupAsc
1. BharyangGroupDesc

## Usage

Select some lines of javascript import statements and run one of the above commands.

## TODO

1. Currently supports absolute imports with @ symbol. Allow custom symbols.
1. Treesitter integration
