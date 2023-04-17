#!/usr/bin/env python3
import json

def read_settings(settings_file_path):
    with open(settings_file_path, "r") as r:

        settings = json.loads("\n".join(r.readlines()))

        return settings

def write(settings_file_path, settings):
    with open(settings_file_path, "w") as w:
        w.write(json.dumps(settings))

def main(file, mode):
    settings = read_settings(file)
    settings["workbench.colorTheme"] = settings["x-default-" + mode + "-theme"]
    settings["workbench.iconTheme"] = settings["x-default-" + mode + "-icons"]
    write(file, settings)

mode = "light"
main("/home/nyadiia/.config/VSCodium/User/settings.json", mode)
main("/home/nyadiia/.config/Code/User/settings.json", mode)