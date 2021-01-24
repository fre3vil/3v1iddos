#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyautogui as gui
import random


# wechat bomb tools
def bomb():
    ll = ["[Party]", "[Bomb]", "[Fireworks]", "[Bomb]", "[Bomb]"]
    for i in range(50):
        data = random.choice(ll)
        # time.sleep(1)
        gui.typewrite(message=data)
        gui.hotkey('enter')


if __name__ == '__main__':
    # gui.hotkey('command', 'v')
    bomb()

