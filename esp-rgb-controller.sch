EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "ESP RGB Controller"
Date "2020-10-19"
Rev "A"
Comp "W3AXL"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AP6320X:AP63203WU-7 U2
U 1 1 5F8DF99E
P 3500 6950
F 0 "U2" H 3500 7365 50  0000 C CNN
F 1 "AP63203WU-7" H 3500 7274 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6_HandSoldering" H 3500 6950 50  0001 C CNN
F 3 "" H 3500 6950 50  0001 C CNN
	1    3500 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 5F8E100B
P 2750 7100
F 0 "C2" H 2838 7146 50  0000 L CNN
F 1 "10uF" H 2838 7055 50  0000 L CNN
F 2 "" H 2750 7100 50  0001 C CNN
F 3 "~" H 2750 7100 50  0001 C CNN
	1    2750 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F8E239A
P 3500 7300
F 0 "#PWR07" H 3500 7050 50  0001 C CNN
F 1 "GND" H 3505 7127 50  0001 C CNN
F 2 "" H 3500 7300 50  0001 C CNN
F 3 "" H 3500 7300 50  0001 C CNN
	1    3500 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F8E2BFA
P 2750 7200
F 0 "#PWR06" H 2750 6950 50  0001 C CNN
F 1 "GND" H 2755 7027 50  0001 C CNN
F 2 "" H 2750 7200 50  0001 C CNN
F 3 "" H 2750 7200 50  0001 C CNN
	1    2750 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F2
U 1 1 5F8E3151
P 2500 6800
F 0 "F2" H 2500 6985 50  0000 C CNN
F 1 "500mA" H 2500 6894 50  0000 C CNN
F 2 "Fuse:Fuse_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2500 6800 50  0001 C CNN
F 3 "~" H 2500 6800 50  0001 C CNN
	1    2500 6800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5F8E3D19
P 1700 6900
F 0 "J1" H 1757 7217 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1757 7126 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-102AH_Horizontal" H 1750 6860 50  0001 C CNN
F 3 "~" H 1750 6860 50  0001 C CNN
	1    1700 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F8E4746
P 2050 7050
F 0 "#PWR02" H 2050 6800 50  0001 C CNN
F 1 "GND" H 2055 6877 50  0001 C CNN
F 2 "" H 2050 7050 50  0001 C CNN
F 3 "" H 2050 7050 50  0001 C CNN
	1    2050 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6900 2050 6900
Wire Wire Line
	2050 6900 2050 7000
Wire Wire Line
	2000 7000 2050 7000
Connection ~ 2050 7000
Wire Wire Line
	2050 7000 2050 7050
Wire Wire Line
	2000 6800 2200 6800
Wire Wire Line
	2600 6800 2750 6800
Wire Wire Line
	2750 7000 2750 6800
Connection ~ 2750 6800
Wire Wire Line
	2750 6800 3000 6800
Wire Wire Line
	3150 6950 3000 6950
Wire Wire Line
	3000 6950 3000 6800
Connection ~ 3000 6800
Wire Wire Line
	3000 6800 3150 6800
$Comp
L Device:Fuse_Small F1
U 1 1 5F8E5995
P 2500 6450
F 0 "F1" H 2500 6635 50  0000 C CNN
F 1 "4A" H 2500 6544 50  0000 C CNN
F 2 "Fuse:Fuse_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2500 6450 50  0001 C CNN
F 3 "~" H 2500 6450 50  0001 C CNN
	1    2500 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6450 2200 6450
Wire Wire Line
	2200 6450 2200 6800
Connection ~ 2200 6800
Wire Wire Line
	2200 6800 2400 6800
$Comp
L power:+12V #PWR05
U 1 1 5F8E6439
P 2700 6350
F 0 "#PWR05" H 2700 6200 50  0001 C CNN
F 1 "+12V" H 2715 6523 50  0000 C CNN
F 2 "" H 2700 6350 50  0001 C CNN
F 3 "" H 2700 6350 50  0001 C CNN
	1    2700 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6450 2700 6450
