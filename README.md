mpv-types-lua
======

Lua type declarations for mpv scripting.

# FEATURES

- Global typed `mp` object

- Loading built in submodules with type information via `require` - e.g. `require('mp.msg')`

- Function signatures for all built in functions

- Documentation comments from mpv man pages

![][feature-image]

# INSTALLATION

## Visual Studio Code

### Extension Configurations

VSCode does not support Emmylua style type declarations out of the box, and requires one of the following extensions.

#### Lua - sumneko.lua - [Marketplace][sumneko.lua] - [Github][sumneko.lua-repo]

``` javascript
  /* mpv builds with 5.1, 5.2, or luajit */
  "Lua.runtime.version": "Lua 5.1",

  /* Declarations can also be placed in workspace subdirectory */
  "Lua.workspace.library": {
    ".../path/to/mpv-lua-types/@types/": true
  },

  /* Recommended */
  "Lua.completion.enable": true,
  "Lua.signatureHelp.enable": true,
  "Lua.hover.enable": true,
```

#### EmmyLua - tangzx.emmylua - [Marketplace][tangzx.emmylua] - [GitHub][tangzx.emmylua-repo]

``` javascript
  /* Declarations can also be placed in workspace subdirectory */
  "emmylua.source.roots": {
    ".../path/to/mpv-lua-types/@types/": true
  },
```

#### LuaPanda - stuartwang.luapanda - [Marketplace][stuartwang.luapanda] - [GitHub][stuartwang.luapanda-repo]

``` javascript
  /* Declarations can also be placed in workspace subdirectory */
  "luaide-lite.apiFolders": [
    ".../path/to/mpv-types-lua/@types"
  ],
  "luaide-lite.core": "emmy",
```

#### luaide-lite - wellshsu.luaide-lite - [Marketplace][wellshsu.luaide-lite] - [GitHub][wellshsu.luaide-lite-repo]

- Declaration files must be in subdirectory of workspace.

``` json
  "lua_analyzer.codeLinting.luaVersion": "5.1",
  "lua_analyzer.codeLinting.enable": true
```

## Intellij

### Required Extensions

  - Emmylua - [Plugin Homepage][tangzx.emmylua-intellij] - [GitHub][tangzx.emmylua-repo]

### Installation

Create a new Lua Zip Library and attach the the `@types` folder.

# TODO

- Create [lua library file](https://github.com/actboy168/lni)

- Write documentation for `assdraw` submodule

[feature-image]:             media/mpv-types-lua-diptych-vscode-intellij.full.png
[sumneko.lua]:               https://marketplace.visualstudio.com/items?itemName=sumneko.lua
[sumneko.lua-repo]:          https://github.com/sumneko/lua-language-server
[tangzx.emmylua]:            https://marketplace.visualstudio.com/items?itemName=tangzx.emmylua
[tangzx.emmylua-intellij]:   https://plugins.jetbrains.com/plugin/9768-emmylua
[tangzx.emmylua-repo]:       https://github.com/EmmyLua/VSCode-EmmyLua
[stuartwang.luapanda]:       https://marketplace.visualstudio.com/items?itemName=stuartwang.luapanda
[stuartwang.luapanda-repo]:  https://github.com/Tencent/LuaPanda
[wellshsu.luaide-lite]:      https://marketplace.visualstudio.com/items?itemName=wellshsu.luaide-lite
[wellshsu.luaide-lite-repo]: https://github.com/hsu2017/luaide-lite