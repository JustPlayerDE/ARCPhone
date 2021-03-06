-- This file is under copyright, and is bound to the agreement stated in the EULA.
-- Any 3rd party content has been used as either public domain or with permission.
-- © Copyright 2016-2017 Aritz Beobide-Cardinal All rights reserved.

-- TODO: STOP MESSING WITH APP.Tiles and do the stuff properly!!
-- TODO: Translation
local APP = ARCPhone.NewAppObject()
APP.Name = "Messaging"
APP.Author = "ARitz Cracker"
APP.Purpose = "Messaging app for ARCPhone"
APP.FlatIconName = "chat-bubbles"

APP.OpenNumber = ""
function APP:PhoneStart()
	ARCPhone.Apps["contacts"]:AddContactOption("Text",function(num)
		ARCPhone.PhoneSys:OpenApp("messaging")
		ARCPhone.Apps["messaging"]:OpenConvo(num)
	end)
end


function APP:AttachPhoto(photo)
	local imagetag = "{{IMG\""..photo.."\"IMG}}"
	if string.find( self.Tiles[self.TextInputIcon]:GetText(), imagetag ,1 ,false) then
            -- TODO: Translation
		ARCPhone.PhoneSys:AddMsgBox("Duplicate image","You cannot attach 2 of the same image","warning")
	else
		self.Tiles[self.TextInputIcon]:SetText(self.Tiles[self.TextInputIcon]:GetText()..imagetag)
		timer.Simple(0.1,function()
		self:SetCurPos(self.SendIcon)
		end)
	end
end

function APP:UpdateCurrentConvo(timestamp,msg,sender)
	local sendTile = table.remove( self.Tiles )
	local inputTile = table.remove( self.Tiles )



	local i = #self.Tiles + 1
	self.Tiles[i] = ARCPhone.NewAppTextInputTile(self,msg,true,118)
	self.Tiles[i].ID = i
	self.Tiles[i].Editable = false
	if i > 1 then
		self.Tiles[i].y = self.Tiles[i-1].y + self.Tiles[i-1].h + 4
	else
		self.Tiles[i].y = 24
	end
	if sender then
		self.Tiles[i].x = 12
		self.Tiles[i].bgcolor = self.Phone.Settings.Personalization.CL_01_MainColour
		self.Tiles[i].color = self.Phone.Settings.Personalization.CL_03_MainText
	else
		self.Tiles[i].x = 4
		self.Tiles[i].bgcolor = self.Phone.Settings.Personalization.CL_03_SecondaryColour
		self.Tiles[i].color = self.Phone.Settings.Personalization.CL_05_SecondaryText
	end
	i = i + 1
	inputTile.y = self.Tiles[i-1].y + self.Tiles[i-1].h + 4
	self.Tiles[i] = inputTile
	self.Tiles[i].ID = i
	self.TextInputIcon = i
	self:SetCurPos(i)
	i = i + 1
	sendTile.y = self.Tiles[i-1].y + self.Tiles[i-1].h + 2
	self.Tiles[i] = sendTile
	self.Tiles[i].ID = i
	self.SendIcon = i
end

function APP:OpenConvo(num,previewText)
	table.Empty(self.Tiles)
            -- TODO: Translation
	self:AddMenuOption("Attach Photo",self.Phone.ChoosePhoto,self.Phone,self.AttachPhoto,self)
	self.Home = false
	self.OpenNumber = num
	local numdir = ARCPhone.ROOTDIR.."/messaging/"..num..".txt"
	local len = 0
	if file.Exists(numdir,"DATA") then
		local msgs = string.Explode( "\f", file.Read(numdir))
		len = #msgs
		local msgpart
		for i=1,len do
			msgpart = string.Explode("\v", msgs[i])
			-- msgpart[2] -- Unix timestamp
			self.Tiles[i] = ARCPhone.NewAppTextInputTile(self,msgpart[3],true,118)
			self.Tiles[i].ID = i
			self.Tiles[i].Editable = false
			if i > 1 then
				self.Tiles[i].y = self.Tiles[i-1].y + self.Tiles[i-1].h + 4
			else
				self.Tiles[i].y = 24
			end
			if msgpart[1] == "s" then
				self.Tiles[i].x = 12
				self.Tiles[i].bgcolor = self.Phone.Settings.Personalization.CL_01_MainColour
				self.Tiles[i].color = self.Phone.Settings.Personalization.CL_03_MainText
			else
				self.Tiles[i].x = 4
				self.Tiles[i].bgcolor = self.Phone.Settings.Personalization.CL_03_SecondaryColour
				self.Tiles[i].color = self.Phone.Settings.Personalization.CL_05_SecondaryText
			end
		end
	end
	
	
	
	len = len + 1
	self.TextInputIcon = len
	self.Tiles[len] = ARCPhone.NewAppTextInputTile(self,previewText or "",true,118)
	self.Tiles[len].ID = len
            -- TODO: Translation
	self.Tiles[len]:SetPlaceholder("Enter your message")
	if len > 1 then
		self.Tiles[len].y = self.Tiles[len-1].y + self.Tiles[len-1].h + 4
	else
		self.Tiles[len].y = 24
	end
	self.Tiles[len].w = 118
	self.Tiles[len].x = 12
	self.Tiles[len].bgcolor = self.Phone.Settings.Personalization.CL_09_QuaternaryColour
	self.Tiles[len].color = self.Phone.Settings.Personalization.CL_11_QuaternaryText
	self.Tiles[len].Editable = true
	self:SetCurPos(len)
	
	len = len + 1
	
	self.InConvo = true
	self.SendIcon = len
	self.Tiles[len] = ARCPhone.NewAppTile(self)
	self.Tiles[len].ID = len
	self.Tiles[len].x = 12
	self.Tiles[len].y = self.Tiles[len-1].y + self.Tiles[len-1].h + 2
	self.Tiles[len].w = 118
	self.Tiles[len].h = 18
	self.Tiles[len].color = self.Phone.Settings.Personalization.CL_22_PopupAccept
	self.Tiles[len].drawfunc = function(tile,x,y)
            -- TODO: Translation
		draw.SimpleText("SEND", "ARCPhone", x+tile.w*0.5, y+tile.h*0.5, self.Phone.Settings.Personalization.CL_23_PopupAcceptText, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER) 
	end
	--self.Tiles[len].OnPressed = function(tile)
	--end
	self.Tiles[len].OnUnPressed = function(tile)
		local msg = tile.App.Tiles[tile.App.SendIcon-1].TextInput
		if msg ~= "" and tile.App.Phone:SendText(num,msg) then
			tile.App.Tiles[tile.App.SendIcon-1]:SetText("")
			self:UpdateCurrentConvo(os.time(),msg,true)
		end
	end