Wire Wire Line
	2700 6450 2700 6350
$Comp
L Device:L_Small L1
U 1 1 5F8E78DC
P 4450 6950
F 0 "L1" V 4635 6950 50  0000 C CNN
F 1 "3.9uH" V 4544 6950 50  0000 C CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_NR-40xx_HandSoldering" H 4450 6950 50  0001 C CNN
F 3 "~" H 4450 6950 50  0001 C CNN
	1    4450 6950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5F8E9D8B
P 4050 6800
F 0 "C3" V 3821 6800 50  0000 C CNN
F 1 "0.1uF" V 3912 6800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 6800 50  0001 C CNN
F 3 "~" H 4050 6800 50  0001 C CNN
	1    4050 6800
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 5F8EE4E5
P 4650 7300
F 0 "C5" H 4550 7350 50  0000 R CNN
F 1 "22uF" H 4550 7250 50  0000 R CNN
F 2 "" H 4650 7300 50  0001 C CNN
F 3 "~" H 4650 7300 50  0001 C CNN
	1    4650 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6950 4250 6950
Wire Wire Line
	3950 6800 3850 6800
Wire Wire Line
	4150 6800 4250 6800
Wire Wire Line
	4250 6800 4250 6950
Connection ~ 4250 6950
Wire Wire Line
	4250 6950 3850 6950
$Comp
L power:GND #PWR012
U 1 1 5F8F2492
P 4650 7400
F 0 "#PWR012" H 4650 7150 50  0001 C CNN
F 1 "GND" H 4655 7227 50  0001 C CNN
F 2 "" H 4650 7400 50  0001 C CNN
F 3 "" H 4650 7400 50  0001 C CNN
	1    4650 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6950 4650 6950
Wire Wire Line
	3850 7100 4650 7100
Wire Wire Line
	4650 6950 4650 7100
Wire Wire Line
	4650 7200 4650 7100
Connection ~ 4650 7100
$Comp
L power:+3V3 #PWR014
U 1 1 5F8F6290
P 4850 6950
F 0 "#PWR014" H 4850 6800 50  0001 C CNN
F 1 "+3V3" H 4865 7123 50  0000 C CNN
F 2 "" H 4850 6950 50  0001 C CNN
F 3 "" H 4850 6950 50  0001 C CNN
	1    4850 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C6
U 1 1 5F8F7EB9
P 4850 7300
F 0 "C6" H 4938 7346 50  0000 L CNN
F 1 "22uF" H 4938 7255 50  0000 L CNN
F 2 "" H 4850 7300 50  0001 C CNN
F 3 "~" H 4850 7300 50  0001 C CNN
	1    4850 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5F8F8B60
P 4850 7400
F 0 "#PWR015" H 4850 7150 50  0001 C CNN
F 1 "GND" H 4855 7227 50  0001 C CNN
F 2 "" H 4850 7400 50  0001 C CNN
F 3 "" H 4850 7400 50  0001 C CNN
	1    4850 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 7100 4850 7100
Wire Wire Line
	4850 7100 4850 7200
Wire Wire Line
	4850 6950 4850 7100
Connection ~ 4850 7100
$Comp
L Device:Q_NMOS_GDSD Q3
U 1 1 5F9037E1
P 8900 4000
F 0 "Q3" H 9188 4046 50  0000 L CNN
F 1 "DMG4800LK3" H 9188 3955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-3_TabPin4" H 9100 4100 50  0001 C CNN
F 3 "~" H 8900 4000 50  0001 C CNN
	1    8900 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5F90815F
P 7500 5400
F 0 "#PWR024" H 7500 5150 50  0001 C CNN
F 1 "GND" H 7505 5227 50  0001 C CNN
F 2 "" H 7500 5400 50  0001 C CNN
F 3 "" H 7500 5400 50  0001 C CNN
	1    7500 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5F90883C
