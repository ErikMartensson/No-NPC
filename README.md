### Permission

If you only want a specific group to be able to toggle NPCs on/off, add this to your `server.cfg`:
```
add_ace group.admin "NoNPC.Toggle" allow
```
Replace "group.admin" with whatever you want.

If you want anyone to be able to toggle NPCs, add this instead:
```
add_ace builtin.everyone "NoNPC.Toggle" allow
```

### How to use
Press the key to the right of the "0" on your number row (not numpad). On US keyboards it's "-", on Scandinavian keyboards it's "+".

It's mapped to the `INPUT_VEH_PREV_RADIO_TRACK` function.
![Layout](https://i.imgur.com/fe6IBSJ.png)
