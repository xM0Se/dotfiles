/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

enum layer_names {
    _default_layer,
    _number_layer,
    _symbol_layer,
    _keyboard_layer,
    _arrow_layer,
};

enum layers {
    _BASE,
    _LAYER1,
    _LAYER2,
    _LAYER3,
    _LAYER4,
};

enum {
    TD_SPACE_ENTER_LAYER1,
    TD_BSPC_ALT_BSPC,
    TD_ESC_TT_LAYER_2
};

static bool td_space_enter_layer1_held = false;
void dance_space_enter_finished(tap_dance_state_t *state, void *user_data) {
    if (state->pressed) {

        td_space_enter_layer1_held = true;
        layer_on(_LAYER1);
    } else {

        td_space_enter_layer1_held = false;
        if (state->count == 1) {
            tap_code(KC_SPC);
        } else if (state->count == 2) {
            tap_code(KC_ENT);
        } else if (state->count == 5) {
            layer_on(_LAYER1);
        }
    }
}
void dance_space_enter_reset(tap_dance_state_t *state, void *user_data) {
    if (td_space_enter_layer1_held) {
        layer_off(_LAYER1);
        td_space_enter_layer1_held = false;
    }
}


static bool td_bspc_alt_bscp_held = false;
void dance_backspace_finished(tap_dance_state_t *state, void *user_data) {
    if (state->pressed) {

        td_bspc_alt_bscp_held = true;
        layer_on(_LAYER4);
    } else {

        if (state->count == 1) {
            tap_code(KC_BSPC);
        } else if (state->count == 2) {
            register_code(KC_LALT);
            tap_code(KC_BSPC);
            unregister_code(KC_LALT);
        }else if (state->count == 5) {
            layer_on(_LAYER4);
        }
    }
}

void td_bspc_alt_bscp_reset(tap_dance_state_t *state, void *user_data) {
    if (td_bspc_alt_bscp_held) {
        layer_off(_LAYER4);
        td_bspc_alt_bscp_held = false;
    }
}

static bool td_esc_tt_layer_2_held = false;
    void dance_esc_tt_fished(tap_dance_state_t *state, void *user_data) {
    if (state->pressed) {

        td_esc_tt_layer_2_held = true;
        layer_on(_LAYER2);
    } else {

        td_esc_tt_layer_2_held = false;
        if (state->count == 1) {
            tap_code(KC_ESC);
        } else if (state->count == 2) {
            tap_code(KC_DEL);
        } else if (state->count == 5) {
            layer_on(_LAYER2);
        }
    }
}
void dance_esc_tt_reset(tap_dance_state_t *state, void *user_data) {
    if (td_esc_tt_layer_2_held) {
        layer_off(_LAYER2);
        td_esc_tt_layer_2_held = false;
    }
}


tap_dance_action_t tap_dance_actions[] = {
    [TD_SPACE_ENTER_LAYER1] = ACTION_TAP_DANCE_FN_ADVANCED(NULL, dance_space_enter_finished, dance_space_enter_reset),
    [TD_BSPC_ALT_BSPC] = ACTION_TAP_DANCE_FN_ADVANCED(NULL, dance_backspace_finished, td_bspc_alt_bscp_reset),
    [TD_ESC_TT_LAYER_2] = ACTION_TAP_DANCE_FN_ADVANCED(NULL, dance_esc_tt_fished, dance_esc_tt_reset),
};