P 8250 4900
F 0 "#PWR025" H 8250 4650 50  0001 C CNN
F 1 "GND" H 8255 4727 50  0001 C CNN
F 2 "" H 8250 4900 50  0001 C CNN
F 3 "" H 8250 4900 50  0001 C CNN
	1    8250 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5F908D41
P 9000 4400
F 0 "#PWR026" H 9000 4150 50  0001 C CNN
F 1 "GND" H 9005 4227 50  0001 C CNN
F 2 "" H 9000 4400 50  0001 C CNN
F 3 "" H 9000 4400 50  0001 C CNN
	1    9000 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J6
U 1 1 5F90A806
P 9500 3200
F 0 "J6" H 9528 3176 50  0000 L CNN
F 1 "STRIP" H 9528 3085 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-4_P5.08mm" H 9500 3200 50  0001 C CNN
F 3 "~" H 9500 3200 50  0001 C CNN
	1    9500 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDSD Q1
U 1 1 5F90D767
P 7400 5000
F 0 "Q1" H 7688 5046 50  0000 L CNN
F 1 "DMG4800LK3" H 7688 4955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-3_TabPin4" H 7600 5100 50  0001 C CNN
F 3 "~" H 7400 5000 50  0001 C CNN
	1    7400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3400 9000 3400
Wire Wire Line
	9000 3400 9000 3700
Wire Wire Line
	9100 3800 9100 3700
Wire Wire Line
	9100 3700 9000 3700
Connection ~ 9000 3700
Wire Wire Line
	9000 3700 9000 3800
Wire Wire Line
	8350 4300 8350 4200
$Comp
L power:+12V #PWR027
U 1 1 5F91C951
P 9200 3000
F 0 "#PWR027" H 9200 2850 50  0001 C CNN
F 1 "+12V" H 9215 3173 50  0000 C CNN
F 2 "" H 9200 3000 50  0001 C CNN
F 3 "" H 9200 3000 50  0001 C CNN
	1    9200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3100 9200 3100
Wire Wire Line
	9200 3100 9200 3000
$Comp
L power:GND #PWR03
U 1 1 5F92CF09
P 2500 5100
F 0 "#PWR03" H 2500 4850 50  0001 C CNN
F 1 "GND" H 2505 4927 50  0001 C CNN
F 2 "" H 2500 5100 50  0001 C CNN
F 3 "" H 2500 5100 50  0001 C CNN
	1    2500 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 5F92DF02
P 2600 1950
F 0 "#PWR04" H 2600 1800 50  0001 C CNN
F 1 "+3V3" H 2615 2123 50  0000 C CNN
F 2 "" H 2600 1950 50  0001 C CNN
F 3 "" H 2600 1950 50  0001 C CNN
	1    2600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2000 2600 1950
Connection ~ 2600 2000
Wire Wire Line
	6500 2900 6500 2950
Wire Wire Line
	6450 2900 6500 2900
$Comp
L power:GND #PWR022
U 1 1 5F8DE2A7
P 6500 2950
F 0 "#PWR022" H 6500 2700 50  0001 C CNN
F 1 "GND" H 6505 2777 50  0001 C CNN
F 2 "" H 6500 2950 50  0001 C CNN
F 3 "" H 6500 2950 50  0001 C CNN
	1    6500 2950
	1    0    0    -1  
$EndComp
$Comp
L ESP8266:ESP-01v090 U3
U 1 1 5F8DC6ED
P 5500 2750
F 0 "U3" H 5500 2235 50  0000 C CNN
F 1 "ESP-01v090" H 5500 2326 50  0000 C CNN
F 2 "ESP8266:ESP-01" H 5500 2750 50  0001 C CNN
F 3 "http://l0l.org.uk/2014/12/esp8266-modules-hardware-guide-gotta-catch-em-all/" H 5500 2750 50  0001 C CNN
	1    5500 2750
	1    0    0    1   
