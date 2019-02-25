EESchema Schematic File Version 4
LIBS:train_distance_car-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "A Carrier Board for Teensy 3.2 and ILI9341 Touch Screet"
Date "2019-02-22"
Rev "1.1"
Comp "Timberlake Hobbies"
Comment1 ""
Comment2 "This revision adding in Audio and FRAM for persistent memory"
Comment3 "with a Teensy 3.2 and a few peripherals to make it all more fun..."
Comment4 "This is a small \"mother board\" to tie together a cheap ILI9431 based touch screen"
$EndDescr
$Comp
L Memory_NVRAM:MB85RS16 U2
U 1 1 5C6FAE3A
P 8500 2850
F 0 "U2" H 8500 3328 50  0000 C CNN
F 1 "MB85RS16" H 8500 3237 50  0000 C CNN
F 2 "Package_SO:SOP-8_6.62x9.15mm_P2.54mm" H 8150 2800 50  0001 C CNN
F 3 "http://www.fujitsu.com/downloads/MICRO/fsa/pdf/products/memory/fram/MB85RS16-DS501-00014-6v0-E.pdf" H 8150 2800 50  0001 C CNN
	1    8500 2850
	1    0    0    -1  
$EndComp
Text GLabel 9050 2750 2    50   Input ~ 0
SCK
Wire Wire Line
	8900 2750 9050 2750
Text GLabel 9050 2850 2    50   Input ~ 0
MOSI
Text GLabel 9050 2950 2    50   Output ~ 0
MISO
Wire Wire Line
	8900 2850 9050 2850
Wire Wire Line
	8900 2950 9050 2950
Text GLabel 7950 2950 0    50   Input ~ 0
~FRCS
Wire Wire Line
	7950 2950 8100 2950
$Comp
L teensy:Teensy3.2 U1
U 1 1 5C6FB5F4
P 5500 3900
F 0 "U1" H 5500 5487 60  0000 C CNN
F 1 "Teensy3.2" H 5500 5381 60  0000 C CNN
F 2 "teensy:Teensy30_31_32_LC_audio_only" H 5500 3100 60  0001 C CNN
F 3 "" H 5500 3100 60  0000 C CNN
	1    5500 3900
	1    0    0    -1  
$EndComp
Text GLabel 2300 2600 0    50   Output ~ 0
TIRQ
Text GLabel 2300 2700 0    50   Output ~ 0
MISO
Text GLabel 2300 2800 0    50   Input ~ 0
MOSI
Text GLabel 2300 2900 0    50   Input ~ 0
TCS
Text GLabel 2300 3000 0    50   Input ~ 0
SCK
Text GLabel 2300 3100 0    50   Output ~ 0
MISO
Text GLabel 2300 3300 0    50   Input ~ 0
SCK
Text GLabel 2300 3400 0    50   Input ~ 0
MOSI
Text GLabel 2300 3500 0    50   Input ~ 0
DnC
Text GLabel 2300 3700 0    50   Input ~ 0
CS
Text GLabel 4300 2900 0    50   Input ~ 0
TIRQ
Text GLabel 4300 3800 0    50   Output ~ 0
MOSI
Text GLabel 4300 3900 0    50   Input ~ 0
MISO
Text GLabel 4300 3700 0    50   Output ~ 0
CS
Text GLabel 4300 3600 0    50   Output ~ 0
DnC
Text GLabel 4300 3500 0    50   Output ~ 0
TCS
Text GLabel 4300 4500 0    50   Output ~ 0
SCK
$Comp
L power:+5V #PWR03
U 1 1 5C70A537
P 1500 2750
F 0 "#PWR03" H 1500 2600 50  0001 C CNN
F 1 "+5V" H 1515 2923 50  0000 C CNN
F 2 "" H 1500 2750 50  0001 C CNN
F 3 "" H 1500 2750 50  0001 C CNN
	1    1500 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5C70A5FD
P 6800 4850
F 0 "#PWR015" H 6800 4700 50  0001 C CNN
F 1 "+3.3V" H 6815 5023 50  0000 C CNN
F 2 "" H 6800 4850 50  0001 C CNN
F 3 "" H 6800 4850 50  0001 C CNN
	1    6800 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 5C70A62F
