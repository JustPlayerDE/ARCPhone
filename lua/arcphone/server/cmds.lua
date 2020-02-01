-- cmds.lua - Commands for ARCPhone (Can be editable using a plugin)

-- This file is under copyright, and is bound to the agreement stated in the EULA.
-- Any 3rd party content has been used as either public domain or with permission.
-- © Copyright 2016-2017 Aritz Beobide-Cardinal All rights reserved.
ARCPhone.Loaded = false
ARCPhone.Commands = { --Make sure they are less then 16 chars long.$
	["about"] = {
		command = function(ply,args) 
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			ARCPhone.MsgCL(ply,"ARitz Cracker Phone v"..ARCPhone.Version.." Last updated on "..ARCPhone.Update )
			ARCPhone.MsgCL(ply,"© Copyright 2015-2016 Aritz Beobide-Cardinal (ARitz Cracker) All rights reserved.")
		end, 
		usage = "",
		description = "About ARitz Cracker Phone.",
		adminonly = false,
		hidden = false
	},
	["owner"] = {
		command = function(ply,args) 
			ARCPhone.MsgCL(ply,"76561197997486016")
			ARCPhone.MsgCL(ply,"ca86f3e4f6b44b6c24c523ea077f4ac4ba26fd9ee7b6887a4e04e4c4e06971b2")
		end, 
		usage = "",
		description = "Who owns this copy of ARCPhone?",
		adminonly = false,
		hidden = true
	},
	["number"] = {
		command = function(ply,args) 
			 ARCPhone.MsgCL(ply,ARCPhone.GetPhoneNumber(ply))
		end, 
		usage = "",
		description = "Get your phone number",
		adminonly = false,
		hidden = false
	},
	["help"] = {
		command = function(ply,args) 
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			if args[1] then
				if ARCPhone.Commands[args[1]] then
					ARCPhone.MsgCL(ply,args[1]..tostring(ARCPhone.Commands[args[1]].usage).." - "..tostring(ARCPhone.Commands[args[1]].description))
				else
					ARCPhone.MsgCL(ply,"No such command as "..tostring(args[1]))
				end
			else
				local cmdlist = "\n*** ARCPHONE HELP MENU ***\n\nSyntax:\n<name(type)> = required argument\n[name(type)] = optional argument\n\nList of commands:"
				for key,a in SortedPairs(ARCPhone.Commands) do
					if !ARCPhone.Commands[key].hidden then
						local desc = "*                                                 - "..ARCPhone.Commands[key].description.."" -- +2
						for i=1,string.len( key..ARCPhone.Commands[key].usage ) do
							desc = string.SetChar( desc, (i+2), string.GetChar( key..ARCPhone.Commands[key].usage, i ) )
						end
						cmdlist = cmdlist.."\n"..desc
					end
				end
				for _,v in ipairs(string.Explode( "\n", cmdlist ))do
					ARCPhone.MsgCL(ply,v)
				end
			end
			
		end, 
		usage = " [command(string)]",
		description = "Gives you a description of every command.",
		adminonly = false,
		hidden = false
	},
	["test"] = {
		command = function(ply,args) 
			local str = "Arguments:"
			for _,arg in ipairs(args) do
				str = str.." | "..arg
			end
			ARCPhone.MsgCL(ply,str)
		end, 
		usage = " [argument(any)] [argument(any)] [argument(any)]",
		description = "[Debug] Tests arguments",
		adminonly = false,
		hidden = true
	},
	["antenna_save"] = {
		command = function(ply,args)
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			ARCPhone.MsgCL(ply, ARCPhone.Msgs.CommandOutput.AntennasSaving)
			if ARCPhone.SaveAntennas() then
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasSaved)
			else
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasError)
			end
		end, 
		usage = "",
		description = "Makes all active Antennas a part of the map.",
		adminonly = true,
		hidden = false
	},
	["antenna_unsave"] = {
		command = function(ply,args)
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			ARCPhone.MsgCL(ply, ARCPhone.Msgs.CommandOutput.AntennasDetatching)
			if ARCPhone.UnSaveAntennas() then
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasDSaved)
			else
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasDError)
			end
		end, 
		usage = "",
		description = "Makes all saved Antennas moveable again.",
		adminonly = true,
		hidden = false
	},
	["antenna_respawn"] = {
		command = function(ply,args) 
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasRespawning)
			if ARCPhone.SpawnAntennas() then
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasRespawned)
			else
				ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.AntennasSpawnError)
			end
		end, 
		usage = "",
		description = "Respawns all Map-Based Antennas.",
		adminonly = true,
		hidden = false
	},
	["screen_debug"] = {
		command = function(ply,args)
			ply:SendLua("ARCPhone.PhoneSys.HideWhatsOffTheScreen = !ARCPhone.PhoneSys.HideWhatsOffTheScreen")
		end, 
		usage = "",
		description = "Screen Debug Mode",
		adminonly = true,
		hidden = true
	},
	["print_json"] = {
		command = function(ply,args) 
			if !ARCPhone.Loaded then ARCPhone.MsgCL(ply,ARCPhone.Msgs.CommandOutput.SysReset) return end
			local translations = {}
			translations.errmsgs = ARCPHONE_ERRORSTRINGS
			translations.msgs = ARCPhone.Msgs
			translations.settingsdesc = ARCPhone.SettingsDesc
			local strs = ARCLib.SplitString(util.TableToJSON(translations),4000)
			for i = 1,#strs do
				Msg(strs[i])
			end
			Msg("\n")
		end, 
		usage = "",
		description = "Prints a JSON of all the translation shiz.",
		adminonly = true,
		hidden = true
	},
	["reset"] = {
		command = function(ply,args) 
			ARCPhone.MsgCL(ply,"Resetting ARCPhone system...")
			ARCPhone.SaveDisk()
			ARCPhone.Load()
			timer.Simple(math.Rand(4,5),function()
				if ARCPhone.Loaded then
					ARCPhone.MsgCL(ply, ARCPhone.Msgs.CommandOutput.ResetYes)
				else
					ARCPhone.MsgCL(ply, ARCPhone.Msgs.CommandOutput.ResetNo)
				end
			end)
		end, 
		usage = "",
		description = "Updates settings and checks for any currupt or invalid accounts. (SAVE YOUR SETTINGS BEFORE DOING THIS!)",
		adminonly = true,
		hidden = false
	}
}

ARCLib.AddSettingConsoleCommands("ARCPhone")
ARCLib.AddAddonConcommand("ARCPhone","arcphone") 