$EndComp
Text GLabel 8600 4000 0    50   Input ~ 0
B_PWM
Text GLabel 7850 4500 0    50   Input ~ 0
R_PWM
Text GLabel 7100 5000 0    50   Input ~ 0
G_PWM
Text Label 9000 3200 0    50   ~ 0
G
Text Label 9000 3300 0    50   ~ 0
R
Text Label 9000 3400 0    50   ~ 0
B
$Comp
L Device:Q_NMOS_GDSD Q2
U 1 1 5F90CDEA
P 8150 4500
F 0 "Q2" H 8438 4546 50  0000 L CNN
F 1 "DMG4800LK3" H 8438 4455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-3_TabPin4" H 8350 4600 50  0001 C CNN
F 3 "~" H 8150 4500 50  0001 C CNN
	1    8150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3300 8250 4200
Wire Wire Line
	8250 3300 9300 3300
Wire Wire Line
	8350 4200 8250 4200
Connection ~ 8250 4200
Wire Wire Line
	8250 4200 8250 4300
Wire Wire Line
	7500 3200 7500 4700
Wire Wire Line
	7500 3200 9300 3200
Wire Wire Line
	7600 4800 7600 4700
Wire Wire Line
	7600 4700 7500 4700
Connection ~ 7500 4700
Wire Wire Line
	7500 4700 7500 4800
$Comp
L Device:R_Small R3
U 1 1 5F9B7621
P 7300 5300
F 0 "R3" V 7400 5300 50  0000 C BNN
F 1 "10k" V 7300 5300 40  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7300 5300 50  0001 C CNN
F 3 "~" H 7300 5300 50  0001 C CNN
	1    7300 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 4300 9000 4300
Wire Wire Line
	9000 4300 9000 4200
Wire Wire Line
	9000 4300 9000 4400
Connection ~ 9000 4300
Wire Wire Line
	8700 4300 8650 4300
Wire Wire Line
	8650 4300 8650 4000
Wire Wire Line
	8650 4000 8600 4000
Wire Wire Line
	8700 4000 8650 4000
Connection ~ 8650 4000
Wire Wire Line
	7850 4500 7900 4500
Wire Wire Line
	7900 4500 7900 4800
Wire Wire Line
	7900 4800 7950 4800
Connection ~ 7900 4500
Wire Wire Line
	7900 4500 7950 4500
Wire Wire Line
	8150 4800 8250 4800
Wire Wire Line
	8250 4800 8250 4700
Wire Wire Line
	8250 4800 8250 4900
Connection ~ 8250 4800
Wire Wire Line
	7200 5000 7150 5000
Wire Wire Line
	7150 5000 7150 5300
Wire Wire Line
	7150 5300 7200 5300
Connection ~ 7150 5000
Wire Wire Line
	7150 5000 7100 5000
Wire Wire Line
	7400 5300 7500 5300
Wire Wire Line
	7500 5300 7500 5200
Wire Wire Line
	7500 5300 7500 5400
Connection ~ 7500 5300
$Comp
L Device:R_Small R4
U 1 1 5F9C69C1
P 8050 4800
F 0 "R4" V 8150 4800 50  0000 C BNN
F 1 "10k" V 8050 4800 40  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 4800 50  0001 C CNN
F 3 "~" H 8050 4800 50  0001 C CNN
	1    8050 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F9C704F
P 8800 4300
F 0 "R5" V 8900 4300 50  0000 C BNN
F 1 "10k" V 8800 4300 40  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8800 4300 50  0001 C CNN
F 3 "~" H 8800 4300 50  0001 C CNN
	1    8800 4300
	0    -1   -1   0   
$EndComp
Text GLabel 3100 2500 2    50   Input ~ 0
R_PWM
Text GLabel 3100 4600 2    50   Input ~ 0
G_PWM
Text GLabel 3100 4700 2    50   Input ~ 0
B_PWM
Wire Wire Line
	2500 2000 2500 2100
Connection ~ 2500 2000
Wire Wire Line
	2500 2000 2600 2000
Wire Wire Line
	2600 2000 2600 2100
