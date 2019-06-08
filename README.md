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
