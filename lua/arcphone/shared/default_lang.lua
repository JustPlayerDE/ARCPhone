--default_lang.lua - default language

-- This file is under copyright, and is bound to the agreement stated in the EULA.
-- Any 3rd party content has been used as either public domain or with permission.
-- © Copyright 2016-2017 Aritz Beobide-Cardinal All rights reserved.

ARCPhone.Msgs = ARCPhone.Msgs or {}
ARCPhone.Msgs.Time = ARCPhone.Msgs.Time or {}
ARCPhone.Msgs.AdminMenu = ARCPhone.Msgs.AdminMenu or {}
ARCPhone.Msgs.Commands = ARCPhone.Msgs.Commands or {}
ARCPhone.Msgs.CommandOutput = ARCPhone.Msgs.CommandOutput or {}
ARCPhone.Msgs.Items = ARCPhone.Msgs.Items or {}
ARCPhone.Msgs.LogMsgs = ARCPhone.Msgs.LogMsgs or {}
ARCPhone.Msgs.Phone = ARCPhone.Msgs.Phone or {}
ARCPhone.Msgs.PhoneCases = ARCPhone.Msgs.PhoneCases or {}

ARCPHONE_ERRORSTRINGS = ARCPHONE_ERRORSTRINGS or {}
ARCPhone.SettingsDesc = ARCPhone.SettingsDesc or {}

--[[
 ____   ___    _   _  ___ _____   _____ ____ ___ _____   _____ _   _ _____   _    _   _   _      _____ ___ _     _____ _ 
|  _ \ / _ \  | \ | |/ _ \_   _| | ____|  _ \_ _|_   _| |_   _| | | | ____| | |  | | | | / \    |  ___|_ _| |   | ____| |
| | | | | | | |  \| | | | || |   |  _| | | | | |  | |     | | | |_| |  _|   | |  | | | |/ _ \   | |_   | || |   |  _| | |
| |_| | |_| | | |\  | |_| || |   | |___| |_| | |  | |     | | |  _  | |___  | |__| |_| / ___ \  |  _|  | || |___| |___|_|
|____/ \___/  |_| \_|\___/ |_|   |_____|____/___| |_|     |_| |_| |_|_____| |_____\___/_/   \_\ |_|   |___|_____|_____(_)

 ____   ___    _   _  ___ _____   _____ ____ ___ _____   _____ _   _ _____   _    _   _   _      _____ ___ _     _____ _ 
|  _ \ / _ \  | \ | |/ _ \_   _| | ____|  _ \_ _|_   _| |_   _| | | | ____| | |  | | | | / \    |  ___|_ _| |   | ____| |
| | | | | | | |  \| | | | || |   |  _| | | | | |  | |     | | | |_| |  _|   | |  | | | |/ _ \   | |_   | || |   |  _| | |
| |_| | |_| | | |\  | |_| || |   | |___| |_| | |  | |     | | |  _  | |___  | |__| |_| / ___ \  |  _|  | || |___| |___|_|
|____/ \___/  |_| \_|\___/ |_|   |_____|____/___| |_|     |_| |_| |_|_____| |_____\___/_/   \_\ |_|   |___|_____|_____(_)
                                                                                                                         

 ____   ___    _   _  ___ _____   _____ ____ ___ _____   _____ _   _ _____   _    _   _   _      _____ ___ _     _____ _ 
|  _ \ / _ \  | \ | |/ _ \_   _| | ____|  _ \_ _|_   _| |_   _| | | | ____| | |  | | | | / \    |  ___|_ _| |   | ____| |
| | | | | | | |  \| | | | || |   |  _| | | | | |  | |     | | | |_| |  _|   | |  | | | |/ _ \   | |_   | || |   |  _| | |
| |_| | |_| | | |\  | |_| || |   | |___| |_| | |  | |     | | |  _  | |___  | |__| |_| / ___ \  |  _|  | || |___| |___|_|
|____/ \___/  |_| \_|\___/ |_|   |_____|____/___| |_|     |_| |_| |_|_____| |_____\___/_/   \_\ |_|   |___|_____|_____(_)
                                                                                                                         
																														 
These are the default values in order to prevent you from screwing it up!
]]