P 8500 2300
F 0 "#PWR020" H 8500 2150 50  0001 C CNN
F 1 "+3.3V" H 8515 2473 50  0000 C CNN
F 2 "" H 8500 2300 50  0001 C CNN
F 3 "" H 8500 2300 50  0001 C CNN
	1    8500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2300 8500 2550
Wire Wire Line
	4300 2900 4500 2900
Wire Wire Line
	4300 3500 4500 3500
Wire Wire Line
	4300 3600 4500 3600
Wire Wire Line
	4300 3700 4500 3700
Wire Wire Line
	4300 3800 4500 3800
Wire Wire Line
	4300 3900 4500 3900
Wire Wire Line
	2300 2600 2450 2600
Wire Wire Line
	2300 2700 2450 2700
Wire Wire Line
	2300 2800 2450 2800
Wire Wire Line
	2300 2900 2450 2900
Wire Wire Line
	2300 3000 2450 3000
Wire Wire Line
	2300 3100 2450 3100
Wire Wire Line
	2300 3300 2450 3300
Wire Wire Line
	2300 3400 2450 3400
Wire Wire Line
	2300 3500 2450 3500
Wire Wire Line
	2300 3700 2450 3700
$Comp
L Device:R R1
U 1 1 5C70CE12
P 1500 3000
F 0 "R1" H 1570 3046 50  0000 L CNN
F 1 "100" H 1570 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1430 3000 50  0001 C CNN
F 3 "~" H 1500 3000 50  0001 C CNN
	1    1500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2750 1500 2850
Wire Wire Line
	1500 3150 1500 3200
Wire Wire Line
	1500 3200 2450 3200
$Comp
L power:+3.3V #PWR05
U 1 1 5C70D8DE
P 1800 3500
F 0 "#PWR05" H 1800 3350 50  0001 C CNN
F 1 "+3.3V" H 1815 3673 50  0000 C CNN
F 2 "" H 1800 3500 50  0001 C CNN
F 3 "" H 1800 3500 50  0001 C CNN
	1    1800 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C70D91E
P 2300 4000
F 0 "#PWR08" H 2300 3750 50  0001 C CNN
F 1 "GND" H 2305 3827 50  0000 C CNN
F 2 "" H 2300 4000 50  0001 C CNN
F 3 "" H 2300 4000 50  0001 C CNN
	1    2300 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5C70D95E
P 1500 3700
F 0 "#PWR04" H 1500 3550 50  0001 C CNN
F 1 "+5V" H 1515 3873 50  0000 C CNN
F 2 "" H 1500 3700 50  0001 C CNN
F 3 "" H 1500 3700 50  0001 C CNN
	1    1500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3600 1800 3600
Wire Wire Line
	1800 3600 1800 3500
Wire Wire Line
	1500 3700 1500 3900
$Comp
L Device:R R3
U 1 1 5C70ED76
P 2650 4650
F 0 "R3" H 2720 4696 50  0000 L CNN
F 1 "10k" H 2720 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2580 4650 50  0001 C CNN
F 3 "~" H 2650 4650 50  0001 C CNN
	1    2650 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5C70EDC1
P 3000 4650
F 0 "R4" H 3070 4696 50  0000 L CNN
F 1 "10k" H 3070 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2930 4650 50  0001 C CNN
F 3 "~" H 3000 4650 50  0001 C CNN
	1    3000 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR09
U 1 1 5C70EE08
P 2650 4350
F 0 "#PWR09" H 2650 4200 50  0001 C CNN
F 1 "+3.3V" H 2665 4523 50  0000 C CNN
F 2 "" H 2650 4350 50  0001 C CNN
F 3 "" H 2650 4350 50  0001 C CNN
	1    2650 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 5C70EE1F
P 3000 4350
F 0 "#PWR010" H 3000 4200 50  0001 C CNN
F 1 "+3.3V" H 3015 4523 50  0000 C CNN
F 2 "" H 3000 4350 50  0001 C CNN
F 3 "" H 3000 4350 50  0001 C CNN
	1    3000 4350
	1    0    0    -1  
$EndComp
Text GLabel 2650 5000 3    50   Input ~ 0
TCS
Text GLabel 3000 5000 3    50   Input ~ 0
CS
Wire Wire Line
	2650 4800 2650 5000
Wire Wire Line
	3000 4800 3000 5000
