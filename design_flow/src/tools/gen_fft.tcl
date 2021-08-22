#!/usr/bin/tclsh

set PI 					3.14159265358979323846
set TWO_PI 			[expr 2*$PI]

proc rev {value   bitwidth} {
	 set rev_value   0
	  
	 for {set i 0} {$i < $bitwidth} {incr i} {
	  	set lsb 				[expr $value & 1]
	  	set rev_value 		[expr [expr $rev_value << 1] | $lsb]
	  	set value			[expr $value >> 1]
	 }

	 return $rev_value
}

proc int2bin { int width } {
	set str ""
	
	for {set i 0} {$i<$width} {incr i} {
		if {[expr $int%2]} {
			set str  "1$str"
		} else {
			set str  "0$str"
		}
		set int [expr $int/2]
	}
	
	return $str
}

proc gen_int_coef {fOut size width} {
	global TWO_PI
	set max_coef   [expr (1 << ($width-1))-1]

	for {set i 0} {$i< [expr $size >> 1]} {incr i} {
		set re [expr round([format "%.1f" [expr $max_coef *cos(-$TWO_PI * $i / $size)]])]
		set im [expr round([format "%.1f" [expr $max_coef *sin(-$TWO_PI * $i / $size)]])]

		puts $fOut [format "%s%-20s%s" "\t\t\t" "assign coef\[$i\] =" "{12'b[int2bin $re $width], 12'b[int2bin $im $width]};"]
	}
}
#===========================================
	exec clear

	set next 0
	foreach arg $argv {
		incr next
			switch -exact $arg {
				"-size"  	 { set size 	[lindex $argv $next] }
				"-width"   { set width 	[lindex $argv $next] }
				"-path"    { set path 	[lindex $argv $next] }
			}
	}

	if {![info exists size] || ![info exists width]} {
		puts "ERROR --- Syntax error !"
	  puts "   gen_fft -size <size of FFT (power of 2)> -width <data width in bits> -path <path of output file>"
		exit -1
	}

	set depth    [format "%.0f" [expr log10($size)/log10(2)]]

	if {![info exists path]} {
		set path     "../"
	}

	set fOut		 [open "$path/fft$size.v"  "w"]
	puts "INFOR --- File $path/fft$size.v is generated for $size complex inputs FFT with datawidth as $width bits"

	#--- module ports
		puts $fOut "`include \"macros.h\"\n"

		puts $fOut "module fft$size"
		puts $fOut "#("
		puts $fOut "\t\t//--- data bit-width"
		puts $fOut "\t\t\tparameter width = [expr $width*2],"
		puts $fOut "\t\t//--- fft size"
		puts $fOut "\t\t\tparameter size=$size"
		puts $fOut ")"
		puts $fOut "("
		puts $fOut "\t\t//--- control"
		puts $fOut [format %-12s%-15s%-30s "\t\t\tinput" " " "clk, rst, stall,"]
		puts $fOut "\t\t//--- inputs"

		for {set i 0} {$i < $size} {incr i} {
			puts $fOut [format %-12s%-15s%-30s "\t\t\tinput" "\[width-1:0\]" "x$i\_in,";];
		}
		puts $fOut "\t\t//--- outputs"
		puts $fOut [format %-12s%-15s%-30s "\t\t\toutput" "" "stall_out,";];
		for {set i 0} {$i < $size} {incr i} {
			if {$i==[expr $size-1]} {
				puts $fOut [format %-12s%-15s%-30s "\t\t\toutput" "\[width-1:0\]" "x$i\_out";];
			} else {
				puts $fOut [format %-12s%-15s%-30s "\t\t\toutput" "\[width-1:0\]" "x$i\_out,";];
			}
		}
		puts $fOut ");\n"

	#--- signal definition
		puts $fOut "\t\t//--- signal definition"
		puts $fOut [format %-6s%-20s%-s "\t\t\twire " " \[width-1:0\]" "coef\[size-1:0\];\n"] 
		for {set i 0} {$i <= $depth} {incr i} {
			if {$i==0} {
				puts $fOut [format %-6s%-20s%-s "\t\t\treg  " " \[width-1:0\]" "a$i\_wr\[size-1:0\];"]
			} else {
				puts $fOut [format %-6s%-20s%-s "\t\t\twire " " \[width-1:0\]" "a$i\_wr\[size-1:0\];"]
			}
		}
		puts $fOut [format %-6s%-20s%-s "\t\t\twire " " " "comb_stall;"]
		puts $fOut ""

	#--- coefficient assign
		puts $fOut "\t\t//--- cofficient assignment"
		gen_int_coef	$fOut $size $width
		puts $fOut ""

	#--- FIFO stage
		puts $fOut "\t\t//--- fifo stage"
		puts $fOut "\t\t\tlocalparam depth=`LOG2(size);"
		puts $fOut "\t\t\tfifo #(.depth(depth)) inst_fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));\n"
		puts $fOut "\t\t\tassign comb_stall = stall_out & stall;\n"

	#--- input stage	
		puts $fOut "\t\t//--- input stage"
		puts $fOut "\t\t\talways @(posedge clk or posedge rst) begin"
		puts $fOut "\t\t\t\tif (rst) begin"
		for {set i 0} {$i < $size} {incr i} {
			puts $fOut [format %-20s%1s%-30s "\t\t\t\t\ta0\_wr\[$i\]"  "<=" " 0;";];
		}
		puts $fOut "\t\t\t\tend"
		puts $fOut "\t\t\t\telse begin"
		puts $fOut "\t\t\t\t\tif (!stall) begin"
		for {set i 0} {$i < $size} {incr i} {
			puts $fOut [format %-20s%1s%-30s "\t\t\t\t\t\ta0\_wr\[$i\]"  "<=" " x$i\_in;";];
		}
		puts $fOut "\t\t\t\t\tend"
		puts $fOut "\t\t\t\tend"
		puts $fOut "\t\t\tend\n"

	#--- radix network		
		set	  step      $size
		for {set cs 0} {$cs < $depth} {incr cs} {
			set ns    [expr $cs+1]
			puts $fOut "\t\t//--- radix stage $cs"
			for {set s 0} {$s < $size} {incr s $step} {
				for {set i $s} {$i < [expr $s+ ($step/2)]} {incr i} {
					set 	j		[expr $i+($step/2)]
					set i1    	"\[$i\]"
					set j1    	"\[$j\]"
					set ci		"\[[expr ($size/$step)*($i-$s)]\]"

					#puts $fOut -nonewline "radix2 #(.width(width))"
					puts $fOut [format %-9s%-16s%-12s%s "\t\t\tradix2" " #(.width(width))" " rd_st$cs\_$i  " "(.clk(clk), .rst(rst), \
																							.stall(comb_stall), .rdup_in(a$cs\_wr$i1), .rdlo_in(a$cs\_wr$j1), \
		 						                         		 	.coef_in(coef$ci), .rdup_out(a$ns\_wr$i1), .rdlo_out(a$ns\_wr$j1));"]
				}					                 
			}	
			set step   [expr $step/2]
			puts $fOut ""
		}

	#--- output stage
		puts $fOut "\t\t//--- output stage (bit reversal)"
		for {set i 0} {$i < $size} {incr i} {
			set rev_i    [rev $i $depth]
			puts $fOut [format %-23s%1s%-30s "\t\t\tassign x$i\_out"  "=" " a$depth\_wr\[$rev_i\];";];
		}

	puts $fOut "\n\nendmodule"
