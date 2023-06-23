# sw
Switch in pluralkit from the comfort of your command line.

## How to use:
Run it however you normally run Python scripts, which will probably be `python3 sw`. If you put it somewhere on your PATH, you can run `sw` anywhere you like, without needing to specify `python3`.

The first time you run this, it will create a config file `config.py`. Edit it to have your system token between the 'quotes'. You can get your token by running `pk;token` on Discord. Anyone with your token can delete your system, make 1000 members all named "farts", and all sorts of nasty stuff, so don't accidentally leak it. `pk;token refresh` will reset it if you do.

## Commands
`sw memberName otherGuy etc` to switch in members (as many as you'd like!)

`sw out` to switch out

`sw delete` to delete the last switch

You can list members by name, ID, or display name. Put multi-word names 'in quotes'.