Wire Wire Line
	3000 4500 3000 4350
Wire Wire Line
	2650 4350 2650 4500
Text GLabel 1300 4900 0    50   Output ~ 0
ENC-A
Text GLabel 1300 4700 0    50   Output ~ 0
ENC-B
$Comp
L power:+5V #PWR01
U 1 1 5C711DC3
P 850 4750
F 0 "#PWR01" H 850 4600 50  0001 C CNN
F 1 "+5V" H 865 4923 50  0000 C CNN
F 2 "" H 850 4750 50  0001 C CNN
F 3 "" H 850 4750 50  0001 C CNN
	1    850  4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C711DDC
P 850 5150
F 0 "#PWR02" H 850 4900 50  0001 C CNN
F 1 "GND" H 855 4977 50  0000 C CNN
F 2 "" H 850 5150 50  0001 C CNN
F 3 "" H 850 5150 50  0001 C CNN
	1    850  5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4750 850  4800
Wire Wire Line
	850  4800 1450 4800
Wire Wire Line
	1450 4700 1300 4700
Wire Wire Line
	1300 4900 1450 4900
Wire Wire Line
	1450 5100 850  5100
Wire Wire Line
	850  5100 850  5150
$Comp
L Device:Polyfuse_Small F1
U 1 1 5C714627
P 1850 3900
F 0 "F1" V 1645 3900 50  0000 C CNN
F 1 "450mA Polyfuse" V 1736 3900 50  0000 C CNN
F 2 "Fuse:Fuse_2920_7451Metric" H 1900 3700 50  0001 L CNN
F 3 "~" H 1850 3900 50  0001 C CNN
	1    1850 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 3800 2300 3800
Wire Wire Line
	2300 3800 2300 4000
Wire Wire Line
	2450 3900 1950 3900
Wire Wire Line
	1750 3900 1500 3900
Wire Wire Line
	4300 4500 4500 4500
Text GLabel 6700 5200 2    50   Input ~ 0
ENC-B
Text GLabel 4300 5200 0    50   Input ~ 0
ENC-A
Wire Wire Line
	4300 5200 4500 5200
Wire Wire Line
	6500 5200 6700 5200
Text GLabel 6700 5100 2    50   Output ~ 0
~FRCS
Wire Wire Line
	6500 5100 6700 5100
$Comp
L Device:Buzzer BZ1
U 1 1 5C719CC2
P 7150 4900
F 0 "BZ1" H 7303 4929 50  0000 L CNN
F 1 "Buzzer" H 7303 4838 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 7125 5000 50  0001 C CNN
F 3 "~" V 7125 5000 50  0001 C CNN
	1    7150 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR016
U 1 1 5C719D1F
P 6950 4700
F 0 "#PWR016" H 6950 4550 50  0001 C CNN
F 1 "+3.3V" H 6965 4873 50  0000 C CNN
F 2 "" H 6950 4700 50  0001 C CNN
F 3 "" H 6950 4700 50  0001 C CNN
	1    6950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5000 7050 5000
Wire Wire Line
	7050 4800 6950 4800
Wire Wire Line
	6950 4800 6950 4700
$Comp
L Connector:Conn_01x08_Male J5
U 1 1 5C71B899
P 8550 4050
F 0 "J5" H 8522 4023 50  0000 R CNN
F 1 "Adafruit 500C Header" H 8522 3932 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 8550 4050 50  0001 C CNN
F 3 "~" H 8550 4050 50  0001 C CNN
	1    8550 4050
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5C71BA87
P 8100 3700
F 0 "#PWR017" H 8100 3550 50  0001 C CNN
F 1 "+5V" H 8115 3873 50  0000 C CNN
F 2 "" H 8100 3700 50  0001 C CNN
F 3 "" H 8100 3700 50  0001 C CNN
	1    8100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3750 8100 3700
Wire Wire Line
	8100 3750 8350 3750
$Comp
L power:GND #PWR018
U 1 1 5C71E698
P 8100 4600
F 0 "#PWR018" H 8100 4350 50  0001 C CNN
F 1 "GND" H 8105 4427 50  0000 C CNN
F 2 "" H 8100 4600 50  0001 C CNN
F 3 "" H 8100 4600 50  0001 C CNN
	1    8100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3850 8100 3850
