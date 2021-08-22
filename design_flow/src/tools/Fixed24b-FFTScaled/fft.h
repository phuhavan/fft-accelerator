#ifndef 	__FFT_H__
#define 	__FFT_H__

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

//===========================================
#define PI 						3.14159265358979323846
#define TWO_PI     				(2*PI)
#define CHAR_BIT               	8

#define GETBIT(n, pos)            (( (n) >> (pos) ) & 0x1)
#define SETBIT(n, pos, val)      ( (val) == 1 ? (n) | (1 << (pos) ) : (n) & (~(1 << (pos) )))

//===========================================
	typedef  struct complex
	{
	    int 	re;
	    int 	im;
	} cpx;

//===========================================
	void  				print_bin 	(int a, unsigned int bit_width);
	unsigned int 	rev 				(unsigned int v);

	void 			bit_reverse 		(struct complex *data,  unsigned int  fft_size);
	void 			gen_fft_coef 		(struct complex *coef,  unsigned int  fft_size, unsigned int max_ampt);
	void 			gen_fft_tdm			(struct complex *tdm,  	unsigned int  n2, 			unsigned int fft_size, unsigned int max_ampt);
	int 			check_overflow 	(struct complex *in, 		unsigned int 	fft_size, unsigned int max_ampt);

	void 			fft_dif_radix2	(struct complex *data, struct complex *coef, unsigned int fft_size, unsigned int bit_width, unsigned int max_ampt);

#endif    /* __FFT_H__ */
