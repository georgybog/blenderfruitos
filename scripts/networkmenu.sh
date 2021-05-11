/*
 *
 * Author  : Aditya Shakya
 * Mail    : adi1090x@gmail.com
 * Github  : @adi1090x
 * Twitter : @adi1090x
 *
 */

configuration {
	font:							"Iosevka Nerd Font 10";
    show-icons:                     true;
	icon-theme: 					"Papirus";
    display-drun: 					"";
    drun-display-format:            "{name}";
    disable-history:                false;
    fullscreen:                     false;
	hide-scrollbar: 				true;
	sidebar-mode: 					false;
}

@import "colors.rasi"

window {
    transparency:                   "real";
    background-color:               @bg;
    text-color:                     @fg;
	border:							0px;
	border-color:					@ac;
    border-radius:                  20px;
	width:							460px;
    location:                       southwest;
    x-offset:                       25px;
    y-offset:                       -95px;
}

prompt {
    enabled: 						true;
	padding: 						10px;
	background-color: 				@al;
	text-color: 					@fg;
}

textbox-prompt-colon {
	padding: 						10px 5px 10px 15px;
	font:							"Iosevka Nerd Font 10";
	background-color: 				@al;
	text-color: 					@ac;
	expand: false;
	str: "直";
}

entry {
    background-color:               @al;
    text-color:                     @ac;
    placeholder-color:              @ac;
    expand:                         true;
    horizontal-align:               0;
    placeholder:                    "Search...";
    padding:                        10px 10px 10px 0px;
    border-radius:                  0px;
    blink:                          true;
}

inputbar {
	children: 						[ textbox-prompt-colon, prompt ];
    background-color:               @al;
    text-color:                     @fg;
    expand:                         false;
	border:							0px 0px 1px 0px;
    border-radius:                  12px;
	border-color:					@ac;
    spacing:                        0px;
}

listview {
    background-color:               @al;
    padding:                        0px;
    columns:                        1;
    lines:                          8;
    spacing:                        5px;
    cycle:                          true;
    dynamic:                        true;
    layout:                         vertical;
}

mainbox {
    background-color:               @al;
	border:							0px;
    border-radius:                  0px;
	border-color:					@ac;
    children:                       [ inputbar, listview ];
    spacing:                       	10px;
    padding:                        2px 10px 10px 10px;
}

element {
    background-color:               @al;
    text-color:                     @fg;
    orientation:                    horizontal;
    border-radius:                  0px;
    padding:                        8px 8px 8px -10px;
}

element-icon {
    size:                           24px;
    border:                         0px;
}

element-text {
    expand:                         true;
    horizontal-align:               0;
    vertical-align:                 0.5;
    margin:                         0px 2.5px 0px 2.5px;
}

element selected {
    background-color:               @ac;
    text-color:                     @bg;
	border:							0px 0px 0px 0px;
    border-radius:                  12px;
    border-color:                  	@ac;
}
