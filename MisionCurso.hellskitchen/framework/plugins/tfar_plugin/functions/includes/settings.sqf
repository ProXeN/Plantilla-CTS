if (isNil "tf_same_sw_frequencies_for_side") then { tf_same_sw_frequencies_for_side = true };

if (isNil "tf_same_lr_frequencies_for_side") then { tf_same_lr_frequencies_for_side = true };

if (isNil "tf_no_auto_long_range_radio") then { tf_no_auto_long_range_radio = true };

if (isNil "TF_give_personal_radio_to_regular_soldier") then { TF_give_personal_radio_to_regular_soldier = false };

if (isNil "TF_give_microdagr_to_soldier") then { TF_give_microdagr_to_soldier = false };

// Defaultradios and decryption
tf_west_radio_code = "brk2014"; // Default: _blufor
tf_east_radio_code = "brk2014"; // Default: _opfor
tf_guer_radio_code = "brk2014"; // Default: _independent

tf_freq_west 	= [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_west_radio_code, -1, 0];
tf_freq_west_lr = [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_west_radio_code, -1, 0];
tf_freq_east  	= [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_east_radio_code, -1, 0];
tf_freq_east_lr = [3 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_east_radio_code, -1, 0];
tf_freq_guer 	= [0 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_guer_radio_code, -1, 0];
tf_freq_guer_lr = [3 ,7, ["31","32","33","34","35","36","37","38","39"],0, tf_guer_radio_code, -1, 0];