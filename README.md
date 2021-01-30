# youtube-audio-downloader
**Bash** script for downloading youtube videos as audio files using youtube-dl

Sets audio format to best. Usually results in a .opus file.

Date and time of running the script is used as the file name for downloaded files.

Tested on Arch Linux with bash 5.1.4 and youtube-dl 2021.01.24.1

## Requirements
- Bash
- youtube-dl
- curl (used to download youtube-dl if not installed)

## Usage
```
./yt-audio-dl.sh [URL] /path/to/download/folder
```
If */path/to/download/folder* is not set, the directory from which the script is being run is used as the download location.