$Comp
L MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 5F93A058
P 2500 3600
F 0 "U1" H 2650 2150 50  0000 L CNN
F 1 "ATmega328P-AU" H 2650 2050 50  0000 L CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 2500 3600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2500 3600 50  0001 C CNN
	1    2500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2000 1850 2000
Wire Wire Line
	1900 2400 1850 2400
Wire Wire Line
	1850 2400 1850 2000
Connection ~ 1850 2000
Wire Wire Line
	1850 2000 2500 2000
$Comp
L power:+3V3 #PWR010
U 1 1 5FA0BE4A
P 4450 2500
F 0 "#PWR010" H 4450 2350 50  0001 C CNN
F 1 "+3V3" H 4465 2673 50  0000 C CNN
F 2 "" H 4450 2500 50  0001 C CNN
F 3 "" H 4450 2500 50  0001 C CNN
	1    4450 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5F92F9F6
P 1700 2000
F 0 "C1" V 1471 2000 50  0000 C CNN
F 1 "0.1uF" V 1562 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1700 2000 50  0001 C CNN
F 3 "~" H 1700 2000 50  0001 C CNN
	1    1700 2000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F930F67
P 1600 2000
F 0 "#PWR01" H 1600 1750 50  0001 C CNN
F 1 "GND" H 1605 1827 50  0001 C CNN
F 2 "" H 1600 2000 50  0001 C CNN
F 3 "" H 1600 2000 50  0001 C CNN
	1    1600 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5FA0ED00
P 4250 2600
F 0 "C4" V 4021 2600 50  0000 C CNN
F 1 "0.1uF" V 4112 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 2600 50  0001 C CNN
F 3 "~" H 4250 2600 50  0001 C CNN
	1    4250 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FA0ED0A
P 4150 2600
F 0 "#PWR09" H 4150 2350 50  0001 C CNN
F 1 "GND" H 4155 2427 50  0001 C CNN
F 2 "" H 4150 2600 50  0001 C CNN
F 3 "" H 4150 2600 50  0001 C CNN
	1    4150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2600 4450 2600
Wire Wire Line
	4450 2500 4450 2600
Connection ~ 4450 2600
Wire Wire Line
	4450 2600 4550 2600
Text GLabel 4200 2800 0    50   Input ~ 0
~RST
Text GLabel 3100 3900 2    50   Input ~ 0
~RST
$Comp
L Connector:AVR-ISP-6 J4
U 1 1 5FA22D35
P 5250 4050
F 0 "J4" H 4920 4146 50  0000 R CNN
F 1 "AVR-ISP-6" H 4920 4055 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 5000 4100 50  0001 C CNN
F 3 " ~" H 3975 3500 50  0001 C CNN
	1    5250 4050
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5FA23F2A
P 5350 4450
F 0 "#PWR017" H 5350 4200 50  0001 C CNN
F 1 "GND" H 5355 4277 50  0001 C CNN
F 2 "" H 5350 4450 50  0001 C CNN
F 3 "" H 5350 4450 50  0001 C CNN
	1    5350 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR016
U 1 1 5FA245DE
P 5350 3550
F 0 "#PWR016" H 5350 3400 50  0001 C CNN
F 1 "+3V3" H 5365 3723 50  0000 C CNN
F 2 "" H 5350 3550 50  0001 C CNN
F 3 "" H 5350 3550 50  0001 C CNN
	1    5350 3550
	1    0    0    -1  
$EndComp
Text GLabel 4850 4150 0    50   Input ~ 0
~RST
Text GLabel 4850 3850 0    50   Input ~ 0
MISO
Text GLabel 4850 3950 0    50   Input ~ 0
MOSI
Text GLabel 4850 4050 0    50   Input ~ 0
SCK
Text GLabel 3100 2900 2    50   Input ~ 0
SCK
Text GLabel 3100 2800 2    50   Input ~ 0
MISO
Text GLabel 3100 2700 2    50   Input ~ 0
MOSI
$Comp
L Device:LED_Small D2
U 1 1 5FA2F90E
P 5500 7300
F 0 "D2" V 5546 7230 50  0000 R CNN
F 1 "PWR" V 5455 7230 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5500 7300 50  0001 C CNN
F 3 "~" V 5500 7300 50  0001 C CNN
	1    5500 7300
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5FA30814
P 3600 3100
F 0 "D1" V 3646 3030 50  0000 R CNN
F 1 "STAT" V 3555 3030 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 3600 3100 50  0001 C CNN
F 3 "~" V 3600 3100 50  0001 C CNN
	1    3600 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 3300 3600 3200
