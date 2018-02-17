
/*
================================================================================

NAME:
    Plugin List.

AUTHOR(s):
    All collaborators.

DESCRIPTION:
    Comentad las líneas de los plugins que no queráis utilizar.

USAGE:
    #include "my_plugin\main.cpp"

================================================================================
*/

#include "headless_client\main.cpp"     //Config HC
#include "team_roster\main.cpp"         //ORBAT
#include "tfar_plugin\main.cpp"         //Asigna frecuencias TFAR
//#include "acre2_plugin\main.cpp"        //Asigna frecuencias ACRE
#include "map_cover\main.cpp"           //Marca AO en mapa
#include "loading_screen\main.cpp"      //Pantalla inicial de espera
#include "intros\main.cpp"              //Intros
#include "dac_plugin\main.cpp"          //Config DAC
#include "f_evade_escape\main.cpp"      //Extracción al finalizar objetivos
#include "f_casualties_cap\main.cpp"    //Finaliza misión si mueren todos los jugadores
#include "f_remove_body\main.cpp"       //Limpia cadáveres
#include "mission_maker_tools\main.cpp" //Scripts debug
#include "jip_teleport\main.cpp"        //JIP. Necesita testeo.
//#include "ocap_plugin\main.cpp"         //OCAP plugin
#include "aircraft\main.cpp"
//#include "t8\main.cpp"                //T8
//#include "civilian_casualty_cap\main.cpp" //Finaliza misión si las bajas civiles son altas. Necesita testeo.
//#include "time_limit\main.cpp"        //Limite de tiempo. Necesita testeo.
//#include "ace3_plugin\main.cpp"       //No usar