ARCPHONE_ERRORSTRINGS[-4] = "Incomming call"
ARCPHONE_ERRORSTRINGS[-3] = "Call ended"
ARCPHONE_ERRORSTRINGS[-2] = "Operation Aborted"
ARCPHONE_ERRORSTRINGS[-1] = "Dialing..."
ARCPHONE_ERRORSTRINGS[0] = "Call in progress"
ARCPHONE_ERRORSTRINGS[1] = "The person who you're trying to call is out of range"
ARCPHONE_ERRORSTRINGS[2] = "Invalid call code"
ARCPHONE_ERRORSTRINGS[3] = "All lines busy. Try again later."
ARCPHONE_ERRORSTRINGS[4] = "Number blocked/disconnected"
ARCPHONE_ERRORSTRINGS[5] = "The person who you're trying to call is not in this area"
ARCPHONE_ERRORSTRINGS[6] = "The person who you're trying to call is already in one"
ARCPHONE_ERRORSTRINGS[7] = "Invalid phone number"

ARCPHONE_ERRORSTRINGS[16] = "Not enough reception"
ARCPHONE_ERRORSTRINGS[17] = "Call dropped"
ARCPHONE_ERRORSTRINGS[18] = "Your phone plan doesn't support this"

ARCPHONE_ERRORSTRINGS[-127] = "The ARCPhone system failed to load."
ARCPHONE_ERRORSTRINGS[-128] = "Unknown Error. Try again later."

ARCPhone.Msgs.PhoneCases[0] = "Black"
ARCPhone.Msgs.PhoneCases[1] = "Orange"
ARCPhone.Msgs.PhoneCases[2] = "Yellow"
ARCPhone.Msgs.PhoneCases[3] = "Lime"
ARCPhone.Msgs.PhoneCases[4] = "Bright Green"
ARCPhone.Msgs.PhoneCases[5] = "Green"
ARCPhone.Msgs.PhoneCases[6] = "Aquamarine"
ARCPhone.Msgs.PhoneCases[7] = "Cyan"
ARCPhone.Msgs.PhoneCases[8] = "Bleu de France"
ARCPhone.Msgs.PhoneCases[9] = "Blue"
ARCPhone.Msgs.PhoneCases[10] = "Violet"
ARCPhone.Msgs.PhoneCases[11] = "Magenta"
ARCPhone.Msgs.PhoneCases[12] = "Red"
ARCPhone.Msgs.PhoneCases[13] = "Gray"

ARCPhone.Msgs.CommandOutput.SysReset = "System reset required!"
ARCPhone.Msgs.CommandOutput.SysSetting = "%SETTING% has been changed to %VALUE%"
ARCPhone.Msgs.CommandOutput.admin = "You must be an admin to use this command!"
ARCPhone.Msgs.CommandOutput.superadmin = "You must be an superadmin to use this command!"
ARCPhone.Msgs.CommandOutput.SettingsSaved = "Settings have been saved!"
ARCPhone.Msgs.CommandOutput.SettingsError = "Error saving settings."

ARCPhone.Msgs.CommandOutput.ResetYes = "System reset!"
ARCPhone.Msgs.CommandOutput.ResetNo = "Error. Check server console for details. Or look at the latest system log located in garrysmod/data/_arcphone_server/syslogs on the server."

ARCPhone.Msgs.CommandOutput.AntennasSaving = "Saving Antennas to map..."
ARCPhone.Msgs.CommandOutput.AntennasSaved = "Antennas saved onto map!"
ARCPhone.Msgs.CommandOutput.AntennasError = "An error occurred while saving the Antennas onto the map."

ARCPhone.Msgs.CommandOutput.AntennasDetatching = "Detatching Antennas from map..."
ARCPhone.Msgs.CommandOutput.AntennasDSaved = "Antennas detached from map!"
ARCPhone.Msgs.CommandOutput.AntennasDError = "An error occurred while detaching Antennas from map."

ARCPhone.Msgs.CommandOutput.AntennasRespawning = "Re-spawning Map-Based Antennas..."
ARCPhone.Msgs.CommandOutput.AntennasRespawned = "Map-Based Antennas re-spawned!"

ARCPhone.Msgs.CommandOutput.AntennasSpawnError = "No Antennas associated with this map. (Non-existent/Currupt file)"

ARCPhone.Msgs.Items.Phone = "Phone"

