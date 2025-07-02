
	.data

placeholder: .string "holder",0x00
ansiclear: .string 27,"[2J", 0x00
cursor_semicolon: .string ";",0x00
cursor_close: .string "H",0x00
ansi_header:	.string 27,"[",0x00

cursor_placeholder: .string "placehol",0x00
cursor_value:	.string "placehol",0x00

game_process:	.byte 0x00

paddle_state: 	.byte 0x00
ball_state:		.byte 0x00

clock_state:	.byte 0x00
pause_state:	.byte 0x00

power_up_xpos:	.byte 0
power_up_ypos:	.byte 0
power_up_color:	.byte 0
power_up_timer:	.byte 0

power_up_active: .byte 0

bluepaddle_state:	.byte 0x00
redpaddle_state:	.byte 0x00

blue_ypos: 	.byte 12
red_ypos: 	.byte 12

ball_xpos:	.byte 40
ball_ypos:	.byte 12

clock_value: .byte 0
collision_count:	.byte 0

pause_register: .byte 0

red_points: .byte 0
blue_points: .byte 0
winning_points: .byte 7

red_points_string: 	.string "placeholder",0x00
blue_points_string: 	.string "placeholder",0x00
clock_value_string:		.string "placeholder",0x00

ansi_up_all: .string 27,"[1000A",0x00
ansi_left_all: .string 27,"[1000D", 0x00

;	UART0

general_input:	.byte 0x00

power_up_clock:	.byte 12
power_up_arm:	.byte 0x00
picked:			.byte 0x00

; Prompt and Printables

message:			.string 0x00, "GAME MESSAGE:", 0x00
boot_prompt:		.string 27,"[48;5;232m","Press SPACE to Boot PONG", 0x00
starter_prompt:		.string 0x00, "Press SPACE to start the paddles",0x00

points_select:		.string 0x00, "CHOOSE AMOUNT OF POINTS:",0x00
SW5_prompt:			.string 0x00, "SW5 for 10 POINTS"
SW4_prompt:			.string 0x00, "SW4 for 7 POINTS"
SW3_prompt:			.string 0x00, "SW3 for 5 POINTS"
SW2_prompt:			.string 0x00, "SW2 for 3 POINTS"

pick_serve_1: 		.string 0x00, "Press 1: Player 1 serve to the Player 2's side",0x00
pick_serve_2:		.string 0x00, "Press 2: Player 2 serve to the Player 1's side",0x00
continue_prompt:	.string 0x00, "Press SPACE to start the next round",0x00
penalty_1:			.string 0x00, "Player 1 Received a Penalty",0x00
penalty_2:			.string 0x00, "Player 2 Received a Penalty",0x00

game_paused:		.string 0x00, "GAME IS PAUSED, PRESS SW1 TO UNPAUSE", 0x00
game_restart:	.string 0x00, "PRESS SPACE TO RESTART THE GAME",0x00
anykey:			.string 0x00, "ANY KEYS TO END THE GAME"
red_win_msg:		.string 0x00, "PLAYER 2 WIN",0x00
blue_win_msg:		.string 0x00, "PLAYER 1 WIN",0x00

clear_message: .string 0x00, 0x20, 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20, 0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x00
side_border: .string 0x18,0x20,0x00

saved_dir: 			.byte 0x00
penalty_state:		.byte 0x00

red_paddle_color:	.byte 0x00
blue_paddle_color:	.byte 0x00
ball_color:			.byte 0x00

red_paddle: .string	0x20, 0x00
blue_paddle: .string 0x20, 0x00

color_gray_clear:		.string 0xC,0x20,0x20,0x20,0x00

power_up:		.string 0x20, 0x00
ball:			.string 0x20, 0x00
black_clear:	.string 0x18, 0x20, 0x00

led_dance:		.byte 0x00

; TO USE LUT: first byte is the color and the second byte should be the string, NULL termination to stop printing.
LUT_addr_gray: 		.string 27,"[48;5;239m",0x00
LUT_addr_lightgray: .string 27,"[48;5;244m",0x00
LUT_addr_black: 	.string 27,"[48;5;232m",0x00
LUT_addr_red: 		.string 27,"[48;5;196m",0x00
LUT_addr_blue: 		.string 27,"[48;5;27m",0x00, 0x00
LUT_addr_white:		.string 27,"[48;5;231m",0x00


; Color for RANDOMIZATION-ish								G   B   R
ELE_HOLDER:			.string 27,"[48;5;232m",0x00		;0  0 | 0 | 0
ELE_RED:			.string 27,"[48;5;196m",0x00		;1  0 | 0 | 1
ELE_BLUE:			.string 27,"[48;5;21m",0x00,0x00	;2  0 | 1 | 0
ELE_PURPLE:			.string 27,"[48;5;177m",0x00		;3  0 | 1 | 1
ELE_GREEN:			.string 27,"[48;5;154m",0x00		;4  1 | 0 | 0
ELE_YELLOW:			.string 27,"[48;5;226m",0x00		;5  1 | 0 | 1
ELE_CYAN:			.string 27,"[48;5;117m",0x00		;6  1 | 1 | 0
ELE_WHITE:			.string 27,"[48;5;255m",0x00		;7  1 | 1 | 1

	.text
	.global read_character
	.global timer_intterupt_innit
	.global uart_interrupt_init
	.global gpio_interrupt_init
	.global gpio_btn_and_LED_init
	.global main_routine
	.global UART0_Handler
	.global Switch_Handler
	.global Timer_Handler
	.global Second_Timer_Handler
	.global output_character
	.global read_string
	.global output_string
	.global uart_init
	.global string2int
	.global int2string
	.global illuminate_RGB_LED
	.global power_up_randomizer
	.global mov_cursor
	.global set_color
	.global reset_cursor
	.global init_game
	.global print_clock_value
	.global update_score
	.global illuminate_LEDs
	.global read_from_push_btns
	.global background_gen

	.global ptr_to_power_up_xpos
	.global ptr_to_power_up_yposb
	.global ptr_to_side_border
	.global ptr_to_BLUEplayer
	.global ptr_to_REDplayer
	.global ptr_to_pong
	.global ptr_to_CLOCK



ptr_to_up_all: .word ansi_up_all
ptr_to_left_all: .word ansi_left_all

ptr_to_message: .word message
ptr_to_boot_prompt: .word boot_prompt
ptr_to_ansiclear: .word ansiclear


ptr_to_side_border: .word side_border


ptr_to_continue_prompt:	.word continue_prompt
ptr_to_winning_points:	.word winning_points

ptr_to_gray_color:	.word color_gray_clear



ptr_to_ball:			.word ball



ptr_to_starter_prompt:	.word starter_prompt
ptr_to_pick_serve1:	.word pick_serve_1
ptr_to_pick_serve2:	.word pick_serve_2


ptr_to_power_up:	.word power_up





ptr_to_blue_points_string:	.word blue_points_string
ptr_to_red_points_string:	.word red_points_string



ptr_to_red:		.word red_paddle
ptr_to_blue:	.word blue_paddle

ptr_to_clock_value_string:	.word clock_value_string


ptr_to_ansi_header:	.word ansi_header
ptr_to_cursor_semicolon: .word cursor_semicolon
ptr_to_cursor_close: .word cursor_close

ptr_to_cursor_placeholder: .word cursor_placeholder
ptr_to_cursor_value:	.word cursor_value



ptr_to_penalty_1:		.word penalty_1
ptr_to_penalty_2:		.word penalty_2

ptr_to_ELE:			 .word ELE_HOLDER
ptr_to_LUT_baseaddr: .word LUT_addr_gray


ptr_to_points_select:	.word points_select
ptr_to_SW5_prompt:		.word SW5_prompt
ptr_to_SW4_prompt:		.word SW4_prompt
ptr_to_SW3_prompt:		.word SW3_prompt
ptr_to_SW2_prompt:		.word SW2_prompt





