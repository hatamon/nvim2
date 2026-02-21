## windows

### fzf
- 自分でビルドする
- Visual Studio が必要
- C++ の開発環境必要

```
# まず neovim 起動してプラグインがインストールされるのを待つ
# libfzf.dll がないと言われるので以下を実行

# fzf に移動してビルド用の一時フォルダ作成
cd %localappdata%\nvim-data\lazy\telescope-fzf-native.nvim
mkdir build
cd build

# CMake でビルド設定を生成 (Visual Studio を使用)
cmake .. -G "Visual Studio 17 2022" -A x64

# コンパイル実行
cmake --build . --config Release

# 出来上がった DLL をプラグインのルートにコピー
copy Release\libfzf.dll .
```


### rg
- 自分でビルドする
- rust が必要
- https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#building に従えばOK
