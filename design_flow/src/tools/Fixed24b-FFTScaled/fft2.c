#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <time.h>

#include "fft.h"


//===============================================
void print_debug_msg(str, bool_val)
{
	#ifdef ENBALE_DEBUG
		if (bool_val)
			printf("%s", str);
	#endif
}

//===============================================
void print_bin (int a, unsigned int width_div2)
{
	int i;

	for (i=width_div2-1; i>-1; i--)
		printf("%d", GETBIT(a, i) );

	printf("\n");
}

//===============================================
int bk_truncate_mult (int a, unsigned int width_div2)
{
	// width  = width_div2 * 2;
	// return {a[width-1], a[width-4:width_div2-2]}

	if (a < 0) {
		a = SETBIT(a, 31, 1);
		a = SETBIT(a, 30, 1);
	} else {
		a = SETBIT(a, 31, 0);
		a = SETBIT(a, 30, 0);		
	}
	
	return a >> (width_div2-2);		
}

int truncate_mult (int a, unsigned int width_div2)
{
	int width  = width_div2 * 2;
	// return {a[width-1], a[width-4:width_div2-2]}

	int sign_bit = GETBIT(a, width-1);

	a = SETBIT(a, width-2, sign_bit);
	a = SETBIT(a, width-3, sign_bit);

	return (a >> (width_div2-2));

}

//===============================================
unsigned int rev (unsigned int v)
{
  unsigned int r = v; 
  int s = sizeof(v) * CHAR_BIT - 1; 

  for (v >>= 1; v; v >>= 1)
  {   
    r <<= 1;
    r |= v & 1;
    s--;
  }
  r <<= s; 

  return r;
}

//===============================================
void bit_reverse (struct complex *data, unsigned int fft_size)
{
  unsigned int i, s, shift, log_fft_size;

  log_fft_size	= (int) log2(fft_size);
  s 				= sizeof(i) * CHAR_BIT;
  shift 			= s - log_fft_size;
  

  for (i = 0; i < fft_size; i++) {
    unsigned int r;
    int t_real, t_imag;

    r = rev (i) >> shift;

    if (i < r) {
      t_real     = (data+i)->re;
      t_imag 	 = (data+i)->im;

      (data+i)->re   = (data+r)->re;
      (data+i)->im   = (data+r)->im;
      (data+r)->re   = t_real;
      (data+r)->im   = t_imag;
    }
  }
}

//===============================================
void gen_fft_coef(struct complex *coef, unsigned int fft_size, unsigned int max_ampt)
{
    int i;
    
    for (i = 0; i < fft_size; i++) 
    {
        (coef+i)->re  = (int) (max_ampt * cos(-TWO_PI * i / (float) fft_size));
        (coef+i)->im  = (int) (max_ampt * sin(-TWO_PI * i / (float) fft_size));
    }
}

//===============================================
void gen_fft_tdm(struct complex *tdm,  unsigned int n2, unsigned int fft_size, unsigned int max_ampt)
{
    int i;
    
    for (i = 0; i < fft_size; i++) 
    {
        (tdm+i)->re = (int) (max_ampt * cos(-TWO_PI * i*n2 / (float) fft_size));
        (tdm+i)->re = (int) (max_ampt * sin(-TWO_PI * i*n2 / (float) fft_size));
    }
}


int check_overflow (struct complex *in, unsigned int fft_size, unsigned int max_ampt)
{
		int i;

		int min = -(max_ampt+1), max = max_ampt;
		
		for (i=0; i<fft_size; i++) {
			//printf("\nDEBUG --- Sample %d, Re, Im = %d, %d", i, (in+i)->re, (in+i)->im);

			if ( ((in+i)->re < min) || ((in+i)->re > max) ) {
					printf("\nDEBUG --- Sample %d, Re = %d is out of range (%d, %d]", i, (in+i)->re, min, max);
					return i;
			}

			if ( ((in+i)->im < min) || ((in+i)->im > max) ) {
					printf("\nDEBUG --- Sample %d, Im = %d is out of range (%d, %d]", i, (in+i)->im, min, max);
					return i;
			}		
		}

		return -1;
}