end

function APP:ForegroundThink()
	if self.InConvo then
		self.Tiles[self.SendIcon].y = self.Tiles[self.SendIcon-1].y + self.Tiles[self.SendIcon-1].h + 2
	end
end

function APP:NewConvo()
            -- TODO: Translation
	Derma_StringRequest("ARCPhone","Enter the phone number of the person you want to text","",function( text ) 
		if ARCPhone.IsValidPhoneNumber(text) then
			self:OpenConvo(text)
		else
            -- TODO: Translation
			ARCPhone.PhoneSys:AddMsgBox("Invalid phone number","The phone number you entered was invalid","warning")
		end
	end)
end
function APP:Init()
	self:ResetCurPos()
	self.Home = true
	self.Tiles = {}
	self.InConvo = false
            -- TODO: Translation
	self:RemoveMenuOption("Attach Photo")
	self.OpenNumber = ""
	
	local files,_ = file.Find(ARCPhone.ROOTDIR.."/messaging/*", "DATA", "datedesc")
	--ARCPhone.Apps["contacts"].Disk
	local len = #files
	for i=1,len do
		local num = string.sub( files[i], 1, #files[i]-4 )
		local disp = ARCPhone.Apps["contacts"]:GetNameFromNumber(num)
		if disp == "Unknown" then
			disp = num
		end
		self.Tiles[i] = ARCPhone.NewAppTile(self)
		self.Tiles[i].ID = i
		self.Tiles[i].x = 8
		self.Tiles[i].y = 10 + i*22
		self.Tiles[i].w = 122
		self.Tiles[i].h = 18
		self.Tiles[i].color = self.Phone.Settings.Personalization.CL_01_MainColour
		self.Tiles[i].drawfunc = function(tile,x,y)
			draw.SimpleText(disp, "ARCPhone", x+tile.w*0.5, y+tile.h*0.5, self.Phone.Settings.Personalization.CL_03_MainText, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER) 
		end
		self.Tiles[i].OnPressed = function(tile)
			tile.color = self.Phone.Settings.Personalization.CL_02_MainPressed
		end
		self.Tiles[i].OnUnPressed = function(tile)
			tile.color = self.Phone.Settings.Personalization.CL_01_MainColour
			tile.App:OpenConvo(num)
		end
	end
	len = len + 1
	self.Tiles[len] = ARCPhone.NewAppTile(self)
	self.Tiles[len].ID = len
	self.Tiles[len].x = 8
	self.Tiles[len].y = 10 + len*22
	self.Tiles[len].w = 122
	self.Tiles[len].h = 18
	self.Tiles[len].color = self.Phone.Settings.Personalization.CL_06_TertiaryColour
	self.Tiles[len].drawfunc = function(tile,x,y)
            -- TODO: Translation
		draw.SimpleText("**New Conversation**", "ARCPhone", x+tile.w*0.5, y+tile.h*0.5, self.Phone.Settings.Personalization.CL_08_TertiaryText, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER) 
	end
	self.Tiles[len].OnPressed = function(tile)
		tile.color = self.Phone.Settings.Personalization.CL_07_TertiaryPressed
	end
	self.Tiles[len].OnUnPressed = function(tile)
		tile.color = self.Phone.Settings.Personalization.CL_06_TertiaryColour
		--tile.App:NewConvo()
            -- TODO: Translation
		ARCPhone.PhoneSys:AddMsgBox("COMING SOON!","Please select a person to from your contact list (This button will have you choose between a contact and a new number in a future update)")
	end
	--[[
	self.Tiles[1] = ARCPhone.NewAppTextInputTile("This is a text input tile, but it isn't editable because the Editable variable has been set to false")
	self.Tiles[1].x = 8
	self.Tiles[1].y = 154
	self.Tiles[1].w = 122
	self.Tiles[1].h = 40
	self.Tiles[1].color = Color(0,0,255,255)
	self.Tiles[1].Editable = false

	self.Tiles[2] = ARCPhone.NewAppTextInputTile("This is resizeable tile. This one is editable",true)
	self.Tiles[2].x = 8
	self.Tiles[2].y = 204
	self.Tiles[2].w = 122
	self.Tiles[2].h = 40
	self.Tiles[2].color = Color(0,0,255,255)
	]]
	
	
	
end
//APP:Init()
function APP:OnBack()
	if self.Home then
		self:Close()
	else
		self:Init()
	end
end
ARCPhone.RegisterApp(APP,"messaging")
