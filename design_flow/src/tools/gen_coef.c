#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//========================================================
typedef union
{
	int i;
	float f;
} cvtF2bStr;

#define PI 			3.14159265358979323846
#define TWO_PI     (2*PI)

//========================================================
char* int2bin(int i)
{
    char *str = (char *) malloc(4);
    switch (i)
    {
        case 0:     strcpy(str, "0000"); break;
        case 1:     strcpy(str, "0001"); break;
        case 2:     strcpy(str, "0010"); break;
        case 3:     strcpy(str, "0011"); break;
        case 4:     strcpy(str, "0100"); break;
        case 5:     strcpy(str, "0101"); break;
        case 6:     strcpy(str, "0110"); break;
        case 7:     strcpy(str, "0111"); break;
        case 8:     strcpy(str, "1000"); break;
        case 9:     strcpy(str, "1001"); break;
        case 10:    strcpy(str, "1010"); break;
        case 11:    strcpy(str, "1011"); break;
        case 12:    strcpy(str, "1100"); break;
        case 13:    strcpy(str, "1101"); break;
        case 14:    strcpy(str, "1110"); break;
        default:    strcpy(str, "1111"); break;
    }

    return str;
}

//========================================================
char* int2binstring(int n, int w)
{
	int i;
	char *str1 = (char *) malloc(32);
	char *str2 = (char *) malloc(w);

	for (i=1; i<=8; i++)
	{
		strcpy(str1 + (i-1)*4, int2bin((n >>28) & 0x0000000f));
		n <<= 4;
	}
	strncpy(str2, str1+(32-w), w);

	return str2;
}

//========================================================
void gen_coef_float (float *float_coef, int N)
{
	int i;
	
	for (i = 0; i < N; i++) 
	{
		float_coef[(i<<1)]    = (float) (cos(-TWO_PI * (float) i / (float) N));
		float_coef[(i<<1)+1] 	= (float) (sin(-TWO_PI * (float) i / (float) N));
	}
}

//========================================================
void gen_coef_int (int *int_coef, float *float_coef, int N, int W)
{
	int 	i;
	int 	MAX_N = (1<<(W-1))-1;			// data range : -2^(W-1) to 2^(W-1)-1

	gen_coef_float(float_coef, N);
	
	for (i = 0; i < 2*N; i++) {
		int_coef[i] = (int) (float_coef[i] * MAX_N);
	}
}

//========================================================
void gen_tdf_float(float *float_tdf, int n2, int N1, int N)
{
	int i;
	
	for (i = 0; i < N1; i++) 
	{
		float_tdf[(i<<1)]   	= (float) (cos(-TWO_PI * (float) i*n2 / (float) N));
		float_tdf[(i<<1)+1] 	= (float) (sin(-TWO_PI * (float) i*n2 / (float) N));
	}
}



//========================================================
int main ( int argc, char *argv[] )
{
	if ( argc == 3 ) 
	{
    		int 		i, N, W;
        	char 	fName[50];
 
        	N = atoi(argv[1]);
        	W = atoi(argv[2]);
        	printf("INFOR --- FFT size is %d\n", N);
        	printf("INFOR --- Coefficient bitwidth is %d\n", W);

        	sprintf(fName, "fft%d_bw%d_coef.txt", N, W);
        	FILE *fCoef = fopen(fName, "w");

        	int 	*int_coef 	= (int *) 	malloc(2*N*sizeof(int));
        	float *float_coef = (float *) malloc(2*N*sizeof(int));
        	gen_coef_int(int_coef, float_coef, N/2, W);

        	fprintf(fCoef, "INFOR --- FFT size is %d\n", N);
        	fprintf(fCoef, "INFOR --- Coefficient bitwidth is %d\n", W);
        	fprintf(fCoef, "INFOR --- Number of coefficient is %d\n\n", N/2);

        	for (i=0; i<N/2; i++) 
        	{
							fprintf(fCoef, "%-4d : %+5f  %+8d  %-12s  |  %+.5f  %+8d  %-12s\n", i, 
											float_coef[2*i], 		int_coef[2*i], 		int2binstring(int_coef[2*i], W), 
											float_coef[2*i+1], 	int_coef[2*i+1], 	int2binstring(int_coef[2*i+1], W));
					}

					fprintf(fCoef, "\n\n//--- Verilog code\n");
        	for (i=0; i<N/2; i++) 
        	{
            //fprintf(fCoef, "%-8d%-32s%-8d%-32s\n", coef[i], int2binstring(coef[i], W), coef[i+1], int2binstring(coef[i+1], W));
        		fprintf(fCoef, "assign coef[%d] = %d'b%s%s;\n", i, 2*W, int2binstring(int_coef[2*i], W), int2binstring(int_coef[2*i+1], W));
        	}        	
        	fclose(fCoef);
    	}
    	else 
    	{
		printf( "\nUsage: gen_coef <size of FFT in integer, e.g. 4, 8, 16> <coefficient bitwidth>\n\n");
	}

	return 0;
}
