# SDL Mixer in HSP

HSPでSDL_Mixerを使うためのASファイルとDLLのセット。

## ファイルコンテンツ

- SDL_Mixer_X.as: ASファイル
- SDL_Mixer_X.DLL: ["WohlSoftのSDL_Mixerのフォーク"](https://github.com/WohlSoft/SDL-Mixer-X)
- SDL2.DLL: Simple DirectMedia Layer 2
- sdl.hsp: 使用例サンプル
-
## クレジット

@WohlSoft: SDL-Mixer-X

### ライセンス

SDL_Mixer_X.asに関してはMITライセンスとする。

フォーラムに書かれた対処法がインクルードされている。

```
Copyright 2020 Chromaryu in Team Digital Fairy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


同梱したDLLは

SDL_Mixer_X: zlibライセンスレベルでのコンパイルにしている。
SDL2: zlibライセンス

そのほかSDL-Mixer-Xの拡張機能を使いたい場合、SDL-Mixer-Xをリコンパイルした上で差し替えて利用してください。

その場合

