// =============================================================================
// Briefings go here!
// don't forget to add a "<br/>" every time you want to break a line down.
// =============================================================================

// =============================================================================
//  RADIO FREQUENCIES, GENERATED AUTOMATICALLY IF YOU HAVE THE PLUGIN ENABLED.
// =============================================================================

mission_author_name = [mission_author_name] call BRM_fnc_verboseArray;

// =============================================================================

player createDiaryRecord ["Diary", ["Creditos","
<font color='#E6E6E6' size='14'>CREDITOS</font><br/>
<font color='#9DA698'>Misión versión <font color='#E6E6E6'>" + mission_version + "</font> hecha por <font color='#E6E6E6'>" + mission_author_name + "</font> para la CTS <font color='#E6E6E6'>http://www.CTSarma.es</font><br/><br/>
Framework ensamblado por <font color='#E6E6E6'>Proxen</font> usando el trabajo de:<br/>
BromA Mission Making Team <font color='#E6E6E6'>http://broma.co.uk</font><br/>
Whiztler's ADF Framework <font color='#E6E6E6'>https://github.com/whiztler/ADF</font><br/>
Todos los creditos para sus respectivos autores.</font>"]];


player createDiaryRecord ["Diary",["Sistema Médico",
// =============================================================================
"
<font color='#E6E6E6' size='14'>SISTEMA MÉDICO</font><br/>
<br/>
<font color='#E6E6E6' size='14'>Abrasiones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Caidas, quemaduras, colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy ligero.<br/>
         | Hemorragia - muy lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Básico/Compresivo/Elástico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Avulsiones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Explosiones, colisión con vehículo, impactos de proyectil.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy alto.<br/>
         | Hemorragia - muy rápida (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo.<br/>
         | Mediana - Compresivo y Básico.<br/>
         | Grande  - Compresivo x2.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Tejido triturado.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Impactos de proyectil, Back-blast, colisión con vehículo, caidas.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Sin Hemorragia.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico/Elástico/Quickclot.<br/>
         | Mediana - Elástico.<br/>
         | Grande  - Elástico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Cortes.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Colisión con vehículo, explosiones.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - rápida (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Básico.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Laceraciones.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta/intermedia (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo/Elástico.<br/>
         | Mediana - Elástico y Básico.<br/>
         | Grande  - Elástico y Quickclot.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Herida de bala.</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Impactos de proyectil, granadas y explosiones.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - muy alto.<br/>
         | Hemorragia - intermedia (depende del tamaño).<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Compresivo.<br/>
         | Mediana - Elástico y Básico.<br/>
         | Grande  - Quickclot x2.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Herida punzante</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Granadas.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico/Elástico.<br/>
         | Mediana - Compresivo y Quickclot.<br/>
         | Grande  - Elástico y Quickclot.<br/>
</font><br/>
<font color='#E6E6E6' size='14'>Contusiones.</font color>
<font color='#9DA698'><br/>
    | <font color='#E6E6E6'>Origen:</font> Caidas, colisión con vehículo.<br/>
    | <font color='#E6E6E6'>Efectos:</font><br/>
         | Dolor - ligero.<br/>
         | Hemorragia - lenta.<br/>
    | <font color='#E6E6E6'>Tratamiento:</font><br/>
         | Pequeña - Básico.<br/>
         | Mediana - Básico.<br/>
         | Grande  - Quickclot x2.<br/>
</font>
"]];

///// SUPPORT & LOGISTICS
player createDiaryRecord ["Diary",["Servicio y Apoyo", "
<font color='#E6E6E6' size='14'>EQUIPACIÓN</font><br/>
<font color='#9DA698'>Equipo estándar de CTS.

<br/><br/><font color='#E6E6E6' size='14'>VEHICULOS</font><br/>
Transporte:<br/>
- Lanchas de desembarco.<br/>
Combate:<br/>
- Plataforma de misiles Tomahawk en el submarino Barracuda.

<br/><br/><font color='#E6E6E6' size='14'>ZONA DE INICIO</font><br/>
El punto de inicio de la operación es en <font color='#FFA500'><marker name='mStart'>LZ CHARLIE</marker></font>.
</font>
"]];

player createDiaryRecord ["Diary",["Ejecución","
<font color='#E6E6E6' size='14'>EJECUCIÓN</font><br/>
<font color='#9DA698'>
Definido por Zero.<br/><br/>
</font>
"]];

player createDiaryRecord ["Diary",["Misión","
<font color='#E6E6E6' size='14'>MISIÓN</font><br/>
<font color='#9DA698'>Los objetivos son: <br/><br/>
Principales<br/>
- Destruir el complejo de radar situado en <font color='#FFA500'><marker name='mLima'>Mike 26</marker></font>.<br/>
- Abandonar la zona y exfiltrar en el submarino <font color='#FFA500'><marker name='mEnd'>Barracuda</marker></font>.<br/>
</font>
"]];


///// SITUATION
player createDiaryRecord ["Diary",["Situación", "
<font color='#E6E6E6' size='14'>SITUACIÓN</font>
<br/><font color='#9DA698'>
Como parte de los conflictos que se van a iniciar en la zona, se nos ha elegido para destruir un emplazamiento de radar situado en la estación Mike 26.<br/>
Dado que la zona esta fuertemente armada, usaremos la posición de ventaja ofrecida por el Campamento Maxwell para solicitar el lanzamiento de un misil Tomahawk desde el submarino Barracuda. Tenga en cuenta que solo tendremos una oportunidad para esto.<br/><br/>
Tras destruir el emplazamiento, deberan extraer de vuelta al Barracuda.

<br/><br/><font color='#E6E6E6' size='14'>INTELIGENCIA SOBRE EL ENEMIGO</font><br/>
Tropas regulares del CSAT irani estacionados en la estación Mike 26.<br/>
Contingente del PMC ION asentados en el Campamento Maxwell.<br/>
Posibilidad de refuerzos por parte del CSAT.

<br/><br/><font color='#E6E6E6' size='14'>TERRENO</font><br/>
Pequeñas poblaciones dispersas por la isla, vegetación y cobertura abundante, visibilidad limitada en zonas boscosas.<br/>

<br/><br/><font color='#E6E6E6' size='14'>CLIMATOLOGÍA</font><br/>
La misión comienza a las 1100H Zulú. Cielos nublados, humedad intermedia, buena visibilidad.
</font>
"]];

///// LOG
player createDiarySubject ["CTS Log","CTS Log"];
player createDiaryRecord ["CTS Log",["Comunicaciones","<br/><br/><font color='#9DA698'>El historial de comunicaciones almacena todos los mensajes transmitidos entre la CTS y HQ<br/>Los mensajes se guardan después de que aparezcan en pantalla en orden de aparición.</font><br/><br/>"]];
