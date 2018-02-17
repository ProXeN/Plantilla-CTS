if ((!isMultiplayer)||(!hasInterface)) exitWith { intro_cutscene_over = true; };

if ((player_is_jip)||(player_is_spectator)) exitWith { intro_cutscene_over = true; };

intro_cutscene_over = false;

0 spawn {

_play = true;

if (isNil "intro_cutscene") then { intro_cutscene = "ESTABLISHING" };

waitUntil{!isNil "loading_screen_finished"};


if (!_play) exitWith { intro_cutscene_over = true };

_posPlayer = [getpos player select 0, getpos player select 1, getpos player select 2];

switch (intro_cutscene) do {
    #include "includes\intros.sqf"
};

intro_cutscene_over = true;

};
