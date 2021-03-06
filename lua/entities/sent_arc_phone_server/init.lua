-- This file is under copyright, and is bound to the agreement stated in the EULA.
-- Any 3rd party content has been used as either public domain or with permission.
-- © Copyright 2016-2017 Aritz Beobide-Cardinal All rights reserved.
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
ENT.ARitzDDProtected = true
function ENT:Initialize()
	self:SetModel( "models/props_lab/securitybank.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self.phys = self:GetPhysicsObject()
	if self.phys:IsValid() then
		self.phys:Wake()
	end
	--self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
	self.NoiseDelay = CurTime() + 1
	self.OnSound = CreateSound(self,"ambient/machines/combine_terminal_loop1.wav")
	self.OnSound:PlayEx(0.05,100)
	self:SetSubMaterial( 1, "models/arc/server/security_screen" ) 
	self:SetSubMaterial( 2, "models/arc/server/security_screen2" ) 
end
function ENT:SpawnFunction( ply, tr )
 	if ( !tr.Hit ) then return end
	local blarg = ents.Create ("sent_arc_phone_server")
	blarg:SetPos(tr.HitPos + tr.HitNormal * 40)
	blarg:Spawn()
	blarg:Activate()
	return blarg
end
--[[
function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg); -- React physically when getting shot/blown
	self.OurHealth = self.OurHealth - dmg:GetDamage(); -- Reduce the amount of damage took from our health-variable
	MsgN(self.OurHealth)
	if(self.OurHealth <= 0) then -- If our health-variable is zero or below it
		
	end
end
]]
function ENT:Think()
--local newdist = math.Round((v:GetPos():DistToSqr(self:GetPos())^-1)*40000000)
--[[
	for k,v in pairs(player.GetAll()) do
		local tr = util.TraceLine( {
			start = self:GetPos(),
			endpos = v:GetPos(),
			filter = self
		} )
		v:PrintMessage( HUD_PRINTTALK, "I'm new here." )
	end
	--]]
	if self.NoiseDelay < CurTime() then
		self:EmitSound("ambient/levels/prison/radio_random"..math.random(1,15)..".wav",60,math.random(50,125))
		self.NoiseDelay = CurTime() + math.Rand(0,6.5)
		self.OnSound:PlayEx(0.05,100)
	end
end

function ENT:OnRemove()
	self.OnSound:Stop()
end

function ENT:Use( ply, caller )--self:StopHack()

end