game_boot: 			.equ 0x00
game_in_pending:	.equ 0x88
game_in_process: 	.equ 0xFF
game_in_close:		.equ 0x55


paddle_disabled: .equ 0x00
paddle_enabled: .equ 0xFF

penalty_enabled:	.equ 0xFF
penalty_disabled:	.equ 0x00


ball_state_stop: 		.equ 0x00
ball_state_right: 		.equ 0x31
ball_state_left: 		.equ 0x32
ball_state_up_right: 	.equ 0x41
ball_state_up_left: 	.equ 0x42
ball_state_down_right: 	.equ 0x51
ball_state_down_left: 	.equ 0x52

clock_enabled:			.equ 0xFF
clock_disabled:			.equ 0x00

UART_MODE_general_input:	.equ 0x00
UART_MODE_game_control:		.equ 0xFF

main_routine:

	PUSH {r4-r12,lr}
 	bl uart_init
	bl gpio_btn_and_LED_init
	bl uart_interrupt_init
	bl gpio_interrupt_init
	BL timer_intterupt_innit

	ldr r0, ptr_to_ansiclear
	bl output_string

	bl reset_cursor

	LDR r0, ptr_to_boot_prompt
	BL output_string

poll_boot_game:
	LDR r0, ptr_to_general_input
	LDRB r0, [r0]
	CMP r0, #0x00
	BEQ poll_boot_game

	bl init_game

	MOV r0, #83
	MOV r1, #50
	BL mov_cursor

	LDR r0, ptr_to_message
	BL set_color
	LDR r0, ptr_to_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

restart_game_full:


	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_starter_prompt
	BL set_color
	LDR r0, ptr_to_starter_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #0x00
	LDR r1, ptr_to_general_input
	STRB r0, [r1]

poll_press_space:
	LDR r0, ptr_to_general_input
	LDRB r0, [r0]
	CMP r0, #0x00
	BEQ poll_press_space

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_points_select
	BL set_color
	LDR r0, ptr_to_points_select
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_SW5_prompt
	BL set_color
	LDR r0, ptr_to_SW5_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #54
	BL mov_cursor

	LDR r0, ptr_to_SW4_prompt
	BL set_color
	LDR r0, ptr_to_SW4_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #55
	BL mov_cursor

	LDR r0, ptr_to_SW3_prompt
	BL set_color
	LDR r0, ptr_to_SW3_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #56
	BL mov_cursor

	LDR r0, ptr_to_SW2_prompt
	BL set_color
	LDR r0, ptr_to_SW2_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

read_from_push_btns_poll:

	BL read_from_push_btns
	CMP r0, #0x00
	BEQ read_from_push_btns_poll

	LDR r1, ptr_to_winning_points

	CMP r0, #0x8
	IT EQ
	MOVEQ r0, #10

	CMP r0, #0x4
	IT EQ
	MOVEQ r0, #7

	CMP r0, #0x2
	IT EQ
	MOVEQ r0, #5

	CMP r0, #0x1
	IT EQ
	MOVEQ r0, #3

	STRB r0, [r1]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #54
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #55
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #56
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	BL choose_color
	BL power_up_randomizer


	LDR r0, ptr_to_paddle_state
	MOV r1, #paddle_enabled
	STR r1, [r0]

	bl print_blue_paddle
	bl print_red_paddle
	bl print_ball

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_pick_serve1
	BL set_color
	LDR r0, ptr_to_pick_serve1
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor


	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_pick_serve2
	BL set_color
	LDR r0, ptr_to_pick_serve2
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	bl innit_dir

	LDR r0, ptr_to_power_up_arm
	MOV r1, #power_up_arm_enabled
	STRB r1, [r0]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor


restart_game:
	LDR r0, ptr_to_game_process
poll_game_process:
	LDRB r1, [r0]
	CMP r1, #game_in_process
	BEQ poll_game_process

	BL clear_power_up


	MOV r0, #0x00
	LDR r1, ptr_to_general_input
	STRB r0, [r1]

	BL print_ball

	LDR r0, ptr_to_clock_state
	MOV r1, #clock_disabled
	STRB r1, [r0]

	LDR r0, ptr_to_red_points
	LDRB r3, [r0]
	LDR r0, ptr_to_winning_points
	LDRB r2, [r0]
	CMP r3, r2
	BEQ DANCE_RED

	LDR r0, ptr_to_blue_points
	LDRB r3, [r0]
	LDR r0, ptr_to_winning_points
	LDRB r2, [r0]
	CMP r3, r2
	BEQ DANCE_BLUE

	LDR r0, ptr_to_game_process
	LDRB r1, [r0]
	CMP r1, #game_in_close
	BEQ GAME_RESTARTER


	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_continue_prompt
	BL set_color
	LDR r0, ptr_to_continue_prompt
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	LDR r0, ptr_to_penalty_state
	LDRB r0, [r0]
	CMP r0, #penalty_enabled
	BEQ penalty_string_print
	BNE poll_press_space_to_continue

penalty_string_print:

	LDR r0, ptr_to_penalty_state
	MOV r1, #penalty_disabled
	STRB r1, [r0]

	ldr r0, ptr_to_saved_dir
	LDRB r0, [r0]
	AND r0, r0, #0xF
	CMP r0, #1
	ITE EQ
	ldrEQ r4, ptr_to_penalty_1
	ldrNE r4, ptr_to_penalty_2

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor
	MOV r0, r4
	BL set_color
	MOV r0, r4
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

poll_press_space_to_continue:
	LDR r0, ptr_to_general_input
	LDRB r0, [r0]
	CMP r0, #0x20
	BNE poll_press_space_to_continue

	MOV r0, #0x0000
	MOVT r0, #0x4003
	MOV r1, #0x2355			; Current Interval Load 0x0008 2355
	MOVT r1, #0x0008
	STR r1, [r0, #0x028]	; Set the Interval for General Purpose Timer Interval Load Register (GPTMTAILR)

	LDR r1, ptr_to_clock_value
	MOV r0, #0x00
	STRB r0, [r1]
	bl print_clock_value

	LDR r0, ptr_to_collision_count
	MOV r1, #0x00
	STRB r1, [r0]

	LDR r0, ptr_to_clock_state
	MOV r1, #clock_enabled
	STRB r1, [r0]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	LDR r0, ptr_to_saved_dir
	LDRB r0, [r0]
	LDR r1, ptr_to_ball_state
	STRB r0, [r1]

	ldr r0, ptr_to_game_process
	MOV r1, #game_in_process
	STRB r1, [r0]

	B restart_game

GAME_RESTARTER:

	LDR r0, ptr_to_game_process
	MOV r1, #game_boot
	STRB r1, [r0]

	LDR r0, ptr_to_pause_state
	MOV r1, #0x00
	STRB r1, [r0]

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r0, r0, #84
	ADD r1, r1, #23

	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #40
	MOV r1, #12
	LDR r2, ptr_to_ball_xpos
	STRB r0, [r2]
	LDR r2, ptr_to_ball_ypos
	STRB r1, [r2]

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]

	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]

	BL print_red_paddle
	BL print_blue_paddle

	LDR r0, ptr_to_power_up_active
	MOV r1, #power_up_active_false
	STRB r1, [r0]

	LDR r0, ptr_to_picked
	MOV r1, #picked_disabled
	STRB r1, [r0]

	B restart_game_full

DANCE_BLUE:
	LDR r0, ptr_to_blue_points
	MOV r1, #0x00
	STRB r1, [r0]

	LDR r0, ptr_to_led_dance
	MOV r1, #0xFF
	STRB r1, [r0]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_blue_win_msg
	BL set_color
	LDR r0, ptr_to_blue_win_msg
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_game_restart
	BL set_color
	LDR r0, ptr_to_game_restart
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_anykeys
	BL set_color
	LDR r0, ptr_to_anykeys
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	LDR r0, ptr_to_general_input
	MOV r1, #0x00
	STRB r1, [r0]

