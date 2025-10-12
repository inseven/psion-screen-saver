# Psion Screen Saver

[![build](https://github.com/inseven/psion-screen-saver/actions/workflows/build.yaml/badge.svg)](https://github.com/inseven/psion-screen-saver/actions/workflows/build.yaml)

Retro Screen Saver for macOS.

![](images/preview.gif)


## Development

macOS screen saver support seems pretty brittle these days, making testing somewhat involved:

- Remove an existing install:

  ```shell
  pkill "System Settings"
  pkill legacyScreenSaver
  rm -r "$HOME/Library/Screen Savers/Psion Screen Saver.saver"
  ```

- Archive the 'Psion Screen Saver' target.

- Export the project.

- Right click on the newly exported `.xcarchive` and select 'Show Package Contents'.

- Double-click the `Products/Library/Screen Savers/Psion Screen Saver.saver`.


## License

Psion Screen Saver is licensed under the MIT License (see [LICENSE](LICENSE)). It includes animations from the original screen saver. These remain copyright Psion PLC.