$Comp
L power:+3V3 #PWR08
U 1 1 5FA48F8A
P 3600 3000
F 0 "#PWR08" H 3600 2850 50  0001 C CNN
F 1 "+3V3" H 3615 3173 50  0000 C CNN
F 2 "" H 3600 3000 50  0001 C CNN
F 3 "" H 3600 3000 50  0001 C CNN
	1    3600 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5FA4FEF6
P 3350 3300
F 0 "R1" V 3450 3300 50  0000 C BNN
F 1 "1k" V 3350 3300 40  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 3300 50  0001 C CNN
F 3 "~" H 3350 3300 50  0001 C CNN
	1    3350 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3300 3250 3300
Wire Wire Line
	3450 3300 3600 3300
$Comp
L power:GND #PWR019
U 1 1 5FA7FA7D
P 5500 7400
F 0 "#PWR019" H 5500 7150 50  0001 C CNN
F 1 "GND" H 5505 7227 50  0001 C CNN
F 2 "" H 5500 7400 50  0001 C CNN
F 3 "" H 5500 7400 50  0001 C CNN
	1    5500 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5FA80FD8
P 5500 7100
F 0 "R2" V 5600 7100 50  0000 C BNN
F 1 "1k" V 5500 7100 40  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 7100 50  0001 C CNN
F 3 "~" H 5500 7100 50  0001 C CNN
	1    5500 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR018
U 1 1 5FA82716
P 5500 7000
F 0 "#PWR018" H 5500 6850 50  0001 C CNN
F 1 "+3V3" H 5515 7173 50  0000 C CNN
F 2 "" H 5500 7000 50  0001 C CNN
F 3 "" H 5500 7000 50  0001 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2800 4450 2800
Wire Wire Line
	4450 2800 4450 2600
Wire Wire Line
	4550 2700 4350 2700
Wire Wire Line
	4350 2700 4350 2800
Wire Wire Line
	4350 2800 4200 2800
Text GLabel 3100 4200 2    50   Input ~ 0
MCU_TX
Text GLabel 3100 4100 2    50   Input ~ 0
MCU_RX
Text GLabel 6450 2600 2    50   Input ~ 0
ESP_RX
Text GLabel 4550 2900 0    50   Input ~ 0
ESP_TX
Text GLabel 3100 4300 2    50   Input ~ 0
ESP_TX
Text GLabel 3100 4400 2    50   Input ~ 0
ESP_RX
Wire Wire Line
	4450 5100 4600 5100
Wire Wire Line
	4450 5000 4450 5100
$Comp
L power:+3V3 #PWR011
U 1 1 5FAED1FB
P 4450 5000
F 0 "#PWR011" H 4450 4850 50  0001 C CNN
F 1 "+3V3" H 4465 5173 50  0000 C CNN
F 2 "" H 4450 5000 50  0001 C CNN
F 3 "" H 4450 5000 50  0001 C CNN
	1    4450 5000
	1    0    0    -1  
$EndComp
Text GLabel 4800 5200 0    50   Input ~ 0
MCU_TX
Text GLabel 4800 5300 0    50   Input ~ 0
MCU_RX
Wire Wire Line
	4750 5400 4750 5450
Wire Wire Line
	4800 5400 4750 5400
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5FAED205
P 4700 5100
F 0 "JP1" H 4700 5285 50  0000 C CNN
F 1 "UART_VCC" H 4700 5194 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4700 5100 50  0001 C CNN
F 3 "~" H 4700 5100 50  0001 C CNN
	1    4700 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5FAED1F1
