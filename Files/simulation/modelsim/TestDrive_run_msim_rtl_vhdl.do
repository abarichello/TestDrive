transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Comparators/topo_COMPARATORS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Debouncer/ButtonSync.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/topo.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Maps/map4.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Maps/map3.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Maps/map2.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Maps/map1.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Comparators/Comparator1.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Comparators/Comparator2.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Comparators/Comparator3.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Comparators/Adder.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Counters/FSM_Clock.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Maps/topo_MAPS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Controller/FSM_Control.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Counters/CONTA_DES.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Counters/CONTA_ASC.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Counters/CONTA_BONUS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Counters/topo_COUNTERS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Registers/FSM_Position.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Registers/FSM_Speed.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Registers/REG_IN.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Registers/topo_REGISTERS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux8x1.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux4x1_32.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux16x1.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux2x1.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/Decod7seg.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux4x1_30.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/topo_SELECTORS.vhd}
vcom -93 -work work {C:/Users/artur/Documents/GitHub/TestDrive/Files/Selectors and Decoders/mux2x1_10.vhd}

