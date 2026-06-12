#!/bin/bash

# Link YouTube Live Alan Becker (akan sentiasa cari live yang aktif)
YT_URL="https://www.youtube.com/@alanbecker/live"

# Ambil URL m3u8 menggunakan yt-dlp (ditambah --format untuk memastikan dapat hls)
M3U8_URL=$(yt-dlp -g -f "best[ext=mp4]/best" "$YT_URL")

# Semak jika URL berjaya diambil
if [ -z "$M3U8_URL" ]; then
    echo "Gagal mengambil URL Live Alan Becker."
    exit 1
fi

# Bina fail index.m3u8
cat <<EOF > index.m3u8
#EXTM3U
#EXT-X-STREAM-INF:BANDWIDTH=3405200,CODECS="avc1.4d001f,mp4a.40.2",RESOLUTION=1280x720
$M3U8_URL
EOF

echo "Fail index.m3u8 untuk Alan Becker berjaya dikemas kini!"