//===============================================
// 		sel 
//		11111		FFT64
//		01111		FFT32
//		00111		FFT16
//		00011		FFT8
//		00001		FFT4
//		00000		FFT2
//==============================================
void fft_dif_radix2(struct complex *data, struct complex *coef, unsigned int fft_size, unsigned int width_div2, unsigned int max_ampt)
{
    int        n2, k1, N1, N2;
    cpx        bfly[2];
    char  		 str[100];

    N1=2;
    N2=fft_size/2;
    
    sprintf(str, "N1=%d, N2=%d\n", N1, N2); print_debug_msg(str, 1);

    /** Do 2 Point DFT */
    for (n2=0; n2<N2; n2++)
    {
    	    int add_re  	=  ((data+n2)->re  	+  (data+N2 + n2)->re) >> 1;
    	    int add_im  	=  ((data+n2)->im		+  (data+N2 + n2)->im) >> 1;
          int sub_re  	=  ((data+n2)->re   -  (data+N2 + n2)->re) >> 1;
			    int sub_im  	=  ((data+n2)->im	 	-  (data+N2 + n2)->im) >> 1;
	    
			    sprintf (str, "%10d %10d %10d %10d\n", add_re, add_im, sub_re, sub_im); print_debug_msg(str, 1);

          bfly[0].re   	=  add_re;
          bfly[0].im  	=  add_im;
          bfly[1].re   	=  sub_re * (coef+n2)->re  -  sub_im * (coef+n2)->im; 
          bfly[1].im  	=  sub_im * (coef+n2)->re  +  sub_re * (coef+n2)->im;

          sprintf (str, "%10d %10d %10d %10d\n", bfly[0].re, bfly[0].im, bfly[1].re, bfly[1].im); print_debug_msg(str, 1);

          /** In-place results */
              (data+n2)->re       	=  bfly[0].re;
              (data+n2)->im					=  bfly[0].im;
              (data+n2 + N2)->re  	=  truncate_mult(bfly[1].re, width_div2);
              (data+n2 + N2)->im  	=  truncate_mult(bfly[1].im, width_div2);
          		sprintf (str, "%10d %10d %10d %10d\n", (data+n2)->re, (data+n2)->im, (data+n2 + N2)->re, (data+n2 + N2)->im); print_debug_msg(str, 1);
    }
    
    // Dont recurse if we're down to one butterfly 
    if (N2!=1)
      for (k1=0; k1<N1; k1++)
        fft_dif_radix2(data+N2*k1, coef, N2, width_div2, max_ampt);
}

//===============================================

#define FFT_COMPUTE_ENABLE    0
#define FFT_USE_RANDOM        0

