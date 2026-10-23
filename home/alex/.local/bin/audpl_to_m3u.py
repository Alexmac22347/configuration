#!/usr/bin/python3

import glob
import sys
import urllib.parse

AUDPL_FOLDER='/home/alex/.config/audacious/playlists/'
OUTPUT_FOLDER='/home/alex/Music/Playlists/'
PLAYLIST_TITLE_STRING='title='
TRACK_STRING='uri=file://'

if __name__ == '__main__':
    for file_path in glob.glob(f'{AUDPL_FOLDER}/*.audpl'):
        with open(file_path, 'r') as f:
            lines = f.readlines()
            tracks = []
            for i, line in enumerate(lines):
                if i == 0 and line.startswith(PLAYLIST_TITLE_STRING):
                    playlist_title=line[len(PLAYLIST_TITLE_STRING):].strip()
                    playlist_title=urllib.parse.unquote(playlist_title)
                elif line.startswith(TRACK_STRING):
                    track=line[len(TRACK_STRING):].strip()
                    track = urllib.parse.unquote(track)
                    tracks.append(track)
        output_file = OUTPUT_FOLDER + playlist_title + '.m3u'
        with open(output_file, 'w') as f:
            for track in tracks:
                f.write(track + '\n')

