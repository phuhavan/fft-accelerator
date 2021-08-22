all: gen-fft gen-coef

gen-coef:
	gcc gen_coef.c -o gen_coef  -lm
	@./gen_coef 2   12
	@./gen_coef 4   12
	@./gen_coef 32  12
	@./gen_coef 64  12
	@./gen_coef 128 12
	@./gen_coef 256 12
	@./gen_coef 512 12

gen-fft:
	@./gen_fft.tcl -size   2 -width 12 	-path ..
	@./gen_fft.tcl -size   4 -width 12 	-path ..
	@./gen_fft.tcl -size  32 -width 12 	-path ..
	@./gen_fft.tcl -size  64 -width 12	-path ..
	@./gen_fft.tcl -size 128 -width 12	-path ..
	@./gen_fft.tcl -size 256 -width 12	-path ..
	@./gen_fft.tcl -size 512 -width 12	-path ..
