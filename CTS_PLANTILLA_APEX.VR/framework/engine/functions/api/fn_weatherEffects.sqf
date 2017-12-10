/* Create the weather effect fsm.
 * This function must be called on each client. The parameter array is automatically
 * passed on to the FSM.
 *
 * Parameters:
 *  param [0] - Object that the particle system will be attached to,
 *              objNull for camera
 *
 *  param [1] - List of effects and their selectors
 *
 *
 * Selectors work like this:
 *  Each entry in the effect list is an array of ["name", {code}].
 *    Name is either snow, fog, sand, wind.
 *    Code is the code that evaluates whether the effect is shown or not. Must return
 *    true or false. If always shown, code should be {true}
 *
 * Returns:
 *  The FSM handle
 *
 * Example: Let it snow, let it snow, let it snow
 *
 * [
 * 	objNull,
 * 	[["snow", {true}]]
 * ] call BRM_fnc_weatherEffects;
 *
 */

if (isNil "FHQ_EffectsFSM") then {
	FHQ_EffectsFSM = _this execFSM "framework\engine\functions\api\weatherEffects.fsm";
};

FHQ_EffectsFSM;
