-- This file is under copyright, and is bound to the agreement stated in the EULA.
-- Any 3rd party content has been used as either public domain or with permission.
-- © Copyright 2016-2017 Aritz Beobide-Cardinal All rights reserved.
function ARCPhone.PhoneSys:ChoiceInput(tile)
	self.ChoiceInputTile = tile
	tile.AnimStart = CurTime()
	tile.AnimEnd = CurTime() + 0.5
	--hook.Add("PlayerBindPress", "ARCPhone Block Movement", BockInput)
end
function ARCPhone.PhoneSys:ChoiceInputFunc(key)
	local s = self.Settings.System
	if key == s.KeyUp then
		self.ChoiceInputTile.ChoiceText = nil
		self.ChoiceInputTile.SelectedChoice = self.ChoiceInputTile.SelectedChoice - 1
		if self.ChoiceInputTile.SelectedChoice < 1 then
			self.ChoiceInputTile.SelectedChoice = 1
		end
	elseif key == s.KeyDown then
		self.ChoiceInputTile.ChoiceText = nil
		self.ChoiceInputTile.SelectedChoice = self.ChoiceInputTile.SelectedChoice + 1
		if self.ChoiceInputTile.SelectedChoice > #self.ChoiceInputTile.ChoiceKeys then
			self.ChoiceInputTile.SelectedChoice = #self.ChoiceInputTile.ChoiceKeys
		end
	end
end