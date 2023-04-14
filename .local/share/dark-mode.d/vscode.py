#!/usr/bin/env python3

import os
import json

settings_file_path = "/home/nyadiia/.config/VSCodium/User/settings.json"
def read_settings():
    with open(settings_file_path, "r") as r:

        settings = json.loads("\n".join(r.readlines()))

        return settings

settings = read_settings()
settings["workbench.colorTheme"] = settings["x-default-dark-theme"]
settings["workbench.iconTheme"] = settings["x-default-dark-icons"]
with open(settings_file_path, "w") as w:
    w.write(json.dumps(settings))