int main  (int argc, char *argv[])
{
      if ( argc != 4 ) {
      	printf( "\nUsage: FFT <number on samples> <size of FFT in integer, e.g. 4, 8, 16> <data and coef.  bit width >\n\n");
      	return 0;
      }

	unsigned int 	i, j, k;
	unsigned int 	num_samples, fft_size, width_div2, max_ampt;
	char  				str[100];
  int        		check;

	num_samples   	= atoi(argv[1]);
	fft_size       	= atoi(argv[2]);
	width_div2  		= atoi(argv[3]);

	max_ampt 	 			= (1 << (width_div2-1))-1;	
	srand (time(NULL));


	#ifdef  FFT_COMPUTE_ENABLE
		printf("INFOR --- FFT size is %d\n", fft_size);
		printf("INFOR --- Data width_div2 is %d\n", width_div2);

		sprintf(str, "fft128_accel_bw%d_input.txt", width_div2);
		FILE *fDataIn_accel = fopen(str, "w");

		sprintf(str, "fft%d_bw%d_input.txt", fft_size, width_div2);
		FILE *fDataIn = fopen(str, "w");
	
		sprintf(str, "fft128_accel_bw%d_coef.txt",  width_div2);
		FILE *fCoefIn_accel = fopen(str, "w");

		sprintf(str, "fft%d_bw%d_coef.txt", fft_size, width_div2);
		FILE *fCoefIn = fopen(str, "w");

		sprintf(str, "fft128_accel_bw%d_output.txt", width_div2);
		FILE *fDataOut_accel = fopen(str, "w");

		sprintf(str, "fft%d_bw%d_output.txt", fft_size, width_div2);
		FILE *fDataOut = fopen(str, "w");

		struct complex *data  = (struct complex *) malloc (fft_size*sizeof(cpx));
		struct complex *coef  = (struct complex *) malloc (fft_size*sizeof(cpx));

		fprintf(fDataIn,   "//INFOR -- Input data of %d-bit, %d-input FFT\n", width_div2, fft_size);  
		fprintf(fDataIn,   "//INFOR -- %-10s%s\n", "Sample", "Input data");  
		fprintf(fDataOut, "//INFOR -- Output data of %d-bit, %d-input FFT\n", width_div2, fft_size);  
		fprintf(fDataOut, "//INFOR -- %-10s%s\n", "Sample", "Output data");  


		fprintf(fDataIn_accel,   "//INFOR -- Input data of %d-bit, %d-input FFT\n", width_div2, fft_size);  
		fprintf(fDataIn_accel,   "//INFOR -- %-10s%s\n", "Sample", "Input data");  
		fprintf(fDataOut_accel, "//INFOR -- Output data of %d-bit, %d-input FFT\n", width_div2, fft_size);  
		fprintf(fDataOut_accel, "//INFOR -- %-10s%s\n", "Sample", "Output data");

		// generate cofficients
				gen_fft_coef(coef, fft_size, max_ampt);
				check = check_overflow(coef, fft_size, max_ampt);
				if (check > -1)
					printf("\nERROR --- Coefficient is overflow at index %d, value (%d, %d)", check, (coef+check)->re, (coef+check)->im);

				// dump coefficient
					fprintf(fCoefIn, "//INFOR -- Coefficient of %d-bit, %d-input FFT\n", width_div2, fft_size);  
					fprintf(fCoefIn, "//%10s%s\n", "Index", "Coefficient data");  
					for (i=0; i<fft_size/2; i++) 
						fprintf(fCoefIn, "  %-10d%6d%6d\n", i, (coef+i)->re, (coef+i)->im);
					fclose(fCoefIn);

		// run FFT
				for (j=0; j< num_samples; j++)  {
					// dump input	
						fprintf(fDataIn_accel,  "%17d  ", j);
						fprintf(fDataIn,  "%17d  ", j);
						for (i=0; i<fft_size; i++) 
						{
							#ifdef FFT_USE_RANDOM 
								(data+i)->re  = (int) (max_ampt*(rand()/(float) RAND_MAX) - 0.5);
								(data+i)->im 	= (int) (max_ampt*(rand()/(float) RAND_MAX) - 0.5);
							#else
								float  w      = (TWO_PI * i) / ((float) fft_size);
								(data+i)->re  = (int) (max_ampt*(cos(w)-0.5));
								(data+i)->im  = (int) (max_ampt*(sin(w)-0.5));
							#endif

							fprintf(fDataIn, "%6d %6d  ", (data+i)->re, (data+i)->im);
						}
						for (k=0; k<128/fft_size; k++)
						{
							for(i=0; i<fft_size; i++)
							{
								fprintf(fDataIn_accel, "%6d %6d  ", (data+i)->re, (data+i)->im);
							}
						}
						fprintf(fDataIn, "\n");
						fprintf(fDataIn_accel, "\n");

						check = check_overflow(data, fft_size, max_ampt);
						if (check > -1)
							printf("\nERROR --- Input sample %d is overflow at index %d, values (%d, %d)", j, check, (data+check)->re, (data+check)->im);

					// call FFT 
						fft_dif_radix2(data, coef, fft_size, width_div2, max_ampt);

					// reverse output
						bit_reverse(data, fft_size);

					// dump output	
						check = check_overflow(data, fft_size, max_ampt);
						if (check > -1)
							printf("\nERROR --- Output sample %d is overflow at index %d, values (%d, %d)", j, check, (data+check)->re, (data+check)->im);


						fprintf(fDataOut, "%17d  ", j);
						for (i=0; i<fft_size; i++) 
							fprintf(fDataOut, "%6d %6d  ", (data+i)->re, (data+i)->im);
						fprintf(fDataOut, "\n");

				}

				fclose(fDataIn);
				fclose(fDataOut);
	
	#else
		// sanity check
			int a = -1956;
			int b =  580;
			int c = a*b;
			int d = truncate_mult(c, width_div2);
		
			int e  = (int) fabs(c);

			printf ("\na=%d, b=%d, a*b(full)=%d, a*b(truncate_mult)=%d\n", a, b, c, d);

			   // print_bin (SETBIT(a, 2, 0), width_div2);
			    //print_bin (SETBIT(a, 1, 1), width_div2);

			printf("ABS(a):= 		"); print_bin ((int) fabs(a), width_div2);	
			printf("a:=      		"); print_bin (a, width_div2);

			printf("ABS(b):= 		"); print_bin ((int) fabs(b), width_div2);	
			printf("b:=      		"); print_bin (b, width_div2);

			printf("32b_Mc:=		"); print_bin (e, 32);
			printf("32b_c:=  		"); print_bin (c, 32);
			printf("c:=      		"); print_bin (c, 2*width_div2);
			printf("M_trunc:=		"); print_bin (d,   width_div2);
	#endif

		printf("\n");
   	return 0;
}
