#!/usr/bin/python3
import sys
import os
import mutagen

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("invalid arguments")
        exit(0)

    try:
        tags = mutagen.File(sys.argv[1])
    except e:
        print("error reading ", sys.argv[1])
        exit(0)

    _, file_extension = os.path.splitext(sys.argv[1])
    writer = tags['©wrt'][0] 
    song_name = tags['©nam'][0]
    print(file_extension)

    os.rename(sys.argv[1], "{0} - {1}{2}".format(writer, song_name, file_extension))