Wire Wire Line
	8100 3850 8100 4050
Wire Wire Line
	8350 4350 8100 4350
Connection ~ 8100 4350
Wire Wire Line
	8100 4350 8100 4600
Wire Wire Line
	8350 4050 8100 4050
Connection ~ 8100 4050
Wire Wire Line
	8100 4050 8100 4350
Text GLabel 7800 3950 0    50   Output ~ 0
~LOBAT
Wire Wire Line
	8350 3950 7800 3950
Text GLabel 7800 4150 0    50   Input ~ 0
~PWR_OFF
Wire Wire Line
	7800 4150 8350 4150
Text GLabel 8050 4250 0    50   Output ~ 0
VBAT
Wire Wire Line
	8050 4250 8350 4250
$Comp
L Device:R R6
U 1 1 5C724B75
P 8700 4950
F 0 "R6" H 8770 4996 50  0000 L CNN
F 1 "100k" H 8770 4905 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8630 4950 50  0001 C CNN
F 3 "~" H 8700 4950 50  0001 C CNN
	1    8700 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5C724C0D
P 8700 5450
F 0 "R7" H 8770 5496 50  0000 L CNN
F 1 "100k" H 8770 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8630 5450 50  0001 C CNN
F 3 "~" H 8700 5450 50  0001 C CNN
	1    8700 5450
	1    0    0    -1  
$EndComp
Text GLabel 9000 4650 2    50   Input ~ 0
VBAT
Wire Wire Line
	9000 4650 8700 4650
Wire Wire Line
	8700 4650 8700 4800
Text GLabel 9000 5200 2    50   Output ~ 0
VBAT.5
$Comp
L power:GND #PWR022
U 1 1 5C725F53
P 8700 5800
F 0 "#PWR022" H 8700 5550 50  0001 C CNN
F 1 "GND" H 8705 5627 50  0000 C CNN
F 2 "" H 8700 5800 50  0001 C CNN
F 3 "" H 8700 5800 50  0001 C CNN
	1    8700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5100 8700 5200
Wire Wire Line
	9000 5200 8700 5200
Connection ~ 8700 5200
Wire Wire Line
	8700 5200 8700 5300
Wire Wire Line
	8700 5600 8700 5800
$Comp
L Device:C C1
U 1 1 5C7298FE
P 8350 5450
F 0 "C1" H 8465 5496 50  0000 L CNN
F 1 ".1uf" H 8465 5405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8388 5300 50  0001 C CNN
F 3 "~" H 8350 5450 50  0001 C CNN
	1    8350 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5C729943
P 8350 5800
F 0 "#PWR019" H 8350 5550 50  0001 C CNN
F 1 "GND" H 8355 5627 50  0000 C CNN
F 2 "" H 8350 5800 50  0001 C CNN
F 3 "" H 8350 5800 50  0001 C CNN
	1    8350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5200 8350 5200
Wire Wire Line
	8350 5300 8350 5200
Wire Wire Line
	8350 5800 8350 5600
Text GLabel 4300 4600 0    50   Input ~ 0
VBAT.5
Wire Wire Line
	4300 4600 4500 4600
$Comp
L Connector:Conn_01x14_Male J3
U 1 1 5C72F38F
P 2650 3200
F 0 "J3" H 2622 3173 50  0000 R CNN
F 1 "IFI9431 Header" H 2622 3082 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x14_P2.54mm_Vertical" H 2650 3200 50  0001 C CNN
F 3 "~" H 2650 3200 50  0001 C CNN
	1    2650 3200
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 5C72F7E3
P 1650 4900
F 0 "J1" H 1622 4923 50  0000 R CNN
F 1 "Encoder Header" H 1622 4832 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 1650 4900 50  0001 C CNN
F 3 "~" H 1650 4900 50  0001 C CNN
	1    1650 4900
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5C72FA0A
P 8500 3300
F 0 "#PWR021" H 8500 3050 50  0001 C CNN
F 1 "GND" H 8505 3127 50  0000 C CNN
F 2 "" H 8500 3300 50  0001 C CNN
F 3 "" H 8500 3300 50  0001 C CNN
	1    8500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3150 8500 3300
