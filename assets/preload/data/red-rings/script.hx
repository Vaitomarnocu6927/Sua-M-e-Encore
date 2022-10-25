var curSection = 0;
var stepDev = 0;
var defaultNotePos = [];
var noteMoveSettings = [0, 0];

function onCreate()
{
	PlayState.curCamera.dadPos[1] = 550;
	PlayState.curCamera.dadZoom = 1.0;
}

function onUpdate()
{
	if (noteMoveSettings != [0, 0])
	{
		var currentBeat = (Conductor.songPosition / 1000) * (bpm / 60);

		for (note in PlayState.strumLineNotes.members)
		{
			var i = PlayState.strumLineNotes.members.indexOf(note);

			note.x = defaultNotePos[i][0] + noteMoveSettings[0] * Math.sin((currentBeat + i * 0.25) * Math.PI);
			note.y = defaultNotePos[i][1] + noteMoveSettings[1] * Math.cos((currentBeat + i * 0.25) * Math.PI);
		}
	}
}

function onStartCountdown()
{
	for (i in [0, 1, 2, 3, 4, 5, 6, 7])
	{
		defaultNotePos[i] = [
			PlayState.strumLineNotes.members[i].x,
			PlayState.isStoryMode ? PlayState.strumLineNotes.members[i].y + 10 : PlayState.strumLineNotes.members[i].y
		];
	}
}

function onStepHit()
{
	if (curStep % 16 == 0)
	{
		curSection = Math.floor(curStep / 16);
	}

	stepDev = Math.floor(curStep % 16) + 1;

	if (curSection >= 16 && curSection <= 47 || curSection >= 72 && curSection <= 79)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.08, 0.06);
		}
	}

	if (curSection >= 48 && curSection <= 63 || curSection >= 80 && curSection <= 111)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.15, 0.06);
		}
	}

	if (curStep == 1032 || curStep == 1062 || curStep == 1096 || curStep == 1126) 
	{
		PlayState.defaultCamZoom += 0.2;
	}

	switch (curStep) {
		case 245:
			FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1);
		case 256:
			FlxTween.tween(FlxG.camera, {zoom: 1}, 1);
		case 768:
			PlayState.addCinematicBars(1, 12);
		case 1152:
			PlayState.defaultCamZoom -= 0.8;
			PlayState.removeCinematicBars(1);
		case 1280:
			PlayState.addCinematicBars(1, 12);
		case 1792:
			PlayState.removeCinematicBars(1);
	}
}

function addCamZoom(game, hud)
{
	PlayState.camGame.zoom += game;
	PlayState.camHUD.zoom += hud;
}
