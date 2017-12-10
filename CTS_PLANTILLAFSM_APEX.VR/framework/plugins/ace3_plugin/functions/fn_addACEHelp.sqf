// =============================================================================
_index = player createDiarySubject ["ACE 3","ACE 3 Medical"];
// =============================================================================

player createDiaryRecord ["ACE 3",["

 Sistema Médico
",
// =============================================================================
"
<font color='#E6E6E6' size='14'>SISTEMA MÉDICO</font>      		<br/>

<br/>
<font color='#E6E6E6' size='14'>Abrasiones<br/></font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Caidas, quemaduras, colisión con vehículo.		<br/>
    | <font color='#E6E6E6'>Efectos:</font>											<br/>
         | Dolor - muy ligero									<br/>
         | Hemorragia - muy lenta								<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>                                             <br/>
         | Pequeña - Básico                             <br/>
         | Mediana - Básico                             <br/>
         | Grande  - Básico/Compresivo/Elástico         <br/>
</font>															<br/>
<font color='#E6E6E6' size='14'>Avulsiones</font color><br/>
<font color='#9DA698'>
    | <font color='#E6E6E6'>Origen:</font> Explosiones, colisión con vehículo, impactos de proyectil.	<br/>
    | Efectos 														<br/>
         | Dolor - muy alto	<br/>
         | Hemorragia - muy rápida (depende del tamaño)<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Compresivo                         <br/>
         | Mediana - Compresivo y Básico                <br/>
         | Grande  - Compresivo x2                      <br/>
</font> 													<br/>
<font color='#E6E6E6' size='14'>Tejido triturado<br/></font color><br/>
<font color='#9DA698'>
    | Origen: Impactos de proyectil, Back-blast, colisión con vehículo, caidas.		<br/>
    | Efectos 														<br/>
         | Dolor - ligero											<br/>
         | Sin Hemorragia												<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Básico/Elástico/Quickclot          <br/>
         | Mediana - Elástico                           <br/>
         | Grande  - Elástico                           <br/>
</font>                                                 <br/>
<font color='#E6E6E6' size='14'>Cortes<br/></font color><br/>
<font color='#9DA698'>
    | Origen: Colisión con vehículo, explosiones.						<br/>
    | Efectos 														<br/>
         | Dolor - ligero												<br/>
         | Hemorragia - rápida (depende del tamaño)						<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Básico                           <br/>
         | Mediana - Básico                           <br/>
         | Grande  - Básico                           <br/>
</font>                                                 <br/>
<font color='#E6E6E6' size='14'>Laceraciones<br/></font color><br/>
<font color='#9DA698'>
    | Origen: Colisión con vehículo.									<br/>
    | Efectos 														<br/>
         | Dolor - ligero												<br/>
         | Hemorragia - lenta/intermedia (depende del tamaño)				<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Compresivo/Elástico              <br/>
         | Mediana - Elástico y Básico                <br/>
         | Grande  - Elástico y Quickclot             <br/>
</font>  																	<br/>
<font color='#E6E6E6' size='14'>Herida de bala</font color><br/>
<font color='#9DA698'>
    | Origen: Impactos de proyectil, granadas y explosiones.						<br/>
    | Efectos 														<br/>
         | Dolor - muy alto	<br/>
         | Hemorragia - intermedia (depende del tamaño)						<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Compresivo              <br/>
         | Mediana - Elástico y Básico                <br/>
         | Grande  - Quickclot x2                     <br/>
</font>                                                                     <br/>
<font color='#E6E6E6' size='14'>Herida punzante<br/></font color><br/>
    | Origen: Granadas.											<br/>
    | Efectos 														<br/>
         | Dolor - ligero												<br/>
         | Hemorragia - lenta											<br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Básico/Elástico              <br/>
         | Mediana - Compresivo y Quickclot                <br/>
         | Grande  - Elástico y Quickclot                     <br/>
</font>                                                                     <br/>
<font color='#E6E6E6' size='14'>Contusiones<br/></font color><br/>
    | Origen: Caidas, colisión con vehículo.                                         <br/>
    | Efectos                                                       <br/>
         | Dolor - ligero                                               <br/>
         | Hemorragia - lenta                                           <br/>
    | <font color='#E6E6E6'>Tratamiento:</font>
         | Pequeña - Básico              <br/>
         | Mediana - Básico                <br/>
         | Grande  - Quickclot x2                     <br/>
</font>                                                                     <br/>


"]];
//quickclot vendaje basico
//basic basico
//packing compresivo
//elastica
// =============================================================================

player createDiaryRecord ["ACE 3",["

 - Wounds (Basic Information)
",
// =============================================================================
"
Wounds which are bleeding are treated by bandages, which will stop the bleeding. Wounds which are not bleeding can only be treated with PAK's, but are not required to be treated.<br/>
There are two basic types of wounds: 									<br/><br/>
- x <font color='#ff0000'>Gunshot / Explosion Wounds</font color> 		<br/>
    Bandaged with <font color='#FFFF00'>Packing Bandages</font color>	<br/>
    Caused by projectile impacts and explosions							<br/>
    These wounds bleed fast and should be bandaged ASAP.				<br/>
- x <font color='#00FFFF'>Non-Gunshot Wounds</font color>  				<br/>
    Bandaged with <font color='#00FF00'>Elastic Bandages</font color>	<br/>
    Caused by vehicle collisions and falling							<br/>
    These wounds bleed a lot slower.									<br/>

"]];
// =============================================================================


// =============================================================================


player createDiaryRecord ["ACE 3",["

 - Drugs
",
// =============================================================================
"
All of these drugs should only be administered one dose at a time and only when
required, drug abuse will lead to death.<br/>
<br/>
There are three types of drugs: 										<br/>
- x <font color='#FFFF00'>Morphine</font color> 						<br/>
    Morphine cures pain and reduces heart rate							<br/>
    Should only be used when in a lot of pain							<br/>
    and bleeding has been reduced to minimum							<br/>
    Usage: MAX 1 Every 30 minutes<br/>
    Effects on (HR)heart rate<br/>
    if HR < 45 will drop HR by 10 to 30<br/>
    if HR > 45 will drop HR by 10 to 50<br/>
    if HR > 120 will drop HR by 10 to 40<br/>
- x <font color='#00FFFF'>Epinephrine</font color>  					<br/>
    Cures unconsciousness.												<br/>
    Also increases heart rate and blood pressure.						<br/>
	Effects on (HR)heart rate<br/>
	if HR < 45 will increase HR by 10 to 20<br/>
	if HR > 45 will increase HR by 10 to 50<br/>
	if HR > 120 will increase HR by 10 to 40<br/>
- x <font color='#00FF00'>Atropine</font color>  						<br/>
    Used to control laughing and crying episodes that are caused by brain tumours.<br/>
																		<br/>


"]];
// =============================================================================


// =============================================================================


player createDiaryRecord ["ACE 3",["

 - Equipment
",
// =============================================================================
"

<br/>

- x <font color='#FFFF00'>Personal Aid Kit (PAK)</font color> 			<br/>
    Only used by medics (mission specific)								<br/>
    Can be used everywhere (mission specific)							<br/>
    Treats ALL wounds and heals to MAX health							<br/>
    Used up on treatment (mission specific)								<br/>
- x <font color='#00FFFF'>Surgical Kit</font color>  					<br/>
    Only used by medics (mission specific)								<br/>
    Used to stitch wounds to prevent them re-opening					<br/>
    Can be used at medical facilities (mission specific)				<br/>
    Not used up on treatment (mission specific)							<br/>
- x <font color='#00FF00'>Tourniquet</font color>  						<br/>
    Used by everyone													<br/>
    Stops blood flow to a limb											<br/>
    Causes immense amounts of pain										<br/>
- x <font color='#ff0000'>Blood Bags</font color>  						<br/>
    Saline IV, Blood IV and Plasma IV									<br/>
    All have the same effect											<br/>
    They increase blood pressure 										<br/>
    Take a while to transfuse after applied								<br/>


"]];
// =============================================================================


// =============================================================================
player createDiaryRecord ["ACE 3",["

Medical
",
// =============================================================================
"
Information about using the ACE 3 Advanced medical system.				<br/><br/><font color='#FFFF00'>
To fix ANYONE to full health, regardless of how damaged a patient is, use a PAK (Personal Aid Kit)<br/></font color><font color='#ff0000'>
Use Surgical Kits to sew up wounds if they re-open after bandaging<br/><br/></font color>
<br/>
CONSCIOUS Patient:<br/><font color='#00FF00'>
1. - Stop the bleeding:<br/></font color>
    -  Packing bandages for avulsions and velocity wounds<br/>
    -  Elastic bandages for everything else<br/>
    -  All bandages work, but these work best<br/>
    -  Use a tourniquet on limbs if bleeding is pronounced<br/>
    -  Remove the tourniquet once bleeding has stopped<br/><font color='#00FFFF'>
2. - If patient is in pain:<br/></font color>
    -  Check the patient's HR (Heart Rate), if it's lower than 80:<br/>
    -  Administer a dose of epinephrine to raise the patient's HR.<br/>
    -  HR lower than 35 will cause death.<br/><font color='#FFFF00'>
3. - If patient has lost a lot of blood:<br/></font color>
    -  Administering a dose of epinephrine will increase BP (Blood Pressure)<br/>
    -  Using Blood/Plasma/Saline IV's will increase BP<br/><br/>
UNCONSCIOUS Patient:<br/><font color='#00FF00'>
1. - Control the patient's bleeding<br/></font color><font color='#00FFFF'>
2. - Diagnose the cause of patient's unconsciousness<br/></font color>
    -  Pain can cause unconsciousness<br/>
    -  Low Blood Pressure can cause unconsciousness<br/>
    -  Explosions/back-blast/punches/etc can also cause loss of a conscious state.<br/><font color='#FFFF00'>
3. - Apply appropriate treatment<br/></font color>
    -  Epinephrine increases HR and BP<br/>
    -  Use a IV bag if BP is very low<br/>
    -  If BP is fine and patient is in pain and won't respond use morphine as a last resort<br/>
CARDIAC ARREST/HEART ATTACK:<br/>
    -  Patient has no Heart Rate<br/><font color='#00FF00'>
1. - Bandage wounds<br/></font color>
    -  If very low BP<br/><font color='#00FFFF'>
2. - Administer an IV bag<br/></font color><font color='#FFFF00'>
3. - Apply CPR<br/></font color></font color><font color='#ff0000'>
4. - If CPR keeps failing administer a dose of epinephrine<br/></font color>
<br/><br/><br/><br/>

I am still not 100% sure how things work and if some things are either features or bugs<br/>
If you have any information about the ACE 3 Advanced Medical System then contact me.<br/>
                    Made by nigel<br/>
                    22.June.2015<br/>
"]];
// =============================================================================