$Comp
L power:+5V #PWR014
U 1 1 5C731040
P 6700 4600
F 0 "#PWR014" H 6700 4450 50  0001 C CNN
F 1 "+5V" H 6715 4773 50  0000 C CNN
F 2 "" H 6700 4600 50  0001 C CNN
F 3 "" H 6700 4600 50  0001 C CNN
	1    6700 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4700 6700 4700
Wire Wire Line
	6700 4700 6700 4600
Wire Wire Line
	6500 4900 6800 4900
Wire Wire Line
	6800 4900 6800 4850
$Comp
L power:GND #PWR013
U 1 1 5C737049
P 6550 5450
F 0 "#PWR013" H 6550 5200 50  0001 C CNN
F 1 "GND" H 6555 5277 50  0000 C CNN
F 2 "" H 6550 5450 50  0001 C CNN
F 3 "" H 6550 5450 50  0001 C CNN
	1    6550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4800 6550 4800
Wire Wire Line
	6550 4800 6550 5450
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5C73893B
P 3750 6300
F 0 "J4" H 3723 6273 50  0000 R CNN
F 1 "Button Header" H 3723 6182 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3750 6300 50  0001 C CNN
F 3 "~" H 3750 6300 50  0001 C CNN
	1    3750 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5C7389D4
P 3450 6050
F 0 "R5" H 3520 6096 50  0000 L CNN
F 1 "10k" H 3520 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3380 6050 50  0001 C CNN
F 3 "~" H 3450 6050 50  0001 C CNN
	1    3450 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5C738A5E
P 3450 6500
F 0 "#PWR012" H 3450 6250 50  0001 C CNN
F 1 "GND" H 3455 6327 50  0000 C CNN
F 2 "" H 3450 6500 50  0001 C CNN
F 3 "" H 3450 6500 50  0001 C CNN
	1    3450 6500
	1    0    0    -1  
$EndComp
Text GLabel 3350 6300 0    50   Output ~ 0
~BUTTON2
$Comp
L power:+3.3V #PWR011
U 1 1 5C738B06
P 3450 5800
F 0 "#PWR011" H 3450 5650 50  0001 C CNN
F 1 "+3.3V" H 3465 5973 50  0000 C CNN
F 2 "" H 3450 5800 50  0001 C CNN
F 3 "" H 3450 5800 50  0001 C CNN
	1    3450 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5800 3450 5900
Wire Wire Line
	3450 6200 3450 6300
Wire Wire Line
	3450 6300 3550 6300
Wire Wire Line
	3350 6300 3450 6300
Connection ~ 3450 6300
Wire Wire Line
	3550 6400 3450 6400
Wire Wire Line
	3450 6400 3450 6500
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C741892
P 2200 6300
F 0 "J2" H 2173 6273 50  0000 R CNN
F 1 "Button Header" H 2173 6182 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2200 6300 50  0001 C CNN
F 3 "~" H 2200 6300 50  0001 C CNN
	1    2200 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5C741899
P 1900 6050
F 0 "R2" H 1970 6096 50  0000 L CNN
F 1 "10k" H 1970 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1830 6050 50  0001 C CNN
F 3 "~" H 1900 6050 50  0001 C CNN
	1    1900 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5C7418A0
P 1900 6500
F 0 "#PWR07" H 1900 6250 50  0001 C CNN
F 1 "GND" H 1905 6327 50  0000 C CNN
F 2 "" H 1900 6500 50  0001 C CNN
F 3 "" H 1900 6500 50  0001 C CNN
	1    1900 6500
	1    0    0    -1  
$EndComp
Text GLabel 1800 6300 0    50   Output ~ 0
~BUTTON1
$Comp
L power:+3.3V #PWR06
U 1 1 5C7418A7
P 1900 5800
F 0 "#PWR06" H 1900 5650 50  0001 C CNN
F 1 "+3.3V" H 1915 5973 50  0000 C CNN
F 2 "" H 1900 5800 50  0001 C CNN
F 3 "" H 1900 5800 50  0001 C CNN
	1    1900 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5800 1900 5900
Wire Wire Line
	1900 6200 1900 6300
Wire Wire Line
	1900 6300 2000 6300
Wire Wire Line
	1800 6300 1900 6300
Connection ~ 1900 6300
Wire Wire Line
	2000 6400 1900 6400
Wire Wire Line
	1900 6400 1900 6500
