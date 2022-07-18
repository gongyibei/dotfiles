import pyperclip
import time 
import threading
import os

class Fore:
    BLACK = 30
    RED = 31
    GREEN = 32
    YELLOW = 33
    BLUE = 34
    MAGENTA = 35
    CYAN = 36
    WHITE = 37


class Back:
    BLACK = 40
    RED = 41
    GREEN = 42
    YELLOW = 43
    BLUE = 44
    MAGENTA = 45
    CYAN = 46
    WHITE = 47


def CSI(n):
    return f'\x1b[{n}m'

def RED(txt):
    return CSI(Fore.RED) + txt +CSI(0)


class Translator:
    def __init__(self):
        self._cur_txt = ''

    def trans(self, txt):
        words = txt.split()
        if len(words) > 1:
            cmd = f'trans -b "{txt}"'
            #  print(txt)
            #  print('\n')
        else:
            cmd = f'trans -b "{txt}"'
        #  os.system(cmd)
        res = os.popen(cmd).read()
        os.system('cls' if os.name =='nt' else 'clear')
        print(RED(res.rstrip()))


    def loop(self):
        while True:
            txt = pyperclip.paste()
            if txt != self._cur_txt:
                self.trans(txt)
                self._cur_txt = txt
            time.sleep(0.2)

if __name__ == '__main__':
    Translator().loop()