BLUE_POLL:
	LDR r0, ptr_to_general_input
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ BLUE_POLL

	LDR r0, ptr_to_led_dance
	MOV r1, #0x00
	STRB r1, [r0]

	CMP r1, #0x20
	BEQ restart_game_full

	B END_GAME

DANCE_RED:
	LDR r0, ptr_to_red_points
	MOV r1, #0x00
	STRB r1, [r0]

	LDR r0, ptr_to_led_dance
	MOV r1, #0xFF
	STRB r1, [r0]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_red_win_msg
	BL set_color
	LDR r0, ptr_to_red_win_msg
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_game_restart
	BL set_color
	LDR r0, ptr_to_game_restart
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_anykeys
	BL set_color
	LDR r0, ptr_to_anykeys
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	LDR r0, ptr_to_general_input
	MOV r1, #0x00
	STRB r1, [r0]

RED_POLL:
	LDR r0, ptr_to_general_input
	LDRB r1, [r0]
	CMP r1, #0x00
	BEQ RED_POLL

	LDR r0, ptr_to_led_dance
	MOV r1, #0x00
	STRB r1, [r0]

	CMP r1, #0x20
	BEQ restart_game_full

	B END_GAME

END_GAME:

	BL background_gen

	POP {r4-r12,lr}			; Restore registers to adhere to the AAPCS
	MOV pc, lr
							; End of main_rountine



ptr_to_anykeys:			.word anykey
ptr_to_penalty_state:	.word penalty_state
ptr_to_red_win_msg:		.word red_win_msg
ptr_to_blue_win_msg:	.word blue_win_msg

ptr_to_clear_message: .word clear_message
ptr_to_power_up_xpos:	.word power_up_xpos
ptr_to_power_up_ypos:	.word power_up_ypos

ptr_to_led_dance: .word led_dance
; Function Function Function Function Function Function Function Function Function Function Function
; Minor Functionality
;----------------------------------------------------------------------------------------------------


int2string_ansi:
	push {r4-r12,lr}
							; r0 have the address to the placeholder
							; r1 have the value of the int

	MOV r4, r0
	MOV r5, r1
	MOV r12, #0			; Counter for the length of the String in base-10

i2s_set_counter_ansi:

	MOV r2, #10
	UDIV r5, r5, r2
	ADD r12, r12, #1
	CMP r5, #0
	BNE i2s_set_counter_ansi

	MOV r0, #0x00
	STRB r0, [r4, r12]
	SUB r12, r12, #1	; Storing the NULL-Terminate Byte into the memory and Move the [OffSet] back by 1

	MOV r5, r1
	MOV r2, #10

i2s_store_process_ansi:

	CMP r12, #0
	BEQ i2s_store_exit_ansi

	UDIV r6, r5, r2
	MUL r6, r6, r2

	SUB r6, r5, r6
	ORR r0, r6, #0x30
	STRB r0, [r4, r12]
	SUB r12, r12, #1

	UDIV r5, r5, r2

	B i2s_store_process_ansi

i2s_store_exit_ansi:

	ORR r0, r5, #0x30
	STRB r0, [r4, r12]

	MOV r0, r4

	pop {r4-r12,lr}
	mov pc,lr

;----------------------------------------------------------------------------------------------------

ptr_to_power_up_timer:	.word power_up_timer
power_up_randomizer:
	PUSH {r4-r12,lr}

	LDR r0, ptr_to_power_up_clock
	MOV r1, #0xC
	STRB r1, [r0]

