#!/usr/bin/python3
import os 
import sys


bg_id_file = '/home/gyk/.config/polybar/scripts/bg.txt'
wallpapers_dir = '/home/gyk/Pictures/Wallpapers/'

cmd = sys.argv[-1]
if cmd == 'default':
    print('default')
    os.system('feh --bg-scale ~/Pictures/Wallpapers/神奇时刻\ ɽ\ 城堡\ 4k壁纸_彼岸图网.jpg')
else:
    with open(bg_id_file, 'r') as f:
        bg_id = int(f.readline().strip())

    file_list = os.listdir(wallpapers_dir)
    N = len(file_list)

    if cmd == 'next':
        print('next')
        bg_id = (bg_id + 1)%N
    elif cmd == 'last':
        print('last')
        bg_id = (bg_id - 1 + N)%N

    file_path = os.path.join(wallpapers_dir, file_list[bg_id])
    os.system(f'feh --bg-scale "{file_path}"')
    with open(bg_id_file, 'w') as f:
        f.write(str(bg_id))