Text GLabel 4300 4800 0    50   Input ~ 0
~BUTTON2
Text GLabel 3900 4900 0    50   Input ~ 0
~BUTTON1
Wire Wire Line
	4300 4800 4500 4800
Wire Wire Line
	3900 4900 4500 4900
$Comp
L power:GND #PWR0101
U 1 1 5C7270B0
P 5700 6150
F 0 "#PWR0101" H 5700 5900 50  0001 C CNN
F 1 "GND" H 5705 5977 50  0000 C CNN
F 2 "" H 5700 6150 50  0001 C CNN
F 3 "" H 5700 6150 50  0001 C CNN
	1    5700 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 6050 5700 6050
Wire Wire Line
	5700 6050 5700 6150
Text GLabel 4900 5950 0    50   Input ~ 0
~PWR_OFF
$Comp
L dk_Slide-Switches:EG1218 S1
U 1 1 5C72C468
P 5350 5950
F 0 "S1" H 5350 6229 50  0000 C CNN
F 1 "EG1218" H 5350 6138 50  0000 C CNN
F 2 "digikey-footprints:Switch_Slide_11.6x4mm_EG1218" H 5550 6150 50  0001 L CNN
F 3 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 5550 6250 60  0001 L CNN
F 4 "EG1903-ND" H 5550 6350 60  0001 L CNN "Digi-Key_PN"
F 5 "EG1218" H 5550 6450 60  0001 L CNN "MPN"
F 6 "Switches" H 5550 6550 60  0001 L CNN "Category"
F 7 "Slide Switches" H 5550 6650 60  0001 L CNN "Family"
F 8 "http://spec_sheets.e-switch.com/specs/P040040.pdf" H 5550 6750 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/e-switch/EG1218/EG1903-ND/101726" H 5550 6850 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH SLIDE SPDT 200MA 30V" H 5550 6950 60  0001 L CNN "Description"
F 11 "E-Switch" H 5550 7050 60  0001 L CNN "Manufacturer"
F 12 "Active" H 5550 7150 60  0001 L CNN "Status"
	1    5350 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5950 5150 5950
$Comp
L power:GND #PWR0102
U 1 1 5C732358
P 3800 2650
F 0 "#PWR0102" H 3800 2400 50  0001 C CNN
F 1 "GND" H 3805 2477 50  0000 C CNN
F 2 "" H 3800 2650 50  0001 C CNN
F 3 "" H 3800 2650 50  0001 C CNN
	1    3800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2600 3800 2600
Wire Wire Line
	3800 2600 3800 2650
$Comp
L Mechanical:MountingHole H1
U 1 1 5C73529E
P 1000 900
F 0 "H1" H 1100 946 50  0000 L CNN
F 1 "hole" H 1100 855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1000 900 50  0001 C CNN
F 3 "~" H 1000 900 50  0001 C CNN
	1    1000 900 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5C737CA3
P 1000 1600
F 0 "H2" H 1100 1646 50  0000 L CNN
F 1 "hole" H 1100 1555 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1000 1600 50  0001 C CNN
F 3 "~" H 1000 1600 50  0001 C CNN
	1    1000 1600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5C737D04
P 2350 900
F 0 "H5" H 2450 946 50  0000 L CNN
F 1 "hole" H 2450 855 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 2350 900 50  0001 C CNN
F 3 "~" H 2350 900 50  0001 C CNN
	1    2350 900 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5C737D58
P 2350 1600
F 0 "H6" H 2450 1646 50  0000 L CNN
F 1 "hole" H 2450 1555 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 2350 1600 50  0001 C CNN
F 3 "~" H 2350 1600 50  0001 C CNN
	1    2350 1600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5C737DFF
P 1850 1400
F 0 "H3" H 1950 1446 50  0000 L CNN
F 1 "hole" H 1950 1355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1850 1400 50  0001 C CNN
F 3 "~" H 1850 1400 50  0001 C CNN
	1    1850 1400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5C737E4F
P 2100 1400
F 0 "H4" H 2200 1446 50  0000 L CNN
F 1 "hole" H 2200 1355 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 2100 1400 50  0001 C CNN
F 3 "~" H 2100 1400 50  0001 C CNN
	1    2100 1400
	1    0    0    -1  
$EndComp
$EndSCHEMATC