power_up_re_randomizer:
	MOV r0, #0x0000
	MOVT r0, #0x4003

	LDR r1, [r0, #0x50]
	AND r2, r1, #0x1F
	ADD r2, r2, #20

	LSR r1, r1, #4
	AND r3, r1, #0xF
	ADD r3, r3, #4

	LSR r1, r1, #4
	AND r4, r1, #0xF


	CMP r4, #2
	IT LT
	MOVLT r4, #2

	LDR r0, ptr_to_power_up_xpos
	STRB r2, [r0]

	LDR r0, ptr_to_power_up_ypos
	STRB r3, [r0]

	LDR r0, ptr_to_power_up_timer
	STRB r4, [r0]

	POP {r4-r12, lr}
	MOV PC, LR


ptr_to_power_up_color:	.word power_up_color
ptr_to_paddle_state: .word paddle_state


choose_color:
	push {r4-r12,lr}

rerandomize:
	MOV r0, #0x0000
	MOVT r0, #0x4003

	LDR r1, [r0, #0x50]
	AND r2, r1, #0x7
	LSR r1, r1, #4
	AND r3, r1, #0x7
	LSR r1, r1, #4
	AND r4, r1, #0x7
	LSR r1, r1, #4
	AND r5, r1, #0x7

	CMP r2, #0
	BEQ rerandomize

	CMP r3, #0
	BEQ rerandomize

	CMP r4, #0
	BEQ rerandomize

	CMP r5, #0
	BEQ rerandomize


	CMP r2,r3
	BEQ rerandomize

	CMP r2,r4
	BEQ rerandomize

	CMP r2,r5
	BEQ rerandomize

	CMP r3,r4
	BEQ rerandomize

	CMP r4,r5
	BEQ rerandomize

	CMP r3,r5
	BEQ rerandomize

	LDR r0, ptr_to_red_paddle_color
	STRB r2, [r0]

	LDR r0, ptr_to_blue_paddle_color
	STRB r3, [r0]

	LDR r0, ptr_to_ball_color
	STRB r4, [r0]

	LDR r0, ptr_to_power_up_color
	STRB r5, [r0]

	pop {r4-r12,lr}
	MOV pc,lr


;-----------------------------------------------------------------------------

ptr_to_game_process:	.word game_process
ptr_to_ball_xpos:	.word ball_xpos
ptr_to_ball_ypos:	.word ball_ypos
ptr_to_ball_state:		.word ball_state

ptr_to_blue_ypos: .word blue_ypos
ptr_to_red_ypos:  .word red_ypos

innit_dir:
	push {r4-r12,lr}

	ldr r0, ptr_to_game_process
	MOV r1, #game_in_process
	STRB r1, [r0]



reset_dir:
	MOV r0, #0x00
	LDR r1, ptr_to_general_input
	STRB r0, [r1]

poll_press_dir:
	LDR r0, ptr_to_general_input
	LDRB r0, [r0]
	CMP r0, #0x00
	BEQ poll_press_dir

	CMP r0, #0x31
	BEQ set_dir_store

	CMP r0, #0x32
	BEQ set_dir_store

	CMP r0, #0x33
	BEQ change_color

	B reset_dir

change_color:

	BL choose_color
	bl print_blue_paddle
	bl print_red_paddle
	bl print_ball
	B reset_dir

set_dir_store:

	LDR r1, ptr_to_ball_state
	STRB r0, [r1]

	LDR r0, ptr_to_clock_state
	MOV r1, #clock_enabled
	STRB r1, [r0]

	pop {r4-r12,lr}
	MOV pc,lr

;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

update_score:
	push {r4-r12,lr}

	mov r0, #84
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_gray_color
	ADD r0, r0, #1
	bl output_string
	bl reset_cursor

	mov r0, #155
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_gray_color
	ADD r0, r0, #1
	bl output_string
	bl reset_cursor

	ldr r0, ptr_to_blue_points
	ldrb r1, [r0]
	ldr r0, ptr_to_blue_points_string
	bl int2string

	mov r0, #84
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_blue_points_string
	bl output_string
	bl reset_cursor

	ldr r0, ptr_to_red_points
	ldrb r1, [r0]
	ldr r0, ptr_to_red_points_string
	bl int2string

	mov r0, #155
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_red_points_string
	bl output_string
	bl reset_cursor

	pop {r4-r12,lr}
	mov pc, lr



print_clock_value:
	push {r4-r12,lr}

	mov r0, #125
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_gray_color
	ADD r0, r0, #1
	bl output_string
	bl reset_cursor

	ldr r0, ptr_to_clock_value
	ldrb r1, [r0]
	ldr r0, ptr_to_clock_value_string
	bl int2string

	mov r0, #125
	mov r1, #21
	bl mov_cursor
	ldr r0, ptr_to_gray_color
	bl set_color
	ldr r0, ptr_to_clock_value_string
	bl output_string
	bl reset_cursor

	pop {r4-r12,lr}
	mov pc, lr

;---------------------------------------------------------------

print_blue_paddle:
	push {r4-r12,lr}

	mov r4, #84
	mov r5, #23		; Innit Deafult Pos for the blue side of the gameboard


	mov r12, #24
blue_side_clear:
	mov r0, r4
	mov r1, r5
	bl mov_cursor

	ldr r0, ptr_to_side_border
	bl set_color
	ldr r0, ptr_to_side_border
	add r0, r0, #1
	bl output_string
	bl reset_cursor

	add r5, r5, #1
	sub r12, r12, #1
	cmp r12, #0
	bne blue_side_clear				; CLEARING THE SIDE BORDER FOR THE PADDLES



	ldr r0, ptr_to_bluepaddle_state
	ldrb r0, [r0]
	CMP r0, #0x00
	ITE EQ
	MOVEQ R11, #2					; R11 HOLDS THE LEN OF THE PADDLE ON EACH SIDE
	MOVNE R11, #3					; CHECKIN THE PADDLE STATE, REGULAR OR BOOSTED

	mov r4, #84
	mov r5, #23		; Innit Deafult Pos for the blue side of the gameboard

	LDR R6, ptr_to_blue_ypos
	LDRB R6, [R6]

	MOV R0, R4
	ADD R1, R5, R6
	BL mov_cursor

	LDR R0, ptr_to_blue_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_blue
	BL output_string
	BL reset_cursor

	MOV R12, #1
print_blue_loop:
	MOV R0, R4
	ADD R1, R5, R6
	ADD R1, R1, R12
	BL mov_cursor

	LDR R0, ptr_to_blue_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_blue
	BL output_string
	BL reset_cursor

	MOV R0, R4
	ADD R1, R5, R6
	SUB R1, R1, R12
	BL mov_cursor

	LDR R0, ptr_to_blue_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_blue
	BL output_string
	BL reset_cursor

	ADD R12, R12, #1
	CMP R12, R11
	BLE print_blue_loop

	pop {r4-r12,lr}
	mov pc,lr

;''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

print_red_paddle:
	push {r4-r12,lr}

	mov r4, #163
	mov r5, #23		; Innit Deafult Pos for the blue side of the gameboard

	mov r12, #24
red_side_clear:
	mov r0, r4
	mov r1, r5
	bl mov_cursor

	ldr r0, ptr_to_side_border
	bl set_color
	ldr r0, ptr_to_side_border
	add r0, r0, #1
	bl output_string
	bl reset_cursor

	add r5, r5, #1
	sub r12, r12, #1
	cmp r12, #0
	bne red_side_clear				; CLEARING THE SIDE BORDER FOR THE PADDLES

	ldr r0, ptr_to_redpaddle_state
	ldrb r0, [r0]
	CMP r0, #0x00
	ITE EQ
	MOVEQ R11, #2					; R11 HOLDS THE LEN OF THE PADDLE ON EACH SIDE
	MOVNE R11, #3					; CHECKIN THE PADDLE STATE, REGULAR OR BOOSTED


	mov r4, #163
	mov r5, #23						; Innit Deafult Pos for the blue side of the gameboard

	LDR R6, ptr_to_red_ypos
	LDRB R6, [R6]

	MOV R0, R4
	ADD R1, R5, R6
	BL mov_cursor

	LDR R0, ptr_to_red_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_red
	BL output_string
	BL reset_cursor

	MOV R12, #1
print_red_loop:
	MOV R0, R4
	ADD R1, R5, R6
	ADD R1, R1, R12
	BL mov_cursor

	LDR R0, ptr_to_red_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_red
	BL output_string
	BL reset_cursor

	MOV R0, R4
	ADD R1, R5, R6
	SUB R1, R1, R12
	BL mov_cursor

	LDR R0, ptr_to_red_paddle_color
	BL set_color_ele
	LDR R0, ptr_to_red
	BL output_string
	BL reset_cursor

	ADD R12, R12, #1
	CMP R12, R11
	BLE print_red_loop

	pop {r4-r12,lr}
	mov pc,lr

;-----------------------------------------------------------

print_ball:
	push {r4-r12,lr}

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r0, r0, #84
	ADD r1, r1, #23

	BL mov_cursor

	LDR R0, ptr_to_ball_color
	BL set_color_ele
	LDR R0, ptr_to_ball
	BL output_string
	BL reset_cursor



	pop {r4-r12,lr}
	mov pc,lr

;==========================================================================================
clear_power_up:
	push {r4-r12,lr}

	LDR r0, ptr_to_power_up_active
	MOV r1, #power_up_active_false
	STRB r1, [r0]


	LDR r0, ptr_to_picked
	MOV r1, #picked_disabled
	STRB r1, [r0]



	LDR r4, ptr_to_power_up_xpos
	LDR r5, ptr_to_power_up_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r0, r0, #84
	ADD r1, r1, #23
	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	BL power_up_randomizer

	pop {r4-r12,lr}
	mov pc,lr

print_power_up:
	push {r4-r12,lr}

	LDR r4, ptr_to_power_up_xpos
	LDR r5, ptr_to_power_up_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r0, r0, #84
	ADD r1, r1, #23
	BL mov_cursor

	LDR R0, ptr_to_power_up_color
	BL set_color_ele
	LDR R0, ptr_to_power_up
	BL output_string
	BL reset_cursor

	pop {r4-r12,lr}
	mov pc,lr

;==========================================================================================
; Important Functionality



;------------------------------------------------------------------------------------

reset_cursor:
	push {r4-r12,lr}

	ldr r0, ptr_to_left_all
	bl output_string
	ldr r0, ptr_to_up_all
	bl output_string

	pop {r4-r12,lr}
	mov pc,lr


mov_cursor:
	push {r4-r12,lr}

	MOV r4, r0
	MOV r5, r1				; r0 contains x-loc, r1 contains y-loc

	ldr r0, ptr_to_ansi_header
	bl output_string

	ldr r0, ptr_to_cursor_value
	mov r1, r5
	bl int2string_ansi
	bl output_string

	ldr r0, ptr_to_cursor_semicolon
	bl output_string

	ldr r0, ptr_to_cursor_value
	mov r1, r4
	bl int2string_ansi
	bl output_string

	ldr r0, ptr_to_cursor_close
	bl output_string

	pop {r4-r12,lr}
	mov pc,lr



;-------------------------------------------------------------------------------------

set_color:								; Basically just printing color
	push {r4-r12,lr}

	mov r5, r0

	ldr r12, ptr_to_LUT_baseaddr		; r12 contains the base address of the LUT

	ldrb r4, [r5]						; r5 contains the base address of the string
										; r4 contains the offset to be added into the LUT
	add r12, r4, r12					; r12 now is with the offset
	mov r0, r12
	bl output_string


	pop {r4-r12,lr}
	MOV pc,lr


set_color_ele:
	push {r4-r12,lr}
	LDR r12, ptr_to_ELE
	LDRB r4, [r0]

	MOV r11, #12
	MUL r4, r4, r11
	ADD r0, r4, r12
	BL output_string

	pop {r4-r12,lr}
	mov pc,lr

;------------------------------------------------------------------------------------------
;==========================================================================================

; INITIALLIZATION 

ptr_to_ball_clear:		.word black_clear

ptr_to_clock_value:	.word clock_value


uart_interrupt_init:

	; Your code to initialize the UART0 interrupt goes here

	MOV r0, #0xC000
	MOVT r0, #0x4000
	LDR r1, [r0, #0x038] ; Loading the UART Interupt Mask Register into r1
	ORR r1, r1, #0x10	 ; Setting the RXIM bit
	STR r1, [r0, #0x038]

	MOV r0, #0xE000
	MOVT r0, #0xE000
	LDR r1, [r0, #0x100] ; Loading the Interupt 0-31 Set Enable Register
	ORR r1, r1, #0x20
	STR r1, [r0, #0x100]

	MOV pc, lr

gpio_interrupt_init:

	; Your code to initialize the SW1 interrupt goes here
	; Don't forget to follow the procedure you followed in Lab #4
	; to initialize SW1.


	MOV r0, #0xE000
	MOVT r0, #0x400F
	LDR r1, [r0, #0x608]
	ORR r1, r1, #0x20
	STR r1, [r0, #0x608]	;Clock Enable


 	MOV r0, #0x5000
 	MOVT r0, #0x4002		; Port F

 	LDR r1, [r0, #0x400] 	; Config pin direction
 	BIC r1, r1, #0x10
 	ORR r1, r1, #0xE
 	STR r1, [r0, #0x400]

 	LDR r1, [r0, #0x51C] 	; Config I/O DEN
 	ORR r1, r1, #0x1E
 	STR r1, [r0, #0x51C]

 	LDR r1, [r0, #0x510] 	; Enable pull-up resistor
 	ORR r1, r1, #0x10
 	STR r1, [r0, #0x510]

 	LDR r1, [r0, #0x404]
	BIC r1, r1, #0x10
	STR r1, [r0, #0x404]  	; Setting Edge Sensitive

	LDR r1, [r0, #0x408]
	BIC r1, r1, #0x10
	STR r1, [r0, #0x404] 	; Enable GIPIOEV Register to Control the Edge

	LDR r1, [r0, #0x40C]
	BIC r1, r1, #0x10
	STR r1, [r0, #0x40C] 	; Decide the Edge, '0' for Falling Edge

	LDR r1, [r0, #0x410]
	ORR r1, r1, #0x10
	STR r1, [r0, #0x410] 	; Interrupt Mask

	MOV r0, #0xE000
	MOVT r0, #0xE000		; Interrupt bit 30 to set GPIOF (Bit 30) to 1

	LDR r1, [r0, #0x100]
	MOV r2, #0x0000
	MOVT r2, #0x4000
	ORR r1, r1, r2
	STR r1, [r0, #0x100]

	MOV pc, lr




timer_intterupt_innit:

	MOV r0, #0xE000
	MOVT r0, #0x400F
	LDR r1, [r0, #0x604]	; General Purpose Timer Run Mode Clock Gating Control Register (RCGC-TIMER)
	ORR r1, r1, #0x3		; Enable Clock T0 by Writing 1 to T0 at 0x400FE604
	STR r1, [r0, #0x604]

	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x00C]	; General Purpose Timer Control Register (GPTMCTL)
	BIC r1, r1, #0x1		; Timer A Enable (TAEN)
	STR r1, [r0, #0x00C]

	MOV r0, #0x0000
	MOVT r0, #0x4003		; General Purpose Timer Configuration
	LDR r1, [r0]
	BIC r1, r1, #0x7		; Choosing Configuration 0 for GPTMCFG
	STR r1, [r0]

	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x004]	; General Purpose Timer - Timer A Mode Register (GPTM-TAMR)
	BIC r1, r1, #0x3		; Clearing the First 2 bits of GPTM-TAMR
	ORR r1, r1, #0x2		; Setting the Mode of Timer A to Periodic Mode (Write b10 to the first 2 bits)
	STR r1, [r0, #0x004]

	MOV r0, #0x0000
	MOVT r0, #0x4003
	MOV r1, #0x2355			; Current Interval Load 0x0008 2355
	MOVT r1, #0x0008
	STR r1, [r0, #0x028]	; Set the Interval for General Purpose Timer Interval Load Register (GPTMTAILR)

	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x018]	; General Purpose Timer Interrupt Mask Register (GPTM-IMR)
	ORR r1, r1, #0x1		; Set bit 1 to 1
	STR r1, [r0, #0x018]



	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x00C]	; General Purpose Timer Control Register (GPTMCTL)
	ORR r1, r1, #0x1		; Timer A Enable (TAEN)
	STR r1, [r0, #0x00C]

	; TIMER 1A

	MOV r0, #0x1000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x00C]	; General Purpose Timer Control Register (GPTMCTL)
	BIC r1, r1, #0x1		; Timer A Enable (TAEN)
	STR r1, [r0, #0x00C]

	MOV r0, #0x1000
	MOVT r0, #0x4003		; General Purpose Timer Configuration
	LDR r1, [r0]
	BIC r1, r1, #0x7		; Choosing Configuration 0 for GPTMCFG
	STR r1, [r0]

	MOV r0, #0x1000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x004]	; General Purpose Timer - Timer A Mode Register (GPTM-TAMR)
	BIC r1, r1, #0x3		; Clearing the First 2 bits of GPTM-TAMR
	ORR r1, r1, #0x2		; Setting the Mode of Timer A to Periodic Mode (Write b10 to the first 2 bits)
	STR r1, [r0, #0x004]

	MOV r0, #0x1000
	MOVT r0, #0x4003

	MOV r1, #0x2400		; Current Interval Load 0x0008 2355
	MOVT r1, #0x00F4
	STR r1, [r0, #0x028]	; Set the Interval for General Purpose Timer Interval Load Register (GPTMTAILR)

	MOV r0, #0x1000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x018]	; General Purpose Timer Interrupt Mask Register (GPTM-IMR)
	ORR r1, r1, #0x1		; Set bit 1 to 1
	STR r1, [r0, #0x018]

	MOV r0, #0xE000
	MOVT r0, #0xE000
	LDR r1, [r0, #0x100]	; Interrupt 0-31 Set Enable Register (EN0)
	MOV r2, #0x0000
	MOVT r2, #0x0028		; Mask to set the 19th and the 21st bit in the EN0 Register (0x0008 0000)
	ORR r1, r1, r2
	STR r1, [r0, #0x100]

	MOV r0, #0x1000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x00C]	; General Purpose Timer Control Register (GPTMCTL)
	ORR r1, r1, #0x1		; Timer A Enable (TAEN)
	STR r1, [r0, #0x00C]



	MOV pc, lr

ptr_to_general_input:	.word general_input
ptr_to_clock_state:	.word clock_state
ptr_to_pause_state:	.word pause_state
;=========================================================
; HANDLERS

UART0_Handler:
 	PUSH {r4-r12,lr}

	MOV r0, #0xC000
	MOVT r0, #0x4000
	LDR r1, [r0, #0x044]
	ORR r1, r1, #0x10
	STR r1, [r0, #0x044]

	MOV r0, #0xC000
	MOVT r0, #0x4000

	LDR r0, [r0]			; W,S for BLUE side, O,L for RED side
	MOV r4, #0x00FF
	AND r0, r0, r4

	LDR r1, ptr_to_general_input
	STRB r0, [r1]

	LDR r1, ptr_to_pause_state
	LDRB r1, [r1]
	CMP r1, #0x00
	BNE RESTART_GAME_CHECK

	LDR r2, ptr_to_paddle_state
	LDRB r2, [r2]
	CMP r2, #paddle_enabled
	BEQ PADDLE_ENABLED
	B UART_HANDLER_EXIT

PADDLE_ENABLED:

	CMP r0, #0x77
	IT EQ
	MOVEQ r1, #-1
	BEQ UART_BLUE_HANDLER

	CMP r0, #0x73
	IT EQ
	MOVEQ r1, #1
	BEQ UART_BLUE_HANDLER


	CMP r0, #0x6F
	IT EQ
	MOVEQ r1, #-1
	BEQ UART_RED_HANDLER

	CMP r0, #0x6C
	IT EQ
	MOVEQ r1, #1
	BEQ UART_RED_HANDLER

	B UART_HANDLER_EXIT

UART_BLUE_HANDLER:

	LDR r5, ptr_to_ball_state
	LDRB r5, [r5]

	CMP r5, #0x00
	BEQ UART_BLUE_PENALTY_CLEARED

	AND r5, r5, #0xF
	CMP r5, #2
	BEQ UART_BLUE_PENALTY_CLEARED

	LDR r4, ptr_to_ball_xpos
	LDRB r4, [r4]

	CMP r4, #10
	BLT UART_BLUE_PENALTY_CLEARED

	CMP r4, #39
	BGT UART_BLUE_PENALTY_CLEARED

	B BLUE_PENALTY_HANDLER

UART_BLUE_PENALTY_CLEARED:

	LDR r7, ptr_to_blue_ypos
	LDRB r5, [r7]

	LDR r2, ptr_to_bluepaddle_state
	LDRB r2, [r2]

	CMP r2, #0x00
	ITTEE EQ
	MOVEQ r2, #2
	MOVEQ r3, #21
	MOVNE r2, #3
	MOVNE r3, #20


	ADD r5, r5, r1
	CMP r5, r2
	IT LT
	ADDLT r5, r5, #1

	CMP r5, r3
	IT GT
	SUBGT r5, r5, #1

	STRB r5, [r7]

	BL print_blue_paddle
	B UART_HANDLER_EXIT

UART_RED_HANDLER:

	LDR r5, ptr_to_ball_state
	LDRB r5, [r5]

	CMP r5, #0x00
	BEQ UART_RED_PENALTY_CLEARED

	AND r5, r5, #0xF
	CMP r5, #1
	BEQ UART_RED_PENALTY_CLEARED

	LDR r4, ptr_to_ball_xpos
	LDRB r4, [r4]

	CMP r4, #69
	BGT UART_RED_PENALTY_CLEARED

	CMP r4, #40
	BLT UART_RED_PENALTY_CLEARED

	B RED_PENALTY_HANDLER


UART_RED_PENALTY_CLEARED:

	LDR r8, ptr_to_red_ypos
	LDRB r6, [r8]

	LDR r2, ptr_to_redpaddle_state
	LDRB r2, [r2]

	CMP r2, #0x00
	ITTEE EQ
	MOVEQ r2, #2
	MOVEQ r3, #21
	MOVNE r2, #3
	MOVNE r3, #20


	ADD r6, r6, r1
	CMP r6, r2
	IT LT
	ADDLT r6, r6, #1

	CMP r6, r3
	IT GT
	SUBGT r6, r6, #1

	STRB r6, [r8]

	BL print_red_paddle
	B UART_HANDLER_EXIT


BLUE_PENALTY_HANDLER:

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]
	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]
	BL print_red_paddle
	BL print_blue_paddle

	LDR r0, ptr_to_penalty_state
	MOV r1, #penalty_enabled
	STRB r1, [r0]

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos
	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r6, r0, #84
	ADD r7, r1, #23

	MOV r0, r6
	MOV r1, r7
	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor

	LDR r1, ptr_to_red_points
	LDRB r0, [r1]

	ADD r0, r0, #1
	STRB r0, [r1]

	LDR r1, ptr_to_blue_points
	LDRB r0, [r1]

	CMP r0, #0
	ITE GT
	MOVGT r2, #-1
	MOVLE r2, #0

	ADD r0, r0, r2
	STRB r0, [r1]

	BL update_score

	LDR r0, ptr_to_game_process
	MOV r1, #game_in_pending
	STRB r1, [r0]

	MOV r0, #40
	MOV r1, #12
	LDR r2, ptr_to_ball_xpos
	STRB r0, [r2]
	LDR r2, ptr_to_ball_ypos
	STRB r1, [r2]

	LDR r0, ptr_to_saved_dir
	MOV r1, #0x31
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #ball_state_stop
	STRB r1, [r0]

	LDR r0, ptr_to_red_paddle_color
	LDRB r0, [r0]
	BL illuminate_RGB_LED
	BL clear_power_up

	B UART_HANDLER_EXIT


RED_PENALTY_HANDLER:

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]
	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]
	BL print_red_paddle
	BL print_blue_paddle

	LDR r0, ptr_to_penalty_state
	MOV r1, #penalty_enabled
	STRB r1, [r0]

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos
	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r6, r0, #84
	ADD r7, r1, #23

	MOV r0, r6
	MOV r1, r7
	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor

	LDR r1, ptr_to_blue_points
	LDRB r0, [r1]

	ADD r0, r0, #1
	STRB r0, [r1]

	LDR r1, ptr_to_red_points
	LDRB r0, [r1]

	CMP r0, #0
	ITE GT
	MOVGT r2, #-1
	MOVLE r2, #0

	ADD r0, r0, r2
	STRB r0, [r1]

	BL update_score

	LDR r0, ptr_to_game_process
	MOV r1, #game_in_pending
	STRB r1, [r0]

	MOV r0, #40
	MOV r1, #12
	LDR r2, ptr_to_ball_xpos
	STRB r0, [r2]
	LDR r2, ptr_to_ball_ypos
	STRB r1, [r2]

	LDR r0, ptr_to_saved_dir
	MOV r1, #0x32
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #ball_state_stop
	STRB r1, [r0]

	LDR r0, ptr_to_blue_paddle_color
	LDRB r0, [r0]
	BL illuminate_RGB_LED
	BL clear_power_up

	B UART_HANDLER_EXIT

RESTART_GAME_CHECK:

	LDR r0, ptr_to_general_input
	LDRB r0, [r0]
	CMP r0, #0x20
	BNE UART_HANDLER_EXIT

	LDR r0, ptr_to_game_process
	MOV r1, #game_in_close
	STRB r1, [r0]

	B UART_HANDLER_EXIT

UART_HANDLER_EXIT:

	POP {r4-r12,lr}
	BX lr



ptr_to_pause_register: .word pause_register

ptr_to_game_paused:		.word game_paused
ptr_to_game_restart:	.word game_restart
pause_enabled:		.equ 0xFF
pause_disabled:		.equ 0x00

Switch_Handler:

 	PUSH {r4-r12,lr}

	MOV r0, #0x5000
 	MOVT r0, #0x4002
 	LDR r1, [r0, #0x41C]	; Port F GPIOIC
 	ORR r1, r1, #0x10
 	STR r1, [r0, #0x41C]
							; TODO: SW1 Handler need to switch gamestate to stop and to runnning everytime SW1 was pressed

	LDR r0, ptr_to_pause_state
	LDRB r0, [r0]
	CMP r0, #pause_disabled
	BEQ pause_game

	CMP r0, #pause_enabled
	BEQ unpause_game

pause_game:

	LDR r0, ptr_to_clock_state
	MOV r1, #clock_disabled
	STRB r1, [r0]

	LDR r0, ptr_to_pause_state
	MOV r1, #pause_enabled
	STRB r1, [r0]

	LDR r0, ptr_to_paddle_state
	MOV r1, #paddle_disabled
	STRB r1, [r0]

	LDR r4, ptr_to_pause_register
	LDR r0, ptr_to_ball_state

	LDRB r2, [r0]
	STRB r2, [r4]

	MOV r1, #ball_state_stop
	STRB r1, [r0]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_game_paused
	BL set_color
	LDR r0, ptr_to_game_paused
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_game_restart
	BL set_color
	LDR r0, ptr_to_game_restart
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor


	B end_switch_handler

unpause_game:

	LDR r0, ptr_to_clock_state
	MOV r1, #clock_enabled
	STRB r1, [r0]

	LDR r0, ptr_to_pause_state
	MOV r1, #pause_disabled
	STRB r1, [r0]

	LDR r0, ptr_to_paddle_state
	MOV r1, #paddle_enabled
	STRB r1, [r0]

	LDR r4, ptr_to_pause_register
	LDR r0, ptr_to_ball_state

	LDRB r1, [r4]
	STRB r1, [r0]

	MOV r1, #0x00
	STRB r1, [r4]

	MOV r0, #83
	MOV r1, #52
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	MOV r0, #83
	MOV r1, #53
	BL mov_cursor

	LDR r0, ptr_to_clear_message
	BL set_color
	LDR r0, ptr_to_clear_message
	ADD r0, r0, #1
	BL output_string
	BL reset_cursor

	B end_switch_handler

end_switch_handler:
	POP {r4-r12, lr}
	BX lr




ptr_to_power_up_arm: .word power_up_arm

ptr_to_collision_count: .word collision_count

ptr_to_blue_points:		.word blue_points
ptr_to_red_points:		.word red_points

ptr_to_saved_dir:	.word saved_dir

ptr_to_red_paddle_color:	.word red_paddle_color
ptr_to_blue_paddle_color:	.word blue_paddle_color
ptr_to_ball_color:			.word ball_color

ptr_to_power_up_active:		.word power_up_active

power_up_active_false:	.equ 0x00
power_up_active_true:	.equ 0xFF

ptr_to_bluepaddle_state: .word bluepaddle_state
ptr_to_redpaddle_state:  .word redpaddle_state

ptr_to_picked:		.word picked

Timer_Handler:
	PUSH {r4-r12,lr}

	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x024]
	ORR r1, r1, #0x1
	STR r1, [r0, #0x024]



	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]

	CMP r0, #0x00
	BEQ ENDER_TIMERHANDLER

	LDR r0, ptr_to_power_up_active
	LDRB r1, [r0]

	CMP r1, #power_up_active_true
	BEQ BALL_HANDLER

	CMP r1, #power_up_active_false
	BEQ COLLISION_CHECK

BALL_HANDLER:

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos

	LDR r11, ptr_to_power_up_xpos
	LDR r12, ptr_to_power_up_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	LDRB r2, [r11]
	LDRB r3, [r12]

	CMP r0, r2
	ITE EQ
	MOVEQ r4, #0
	BNE COLLISION_CHECK

	CMP r1, r3
	ITE EQ
	MOVEQ r5, #0
	BNE COLLISION_CHECK

	ADD r4, r4, r5
	CMP r4, #0
	BEQ POWER_UP_HANDLER
	BNE COLLISION_CHECK

POWER_UP_HANDLER:
	LDR r0, ptr_to_power_up_xpos
	MOV r1, #200
	STRB r1, [r0]

	LDR r0, ptr_to_power_up_ypos
	MOV r1, #200
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]
	AND r0, r0, #7

	CMP r0, #0
	BEQ COLLISION_CHECK

	CMP r0, #1
	IT EQ
	LDREQ r0, ptr_to_bluepaddle_state

	CMP r0, #2
	IT EQ
	LDREQ r0, ptr_to_redpaddle_state

	MOV r1, #0xFF
	STRB r1, [r0]

	BL print_red_paddle
	BL print_blue_paddle

	LDR r0, ptr_to_picked
	MOV r1, #picked_enabled
	STRB r1, [r0]

COLLISION_CHECK:

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	CMP r0, #78
	BEQ x_right_collision

	CMP r0, #1
	BEQ x_left_collision 		; HANDLED x-collision with the paddles, need to check the points

	CMP r1, #0
	BEQ y_upper_collision

	CMP r1, #23
	BEQ y_lower_collision

	B regular_movement

y_upper_collision:
	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]
	AND r0, r0, #7
	ORR r0, r0, #0x50
	LDR r1, ptr_to_ball_state
	STRB r0, [r1]

	B regular_movement

y_lower_collision:
	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]
	AND r0, r0, #7
	ORR r0, r0, #0x40
	LDR r1, ptr_to_ball_state
	STRB r0, [r1]

	B regular_movement

x_right_collision:
	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]
	AND r0, r0, #7

	CMP r0, #1
	BNE regular_movement

	LDR r0, ptr_to_red_ypos
	LDRB r1, [r0]

	LDR r0, ptr_to_ball_ypos
	LDRB r2, [r0]

	CMP r1, r2
	BEQ x_right_collision_center
	BNE x_right_side

x_right_collision_center:		; HANDLED IF THE BALL IS HITTING THE CENTER OF THE PADDLE

	LDR r0, ptr_to_collision_count
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #0x32
	STRB r1, [r0]
	B regular_movement


x_right_side:						; HANDLED IF THE BALL HIS THE SIDES OF THE PADDLE
	ldr r0, ptr_to_redpaddle_state
	ldrb r0, [r0]
	CMP r0, #0x00
	ITE EQ
	MOVEQ R11, #2
	MOVNE R11, #3

	SUB r3, r1, r2
	CMP r3, #0
	IT LT
	RSBLT r3, r3, #0
	CMP r3, r11
	BLE x_right_move
	BGT blue_points_handler

x_right_move:					; MOVING THE BALL ACCORDINGLY

	LDR r0, ptr_to_collision_count
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]

	LDR r0, ptr_to_red_ypos
	LDRB r1, [r0]

	LDR r0, ptr_to_ball_ypos
	LDRB r2, [r0]

	SUB r3, r1, r2
	CMP r3, #0
	ITE GT
	MOVGT r3, #0x42
	MOVLE r3, #0x52

	LDR r0, ptr_to_ball_state
	STRB r3, [r0]
	B regular_movement


x_left_collision:
	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]
	AND r0, r0, #7

	CMP r0, #2
	BNE regular_movement

	LDR r0, ptr_to_blue_ypos
	LDRB r1, [r0]

	LDR r0, ptr_to_ball_ypos
	LDRB r2, [r0]

	CMP r1, r2
	BEQ x_left_collision_center
	BNE x_left_side

x_left_collision_center:
	LDR r0, ptr_to_collision_count
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #0x31
	STRB r1, [r0]
	B regular_movement

x_left_side:
	ldr r0, ptr_to_bluepaddle_state
	ldrb r0, [r0]
	CMP r0, #0x00
	ITE EQ
	MOVEQ R11, #2
	MOVNE R11, #3

	SUB r3, r1, r2

	CMP r3, #0
	IT LT
	RSBLT r3, r3, #0

	CMP r3, r11
	BLE x_left_move
	BGT red_points_handler

x_left_move:

	LDR r0, ptr_to_collision_count
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]

	LDR r0, ptr_to_blue_ypos
	LDRB r1, [r0]

	LDR r0, ptr_to_ball_ypos
	LDRB r2, [r0]

	SUB r3, r1, r2
	CMP r3, #0
	ITE GT
	MOVGT r3, #0x41
	MOVLE r3, #0x51

	LDR r0, ptr_to_ball_state
	STRB r3, [r0]
	B regular_movement


regular_movement:

	LDR r0, ptr_to_ball_state
	LDRB r0, [r0]

	CMP r0, #ball_state_right
	ITT EQ
	MOVEQ r11, #1
	MOVEQ r12, #0

	CMP r0, #ball_state_left
	ITT EQ
	MOVEQ r11, #-1
	MOVEQ r12, #0

	CMP r0, #ball_state_up_right
	ITT EQ
	MOVEQ r11, #1
	MOVEQ r12, #-1

	CMP r0, #ball_state_up_left
	ITT EQ
	MOVEQ r11, #-1
	MOVEQ r12, #-1

	CMP r0, #ball_state_down_right
	ITT EQ
	MOVEQ r11, #1
	MOVEQ r12, #1

	CMP r0, #ball_state_down_left
	ITT EQ
	MOVEQ r11, #-1
	MOVEQ r12, #1

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos
	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r6, r0, #84
	ADD r7, r1, #23

	MOV r0, r6
	MOV r1, r7
	BL mov_cursor


	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor


	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos

	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r0,r0,r11
	ADD r1,r1,r12

	LDR r4, ptr_to_ball_xpos
	STRB r0, [r4]

	LDR r4, ptr_to_ball_ypos
	STRB r1, [r4]

	BL reset_cursor
	BL print_ball
	B end_TimerHandler

blue_points_handler:

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]
	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]
	BL print_red_paddle
	BL print_blue_paddle

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos
	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r6, r0, #84
	ADD r7, r1, #23

	MOV r0, r6
	MOV r1, r7
	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor

	LDR r1, ptr_to_blue_points
	LDRB r0, [r1]


	ADD r0, r0, #1
	STRB r0, [r1]
	BL update_score

	LDR r0, ptr_to_game_process
	MOV r1, #game_in_pending
	STRB r1, [r0]

	MOV r0, #40
	MOV r1, #12
	LDR r2, ptr_to_ball_xpos
	STRB r0, [r2]
	LDR r2, ptr_to_ball_ypos
	STRB r1, [r2]

	LDR r0, ptr_to_saved_dir
	MOV r1, #0x32
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #ball_state_stop
	STRB r1, [r0]

	LDR r0, ptr_to_blue_paddle_color
	LDRB r0, [r0]
	BL illuminate_RGB_LED

	BL clear_power_up

	B end_TimerHandler

red_points_handler:

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]
	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]
	BL print_red_paddle
	BL print_blue_paddle

	LDR r4, ptr_to_ball_xpos
	LDR r5, ptr_to_ball_ypos
	LDRB r0, [r4]
	LDRB r1, [r5]

	ADD r6, r0, #84
	ADD r7, r1, #23

	MOV r0, r6
	MOV r1, r7
	BL mov_cursor

	LDR r0, ptr_to_ball_clear
	BL set_color
	LDR r0, ptr_to_ball_clear
	BL output_string
	BL reset_cursor

	LDR r1, ptr_to_red_points
	LDRB r0, [r1]

	ADD r0, r0, #1
	STRB r0, [r1]
	BL update_score

	LDR r0, ptr_to_game_process
	MOV r1, #game_in_pending
	STRB r1, [r0]

	MOV r0, #40
	MOV r1, #12
	LDR r2, ptr_to_ball_xpos
	STRB r0, [r2]
	LDR r2, ptr_to_ball_ypos
	STRB r1, [r2]

	LDR r0, ptr_to_saved_dir
	MOV r1, #0x31
	STRB r1, [r0]

	LDR r0, ptr_to_ball_state
	MOV r1, #ball_state_stop
	STRB r1, [r0]

	LDR r0, ptr_to_red_paddle_color
	LDRB r0, [r0]
	BL illuminate_RGB_LED

	BL clear_power_up

	B end_TimerHandler

end_TimerHandler:

	LDR r0, ptr_to_collision_count
	LDRB r1, [r0]
	CMP r1, #6
	IT GE
	MOVGE r1, #6

	STRB r1, [r0]

	MOV r3, #0x2400
	MOVT r3, #0x00F4

	MOV r5, #5
	MUL r1, r1, r5
	ADD r1, r1, #30
	UDIV r2, r3, r1


	MOV r0, #0x0000
	MOVT r0, #0x4003
	STR r2, [r0, #0x028]



ENDER_TIMERHANDLER:

	POP {r4-r12,lr}
	BX lr       	; Return



; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_



ptr_to_power_up_clock:	.word power_up_clock


power_up_arm_enabled: 	.equ 0xFF
power_up_arm_disabled: 	.equ 0x00

picked_enabled:			.equ 0xFF
picked_disabled:		.equ 0x00

Second_Timer_Handler:
 	PUSH {r4-r12,lr}

	MOV r0, #0x1000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x024]
	ORR r1, r1, #0x1
	STR r1, [r0, #0x024]

	LDR r0, ptr_to_led_dance
	LDRB r1, [r0]
	CMP r1, #0xFF
	BEQ START_DANCE

	LDR r0, ptr_to_clock_state
	LDRB r1, [r0]
	CMP r1, #clock_disabled
	BEQ END_SECOND_TIME_HANDLER

	LDR r0, ptr_to_clock_value
	LDRB r1, [r0]
	ADD r1, r1, #1
	STRB r1, [r0]
	BL print_clock_value			; PRINTING THE CLOCK VALUE

	LDR r0, ptr_to_power_up_active
	LDRB r1, [r0]
	CMP r1, #power_up_active_false
	BEQ ARMING_THE_POWER_UP

	CMP r1, #power_up_active_true
	BEQ POWER_UP_HANDLER_SECOND_TIMER

ARMING_THE_POWER_UP:

	LDR r0, ptr_to_power_up_timer
	LDRB r1, [r0]
	SUB r1, r1, #1
	STRB r1, [r0]
	LDR r4, ptr_to_power_up_arm

	CMP r1, #0
	ITTEE EQ
	MOVEQ r5, #power_up_arm_enabled
	STRBEQ r5, [r4]
	MOVNE r5, #power_up_arm_disabled
	STRBNE r5, [r4]						; SINCE WE ARE PRINTING THE POWER_UP AT A RANDOM TIME, THIS PRETTY MUCH COUNT DOWN THAT TIMER AND ARM THE POWER UP

	LDR r0, ptr_to_power_up_arm
	LDRB r1, [r0]
	CMP r1, #power_up_arm_disabled
	BEQ END_SECOND_TIME_HANDLER			; MAKE SURE THAT THE POWER_UP CLOCK IS ARMED SO WE CAN ENABLE THE POWER UP

	BL print_power_up
	LDR r0, ptr_to_power_up_active
	MOV r1, #power_up_active_true
	STRB r1, [r0]


	B END_SECOND_TIME_HANDLER


POWER_UP_HANDLER_SECOND_TIMER:
	LDR r0, ptr_to_picked
	LDRB r1, [r0]
	CMP r1, #picked_enabled
	BNE END_SECOND_TIME_HANDLER

	LDR r0, ptr_to_power_up_clock
	LDRB r4, [r0]
	MOV r1, r4
	SUB r4, r4, #1
	STRB r4, [r0]

	CMP r4, #0
	IT EQ
	MOVEQ r0, #0x0

	CMP r4, #0
	IT GT
	MOVGT r0, #0x1

	CMP r4, #3
	IT GT
	MOVGT r0, #0x3

	CMP r4, #6
	IT GT
	MOVGT r0, #0x7

	CMP r4, #9
	IT GT
	MOVGT r0, #0xF


	BL illuminate_LEDs

	CMP r4, #0
	BNE END_SECOND_TIME_HANDLER

	MOV r4, #0x00
	LDR r0, ptr_to_redpaddle_state
	STRB r4, [r0]

	LDR r0, ptr_to_bluepaddle_state
	STRB r4, [r0]

	BL print_red_paddle
	BL print_blue_paddle

	LDR r0, ptr_to_power_up_active
	MOV r1, #power_up_active_false
	STRB r1, [r0]


	LDR r0, ptr_to_picked
	MOV r1, #picked_disabled
	STRB r1, [r0]

	BL power_up_randomizer

	B END_SECOND_TIME_HANDLER

START_DANCE:
	MOV r0, #0x0000
	MOVT r0, #0x4003
	LDR r1, [r0, #0x50]
	AND r2, r1, #0xF
	MOV r0, r2
	BL illuminate_LEDs

END_SECOND_TIME_HANDLER:

	POP {r4-r12,lr}
	BX lr

	.end
