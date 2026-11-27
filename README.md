# Homebrew-Extras

![Homebrew](https://img.shields.io/badge/-Homebrew-FBB040?labelColor=555555&logoColor=FFFFFF&logo=homebrew) ![CI](https://github.com/Brewforge/homebrew-extras/actions/workflows/schedule.yml/badge.svg) ![license](https://img.shields.io/github/license/Brewforge/homebrew-extras) ![code-size](https://img.shields.io/github/languages/code-size/Brewforge/homebrew-extras) ![repo-size](https://img.shields.io/github/repo-size/Brewforge/homebrew-extras)

Extras [Homebrew](https://github.com/Homebrew/brew) 🍺 Casks Not Included in the Official [Homebrew-Cask](https://github.com/Homebrew/homebrew-cask) Tap

👏 Welcome discussion on [Discussions](https://github.com/orgs/Brewforge/discussions). 🎙️

## 🍺 Get Started

### 🏃 Get Prepared

```sh
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

For more details, check [Homebrew official site](https://brew.sh/).

### 🚀 Use it

🚰 `Tap` this repo at the 1st time

```bash
brew tap brewforge/extras
```

🔍 Search

```sh
brew search <cask>
```

🛒 Install

```sh
brew install --cask <cask>
```

🗑️ Remove

```sh
brew rm <cask>
```

🧾 List the installed software

```sh
brew ls
```

🙏 More help

```sh
brew help
```

## 🚀 Background Services

Some packages include a Homebrew `service` definition (currently only formulae
support `brew services`). Start it once and it will launch automatically at
login (macOS launchd) or boot (Linux systemd):

| Formula | Install | Start command | Endpoint |
| :--- | :--- | :--- | :--- |
| `userpref-mcp` | `brew install userpref-mcp` | `brew services start userpref-mcp` | `http://127.0.0.1:8765/mcp` |

## 🌍 List

> Software not found in this list can be viewed in the list below.
>
> [![Click to View List for Chinese](https://img.shields.io/badge/List_for_Chinese-red?style=for-the-badge&logo=homebrew&label=Click%20to%20view)](https://github.com/Brewforge/homebrew-chinese)
> [![Click to View List for CLI](https://img.shields.io/badge/List_for_CLI-red?style=for-the-badge&logo=homebrew&label=Click%20to%20view)](https://github.com/Brewforge/homebrew-more)

<!-- package-list:start -->
## 📦 Packages

> Auto-generated from `Casks/` and `Formula/` — do not edit by hand.

59 cask(s) and 4 formula(s). Install with `brew install --cask <token>` on macOS or `brew install <token>` on Linux.

| Token | Version | Platform | Architecture | Description | Homepage |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `5ire` | 0.10.1 | macOS | arm64 + x86_64 | Sleek AI Assistant & MCP Client | [5ire](https://5ire.app/) |
| `adobe-downloader` | 2.0.2 | macOS | universal | Adobe apps download & installer | [Adobe Downloader](https://github.com/X1a0He/Adobe-Downloader/) |
| `aerospace@beta` | 0.17.1-Beta | macOS | universal | I3-like tiling window manager | [AeroSpace](https://github.com/nikitabobko/AeroSpace) |
| `airy-ai` | 1.1.1 | macOS | arm64 + x86_64 | Search Launcher Powered by AI | [Airy](https://colink.in/) |
| `alexandria` | 0.13.1 | macOS | universal | Minimalistic cross-platform eBook reader | [Alexandria](https://github.com/btpf/Alexandria/) |
| `android-platform-tools` | 36.0.0 | macOS | universal | Android SDK platform tools, including ADB and Fastboot | [Android Platform Tools](https://developer.android.com/tools/releases/platform-tools) |
| `anx-reader` | 1.5.0 | macOS | universal | Thoughtfully crafted e-book reader for book lovers | [AnxReader](https://github.com/Anxcye/anx-reader/) |
| `barss` | 1.2.2 | macOS | universal | Menu Bar RSS reader | [baRSS](https://relikd.de/projects/barss/) |
| `butterfly` | 2.3.0 | macOS | universal | Powerful, minimalistic, cross-platform, opensource note-taking app | [Butterfly](https://github.com/LinwoodDev/Butterfly) |
| `chatgpt-lencx` | 1.1.0 | macOS | universal | Desktop wrapper for OpenAI ChatGPT | [ChatGPT](https://github.com/lencx/ChatGPT) |
| `corsixth` | 0.68.0 | macOS | arm64 + x86_64 | Open source clone of Theme Hospital | [CorsixTH](https://github.com/CorsixTH/CorsixTH/) |
| `cudatext` | 1.223.5.2 | macOS | arm64 + x86_64 | Text editor | [CudaText](https://cudatext.github.io/index.html) |
| `cytoscape` | 3.10.3 | macOS | arm64 + x86_64 | Open source platform for network analysis and visualization | [Cytoscape](https://cytoscape.org/) |
| `dorion` | 6.6.0 | macOS | arm64 + x86_64 | Alternative Discord client aimed towards lower-spec devices | [Dorion](https://github.com/SpikeHD/Dorion) |
| `dropclock` | 1.4 | macOS | universal | Creating timers as quick and seamless as possible | [ChatGPT](https://github.com/WrkX/Dropclock) |
| `dvc-app` | 3.59.2 | macOS | universal | Open-source Version Control System for Machine Learning Projects | [dvc](https://dvc.org/) |
| `ecopaste` | 0.5.0 | macOS | arm64 + x86_64 | Open source clipboard management tools | [EcoPaste](https://github.com/EcoPasteHub/EcoPaste) |
| `escrcpy` | 1.29.6 | macOS | arm64 + x86_64 | Graphical Scrcpy to display and control Android, devices powered by Electron | [Escrcpy](https://github.com/viarotel-org/escrcpy/) |
| `freefilesync` | 14.3 | macOS | universal | Folder comparison and synchronization software | [FreeFileSync](https://freefilesync.org/) |
| `goldendict-ng` | 25.05.0,Release.2a2b0e16,6.7.2 | macOS | arm64 + x86_64 | Next Generation GoldenDict | [GoldenDict](https://goldendict.org/) |
| `gopeed` | 1.7.0 | macOS | universal | High speed downloader that supports all platforms | [Gopeed](https://gopeed.com/) |
| `gridplayer` | 0.5.3 | macOS | universal | Play videos side-by-side | [gridplayer](https://github.com/vzhd1701/gridplayer) |
| `hiddify` | 2.0.5 | macOS | universal | Multi-Platform Auto-Proxy Client | [Hiddify](https://hiddify.com/) |
| `imfile` | 1.1.2 | macOS | arm64 + x86_64 | Open-source download manager | [imFile](https://imfile.io/) |
| `keyviz` | 2.0.0a2 | macOS | universal | Visualize your keystrokes && mouse actions in real-time | [keyviz](https://github.com/mulaRahul/keyviz) |
| `linkandroid` | 0.6.0 | macOS | arm64 + x86_64 | Easily Link Android and PC | [LinkAndroid](https://linkandroid.com/) |
| `lrcget` | 0.9.3 | macOS | arm64 + x86_64 | Utility for mass-downloading LRC synced lyrics for your offline music library | [LRCGET](https://github.com/tranxuanthang/lrcget) |
| `lyricsx-mxiris` | 1.7.4,2563 | macOS | universal | Ultimate Lyrics App | [LyricsX](https://github.com/MxIris-LyricsX-Project/LyricsX) |
| `musicat` | 0.12.0 | macOS | arm64 + x86_64 | Sleek desktop music player and tagger for offline music | [Musicat](https://github.com/basharovV/musicat) |
| `muzik` | 0.8.0 | macOS | arm64 + x86_64 | Cross platform, local music player | [muzik](https://muzik-apps.github.io/muzik-web/) |
| `nextchat` | 2.15.8 | macOS | universal | Cross-platform ChatGPT/Gemini UI | [NextChat](https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web) |
| `noi` | 0.4.0 | macOS | universal | Power Your World with AI - Explore, Extend, Empower | [Noi](https://github.com/lencx/Noi) |
| `oculante` | 0.9.2 | macOS | universal | Fast and simple image viewer / editor for many operating systems | [Oculante](https://github.com/woelper/oculante) |
| `openai-translator` | 0.4.34 | macOS | universal | Cross-platform Translatior based on ChatGPT API | [OpenAI Translator](https://github.com/openai-translator/openai-translator) |
| `openstudio` | 3.9.0,c77fbb9569 | macOS | arm64 + x86_64 | Collection of software tools to support whole building energy modeling | [OpenStudio](https://github.com/NREL/OpenStudio/) |
| `peazip` | 10.4.0 | macOS | universal | Free Zip/Unzip software and Rar file extractor | [Peazip](https://peazip.github.io/) |
| `peekai` | 4.0.5 | macOS | arm64 + x86_64 | Access to ChatGPT, Bard, Poe, Pi, Perplexity, Claude Labs on Menu Bar | [Peek](https://prateekkeshari.gumroad.com/l/peek) |
| `pixel-perfect` | 1.4 | macOS | universal | Application lets you increase the text size of iPhone and iPad apps | [Pixel Perfect](https://github.com/cormiertyshawn895/PixelPerfect) |
| `qtscrcpy` | 3.1.3,6.5.3 | macOS | universal | Android real-time display control software | [QtScrcpy](https://github.com/barry-ran/QtScrcpy) |
| `qtscrcpy-intel` | 3.1.3,5.15.2 | macOS | universal | Android real-time display control software | [QtScrcpy](https://github.com/barry-ran/QtScrcpy) |
| `quickrecorder` | 1.6.6 | macOS | universal | Lightweight and high-performance screen recorder | [QuickRecorder](https://github.com/lihaoyun6/QuickRecorder) |
| `revezone` | 1.0.0-alpha.18 | macOS | universal | Lightweight Local-First Graphic-Centric Productivity Tool | [revezone](https://revezone.com/) |
| `rune-music` | 1.1.0 | macOS | universal | Player that blends classic design with modern technology | [Rune](https://rune.not.ci/) |
| `ryujinx` | 49574a9 | macOS | universal | Nintendo Switch emulator written in C# | [Ryujinx](https://github.com/ryujinx-mirror/ryujinx) |
| `ryujinx-ryubing` | 1.2.86 | macOS | universal | Nintendo Switch emulator written in C# | [Ryujinx](https://github.com/Ryubing/Ryujinx) |
| `scrcpy-mask` | 0.6.0 | macOS | arm64 + x86_64 | Scrcpy client aimed at providing mouse and key mapping to control Android device | [scrcpy-mask](https://github.com/AkiChase/scrcpy-mask) |
| `sequential-viewer` | 2.6.0,2024-09-07,14.59.00 | macOS | universal | Native comic reader and image viewer | [Sequential](https://github.com/chuchusoft/Sequential/) |
| `stash-nsfw` | 0.28.1 | macOS | universal | Web-based media collection organizer, written in Go | [Stash-NSFW](https://github.com/stashapp/stash) |
| `stirling-pdf` | 0.46.0 | macOS | universal | Robust, locally hosted web-based PDF manipulation tool using Docker | [Stirling PDF](https://stirlingpdf.com/) |
| `stirling-pdf-installer` | 0.45.6 | macOS | universal | Robust, locally hosted web-based PDF manipulation tool using Docker | [Stirling PDF](https://stirlingpdf.com/) |
| `sun-ray` | 0.20.21 | macOS | arm64 only | GUI client for Xray-core with an embedded proxy core | [Sun Ray](https://github.com/idealisan/sun-ray/) |
| `svstudio2-pro` | 2.0.7 | macOS | universal | AI-based singing voice synthesis software | [Synthesizer V Studio 2 Pro](https://dreamtonics.com/synthesizerv/) |
| `tinkertool` | 10.2,eai5aujc1e2lo9jaq02v24eshl | macOS | universal | Gives you access to additional system preference settings | [TinkerTool](https://bresink.com/osx/TinkerTool.html) |
| `tmexclude` | 0.2.2 | macOS | universal | Exclude undesired files (node_modules, target, etc) from your TimeMachine backup | [TimeMachine Exclude](https://github.com/PhotonQuantum/tmexclude) |
| `userpref-mcp` | 0.3.0 | macOS | arm64 + x86_64 | MCP server providing a shared user preference store for AI agents | [UserPref MCP Server](https://github.com/idealisan/user-preferences-mcp) |
| `vibe` | 3.0.5 | macOS | arm64 + x86_64 | Transcribe on your own | [vibe](https://github.com/thewh1teagle/vibe/) |
| `wox` | 2.0.0-beta.2 | macOS | arm64 + x86_64 | Cross-platform launcher that simply works | [Wox](https://github.com/Wox-launcher/Wox) |
| `wpsoffice-en` | 8699 | macOS | arm64 + x86_64 | AI-Powered Office Suite for Everyone | [WPS Office](https://wps.com/) |
| `zulu-jdk11` | 11.0.27,11.80.21 | macOS | universal | OpenJDK distribution from Azul Systems | [Azul Zulu JDK 11](https://www.azul.com/downloads/) |
| `sun-ray` | 0.20.21 | macOS + Linux | arm64 + x86_64 | Xray-core proxy client with a native GUI (Linux desktop build) | [sun-ray](https://github.com/idealisan/sun-ray/) |
| `sun-ray-nogui` | 0.20.21 | macOS + Linux | arm64 + x86_64 | Headless Xray-core proxy client (Linux servers, no user interface) | [sun-ray-nogui](https://github.com/idealisan/sun-ray/) |
| `sun-ray-webui` | 0.20.21 | macOS + Linux | arm64 + x86_64 | Xray-core proxy client with an embedded browser UI (Linux) | [sun-ray-webui](https://github.com/idealisan/sun-ray/) |
| `userpref-mcp` | 0.3.0 | macOS + Linux | arm64 + x86_64 | MCP server providing a shared user preference store for AI agents | [userpref-mcp](https://github.com/idealisan/user-preferences-mcp) |
<!-- package-list:end -->

### Daily Use

|        Cask Name         |                            Site                            |                 Note                 |
| :----------------------: | :--------------------------------------------------------: | :----------------------------------: |
|       `alexandria`       |      [Alexandria](https://github.com/btpf/Alexandria)      | ![a](assets/a.svg)![1](assets/1.svg) |
|       `anx-reader`       |     [Anx Reader](https://github.com/Anxcye/anx-reader)     | ![a](assets/a.svg)![1](assets/1.svg) |
|       `butterfly`        |    [Butterfly](https://github.com/LinwoodDev/Butterfly)    | ![a](assets/a.svg)![1](assets/1.svg) |
|         `dorion`         |        [dorion](https://github.com/SpikeHD/Dorion)         | ![a](assets/a.svg)![1](assets/1.svg) |
|      `freefilesync`      |          [FreeFileSync](https://freefilesync.org)          | ![a](assets/a.svg)![1](assets/1.svg) |
|         `gopeed`         |                [Gopeed](https://gopeed.com)                | ![a](assets/a.svg)![1](assets/1.svg) |
|       `gridplayer`       |    [GridPlayer](https://github.com/vzhd1701/gridplayer)    | ![a](assets/a.svg)![1](assets/1.svg) |
|        `hiddify`         |            [Hiddify-Next](https://hiddify.com/)            | ![a](assets/a.svg)![1](assets/1.svg) |
|         `imfile`         |                [imFile](https://imfile.io/)                | ![a](assets/a.svg)![1](assets/1.svg) |
|         `keyviz`         |       [KeyViz](https://github.com/mulaRahul/keyviz)        | ![a](assets/a.svg)![1](assets/1.svg) |
|      `linkandroid`       | [LinkAndroid](https://github.com/modstart-lib/linkandroid) | ![a](assets/a.svg)![1](assets/1.svg) |
|         `lrcget`         |     [LRCGET](https://github.com/tranxuanthang/lrcget)      | ![a](assets/a.svg)![1](assets/1.svg) |
|        `musicat`         |      [Musicat](https://github.com/basharovV/musicat)       | ![a](assets/a.svg)![1](assets/1.svg) |
|         `muzik`          |      [Muzik](https://muzik-apps.github.io/muzik-web/)      | ![a](assets/a.svg)![1](assets/1.svg) |
|         `peazip`         |         [PeaZip](https://github.com/peazip/PeaZip)         | ![a](assets/a.svg)![1](assets/1.svg) |
|        `oculante`        |      [Oculante](https://github.com/woelper/oculante)       | ![a](assets/a.svg)![1](assets/1.svg) |
|        `revezone`        |             [Revezone](https://revezone.com/)              | ![a](assets/a.svg)![1](assets/1.svg) |
|       `rune-music`       |                [Rune](https://rune.not.ci/)                | ![a](assets/a.svg)![1](assets/1.svg) |
|      `stirling-pdf`      |          [Stirling PDF](https://stirlingpdf.com/)          | ![a](assets/a.svg)![1](assets/1.svg) |
| `stirling-pdf-installer` |          [Stirling PDF](https://stirlingpdf.com/)          | ![a](assets/a.svg)![1](assets/1.svg) |
|      `wpsoffice-en`      |               [WPS Office](https://wps.com/)               | ![b](assets/a.svg)![1](assets/1.svg) |

### AI Clients

|      Cask Name      |                                    Site                                     |                          Note                          |
| :-----------------: | :-------------------------------------------------------------------------: | :----------------------------------------------------: |
|       `5ire`        |                          [5ire](https://5ire.app/)                          |          ![a](assets/a.svg)![1](assets/1.svg)          |
|      `airy-ai`      |                         [Airy](https://colink.in/)                          |          ![b](assets/b.svg)![1](assets/1.svg)          |
|   `chatgpt-lencx`   |              [ChatGPT-lencx](https://github.com/lencx/ChatGPT)              |          ![a](assets/a.svg)![1](assets/1.svg)          |
|        `noi`        |                     [Noi](https://github.com/lencx/Noi)                     |          ![a](assets/a.svg)![1](assets/1.svg)          |
| `openai-translator` | [OpenAI-Translator](https://github.com/openai-translator/openai-translator) |          ![a](assets/a.svg)![1](assets/1.svg)          |
|      `peekai`       |             [peekai](https://prateekkeshari.gumroad.com/l/peek)             | ![a](assets/a.svg)![1](assets/1.svg)![2](assets/2.svg) |
|       `vibe`        |                [vibe](https://github.com/thewh1teagle/vibe)                 |          ![a](assets/a.svg)![1](assets/1.svg)          |

### macOS Only

|      Cask Name      |                                Site                                 |                 Note                 |
| :-----------------: | :-----------------------------------------------------------------: | :----------------------------------: |
| `adobe-downloader`  |   [Adobe Downloader](https://github.com/X1a0He/Adobe-Downloader)    | ![a](assets/a.svg)![1](assets/1.svg) |
|  `aerospace@beta`   |        [AeroSpace](https://github.com/nikitabobko/AeroSpace)        | ![a](assets/a.svg)![1](assets/1.svg) |
|       `barss`       |              [baRSS](https://relikd.de/projects/barss)              | ![a](assets/a.svg)![1](assets/1.svg) |
|     `dropclock`     |           [dropclock](https://github.com/WrkX/Dropclock)            | ![a](assets/a.svg)![1](assets/1.svg) |
|  `lyricsx-mxiris`   | [LyricsX-MxIris](https://github.com/MxIris-LyricsX-Project/LyricsX) | ![a](assets/a.svg)![1](assets/1.svg) |
|   `pixel-perfect`   | [Pixel Perfect](https://github.com/cormiertyshawn895/PixelPerfect)  | ![a](assets/a.svg)![1](assets/1.svg) |
|   `quickrecorder`   |     [QuickRecorder](https://github.com/lihaoyun6/QuickRecorder)     | ![a](assets/a.svg)![1](assets/1.svg) |
| `sequential-viewer` |       [Sequential](https://github.com/chuchusoft/Sequential)        | ![a](assets/a.svg)![1](assets/1.svg) |

### Research

|  Cask Name   |                       Site                       |                 Note                 |
| :----------: | :----------------------------------------------: | :----------------------------------: |
| `cytoscape`  |        [Cytoscape](https://cytoscape.org)        | ![a](assets/a.svg)![1](assets/1.svg) |
| `openstudio` | [OpenStudio](https://github.com/NREL/OpenStudio) | ![a](assets/a.svg)![1](assets/1.svg) |

### Development

|    Cask Name     |                          Site                          |                 Note                 |
| :--------------: | :----------------------------------------------------: | :----------------------------------: |
|    `dvc-app`     |                 [DVC](https://dvc.org)                 | ![a](assets/a.svg)![1](assets/1.svg) |
|    `escrcpy`     |   [escrcpy](https://github.com/viarotel-org/escrcpy)   | ![a](assets/a.svg)![1](assets/1.svg) |
|    `qtscrcpy`    |   [QtScrcpy](https://github.com/barry-ran/QtScrcpy)    | ![a](assets/a.svg)![1](assets/1.svg) |
| `qtscrcpy-intel` |   [QtScrcpy](https://github.com/barry-ran/QtScrcpy)    | ![a](assets/a.svg)![1](assets/1.svg) |
|  `scrcpy-mask`   | [scrcpy-mask](https://github.com/AkiChase/scrcpy-mask) | ![a](assets/a.svg)![1](assets/1.svg) |

### Games & Media

|     Cask Name     |                         Site                          |                 Note                 |
| :---------------: | :---------------------------------------------------: | :----------------------------------: |
|    `corsixth`     |   [CorsixTH](https://github.com/CorsixTH/CorsixTH)    | ![a](assets/a.svg)![1](assets/1.svg) |
|     `ryujinx`     | [Ryujinx](https://github.com/ryujinx-mirror/ryujinx)  | ![a](assets/a.svg)![1](assets/1.svg) |
| `ryujinx-ryubing` | [Ryujinx-Ryubing](https://github.com/Ryubing/Ryujinx) | ![a](assets/a.svg)![1](assets/1.svg) |

## ⚔️ Challenge

There are several manifests that the current contributors cannot fix, welcome your help!

|        Cask Name         |                         Site                          |                Problem                |
| :----------------------: | :---------------------------------------------------: | :-----------------------------------: |
|       `tinkertool`       | [TinkerTool](https://bresink.com/osx/TinkerTool.html) | cannot obtain available info directly |
| `stirling-pdf-installer` |       [Stirling PDF](https://stirlingpdf.com/)        |    dialogbox hinders installation     |

## 🌟 STAR ME

[![Star History](https://starchart.cc/Brewforge/homebrew-extras.svg?variant=adaptive)](https://starchart.cc/Brewforge/homebrew-extras)

## ✨ Contributing

Please directly initiate a [pull request](https://github.com/Brewforge/homebrew-extras/compare) or [issue](https://github.com/Brewforge/homebrew-extras/issues/new/choose).

<!-- ## ❤️ Sponsors -->

---

> Software not found in this list can be viewed in the list below.
>
> [![Click to View List for Chinese](https://img.shields.io/badge/List_for_Chinese-red?style=for-the-badge&logo=homebrew&label=Click%20to%20view)](https://github.com/Brewforge/homebrew-chinese)
> [![Click to View List for CLI](https://img.shields.io/badge/List_for_CLI-red?style=for-the-badge&logo=homebrew&label=Click%20to%20view)](https://github.com/Brewforge/homebrew-more)
