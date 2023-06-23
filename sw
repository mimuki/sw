#!/usr/bin/python3
from pluralkit import Client
import sys
# Import the config file if it's there
try: 
    from config import TOKEN
# Generate a placeholder if it's not
except ModuleNotFoundError:
    print("Could not find config.py.")
    config = open("config.py", "w")
    config.write("# get your token by running `pk;token` in Discord, then put it here:\nTOKEN = ''")
    config.close()
    print("You need to manually edit that file, and put your token in it.")
    exit()

pk = Client(TOKEN, async_mode=False)
args = sys.argv # Any command line arguments
args.pop(0) # This would be the command itself, not a member
found = False # Have we found the member that corresponds to your input?
switch = [] # The member objects to switch in

if len(args) == 0:
    # No names were given
    print("You need to list members to switch to!")

elif args[0].lower() == "yeet" or args[0].lower() == "delete":
    # Delete last switch like you would in Discord
    try:
        latest = pk.get_switches(limit=1)
        pk.delete_switch(latest[0])
    except: 
        print("Failed to get your system. Is your token in config.py correct?")
elif args[0].lower() == "out":
    # Switch out
    try:
        pk.new_switch([]) # quite literally switch to no one
    except:
        print("Failed to get your system. Is your token in config.py correct?")
else:
    # Get list of members
    try:
        members = pk.get_members()
    except:
        print("Failed to get your system. Is your token in config.py correct?")
    # For each name we typed in
    for member in args:
        member = member.lower() # Lowercase it, for easier searching
        # For each member in system
        for m in members:
            try:
                ID = str(m.id.id)
                name = m.name.lower()
                nick = m.display_name.lower()
            except AttributeError: # nickname is unset
                pass
            # If the ID, name, or display_name match
            if member == ID or member == name or member == nick:
                switch.append(m)
                found = True
        if not found:
            print(f"Failed to find {member}, exiting.")
    try: 
        pk.new_switch(switch)
    except: 
        print("Switch failed.")