ARCPhone.Msgs.Phone.CallNoNumber = "No Phone number specified."
ARCPhone.Msgs.Phone.CallNoCall = "No call running or call has not been established."
ARCPhone.Msgs.Phone.CallInvalid = "Invalid operation"

ARCPhone.Msgs.Time.nd = "and"
ARCPhone.Msgs.Time.second = "second"
ARCPhone.Msgs.Time.seconds = "seconds"
ARCPhone.Msgs.Time.minute = "minute"
ARCPhone.Msgs.Time.minutes = "minutes"
ARCPhone.Msgs.Time.hour = "hour"
ARCPhone.Msgs.Time.hours = "hours"
ARCPhone.Msgs.Time.day = "day"
ARCPhone.Msgs.Time.days = "days"
ARCPhone.Msgs.Time.forever = "forever"
ARCPhone.Msgs.Time.now = "now"

ARCPhone.Msgs.AdminMenu.Commands = "Commands"
ARCPhone.Msgs.AdminMenu.Remove = "Remove"
ARCPhone.Msgs.AdminMenu.Add = "Add"
ARCPhone.Msgs.AdminMenu.Description = "Description:"
ARCPhone.Msgs.AdminMenu.Enable = "Enable"
ARCPhone.Msgs.AdminMenu.Settings = "Settings"
ARCPhone.Msgs.AdminMenu.AdvancedSettings = "Advanced Settings"
ARCPhone.Msgs.AdminMenu.ChooseSetting = "Choose setting"
ARCPhone.Msgs.AdminMenu.SaveSettings = "Save settings"
ARCPhone.Msgs.AdminMenu.ServerLogs = "Server Logs"
ARCPhone.Msgs.AdminMenu.EmergencyNumbers = "Emergency Numbers"
ARCPhone.Msgs.AdminMenu.NoTeamError = "No team selected."
ARCPhone.Msgs.AdminMenu.NoNumberError = "No number selected."
ARCPhone.Msgs.AdminMenu.AddTeam = "Add new team..."
ARCPhone.Msgs.AdminMenu.RemoveTeam = "Remove selected team"

ARCPhone.Msgs.Commands["antenna_save"] = "Save and freeze all antennas"
ARCPhone.Msgs.Commands["antenna_unsave"] = "Unsave and unfreeze all antennas"
ARCPhone.Msgs.Commands["antenna_respawn"] = "Respawn frozen antennas"
ARCPhone.Msgs.Commands["antenna_spawn"] = "Spawn an antenna where you're looking"

ARCPhone.SettingsDesc["name"] = "The displayed \"short\" name of the addon."
ARCPhone.SettingsDesc["name_long"] = "The displayed \"long\" name of the addon."
ARCPhone.SettingsDesc["antenna_range"] = "This maximum range (distance) of the reception antennas"
ARCPhone.SettingsDesc["antenna_strength"] = "How far the reception antennas radio waves can travel through walls"
ARCPhone.SettingsDesc["jammer_range"] = "This maximum range (distance) of the cellphone jammers"
ARCPhone.SettingsDesc["jammer_strength"] = "How far the cellphone jammer radio waves can travel through walls"
ARCPhone.SettingsDesc["phone_max_lines"] = "How many calls can be on the server at once"
ARCPhone.SettingsDesc["phone_realistic_reception"] = "Enabled realistic reception. (Turning this off might cause strange bugs)"
ARCPhone.SettingsDesc["phone_clock_cycle"] = "If enabled, the phone clock will display the time of the day/night cycle on the server. (Currently supports Atmos and SimpleWeather)"
ARCPhone.SettingsDesc["override_text_chat"] = "This forces in-game messages to only be seen by nearby players. (Unless in an ARCPhone call) Only enable this if your gamemode doesn't support this natively."
ARCPhone.SettingsDesc["override_voice_chat"] = "This forces all in-game voice chat to be 3D and can only be heard by nearby players. (Unless in an ARCPhone call) Only enable this if your gamemode doesn't support this natively."
ARCPhone.SettingsDesc["override_chat_distance"] = "The distance before players will"
ARCPhone.SettingsDesc["disable_beta_message"] = "This will disable the BETA warning in your phone. (This will not change the current stage of ARCPhone tho)"