P 4750 5450
F 0 "#PWR013" H 4750 5200 50  0001 C CNN
F 1 "GND" H 4755 5277 50  0001 C CNN
F 2 "" H 4750 5450 50  0001 C CNN
F 3 "" H 4750 5450 50  0001 C CNN
	1    4750 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5FAED1E7
P 5000 5200
F 0 "J3" H 5028 5176 50  0000 L CNN
F 1 "MCU_UART" H 5028 5085 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5000 5200 50  0001 C CNN
F 3 "~" H 5000 5200 50  0001 C CNN
	1    5000 5200
	1    0    0    -1  
$EndComp
Text GLabel 5900 5200 0    50   Input ~ 0
ESP_TX
Text GLabel 5900 5300 0    50   Input ~ 0
ESP_RX
Wire Wire Line
	5850 5400 5850 5450
Wire Wire Line
	5900 5400 5850 5400
Wire Wire Line
	5550 5100 5550 5000
Wire Wire Line
	5700 5100 5550 5100
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5FAB72C4
P 5800 5100
F 0 "JP2" H 5800 5285 50  0000 C CNN
F 1 "UART_VCC" H 5800 5194 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5800 5100 50  0001 C CNN
F 3 "~" H 5800 5100 50  0001 C CNN
	1    5800 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR020
U 1 1 5FAB654F
P 5550 5000
F 0 "#PWR020" H 5550 4850 50  0001 C CNN
F 1 "+3V3" H 5565 5173 50  0000 C CNN
F 2 "" H 5550 5000 50  0001 C CNN
F 3 "" H 5550 5000 50  0001 C CNN
	1    5550 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5FAB5D4D
P 5850 5450
F 0 "#PWR021" H 5850 5200 50  0001 C CNN
F 1 "GND" H 5855 5277 50  0001 C CNN
F 2 "" H 5850 5450 50  0001 C CNN
F 3 "" H 5850 5450 50  0001 C CNN
	1    5850 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J5
U 1 1 5FAAAFE5
P 6100 5200
F 0 "J5" H 6128 5176 50  0000 L CNN
F 1 "ESP_UART" H 6128 5085 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6100 5200 50  0001 C CNN
F 3 "~" H 6100 5200 50  0001 C CNN
	1    6100 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 5FB1D918
P 7000 2700
F 0 "JP3" H 7000 2912 50  0000 C CNN
F 1 "GPIO0" H 7000 2821 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7000 2700 50  0001 C CNN
F 3 "~" H 7000 2700 50  0001 C CNN
	1    7000 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR023
U 1 1 5FB1F1D5
P 7200 2600
F 0 "#PWR023" H 7200 2450 50  0001 C CNN
F 1 "+3V3" H 7215 2773 50  0000 C CNN
F 2 "" H 7200 2600 50  0001 C CNN
F 3 "" H 7200 2600 50  0001 C CNN
	1    7200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2700 7200 2700
Wire Wire Line
	7200 2700 7200 2600
Wire Wire Line
	6900 2700 6450 2700
$Comp
L Connector:Conn_01x05_Female J2
U 1 1 5FB2D68D
P 3600 3600
F 0 "J2" H 3628 3626 50  0000 L CNN
F 1 "SPARE_GPIO" H 3628 3535 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 3600 3600 50  0001 C CNN
F 3 "~" H 3600 3600 50  0001 C CNN
	1    3600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3400 3100 3400
Wire Wire Line
	3100 3500 3400 3500
Wire Wire Line
	3400 3600 3100 3600
Wire Wire Line
	3100 3700 3400 3700
Wire Wire Line
	3400 3800 3100 3800
NoConn ~ 3100 4500
NoConn ~ 3100 4800
NoConn ~ 3100 3000
NoConn ~ 3100 3100
NoConn ~ 3100 2400
NoConn ~ 3100 2600
NoConn ~ 1900 2600
NoConn ~ 1900 2700
NoConn ~ 6450 2800
$EndSCHEMATC
