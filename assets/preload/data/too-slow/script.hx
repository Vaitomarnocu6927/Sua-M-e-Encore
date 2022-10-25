var curSection = 0;
var stepDev = 0;
var defaultNotePos = [];
var noteMoveSettings = [0, 0];

function onCreate()
{
	PlayState.curCamera.dadPos[1] = 550;
	PlayState.curCamera.dadZoom = 1.0;

	if (!dadMap.exists("sonic"))
	{
		addCharacterToList("sonic", 0);
	}
	if (!dadMap.exists("mega-sonic"))
	{
		addCharacterToList("mega-sonic", 0);
	}
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

	if (curSection >= 26 && curSection <= 33)
	{
		if (curStep % 8 == 0)
		{
			addCamZoom(0.2, 0.07);
		}
	}

	if (curSection >= 34 && curSection <= 41 || curSection >= 43 && curSection <= 45 || curSection >= 47 && curSection <= 49 || curSection >= 66
		&& curSection <= 73 || curSection >= 82 && curSection <= 88 || curSection >= 90 && curSection <= 91)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.15, 0.06);
		}
	}

	if (curStep == 672 || curStep == 680 || curStep == 737 || curStep == 744 || curStep == 1424 || curStep == 1428 || curStep == 1432 || curStep == 1436
		|| curStep == 1472 || curStep == 1479 || curStep == 1486 || curStep == 1490)
	{
		addCamZoom(0.2, 0.07);
	}

	if (curSection >= 50 && curSection <= 57 || curSection >= 74 && curSection <= 81 || curSection >= 94 && curSection <= 109)
	{
		if (curStep % 4 == 0)
		{
			addCamZoom(0.2, 0.08);
		}
	}

	if (curSection >= 110 && curSection <= 125)
	{
		if (curStep % 8 == 0)
		{
			addCamZoom(0.25, 0.082);
		}
	}

	switch (curStep)
	{
		case 1:
			PlayState.cutsceneText.alpha = 0;
			PlayState.cutsceneText.visible = true;
			PlayState.cutsceneText.size = 32;
			PlayState.cutsceneText.fieldWidth = 1000;
			PlayState.cutsceneText.x = 170;
			PlayState.cutsceneText.y = 600;
		case 416:
			noteMoveSettings = [0, 5];
			triggerEventNote("Change Character", "dad", "sonic");
		case 800:
			noteMoveSettings = [0, -5];
		case 928:
			FlxTween.tween(PlayState.camHUD, {alpha: 0}, 0.7);
			PlayState.addCinematicBars(1, 12);

			PlayState.followChars = false;
		case 930:
			PlayState.vocals.volume = 1;
			PlayState.camZooming = false;
			FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1);
			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x - 155, PlayState.dad.getGraphicMidpoint().y - 150);
			FlxTween.tween(PlayState.cutsceneText, {alpha: 1}, 0.3);
			PlayState.cutsceneText.text = "I'm gonna GETCHA!.";
			PlayState.cutsceneText.applyMarkup("I'm gonna $GETCHA!.$",
				[new FlxTextFormatMarkerPair(new FlxTextFormat(fromRGB(214, 32, 32)), "$")]);
		case 960:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 0}, 0.4);
		case 966:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 1}, 0.3);
			PlayState.cutsceneText.text = "I AM...";
		case 980:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 0}, 0.4);
		case 983:
			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x - 5, PlayState.dad.getGraphicMidpoint().y - 120);
		case 986:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 1}, 0.3);
			PlayState.cutsceneText.text = "GOD!!!";
			PlayState.cutsceneText.applyMarkup("$GOD!!!$", [new FlxTextFormatMarkerPair(new FlxTextFormat(fromRGB(214, 32, 32)), "$")]);
		case 1004:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 0}, 0.4);
		case 1008:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 1}, 0.3);
			PlayState.cutsceneText.text = "*Maniacal Laughter*";
			PlayState.cutsceneText.applyMarkup("$*Maniacal Laughter*$", [new FlxTextFormatMarkerPair(new FlxTextFormat(fromRGB(214, 32, 32)), "$")]);
		case 1012:
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 0.2);
			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x - 155, PlayState.dad.getGraphicMidpoint().y - 220);
		case 1032:
			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x - 155, PlayState.dad.getGraphicMidpoint().y - 390);
		case 1055:
			FlxTween.tween(PlayState.cutsceneText, {alpha: 0}, 0.4);
		case 1056:
			triggerEventNote("Change Character", "dad", "mega-sonic");
		case 1043:
			noteMoveSettings = [5, 0];

			PlayState.removeCinematicBars(1);
			FlxTween.tween(PlayState.camHUD, {alpha: 1}, 1);
			FlxTween.tween(FlxG.camera, {zoom: 1}, 1);

			PlayState.followChars = true;
		case 1443:
			PlayState.curCamera.dadPos[1] = 513;
			PlayState.curCamera.dadZoom = 0.8;

		case 2025:
			FlxG.camera.fade(FlxColor.BLACK, 4);

		case 2036:
			FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.5, {ease: FlxEase.sineIn});
	}
}

function addCamZoom(game, hud)
{
	PlayState.camGame.zoom += game;
	PlayState.camHUD.zoom += hud;
}
