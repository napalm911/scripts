#!/bin/bash
# Educational Proof of Concept: YouTube Video Downloader
# WARNING: Download videos only if you have rights to do so.
#
# This script uses yt-dlp to download a YouTube video.
# Usage: ./youtube_downloader.sh <youtube_video_url>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <youtube_video_url>"
  exit 1
fi

VIDEO_URL=$1
yt-dlp "$VIDEO_URL"