const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------------------------------------------.                    ,----------------------------------------------------------------------------------------------------------------------------.
      MEH(KC_Q),          KC_Q,               KC_W,               KC_F,               KC_P,               KC_B,                                     KC_J,               KC_L,                    KC_U,               KC_Y,               MEH(KC_L),          MEH(KC_U),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      MEH(KC_A),          LCTL_T(KC_A),       LGUI_T(KC_R),       LSFT_T(KC_S),       LALT_T(KC_T),       KC_G,                                     KC_M,               RALT_T(KC_N),            RSFT_T(KC_E),       RGUI_T(KC_I),       RCTL_T(KC_O),       MEH(KC_P),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      MEH(KC_Z),          KC_Z,               KC_X,               KC_C,               KC_D,               KC_V,                                     KC_K,               KC_H,                    KC_DOT,             KC_COMM,            MEH(KC_X),          MEH(KC_H),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
                                                                                                                    KC_NO,   TD(TD_SPACE_ENTER_LAYER1),  KC_TAB,     TD(TD_BSPC_ALT_BSPC),   TD(TD_ESC_TT_LAYER_2),   KC_NO
                                                                                                        //`--------------------------'  `--------------------------'

  ),

    [1] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------------------------------------------.                    ,----------------------------------------------------------------------------------------------------------------------------.
      KC_F1,              KC_F2,              KC_F3,              KC_F4,              KC_F5,              KC_F6,                                    KC_F7,              KC_F8,                   KC_F9,              KC_F10,             KC_F11,             KC_F12,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      HYPR(KC_Q),         LCTL_T(KC_1),       LGUI_T(KC_2),       LSFT_T(KC_3),       LALT_T(KC_4),       KC_5,                                     KC_6,               RALT_T(KC_7),            RSFT_T(KC_8),       RGUI_T(KC_9),       RCTL_T(KC_0),       HYPR(KC_0),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      HYPR(KC_W),         HYPR(KC_F),         HYPR(KC_P),         HYPR(KC_B),         HYPR(KC_J),         HYPR(KC_L),                               HYPR(KC_U),         HYPR(KC_A),              HYPR(KC_R),         HYPR(KC_S),         HYPR(KC_T),         HYPR(KC_E),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
                                                                                                            TO(0),   _______,   TT(2),     _______,   _______,   TT(3)
                                                                                                        //`--------------------------'  `--------------------------'

  ),

    [2] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------------------------------------------.                    ,----------------------------------------------------------------------------------------------------------------------------.
      MEH(KC_B),          KC_LBRC,            KC_PERC,            KC_PIPE,            KC_PPLS,            KC_AT,                                    KC_AMPR,            KC_LT,                   KC_GT,              KC_DQUO,            KC_TILD,            MEH(KC_J),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      MEH(KC_G),          LCTL_T(KC_RBRC),    LGUI_T(KC_PEQL),    LSFT_T(KC_PMNS),    LALT_T(KC_PAST),    KC_DLR,                                   KC_EXLM,            RALT_T(KC_SLSH),         RSFT_T(KC_BSLS),    RGUI_T(KC_DOT),     RCTL_T(KC_SCLN),    MEH(KC_M),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      MEH(KC_V),          KC_GRV,             KC_LPRN,            KC_RPRN,            KC_QUES,            KC_CIRC,                                  KC_LCBR,            KC_UNDS,                 KC_RCBR,            KC_HASH,            KC_COLN,            MEH(KC_K),
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
                                                                                                            TO(0),   _______,   TT(3),     _______,   _______,   KC_NO
                                                                                                        //`--------------------------'  `--------------------------'

  ),

    [3] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------------------------------------------.                    ,----------------------------------------------------------------------------------------------------------------------------.
      QK_BOOT,            XXXXXXX,            XXXXXXX,            XXXXXXX,            XXXXXXX,            XXXXXXX,                                  XXXXXXX,            XXXXXXX,                 XXXXXXX,            XXXXXXX,            XXXXXXX,            XXXXXXX,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      RM_TOGG,            RM_HUEU,            RM_SATU,            RM_VALU,            XXXXXXX,            XXXXXXX,                                  XXXXXXX,            XXXXXXX,                 XXXXXXX,            XXXXXXX,            XXXXXXX,            XXXXXXX,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      RM_NEXT,            RM_HUED,            RM_SATD,            RM_VALD,            XXXXXXX,            XXXXXXX,                                  XXXXXXX,            XXXXXXX,                 XXXXXXX,            XXXXXXX,            XXXXXXX,            XXXXXXX,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
                                                                                                            KC_LGUI,  _______,  KC_SPC,     KC_ENT,   _______,  KC_RALT
                                                                                                        //`--------------------------'  `--------------------------'
  ),

    [4] = LAYOUT_split_3x6_3(

  //,-----------------------------------------------------------------------------------------------------------------------.                    ,---------------------------------------------------------------------------------------------------------------------------.
      KC_NO,            KC_NO,               KC_NO,               KC_NO,             KC_NO,               KC_NO,                                   KC_NO,             KC_NO,                   KC_NO,              KC_NO,              KC_NO,              KC_NO,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      KC_NO,            KC_NO,               KC_NO,               KC_NO,             KC_NO,               KC_NO,                                   KC_NO,             KC_LEFT,                 KC_DOWN,            KC_UP,              KC_RGHT,            KC_NO,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
      KC_NO,            KC_NO,               KC_NO,               KC_NO,             KC_NO,               KC_NO,                                   KC_NO,             KC_NO,                   KC_NO,              KC_NO,              KC_NO,              KC_NO,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+------------------------+-------------------+-------------------+-------------------+-------------------|
                                                                                                            TO(0),  _______,  KC_SPC,     KC_ENT,   _______,  KC_RALT
                                                                                                        //`--------------------------'  `--------------------------'
  )
};

#ifdef ENCODER_MAP_ENABLE
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
  [0] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [1] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [2] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
  [3] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_MPRV, KC_MNXT), ENCODER_CCW_CW(RM_VALD, RM_VALU), ENCODER_CCW_CW(KC_RGHT, KC_LEFT), },
};

#endif

#ifdef OLED_ENABLE

bool oled_task_user(void) {

    if (is_keyboard_master()) {


        switch (get_highest_layer(layer_state)) {
            case _default_layer:
                oled_write("main layer", false);
                break;
            case _number_layer:
                oled_write("number layer", false);
                break;
            case _symbol_layer:
                oled_write("symbol layer", false);
                break;
            case _keyboard_layer:
                oled_write("idk layer", false);
                break;
            case _arrow_layer:
                oled_write("arrow layer", false);
                break;
        }
        return false;


    } else { /* left side ^ */ /* rigth side */

        oled_write("hello world",false);

    }
    return false;
}

#endif

