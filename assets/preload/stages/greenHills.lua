function onCreate()
	-- background shit
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-bunny-death'); --Character json file for the death animation

	if not lowQuality then
	
	makeLuaSprite('cielo', 'CIELO', 110, 100);
	scaleObject('cielo', 1.7, 1.5);
	setScrollFactor('cielo', 0.75, 0.75);
	addLuaSprite('cielo', false);
	
	makeLuaSprite('piso', 'PISO', 90, 190);
	scaleObject('piso',2.2, 2);
    addLuaSprite('piso', false);
    
 elseif lowQuality then
makeLuaSprite('ok', 'bg', 110, 100);
	scaleObject('ok', 2.2, 1.9);
	addLuaSprite('ok', false);
	
end
end