EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:template_PCBPool-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "07 November 2014"
Rev "0.1"
Comp "s-light.eu"
Comment1 "CC BY SA"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +BATT #PWR?
U 1 1 5487046A
P 8750 6100
F 0 "#PWR?" H 8750 6050 20  0001 C CNN
F 1 "+BATT" H 8750 6200 30  0000 C CNN
F 2 "" H 8750 6100 60  0000 C CNN
F 3 "" H 8750 6100 60  0000 C CNN
	1    8750 6100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 54870470
P 9050 6100
F 0 "#PWR?" H 9050 6190 20  0001 C CNN
F 1 "+5V" H 9050 6190 30  0000 C CNN
F 2 "" H 9050 6100 60  0000 C CNN
F 3 "" H 9050 6100 60  0000 C CNN
	1    9050 6100
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 54870476
P 8900 6100
F 0 "#PWR?" H 8900 6070 20  0001 C CNN
F 1 "+9V" H 8900 6210 30  0000 C CNN
F 2 "" H 8900 6100 60  0000 C CNN
F 3 "" H 8900 6100 60  0000 C CNN
	1    8900 6100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5487047C
P 9100 6250
F 0 "#PWR?" H 9100 6250 30  0001 C CNN
F 1 "GND" H 9100 6180 30  0001 C CNN
F 2 "" H 9100 6250 60  0000 C CNN
F 3 "" H 9100 6250 60  0000 C CNN
	1    9100 6250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 54870482
P 9200 6100
F 0 "#PWR?" H 9200 6200 30  0001 C CNN
F 1 "VCC" H 9200 6200 30  0000 C CNN
F 2 "" H 9200 6100 60  0000 C CNN
F 3 "" H 9200 6100 60  0000 C CNN
	1    9200 6100
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR?
U 1 1 54870488
P 8750 6250
F 0 "#PWR?" H 8750 6300 40  0001 C CNN
F 1 "GNDPWR" H 8750 6170 40  0000 C CNN
F 2 "" H 8750 6250 60  0000 C CNN
F 3 "" H 8750 6250 60  0000 C CNN
	1    8750 6250
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR?
U 1 1 5487048E
P 9500 6250
F 0 "#PWR?" H 9500 6250 40  0001 C CNN
F 1 "GNDA" H 9500 6180 40  0000 C CNN
F 2 "" H 9500 6250 60  0000 C CNN
F 3 "" H 9500 6250 60  0000 C CNN
	1    9500 6250
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR?
U 1 1 54870494
P 9350 6100
F 0 "#PWR?" H 9350 6230 20  0001 C CNN
F 1 "+5VA" H 9350 6200 30  0000 C CNN
F 2 "" H 9350 6100 60  0000 C CNN
F 3 "" H 9350 6100 60  0000 C CNN
	1    9350 6100
	1    0    0    -1  
$EndComp
$Comp
L AREF #PWR?
U 1 1 5487049A
P 9500 6100
F 0 "#PWR?" H 9500 6230 20  0001 C CNN
F 1 "AREF" H 9500 6200 30  0000 C CNN
F 2 "" H 9500 6100 60  0000 C CNN
F 3 "" H 9500 6100 60  0000 C CNN
	1    9500 6100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 548704A0
P 9650 6100
F 0 "#PWR?" H 9650 6060 30  0001 C CNN
F 1 "+3.3V" H 9650 6210 30  0000 C CNN
F 2 "" H 9650 6100 60  0000 C CNN
F 3 "" H 9650 6100 60  0000 C CNN
	1    9650 6100
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 548704A6
P 10350 6150
F 0 "C?" H 10400 6250 50  0000 L CNN
F 1 "10uF" H 10400 6050 50  0000 L CNN
F 2 "" H 10350 6150 60  0000 C CNN
F 3 "" H 10350 6150 60  0000 C CNN
	1    10350 6150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 548704AD
P 10700 6150
F 0 "C?" H 10700 6250 40  0000 L CNN
F 1 "100nF" H 10706 6065 40  0000 L CNN
F 2 "" H 10738 6000 30  0000 C CNN
F 3 "" H 10700 6150 60  0000 C CNN
	1    10700 6150
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 548704B4
P 10050 5950
F 0 "#FLG?" H 10050 6045 30  0001 C CNN
F 1 "PWR_FLAG" H 10050 6130 30  0000 C CNN
F 2 "" H 10050 5950 60  0000 C CNN
F 3 "" H 10050 5950 60  0000 C CNN
	1    10050 5950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 548704BA
P 10350 5900
F 0 "#PWR?" H 10350 5990 20  0001 C CNN
F 1 "+5V" H 10350 5990 30  0000 C CNN
F 2 "" H 10350 5900 60  0000 C CNN
F 3 "" H 10350 5900 60  0000 C CNN
	1    10350 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 548704C0
P 10350 6400
F 0 "#PWR?" H 10350 6400 30  0001 C CNN
F 1 "GND" H 10350 6330 30  0001 C CNN
F 2 "" H 10350 6400 60  0000 C CNN
F 3 "" H 10350 6400 60  0000 C CNN
	1    10350 6400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 548704C6
P 10050 6350
F 0 "#FLG?" H 10050 6445 30  0001 C CNN
F 1 "PWR_FLAG" H 10050 6530 30  0000 C CNN
F 2 "" H 10050 6350 60  0000 C CNN
F 3 "" H 10050 6350 60  0000 C CNN
	1    10050 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 5950 10350 5950
Wire Wire Line
	10350 5950 10700 5950
Connection ~ 10350 5950
Wire Wire Line
	10350 5950 10350 5900
Wire Wire Line
	10050 6350 10350 6350
Wire Wire Line
	10350 6350 10700 6350
Wire Wire Line
	10350 6350 10350 6400
Connection ~ 10350 6350
$EndSCHEMATC
