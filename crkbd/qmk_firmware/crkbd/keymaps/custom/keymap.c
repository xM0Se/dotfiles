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

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------.                    ,-----------------------------------------------------------------------------------.
      MEH(KC_Q),    KC_Q,         KC_W,         KC_F,         KC_P,         KC_B,                              KC_J,         KC_L,         KC_U,         KC_Y,         MEH(KC_L),    MEH(KC_U),
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
      MEH(KC_A),    LCTL_T(KC_A), LGUI_T(KC_R), LSFT_T(KC_S), LALT_T(KC_T), KC_G,                              KC_M,         RALT_T(KC_N), RSFT_T(KC_E), RGUI_T(KC_I), RCTL_T(KC_O), MEH(KC_P),
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
      MEH(KC_Z),    KC_Z,         KC_X,         KC_C,         KC_D,         KC_V,                              KC_K,         KC_BSPC,      KC_H,         KC_DOT,       KC_COMM,      MEH(KC_X),
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
                                                                       KC_NO,   KC_SPC,  TT(1),      KC_ENT,   KC_ESC, TT(2)
                                                                    //`--------------------------'  `--------------------------'

  ),

    [1] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------.                    ,-----------------------------------------------------------------------------------.
      KC_F1,        KC_F2,        KC_F3,        KC_F4,        KC_F5,        KC_F6,                             KC_F7,        KC_F8,        KC_F9,        KC_F10,       KC_F11,       KC_F12,
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
      HYPR(KC_Q),   LCTL_T(KC_1), LGUI_T(KC_2), LSFT_T(KC_3), LALT_T(KC_4), KC_5,                              KC_6,         RALT_T(KC_7), RSFT_T(KC_8), RGUI_T(KC_9), RCTL_T(KC_0), HYPR(KC_0),
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
      HYPR(KC_W),   HYPR(KC_F),   HYPR(KC_P),   HYPR(KC_B),   HYPR(KC_J),   HYPR(KC_L),                        HYPR(KC_U),   KC_BSPC,      HYPR(KC_A),   HYPR(KC_R),   HYPR(KC_S),   HYPR(KC_T),
  //|-------------+-------------+-------------+-------------+-------------+-------------|                    |-------------+-------------+-------------+-------------+-------------+-------------|
                                                                       TO(0),   KC_SPC,  TT(2),      KC_ENT,   KC_ESC, TT(3)
                                                                    //`--------------------------'  `--------------------------'
  ),

    [2] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------------------------------------------------------------------------.                    ,-----------------------------------------------------------------------------------.
      KC_MUTE,      KC_LBRC,      KC_PERC,      KC_PIPE,      KC_PPLS,      KC_AT,                             KC_AMPR,      KC_LT,        KC_GT,        KC_DQUO,      KC_TILD,      KC_UNDS,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|
      KC_NO,        LCTL_T(KC_RBRC), LGUI_T(KC_PEQL), KC_LSFT(KC_PMNS), LALT_T(KC_PAST), KC_DLR,               KC_EXLM,      KC_EQL, KC_LBRC, KC_RBRC, KC_BSLS,  KC_GRV,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|
      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_UNDS, KC_PLUS, KC_LCBR, KC_RCBR, KC_PIPE, KC_TILD,
  //|-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|                    |-------------------+-------------------+-------------------+-------------------+-------------------+-------------------|
                                          KC_LGUI,   MO(3),  KC_SPC,     KC_ENT, _______, KC_RALT
                                      //`--------------------------'  `--------------------------'
  ),

    [3] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      QK_BOOT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RM_TOGG, RM_HUEU, RM_SATU, RM_VALU, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RM_NEXT, RM_HUED, RM_SATD, RM_VALD, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI, _______,  KC_SPC,     KC_ENT, _______, KC_RALT
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
