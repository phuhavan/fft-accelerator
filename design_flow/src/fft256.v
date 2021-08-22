`include "macros.h"

module fft256
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=256
)
(
		//--- control
			input                   clk, rst, stall,              
		//--- inputs
			input    [width-1:0]    x0_in,                        
			input    [width-1:0]    x1_in,                        
			input    [width-1:0]    x2_in,                        
			input    [width-1:0]    x3_in,                        
			input    [width-1:0]    x4_in,                        
			input    [width-1:0]    x5_in,                        
			input    [width-1:0]    x6_in,                        
			input    [width-1:0]    x7_in,                        
			input    [width-1:0]    x8_in,                        
			input    [width-1:0]    x9_in,                        
			input    [width-1:0]    x10_in,                       
			input    [width-1:0]    x11_in,                       
			input    [width-1:0]    x12_in,                       
			input    [width-1:0]    x13_in,                       
			input    [width-1:0]    x14_in,                       
			input    [width-1:0]    x15_in,                       
			input    [width-1:0]    x16_in,                       
			input    [width-1:0]    x17_in,                       
			input    [width-1:0]    x18_in,                       
			input    [width-1:0]    x19_in,                       
			input    [width-1:0]    x20_in,                       
			input    [width-1:0]    x21_in,                       
			input    [width-1:0]    x22_in,                       
			input    [width-1:0]    x23_in,                       
			input    [width-1:0]    x24_in,                       
			input    [width-1:0]    x25_in,                       
			input    [width-1:0]    x26_in,                       
			input    [width-1:0]    x27_in,                       
			input    [width-1:0]    x28_in,                       
			input    [width-1:0]    x29_in,                       
			input    [width-1:0]    x30_in,                       
			input    [width-1:0]    x31_in,                       
			input    [width-1:0]    x32_in,                       
			input    [width-1:0]    x33_in,                       
			input    [width-1:0]    x34_in,                       
			input    [width-1:0]    x35_in,                       
			input    [width-1:0]    x36_in,                       
			input    [width-1:0]    x37_in,                       
			input    [width-1:0]    x38_in,                       
			input    [width-1:0]    x39_in,                       
			input    [width-1:0]    x40_in,                       
			input    [width-1:0]    x41_in,                       
			input    [width-1:0]    x42_in,                       
			input    [width-1:0]    x43_in,                       
			input    [width-1:0]    x44_in,                       
			input    [width-1:0]    x45_in,                       
			input    [width-1:0]    x46_in,                       
			input    [width-1:0]    x47_in,                       
			input    [width-1:0]    x48_in,                       
			input    [width-1:0]    x49_in,                       
			input    [width-1:0]    x50_in,                       
			input    [width-1:0]    x51_in,                       
			input    [width-1:0]    x52_in,                       
			input    [width-1:0]    x53_in,                       
			input    [width-1:0]    x54_in,                       
			input    [width-1:0]    x55_in,                       
			input    [width-1:0]    x56_in,                       
			input    [width-1:0]    x57_in,                       
			input    [width-1:0]    x58_in,                       
			input    [width-1:0]    x59_in,                       
			input    [width-1:0]    x60_in,                       
			input    [width-1:0]    x61_in,                       
			input    [width-1:0]    x62_in,                       
			input    [width-1:0]    x63_in,                       
			input    [width-1:0]    x64_in,                       
			input    [width-1:0]    x65_in,                       
			input    [width-1:0]    x66_in,                       
			input    [width-1:0]    x67_in,                       
			input    [width-1:0]    x68_in,                       
			input    [width-1:0]    x69_in,                       
			input    [width-1:0]    x70_in,                       
			input    [width-1:0]    x71_in,                       
			input    [width-1:0]    x72_in,                       
			input    [width-1:0]    x73_in,                       
			input    [width-1:0]    x74_in,                       
			input    [width-1:0]    x75_in,                       
			input    [width-1:0]    x76_in,                       
			input    [width-1:0]    x77_in,                       
			input    [width-1:0]    x78_in,                       
			input    [width-1:0]    x79_in,                       
			input    [width-1:0]    x80_in,                       
			input    [width-1:0]    x81_in,                       
			input    [width-1:0]    x82_in,                       
			input    [width-1:0]    x83_in,                       
			input    [width-1:0]    x84_in,                       
			input    [width-1:0]    x85_in,                       
			input    [width-1:0]    x86_in,                       
			input    [width-1:0]    x87_in,                       
			input    [width-1:0]    x88_in,                       
			input    [width-1:0]    x89_in,                       
			input    [width-1:0]    x90_in,                       
			input    [width-1:0]    x91_in,                       
			input    [width-1:0]    x92_in,                       
			input    [width-1:0]    x93_in,                       
			input    [width-1:0]    x94_in,                       
			input    [width-1:0]    x95_in,                       
			input    [width-1:0]    x96_in,                       
			input    [width-1:0]    x97_in,                       
			input    [width-1:0]    x98_in,                       
			input    [width-1:0]    x99_in,                       
			input    [width-1:0]    x100_in,                      
			input    [width-1:0]    x101_in,                      
			input    [width-1:0]    x102_in,                      
			input    [width-1:0]    x103_in,                      
			input    [width-1:0]    x104_in,                      
			input    [width-1:0]    x105_in,                      
			input    [width-1:0]    x106_in,                      
			input    [width-1:0]    x107_in,                      
			input    [width-1:0]    x108_in,                      
			input    [width-1:0]    x109_in,                      
			input    [width-1:0]    x110_in,                      
			input    [width-1:0]    x111_in,                      
			input    [width-1:0]    x112_in,                      
			input    [width-1:0]    x113_in,                      
			input    [width-1:0]    x114_in,                      
			input    [width-1:0]    x115_in,                      
			input    [width-1:0]    x116_in,                      
			input    [width-1:0]    x117_in,                      
			input    [width-1:0]    x118_in,                      
			input    [width-1:0]    x119_in,                      
			input    [width-1:0]    x120_in,                      
			input    [width-1:0]    x121_in,                      
			input    [width-1:0]    x122_in,                      
			input    [width-1:0]    x123_in,                      
			input    [width-1:0]    x124_in,                      
			input    [width-1:0]    x125_in,                      
			input    [width-1:0]    x126_in,                      
			input    [width-1:0]    x127_in,                      
			input    [width-1:0]    x128_in,                      
			input    [width-1:0]    x129_in,                      
			input    [width-1:0]    x130_in,                      
			input    [width-1:0]    x131_in,                      
			input    [width-1:0]    x132_in,                      
			input    [width-1:0]    x133_in,                      
			input    [width-1:0]    x134_in,                      
			input    [width-1:0]    x135_in,                      
			input    [width-1:0]    x136_in,                      
			input    [width-1:0]    x137_in,                      
			input    [width-1:0]    x138_in,                      
			input    [width-1:0]    x139_in,                      
			input    [width-1:0]    x140_in,                      
			input    [width-1:0]    x141_in,                      
			input    [width-1:0]    x142_in,                      
			input    [width-1:0]    x143_in,                      
			input    [width-1:0]    x144_in,                      
			input    [width-1:0]    x145_in,                      
			input    [width-1:0]    x146_in,                      
			input    [width-1:0]    x147_in,                      
			input    [width-1:0]    x148_in,                      
			input    [width-1:0]    x149_in,                      
			input    [width-1:0]    x150_in,                      
			input    [width-1:0]    x151_in,                      
			input    [width-1:0]    x152_in,                      
			input    [width-1:0]    x153_in,                      
			input    [width-1:0]    x154_in,                      
			input    [width-1:0]    x155_in,                      
			input    [width-1:0]    x156_in,                      
			input    [width-1:0]    x157_in,                      
			input    [width-1:0]    x158_in,                      
			input    [width-1:0]    x159_in,                      
			input    [width-1:0]    x160_in,                      
			input    [width-1:0]    x161_in,                      
			input    [width-1:0]    x162_in,                      
			input    [width-1:0]    x163_in,                      
			input    [width-1:0]    x164_in,                      
			input    [width-1:0]    x165_in,                      
			input    [width-1:0]    x166_in,                      
			input    [width-1:0]    x167_in,                      
			input    [width-1:0]    x168_in,                      
			input    [width-1:0]    x169_in,                      
			input    [width-1:0]    x170_in,                      
			input    [width-1:0]    x171_in,                      
			input    [width-1:0]    x172_in,                      
			input    [width-1:0]    x173_in,                      
			input    [width-1:0]    x174_in,                      
			input    [width-1:0]    x175_in,                      
			input    [width-1:0]    x176_in,                      
			input    [width-1:0]    x177_in,                      
			input    [width-1:0]    x178_in,                      
			input    [width-1:0]    x179_in,                      
			input    [width-1:0]    x180_in,                      
			input    [width-1:0]    x181_in,                      
			input    [width-1:0]    x182_in,                      
			input    [width-1:0]    x183_in,                      
			input    [width-1:0]    x184_in,                      
			input    [width-1:0]    x185_in,                      
			input    [width-1:0]    x186_in,                      
			input    [width-1:0]    x187_in,                      
			input    [width-1:0]    x188_in,                      
			input    [width-1:0]    x189_in,                      
			input    [width-1:0]    x190_in,                      
			input    [width-1:0]    x191_in,                      
			input    [width-1:0]    x192_in,                      
			input    [width-1:0]    x193_in,                      
			input    [width-1:0]    x194_in,                      
			input    [width-1:0]    x195_in,                      
			input    [width-1:0]    x196_in,                      
			input    [width-1:0]    x197_in,                      
			input    [width-1:0]    x198_in,                      
			input    [width-1:0]    x199_in,                      
			input    [width-1:0]    x200_in,                      
			input    [width-1:0]    x201_in,                      
			input    [width-1:0]    x202_in,                      
			input    [width-1:0]    x203_in,                      
			input    [width-1:0]    x204_in,                      
			input    [width-1:0]    x205_in,                      
			input    [width-1:0]    x206_in,                      
			input    [width-1:0]    x207_in,                      
			input    [width-1:0]    x208_in,                      
			input    [width-1:0]    x209_in,                      
			input    [width-1:0]    x210_in,                      
			input    [width-1:0]    x211_in,                      
			input    [width-1:0]    x212_in,                      
			input    [width-1:0]    x213_in,                      
			input    [width-1:0]    x214_in,                      
			input    [width-1:0]    x215_in,                      
			input    [width-1:0]    x216_in,                      
			input    [width-1:0]    x217_in,                      
			input    [width-1:0]    x218_in,                      
			input    [width-1:0]    x219_in,                      
			input    [width-1:0]    x220_in,                      
			input    [width-1:0]    x221_in,                      
			input    [width-1:0]    x222_in,                      
			input    [width-1:0]    x223_in,                      
			input    [width-1:0]    x224_in,                      
			input    [width-1:0]    x225_in,                      
			input    [width-1:0]    x226_in,                      
			input    [width-1:0]    x227_in,                      
			input    [width-1:0]    x228_in,                      
			input    [width-1:0]    x229_in,                      
			input    [width-1:0]    x230_in,                      
			input    [width-1:0]    x231_in,                      
			input    [width-1:0]    x232_in,                      
			input    [width-1:0]    x233_in,                      
			input    [width-1:0]    x234_in,                      
			input    [width-1:0]    x235_in,                      
			input    [width-1:0]    x236_in,                      
			input    [width-1:0]    x237_in,                      
			input    [width-1:0]    x238_in,                      
			input    [width-1:0]    x239_in,                      
			input    [width-1:0]    x240_in,                      
			input    [width-1:0]    x241_in,                      
			input    [width-1:0]    x242_in,                      
			input    [width-1:0]    x243_in,                      
			input    [width-1:0]    x244_in,                      
			input    [width-1:0]    x245_in,                      
			input    [width-1:0]    x246_in,                      
			input    [width-1:0]    x247_in,                      
			input    [width-1:0]    x248_in,                      
			input    [width-1:0]    x249_in,                      
			input    [width-1:0]    x250_in,                      
			input    [width-1:0]    x251_in,                      
			input    [width-1:0]    x252_in,                      
			input    [width-1:0]    x253_in,                      
			input    [width-1:0]    x254_in,                      
			input    [width-1:0]    x255_in,                      
		//--- outputs
			output                  stall_out,                    
			output   [width-1:0]    x0_out,                       
			output   [width-1:0]    x1_out,                       
			output   [width-1:0]    x2_out,                       
			output   [width-1:0]    x3_out,                       
			output   [width-1:0]    x4_out,                       
			output   [width-1:0]    x5_out,                       
			output   [width-1:0]    x6_out,                       
			output   [width-1:0]    x7_out,                       
			output   [width-1:0]    x8_out,                       
			output   [width-1:0]    x9_out,                       
			output   [width-1:0]    x10_out,                      
			output   [width-1:0]    x11_out,                      
			output   [width-1:0]    x12_out,                      
			output   [width-1:0]    x13_out,                      
			output   [width-1:0]    x14_out,                      
			output   [width-1:0]    x15_out,                      
			output   [width-1:0]    x16_out,                      
			output   [width-1:0]    x17_out,                      
			output   [width-1:0]    x18_out,                      
			output   [width-1:0]    x19_out,                      
			output   [width-1:0]    x20_out,                      
			output   [width-1:0]    x21_out,                      
			output   [width-1:0]    x22_out,                      
			output   [width-1:0]    x23_out,                      
			output   [width-1:0]    x24_out,                      
			output   [width-1:0]    x25_out,                      
			output   [width-1:0]    x26_out,                      
			output   [width-1:0]    x27_out,                      
			output   [width-1:0]    x28_out,                      
			output   [width-1:0]    x29_out,                      
			output   [width-1:0]    x30_out,                      
			output   [width-1:0]    x31_out,                      
			output   [width-1:0]    x32_out,                      
			output   [width-1:0]    x33_out,                      
			output   [width-1:0]    x34_out,                      
			output   [width-1:0]    x35_out,                      
			output   [width-1:0]    x36_out,                      
			output   [width-1:0]    x37_out,                      
			output   [width-1:0]    x38_out,                      
			output   [width-1:0]    x39_out,                      
			output   [width-1:0]    x40_out,                      
			output   [width-1:0]    x41_out,                      
			output   [width-1:0]    x42_out,                      
			output   [width-1:0]    x43_out,                      
			output   [width-1:0]    x44_out,                      
			output   [width-1:0]    x45_out,                      
			output   [width-1:0]    x46_out,                      
			output   [width-1:0]    x47_out,                      
			output   [width-1:0]    x48_out,                      
			output   [width-1:0]    x49_out,                      
			output   [width-1:0]    x50_out,                      
			output   [width-1:0]    x51_out,                      
			output   [width-1:0]    x52_out,                      
			output   [width-1:0]    x53_out,                      
			output   [width-1:0]    x54_out,                      
			output   [width-1:0]    x55_out,                      
			output   [width-1:0]    x56_out,                      
			output   [width-1:0]    x57_out,                      
			output   [width-1:0]    x58_out,                      
			output   [width-1:0]    x59_out,                      
			output   [width-1:0]    x60_out,                      
			output   [width-1:0]    x61_out,                      
			output   [width-1:0]    x62_out,                      
			output   [width-1:0]    x63_out,                      
			output   [width-1:0]    x64_out,                      
			output   [width-1:0]    x65_out,                      
			output   [width-1:0]    x66_out,                      
			output   [width-1:0]    x67_out,                      
			output   [width-1:0]    x68_out,                      
			output   [width-1:0]    x69_out,                      
			output   [width-1:0]    x70_out,                      
			output   [width-1:0]    x71_out,                      
			output   [width-1:0]    x72_out,                      
			output   [width-1:0]    x73_out,                      
			output   [width-1:0]    x74_out,                      
			output   [width-1:0]    x75_out,                      
			output   [width-1:0]    x76_out,                      
			output   [width-1:0]    x77_out,                      
			output   [width-1:0]    x78_out,                      
			output   [width-1:0]    x79_out,                      
			output   [width-1:0]    x80_out,                      
			output   [width-1:0]    x81_out,                      
			output   [width-1:0]    x82_out,                      
			output   [width-1:0]    x83_out,                      
			output   [width-1:0]    x84_out,                      
			output   [width-1:0]    x85_out,                      
			output   [width-1:0]    x86_out,                      
			output   [width-1:0]    x87_out,                      
			output   [width-1:0]    x88_out,                      
			output   [width-1:0]    x89_out,                      
			output   [width-1:0]    x90_out,                      
			output   [width-1:0]    x91_out,                      
			output   [width-1:0]    x92_out,                      
			output   [width-1:0]    x93_out,                      
			output   [width-1:0]    x94_out,                      
			output   [width-1:0]    x95_out,                      
			output   [width-1:0]    x96_out,                      
			output   [width-1:0]    x97_out,                      
			output   [width-1:0]    x98_out,                      
			output   [width-1:0]    x99_out,                      
			output   [width-1:0]    x100_out,                     
			output   [width-1:0]    x101_out,                     
			output   [width-1:0]    x102_out,                     
			output   [width-1:0]    x103_out,                     
			output   [width-1:0]    x104_out,                     
			output   [width-1:0]    x105_out,                     
			output   [width-1:0]    x106_out,                     
			output   [width-1:0]    x107_out,                     
			output   [width-1:0]    x108_out,                     
			output   [width-1:0]    x109_out,                     
			output   [width-1:0]    x110_out,                     
			output   [width-1:0]    x111_out,                     
			output   [width-1:0]    x112_out,                     
			output   [width-1:0]    x113_out,                     
			output   [width-1:0]    x114_out,                     
			output   [width-1:0]    x115_out,                     
			output   [width-1:0]    x116_out,                     
			output   [width-1:0]    x117_out,                     
			output   [width-1:0]    x118_out,                     
			output   [width-1:0]    x119_out,                     
			output   [width-1:0]    x120_out,                     
			output   [width-1:0]    x121_out,                     
			output   [width-1:0]    x122_out,                     
			output   [width-1:0]    x123_out,                     
			output   [width-1:0]    x124_out,                     
			output   [width-1:0]    x125_out,                     
			output   [width-1:0]    x126_out,                     
			output   [width-1:0]    x127_out,                     
			output   [width-1:0]    x128_out,                     
			output   [width-1:0]    x129_out,                     
			output   [width-1:0]    x130_out,                     
			output   [width-1:0]    x131_out,                     
			output   [width-1:0]    x132_out,                     
			output   [width-1:0]    x133_out,                     
			output   [width-1:0]    x134_out,                     
			output   [width-1:0]    x135_out,                     
			output   [width-1:0]    x136_out,                     
			output   [width-1:0]    x137_out,                     
			output   [width-1:0]    x138_out,                     
			output   [width-1:0]    x139_out,                     
			output   [width-1:0]    x140_out,                     
			output   [width-1:0]    x141_out,                     
			output   [width-1:0]    x142_out,                     
			output   [width-1:0]    x143_out,                     
			output   [width-1:0]    x144_out,                     
			output   [width-1:0]    x145_out,                     
			output   [width-1:0]    x146_out,                     
			output   [width-1:0]    x147_out,                     
			output   [width-1:0]    x148_out,                     
			output   [width-1:0]    x149_out,                     
			output   [width-1:0]    x150_out,                     
			output   [width-1:0]    x151_out,                     
			output   [width-1:0]    x152_out,                     
			output   [width-1:0]    x153_out,                     
			output   [width-1:0]    x154_out,                     
			output   [width-1:0]    x155_out,                     
			output   [width-1:0]    x156_out,                     
			output   [width-1:0]    x157_out,                     
			output   [width-1:0]    x158_out,                     
			output   [width-1:0]    x159_out,                     
			output   [width-1:0]    x160_out,                     
			output   [width-1:0]    x161_out,                     
			output   [width-1:0]    x162_out,                     
			output   [width-1:0]    x163_out,                     
			output   [width-1:0]    x164_out,                     
			output   [width-1:0]    x165_out,                     
			output   [width-1:0]    x166_out,                     
			output   [width-1:0]    x167_out,                     
			output   [width-1:0]    x168_out,                     
			output   [width-1:0]    x169_out,                     
			output   [width-1:0]    x170_out,                     
			output   [width-1:0]    x171_out,                     
			output   [width-1:0]    x172_out,                     
			output   [width-1:0]    x173_out,                     
			output   [width-1:0]    x174_out,                     
			output   [width-1:0]    x175_out,                     
			output   [width-1:0]    x176_out,                     
			output   [width-1:0]    x177_out,                     
			output   [width-1:0]    x178_out,                     
			output   [width-1:0]    x179_out,                     
			output   [width-1:0]    x180_out,                     
			output   [width-1:0]    x181_out,                     
			output   [width-1:0]    x182_out,                     
			output   [width-1:0]    x183_out,                     
			output   [width-1:0]    x184_out,                     
			output   [width-1:0]    x185_out,                     
			output   [width-1:0]    x186_out,                     
			output   [width-1:0]    x187_out,                     
			output   [width-1:0]    x188_out,                     
			output   [width-1:0]    x189_out,                     
			output   [width-1:0]    x190_out,                     
			output   [width-1:0]    x191_out,                     
			output   [width-1:0]    x192_out,                     
			output   [width-1:0]    x193_out,                     
			output   [width-1:0]    x194_out,                     
			output   [width-1:0]    x195_out,                     
			output   [width-1:0]    x196_out,                     
			output   [width-1:0]    x197_out,                     
			output   [width-1:0]    x198_out,                     
			output   [width-1:0]    x199_out,                     
			output   [width-1:0]    x200_out,                     
			output   [width-1:0]    x201_out,                     
			output   [width-1:0]    x202_out,                     
			output   [width-1:0]    x203_out,                     
			output   [width-1:0]    x204_out,                     
			output   [width-1:0]    x205_out,                     
			output   [width-1:0]    x206_out,                     
			output   [width-1:0]    x207_out,                     
			output   [width-1:0]    x208_out,                     
			output   [width-1:0]    x209_out,                     
			output   [width-1:0]    x210_out,                     
			output   [width-1:0]    x211_out,                     
			output   [width-1:0]    x212_out,                     
			output   [width-1:0]    x213_out,                     
			output   [width-1:0]    x214_out,                     
			output   [width-1:0]    x215_out,                     
			output   [width-1:0]    x216_out,                     
			output   [width-1:0]    x217_out,                     
			output   [width-1:0]    x218_out,                     
			output   [width-1:0]    x219_out,                     
			output   [width-1:0]    x220_out,                     
			output   [width-1:0]    x221_out,                     
			output   [width-1:0]    x222_out,                     
			output   [width-1:0]    x223_out,                     
			output   [width-1:0]    x224_out,                     
			output   [width-1:0]    x225_out,                     
			output   [width-1:0]    x226_out,                     
			output   [width-1:0]    x227_out,                     
			output   [width-1:0]    x228_out,                     
			output   [width-1:0]    x229_out,                     
			output   [width-1:0]    x230_out,                     
			output   [width-1:0]    x231_out,                     
			output   [width-1:0]    x232_out,                     
			output   [width-1:0]    x233_out,                     
			output   [width-1:0]    x234_out,                     
			output   [width-1:0]    x235_out,                     
			output   [width-1:0]    x236_out,                     
			output   [width-1:0]    x237_out,                     
			output   [width-1:0]    x238_out,                     
			output   [width-1:0]    x239_out,                     
			output   [width-1:0]    x240_out,                     
			output   [width-1:0]    x241_out,                     
			output   [width-1:0]    x242_out,                     
			output   [width-1:0]    x243_out,                     
			output   [width-1:0]    x244_out,                     
			output   [width-1:0]    x245_out,                     
			output   [width-1:0]    x246_out,                     
			output   [width-1:0]    x247_out,                     
			output   [width-1:0]    x248_out,                     
			output   [width-1:0]    x249_out,                     
			output   [width-1:0]    x250_out,                     
			output   [width-1:0]    x251_out,                     
			output   [width-1:0]    x252_out,                     
			output   [width-1:0]    x253_out,                     
			output   [width-1:0]    x254_out,                     
			output   [width-1:0]    x255_out                      
);

		//--- signal definition
			wire  [width-1:0]        coef[size-1:0];

			reg   [width-1:0]        a0_wr[size-1:0];
			wire  [width-1:0]        a1_wr[size-1:0];
			wire  [width-1:0]        a2_wr[size-1:0];
			wire  [width-1:0]        a3_wr[size-1:0];
			wire  [width-1:0]        a4_wr[size-1:0];
			wire  [width-1:0]        a5_wr[size-1:0];
			wire  [width-1:0]        a6_wr[size-1:0];
			wire  [width-1:0]        a7_wr[size-1:0];
			wire  [width-1:0]        a8_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b011111111110, 12'b111111001110};
			assign coef[2] =    {12'b011111111101, 12'b111110011100};
			assign coef[3] =    {12'b011111111010, 12'b111101101001};
			assign coef[4] =    {12'b011111110101, 12'b111100110111};
			assign coef[5] =    {12'b011111110000, 12'b111100000101};
			assign coef[6] =    {12'b011111101001, 12'b111011010100};
			assign coef[7] =    {12'b011111100001, 12'b111010100010};
			assign coef[8] =    {12'b011111011000, 12'b111001110001};
			assign coef[9] =    {12'b011111001101, 12'b111000111111};
			assign coef[10] =   {12'b011111000010, 12'b111000001111};
			assign coef[11] =   {12'b011110110101, 12'b110111011110};
			assign coef[12] =   {12'b011110100111, 12'b110110101110};
			assign coef[13] =   {12'b011110011000, 12'b110101111110};
			assign coef[14] =   {12'b011110000111, 12'b110101001110};
			assign coef[15] =   {12'b011101110110, 12'b110100011111};
			assign coef[16] =   {12'b011101100011, 12'b110011110001};
			assign coef[17] =   {12'b011101001111, 12'b110011000010};
			assign coef[18] =   {12'b011100111011, 12'b110010010101};
			assign coef[19] =   {12'b011100100100, 12'b110001101000};
			assign coef[20] =   {12'b011100001101, 12'b110000111011};
			assign coef[21] =   {12'b011011110101, 12'b110000001111};
			assign coef[22] =   {12'b011011011100, 12'b101111100100};
			assign coef[23] =   {12'b011011000001, 12'b101110111001};
			assign coef[24] =   {12'b011010100110, 12'b101110001111};
			assign coef[25] =   {12'b011010001010, 12'b101101100101};
			assign coef[26] =   {12'b011001101100, 12'b101100111101};
			assign coef[27] =   {12'b011001001110, 12'b101100010101};
			assign coef[28] =   {12'b011000101110, 12'b101011101101};
			assign coef[29] =   {12'b011000001110, 12'b101011000111};
			assign coef[30] =   {12'b010111101101, 12'b101010100001};
			assign coef[31] =   {12'b010111001011, 12'b101001111100};
			assign coef[32] =   {12'b010110100111, 12'b101001011001};
			assign coef[33] =   {12'b010110000100, 12'b101000110101};
			assign coef[34] =   {12'b010101011111, 12'b101000010011};
			assign coef[35] =   {12'b010100111001, 12'b100111110010};
			assign coef[36] =   {12'b010100010011, 12'b100111010010};
			assign coef[37] =   {12'b010011101011, 12'b100110110010};
			assign coef[38] =   {12'b010011000011, 12'b100110010100};
			assign coef[39] =   {12'b010010011011, 12'b100101110110};
			assign coef[40] =   {12'b010001110001, 12'b100101011010};
			assign coef[41] =   {12'b010001000111, 12'b100100111111};
			assign coef[42] =   {12'b010000011100, 12'b100100100100};
			assign coef[43] =   {12'b001111110001, 12'b100100001011};
			assign coef[44] =   {12'b001111000101, 12'b100011110011};
			assign coef[45] =   {12'b001110011000, 12'b100011011100};
			assign coef[46] =   {12'b001101101011, 12'b100011000101};
			assign coef[47] =   {12'b001100111110, 12'b100010110001};
			assign coef[48] =   {12'b001100001111, 12'b100010011101};
			assign coef[49] =   {12'b001011100001, 12'b100010001010};
			assign coef[50] =   {12'b001010110010, 12'b100001111001};
			assign coef[51] =   {12'b001010000010, 12'b100001101000};
			assign coef[52] =   {12'b001001010010, 12'b100001011001};
			assign coef[53] =   {12'b001000100010, 12'b100001001011};
			assign coef[54] =   {12'b000111110001, 12'b100000111110};
			assign coef[55] =   {12'b000111000001, 12'b100000110011};
			assign coef[56] =   {12'b000110001111, 12'b100000101000};
			assign coef[57] =   {12'b000101011110, 12'b100000011111};
			assign coef[58] =   {12'b000100101100, 12'b100000010111};
			assign coef[59] =   {12'b000011111011, 12'b100000010000};
			assign coef[60] =   {12'b000011001001, 12'b100000001011};
			assign coef[61] =   {12'b000010010111, 12'b100000000110};
			assign coef[62] =   {12'b000001100100, 12'b100000000011};
			assign coef[63] =   {12'b000000110010, 12'b100000000010};
			assign coef[64] =   {12'b000000000000, 12'b100000000001};
			assign coef[65] =   {12'b111111001110, 12'b100000000010};
			assign coef[66] =   {12'b111110011100, 12'b100000000011};
			assign coef[67] =   {12'b111101101001, 12'b100000000110};
			assign coef[68] =   {12'b111100110111, 12'b100000001011};
			assign coef[69] =   {12'b111100000101, 12'b100000010000};
			assign coef[70] =   {12'b111011010100, 12'b100000010111};
			assign coef[71] =   {12'b111010100010, 12'b100000011111};
			assign coef[72] =   {12'b111001110001, 12'b100000101000};
			assign coef[73] =   {12'b111000111111, 12'b100000110011};
			assign coef[74] =   {12'b111000001111, 12'b100000111110};
			assign coef[75] =   {12'b110111011110, 12'b100001001011};
			assign coef[76] =   {12'b110110101110, 12'b100001011001};
			assign coef[77] =   {12'b110101111110, 12'b100001101000};
			assign coef[78] =   {12'b110101001110, 12'b100001111001};
			assign coef[79] =   {12'b110100011111, 12'b100010001010};
			assign coef[80] =   {12'b110011110001, 12'b100010011101};
			assign coef[81] =   {12'b110011000010, 12'b100010110001};
			assign coef[82] =   {12'b110010010101, 12'b100011000101};
			assign coef[83] =   {12'b110001101000, 12'b100011011100};
			assign coef[84] =   {12'b110000111011, 12'b100011110011};
			assign coef[85] =   {12'b110000001111, 12'b100100001011};
			assign coef[86] =   {12'b101111100100, 12'b100100100100};
			assign coef[87] =   {12'b101110111001, 12'b100100111111};
			assign coef[88] =   {12'b101110001111, 12'b100101011010};
			assign coef[89] =   {12'b101101100101, 12'b100101110110};
			assign coef[90] =   {12'b101100111101, 12'b100110010100};
			assign coef[91] =   {12'b101100010101, 12'b100110110010};
			assign coef[92] =   {12'b101011101101, 12'b100111010010};
			assign coef[93] =   {12'b101011000111, 12'b100111110010};
			assign coef[94] =   {12'b101010100001, 12'b101000010011};
			assign coef[95] =   {12'b101001111100, 12'b101000110101};
			assign coef[96] =   {12'b101001011001, 12'b101001011001};
			assign coef[97] =   {12'b101000110101, 12'b101001111100};
			assign coef[98] =   {12'b101000010011, 12'b101010100001};
			assign coef[99] =   {12'b100111110010, 12'b101011000111};
			assign coef[100] =  {12'b100111010010, 12'b101011101101};
			assign coef[101] =  {12'b100110110010, 12'b101100010101};
			assign coef[102] =  {12'b100110010100, 12'b101100111101};
			assign coef[103] =  {12'b100101110110, 12'b101101100101};
			assign coef[104] =  {12'b100101011010, 12'b101110001111};
			assign coef[105] =  {12'b100100111111, 12'b101110111001};
			assign coef[106] =  {12'b100100100100, 12'b101111100100};
			assign coef[107] =  {12'b100100001011, 12'b110000001111};
			assign coef[108] =  {12'b100011110011, 12'b110000111011};
			assign coef[109] =  {12'b100011011100, 12'b110001101000};
			assign coef[110] =  {12'b100011000101, 12'b110010010101};
			assign coef[111] =  {12'b100010110001, 12'b110011000010};
			assign coef[112] =  {12'b100010011101, 12'b110011110001};
			assign coef[113] =  {12'b100010001010, 12'b110100011111};
			assign coef[114] =  {12'b100001111001, 12'b110101001110};
			assign coef[115] =  {12'b100001101000, 12'b110101111110};
			assign coef[116] =  {12'b100001011001, 12'b110110101110};
			assign coef[117] =  {12'b100001001011, 12'b110111011110};
			assign coef[118] =  {12'b100000111110, 12'b111000001111};
			assign coef[119] =  {12'b100000110011, 12'b111000111111};
			assign coef[120] =  {12'b100000101000, 12'b111001110001};
			assign coef[121] =  {12'b100000011111, 12'b111010100010};
			assign coef[122] =  {12'b100000010111, 12'b111011010100};
			assign coef[123] =  {12'b100000010000, 12'b111100000101};
			assign coef[124] =  {12'b100000001011, 12'b111100110111};
			assign coef[125] =  {12'b100000000110, 12'b111101101001};
			assign coef[126] =  {12'b100000000011, 12'b111110011100};
			assign coef[127] =  {12'b100000000010, 12'b111111001110};

		//--- fifo stage
			localparam depth=`LOG2(size);
			fifo #(.depth(depth)) inst_fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));

			assign comb_stall = stall_out & stall;

		//--- input stage
			always @(posedge clk or posedge rst) begin
				if (rst) begin
					a0_wr[0]       <= 0;                           
					a0_wr[1]       <= 0;                           
					a0_wr[2]       <= 0;                           
					a0_wr[3]       <= 0;                           
					a0_wr[4]       <= 0;                           
					a0_wr[5]       <= 0;                           
					a0_wr[6]       <= 0;                           
					a0_wr[7]       <= 0;                           
					a0_wr[8]       <= 0;                           
					a0_wr[9]       <= 0;                           
					a0_wr[10]      <= 0;                           
					a0_wr[11]      <= 0;                           
					a0_wr[12]      <= 0;                           
					a0_wr[13]      <= 0;                           
					a0_wr[14]      <= 0;                           
					a0_wr[15]      <= 0;                           
					a0_wr[16]      <= 0;                           
					a0_wr[17]      <= 0;                           
					a0_wr[18]      <= 0;                           
					a0_wr[19]      <= 0;                           
					a0_wr[20]      <= 0;                           
					a0_wr[21]      <= 0;                           
					a0_wr[22]      <= 0;                           
					a0_wr[23]      <= 0;                           
					a0_wr[24]      <= 0;                           
					a0_wr[25]      <= 0;                           
					a0_wr[26]      <= 0;                           
					a0_wr[27]      <= 0;                           
					a0_wr[28]      <= 0;                           
					a0_wr[29]      <= 0;                           
					a0_wr[30]      <= 0;                           
					a0_wr[31]      <= 0;                           
					a0_wr[32]      <= 0;                           
					a0_wr[33]      <= 0;                           
					a0_wr[34]      <= 0;                           
					a0_wr[35]      <= 0;                           
					a0_wr[36]      <= 0;                           
					a0_wr[37]      <= 0;                           
					a0_wr[38]      <= 0;                           
					a0_wr[39]      <= 0;                           
					a0_wr[40]      <= 0;                           
					a0_wr[41]      <= 0;                           
					a0_wr[42]      <= 0;                           
					a0_wr[43]      <= 0;                           
					a0_wr[44]      <= 0;                           
					a0_wr[45]      <= 0;                           
					a0_wr[46]      <= 0;                           
					a0_wr[47]      <= 0;                           
					a0_wr[48]      <= 0;                           
					a0_wr[49]      <= 0;                           
					a0_wr[50]      <= 0;                           
					a0_wr[51]      <= 0;                           
					a0_wr[52]      <= 0;                           
					a0_wr[53]      <= 0;                           
					a0_wr[54]      <= 0;                           
					a0_wr[55]      <= 0;                           
					a0_wr[56]      <= 0;                           
					a0_wr[57]      <= 0;                           
					a0_wr[58]      <= 0;                           
					a0_wr[59]      <= 0;                           
					a0_wr[60]      <= 0;                           
					a0_wr[61]      <= 0;                           
					a0_wr[62]      <= 0;                           
					a0_wr[63]      <= 0;                           
					a0_wr[64]      <= 0;                           
					a0_wr[65]      <= 0;                           
					a0_wr[66]      <= 0;                           
					a0_wr[67]      <= 0;                           
					a0_wr[68]      <= 0;                           
					a0_wr[69]      <= 0;                           
					a0_wr[70]      <= 0;                           
					a0_wr[71]      <= 0;                           
					a0_wr[72]      <= 0;                           
					a0_wr[73]      <= 0;                           
					a0_wr[74]      <= 0;                           
					a0_wr[75]      <= 0;                           
					a0_wr[76]      <= 0;                           
					a0_wr[77]      <= 0;                           
					a0_wr[78]      <= 0;                           
					a0_wr[79]      <= 0;                           
					a0_wr[80]      <= 0;                           
					a0_wr[81]      <= 0;                           
					a0_wr[82]      <= 0;                           
					a0_wr[83]      <= 0;                           
					a0_wr[84]      <= 0;                           
					a0_wr[85]      <= 0;                           
					a0_wr[86]      <= 0;                           
					a0_wr[87]      <= 0;                           
					a0_wr[88]      <= 0;                           
					a0_wr[89]      <= 0;                           
					a0_wr[90]      <= 0;                           
					a0_wr[91]      <= 0;                           
					a0_wr[92]      <= 0;                           
					a0_wr[93]      <= 0;                           
					a0_wr[94]      <= 0;                           
					a0_wr[95]      <= 0;                           
					a0_wr[96]      <= 0;                           
					a0_wr[97]      <= 0;                           
					a0_wr[98]      <= 0;                           
					a0_wr[99]      <= 0;                           
					a0_wr[100]     <= 0;                           
					a0_wr[101]     <= 0;                           
					a0_wr[102]     <= 0;                           
					a0_wr[103]     <= 0;                           
					a0_wr[104]     <= 0;                           
					a0_wr[105]     <= 0;                           
					a0_wr[106]     <= 0;                           
					a0_wr[107]     <= 0;                           
					a0_wr[108]     <= 0;                           
					a0_wr[109]     <= 0;                           
					a0_wr[110]     <= 0;                           
					a0_wr[111]     <= 0;                           
					a0_wr[112]     <= 0;                           
					a0_wr[113]     <= 0;                           
					a0_wr[114]     <= 0;                           
					a0_wr[115]     <= 0;                           
					a0_wr[116]     <= 0;                           
					a0_wr[117]     <= 0;                           
					a0_wr[118]     <= 0;                           
					a0_wr[119]     <= 0;                           
					a0_wr[120]     <= 0;                           
					a0_wr[121]     <= 0;                           
					a0_wr[122]     <= 0;                           
					a0_wr[123]     <= 0;                           
					a0_wr[124]     <= 0;                           
					a0_wr[125]     <= 0;                           
					a0_wr[126]     <= 0;                           
					a0_wr[127]     <= 0;                           
					a0_wr[128]     <= 0;                           
					a0_wr[129]     <= 0;                           
					a0_wr[130]     <= 0;                           
					a0_wr[131]     <= 0;                           
					a0_wr[132]     <= 0;                           
					a0_wr[133]     <= 0;                           
					a0_wr[134]     <= 0;                           
					a0_wr[135]     <= 0;                           
					a0_wr[136]     <= 0;                           
					a0_wr[137]     <= 0;                           
					a0_wr[138]     <= 0;                           
					a0_wr[139]     <= 0;                           
					a0_wr[140]     <= 0;                           
					a0_wr[141]     <= 0;                           
					a0_wr[142]     <= 0;                           
					a0_wr[143]     <= 0;                           
					a0_wr[144]     <= 0;                           
					a0_wr[145]     <= 0;                           
					a0_wr[146]     <= 0;                           
					a0_wr[147]     <= 0;                           
					a0_wr[148]     <= 0;                           
					a0_wr[149]     <= 0;                           
					a0_wr[150]     <= 0;                           
					a0_wr[151]     <= 0;                           
					a0_wr[152]     <= 0;                           
					a0_wr[153]     <= 0;                           
					a0_wr[154]     <= 0;                           
					a0_wr[155]     <= 0;                           
					a0_wr[156]     <= 0;                           
					a0_wr[157]     <= 0;                           
					a0_wr[158]     <= 0;                           
					a0_wr[159]     <= 0;                           
					a0_wr[160]     <= 0;                           
					a0_wr[161]     <= 0;                           
					a0_wr[162]     <= 0;                           
					a0_wr[163]     <= 0;                           
					a0_wr[164]     <= 0;                           
					a0_wr[165]     <= 0;                           
					a0_wr[166]     <= 0;                           
					a0_wr[167]     <= 0;                           
					a0_wr[168]     <= 0;                           
					a0_wr[169]     <= 0;                           
					a0_wr[170]     <= 0;                           
					a0_wr[171]     <= 0;                           
					a0_wr[172]     <= 0;                           
					a0_wr[173]     <= 0;                           
					a0_wr[174]     <= 0;                           
					a0_wr[175]     <= 0;                           
					a0_wr[176]     <= 0;                           
					a0_wr[177]     <= 0;                           
					a0_wr[178]     <= 0;                           
					a0_wr[179]     <= 0;                           
					a0_wr[180]     <= 0;                           
					a0_wr[181]     <= 0;                           
					a0_wr[182]     <= 0;                           
					a0_wr[183]     <= 0;                           
					a0_wr[184]     <= 0;                           
					a0_wr[185]     <= 0;                           
					a0_wr[186]     <= 0;                           
					a0_wr[187]     <= 0;                           
					a0_wr[188]     <= 0;                           
					a0_wr[189]     <= 0;                           
					a0_wr[190]     <= 0;                           
					a0_wr[191]     <= 0;                           
					a0_wr[192]     <= 0;                           
					a0_wr[193]     <= 0;                           
					a0_wr[194]     <= 0;                           
					a0_wr[195]     <= 0;                           
					a0_wr[196]     <= 0;                           
					a0_wr[197]     <= 0;                           
					a0_wr[198]     <= 0;                           
					a0_wr[199]     <= 0;                           
					a0_wr[200]     <= 0;                           
					a0_wr[201]     <= 0;                           
					a0_wr[202]     <= 0;                           
					a0_wr[203]     <= 0;                           
					a0_wr[204]     <= 0;                           
					a0_wr[205]     <= 0;                           
					a0_wr[206]     <= 0;                           
					a0_wr[207]     <= 0;                           
					a0_wr[208]     <= 0;                           
					a0_wr[209]     <= 0;                           
					a0_wr[210]     <= 0;                           
					a0_wr[211]     <= 0;                           
					a0_wr[212]     <= 0;                           
					a0_wr[213]     <= 0;                           
					a0_wr[214]     <= 0;                           
					a0_wr[215]     <= 0;                           
					a0_wr[216]     <= 0;                           
					a0_wr[217]     <= 0;                           
					a0_wr[218]     <= 0;                           
					a0_wr[219]     <= 0;                           
					a0_wr[220]     <= 0;                           
					a0_wr[221]     <= 0;                           
					a0_wr[222]     <= 0;                           
					a0_wr[223]     <= 0;                           
					a0_wr[224]     <= 0;                           
					a0_wr[225]     <= 0;                           
					a0_wr[226]     <= 0;                           
					a0_wr[227]     <= 0;                           
					a0_wr[228]     <= 0;                           
					a0_wr[229]     <= 0;                           
					a0_wr[230]     <= 0;                           
					a0_wr[231]     <= 0;                           
					a0_wr[232]     <= 0;                           
					a0_wr[233]     <= 0;                           
					a0_wr[234]     <= 0;                           
					a0_wr[235]     <= 0;                           
					a0_wr[236]     <= 0;                           
					a0_wr[237]     <= 0;                           
					a0_wr[238]     <= 0;                           
					a0_wr[239]     <= 0;                           
					a0_wr[240]     <= 0;                           
					a0_wr[241]     <= 0;                           
					a0_wr[242]     <= 0;                           
					a0_wr[243]     <= 0;                           
					a0_wr[244]     <= 0;                           
					a0_wr[245]     <= 0;                           
					a0_wr[246]     <= 0;                           
					a0_wr[247]     <= 0;                           
					a0_wr[248]     <= 0;                           
					a0_wr[249]     <= 0;                           
					a0_wr[250]     <= 0;                           
					a0_wr[251]     <= 0;                           
					a0_wr[252]     <= 0;                           
					a0_wr[253]     <= 0;                           
					a0_wr[254]     <= 0;                           
					a0_wr[255]     <= 0;                           
				end
				else begin
					if (!stall) begin
						a0_wr[0]      <= x0_in;                       
						a0_wr[1]      <= x1_in;                       
						a0_wr[2]      <= x2_in;                       
						a0_wr[3]      <= x3_in;                       
						a0_wr[4]      <= x4_in;                       
						a0_wr[5]      <= x5_in;                       
						a0_wr[6]      <= x6_in;                       
						a0_wr[7]      <= x7_in;                       
						a0_wr[8]      <= x8_in;                       
						a0_wr[9]      <= x9_in;                       
						a0_wr[10]     <= x10_in;                      
						a0_wr[11]     <= x11_in;                      
						a0_wr[12]     <= x12_in;                      
						a0_wr[13]     <= x13_in;                      
						a0_wr[14]     <= x14_in;                      
						a0_wr[15]     <= x15_in;                      
						a0_wr[16]     <= x16_in;                      
						a0_wr[17]     <= x17_in;                      
						a0_wr[18]     <= x18_in;                      
						a0_wr[19]     <= x19_in;                      
						a0_wr[20]     <= x20_in;                      
						a0_wr[21]     <= x21_in;                      
						a0_wr[22]     <= x22_in;                      
						a0_wr[23]     <= x23_in;                      
						a0_wr[24]     <= x24_in;                      
						a0_wr[25]     <= x25_in;                      
						a0_wr[26]     <= x26_in;                      
						a0_wr[27]     <= x27_in;                      
						a0_wr[28]     <= x28_in;                      
						a0_wr[29]     <= x29_in;                      
						a0_wr[30]     <= x30_in;                      
						a0_wr[31]     <= x31_in;                      
						a0_wr[32]     <= x32_in;                      
						a0_wr[33]     <= x33_in;                      
						a0_wr[34]     <= x34_in;                      
						a0_wr[35]     <= x35_in;                      
						a0_wr[36]     <= x36_in;                      
						a0_wr[37]     <= x37_in;                      
						a0_wr[38]     <= x38_in;                      
						a0_wr[39]     <= x39_in;                      
						a0_wr[40]     <= x40_in;                      
						a0_wr[41]     <= x41_in;                      
						a0_wr[42]     <= x42_in;                      
						a0_wr[43]     <= x43_in;                      
						a0_wr[44]     <= x44_in;                      
						a0_wr[45]     <= x45_in;                      
						a0_wr[46]     <= x46_in;                      
						a0_wr[47]     <= x47_in;                      
						a0_wr[48]     <= x48_in;                      
						a0_wr[49]     <= x49_in;                      
						a0_wr[50]     <= x50_in;                      
						a0_wr[51]     <= x51_in;                      
						a0_wr[52]     <= x52_in;                      
						a0_wr[53]     <= x53_in;                      
						a0_wr[54]     <= x54_in;                      
						a0_wr[55]     <= x55_in;                      
						a0_wr[56]     <= x56_in;                      
						a0_wr[57]     <= x57_in;                      
						a0_wr[58]     <= x58_in;                      
						a0_wr[59]     <= x59_in;                      
						a0_wr[60]     <= x60_in;                      
						a0_wr[61]     <= x61_in;                      
						a0_wr[62]     <= x62_in;                      
						a0_wr[63]     <= x63_in;                      
						a0_wr[64]     <= x64_in;                      
						a0_wr[65]     <= x65_in;                      
						a0_wr[66]     <= x66_in;                      
						a0_wr[67]     <= x67_in;                      
						a0_wr[68]     <= x68_in;                      
						a0_wr[69]     <= x69_in;                      
						a0_wr[70]     <= x70_in;                      
						a0_wr[71]     <= x71_in;                      
						a0_wr[72]     <= x72_in;                      
						a0_wr[73]     <= x73_in;                      
						a0_wr[74]     <= x74_in;                      
						a0_wr[75]     <= x75_in;                      
						a0_wr[76]     <= x76_in;                      
						a0_wr[77]     <= x77_in;                      
						a0_wr[78]     <= x78_in;                      
						a0_wr[79]     <= x79_in;                      
						a0_wr[80]     <= x80_in;                      
						a0_wr[81]     <= x81_in;                      
						a0_wr[82]     <= x82_in;                      
						a0_wr[83]     <= x83_in;                      
						a0_wr[84]     <= x84_in;                      
						a0_wr[85]     <= x85_in;                      
						a0_wr[86]     <= x86_in;                      
						a0_wr[87]     <= x87_in;                      
						a0_wr[88]     <= x88_in;                      
						a0_wr[89]     <= x89_in;                      
						a0_wr[90]     <= x90_in;                      
						a0_wr[91]     <= x91_in;                      
						a0_wr[92]     <= x92_in;                      
						a0_wr[93]     <= x93_in;                      
						a0_wr[94]     <= x94_in;                      
						a0_wr[95]     <= x95_in;                      
						a0_wr[96]     <= x96_in;                      
						a0_wr[97]     <= x97_in;                      
						a0_wr[98]     <= x98_in;                      
						a0_wr[99]     <= x99_in;                      
						a0_wr[100]    <= x100_in;                     
						a0_wr[101]    <= x101_in;                     
						a0_wr[102]    <= x102_in;                     
						a0_wr[103]    <= x103_in;                     
						a0_wr[104]    <= x104_in;                     
						a0_wr[105]    <= x105_in;                     
						a0_wr[106]    <= x106_in;                     
						a0_wr[107]    <= x107_in;                     
						a0_wr[108]    <= x108_in;                     
						a0_wr[109]    <= x109_in;                     
						a0_wr[110]    <= x110_in;                     
						a0_wr[111]    <= x111_in;                     
						a0_wr[112]    <= x112_in;                     
						a0_wr[113]    <= x113_in;                     
						a0_wr[114]    <= x114_in;                     
						a0_wr[115]    <= x115_in;                     
						a0_wr[116]    <= x116_in;                     
						a0_wr[117]    <= x117_in;                     
						a0_wr[118]    <= x118_in;                     
						a0_wr[119]    <= x119_in;                     
						a0_wr[120]    <= x120_in;                     
						a0_wr[121]    <= x121_in;                     
						a0_wr[122]    <= x122_in;                     
						a0_wr[123]    <= x123_in;                     
						a0_wr[124]    <= x124_in;                     
						a0_wr[125]    <= x125_in;                     
						a0_wr[126]    <= x126_in;                     
						a0_wr[127]    <= x127_in;                     
						a0_wr[128]    <= x128_in;                     
						a0_wr[129]    <= x129_in;                     
						a0_wr[130]    <= x130_in;                     
						a0_wr[131]    <= x131_in;                     
						a0_wr[132]    <= x132_in;                     
						a0_wr[133]    <= x133_in;                     
						a0_wr[134]    <= x134_in;                     
						a0_wr[135]    <= x135_in;                     
						a0_wr[136]    <= x136_in;                     
						a0_wr[137]    <= x137_in;                     
						a0_wr[138]    <= x138_in;                     
						a0_wr[139]    <= x139_in;                     
						a0_wr[140]    <= x140_in;                     
						a0_wr[141]    <= x141_in;                     
						a0_wr[142]    <= x142_in;                     
						a0_wr[143]    <= x143_in;                     
						a0_wr[144]    <= x144_in;                     
						a0_wr[145]    <= x145_in;                     
						a0_wr[146]    <= x146_in;                     
						a0_wr[147]    <= x147_in;                     
						a0_wr[148]    <= x148_in;                     
						a0_wr[149]    <= x149_in;                     
						a0_wr[150]    <= x150_in;                     
						a0_wr[151]    <= x151_in;                     
						a0_wr[152]    <= x152_in;                     
						a0_wr[153]    <= x153_in;                     
						a0_wr[154]    <= x154_in;                     
						a0_wr[155]    <= x155_in;                     
						a0_wr[156]    <= x156_in;                     
						a0_wr[157]    <= x157_in;                     
						a0_wr[158]    <= x158_in;                     
						a0_wr[159]    <= x159_in;                     
						a0_wr[160]    <= x160_in;                     
						a0_wr[161]    <= x161_in;                     
						a0_wr[162]    <= x162_in;                     
						a0_wr[163]    <= x163_in;                     
						a0_wr[164]    <= x164_in;                     
						a0_wr[165]    <= x165_in;                     
						a0_wr[166]    <= x166_in;                     
						a0_wr[167]    <= x167_in;                     
						a0_wr[168]    <= x168_in;                     
						a0_wr[169]    <= x169_in;                     
						a0_wr[170]    <= x170_in;                     
						a0_wr[171]    <= x171_in;                     
						a0_wr[172]    <= x172_in;                     
						a0_wr[173]    <= x173_in;                     
						a0_wr[174]    <= x174_in;                     
						a0_wr[175]    <= x175_in;                     
						a0_wr[176]    <= x176_in;                     
						a0_wr[177]    <= x177_in;                     
						a0_wr[178]    <= x178_in;                     
						a0_wr[179]    <= x179_in;                     
						a0_wr[180]    <= x180_in;                     
						a0_wr[181]    <= x181_in;                     
						a0_wr[182]    <= x182_in;                     
						a0_wr[183]    <= x183_in;                     
						a0_wr[184]    <= x184_in;                     
						a0_wr[185]    <= x185_in;                     
						a0_wr[186]    <= x186_in;                     
						a0_wr[187]    <= x187_in;                     
						a0_wr[188]    <= x188_in;                     
						a0_wr[189]    <= x189_in;                     
						a0_wr[190]    <= x190_in;                     
						a0_wr[191]    <= x191_in;                     
						a0_wr[192]    <= x192_in;                     
						a0_wr[193]    <= x193_in;                     
						a0_wr[194]    <= x194_in;                     
						a0_wr[195]    <= x195_in;                     
						a0_wr[196]    <= x196_in;                     
						a0_wr[197]    <= x197_in;                     
						a0_wr[198]    <= x198_in;                     
						a0_wr[199]    <= x199_in;                     
						a0_wr[200]    <= x200_in;                     
						a0_wr[201]    <= x201_in;                     
						a0_wr[202]    <= x202_in;                     
						a0_wr[203]    <= x203_in;                     
						a0_wr[204]    <= x204_in;                     
						a0_wr[205]    <= x205_in;                     
						a0_wr[206]    <= x206_in;                     
						a0_wr[207]    <= x207_in;                     
						a0_wr[208]    <= x208_in;                     
						a0_wr[209]    <= x209_in;                     
						a0_wr[210]    <= x210_in;                     
						a0_wr[211]    <= x211_in;                     
						a0_wr[212]    <= x212_in;                     
						a0_wr[213]    <= x213_in;                     
						a0_wr[214]    <= x214_in;                     
						a0_wr[215]    <= x215_in;                     
						a0_wr[216]    <= x216_in;                     
						a0_wr[217]    <= x217_in;                     
						a0_wr[218]    <= x218_in;                     
						a0_wr[219]    <= x219_in;                     
						a0_wr[220]    <= x220_in;                     
						a0_wr[221]    <= x221_in;                     
						a0_wr[222]    <= x222_in;                     
						a0_wr[223]    <= x223_in;                     
						a0_wr[224]    <= x224_in;                     
						a0_wr[225]    <= x225_in;                     
						a0_wr[226]    <= x226_in;                     
						a0_wr[227]    <= x227_in;                     
						a0_wr[228]    <= x228_in;                     
						a0_wr[229]    <= x229_in;                     
						a0_wr[230]    <= x230_in;                     
						a0_wr[231]    <= x231_in;                     
						a0_wr[232]    <= x232_in;                     
						a0_wr[233]    <= x233_in;                     
						a0_wr[234]    <= x234_in;                     
						a0_wr[235]    <= x235_in;                     
						a0_wr[236]    <= x236_in;                     
						a0_wr[237]    <= x237_in;                     
						a0_wr[238]    <= x238_in;                     
						a0_wr[239]    <= x239_in;                     
						a0_wr[240]    <= x240_in;                     
						a0_wr[241]    <= x241_in;                     
						a0_wr[242]    <= x242_in;                     
						a0_wr[243]    <= x243_in;                     
						a0_wr[244]    <= x244_in;                     
						a0_wr[245]    <= x245_in;                     
						a0_wr[246]    <= x246_in;                     
						a0_wr[247]    <= x247_in;                     
						a0_wr[248]    <= x248_in;                     
						a0_wr[249]    <= x249_in;                     
						a0_wr[250]    <= x250_in;                     
						a0_wr[251]    <= x251_in;                     
						a0_wr[252]    <= x252_in;                     
						a0_wr[253]    <= x253_in;                     
						a0_wr[254]    <= x254_in;                     
						a0_wr[255]    <= x255_in;                     
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[128]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[128]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[129]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[129]));
			radix2 #(.width(width)) rd_st0_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[2]), .rdlo_in(a0_wr[130]),  .coef_in(coef[2]), .rdup_out(a1_wr[2]), .rdlo_out(a1_wr[130]));
			radix2 #(.width(width)) rd_st0_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[3]), .rdlo_in(a0_wr[131]),  .coef_in(coef[3]), .rdup_out(a1_wr[3]), .rdlo_out(a1_wr[131]));
			radix2 #(.width(width)) rd_st0_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[4]), .rdlo_in(a0_wr[132]),  .coef_in(coef[4]), .rdup_out(a1_wr[4]), .rdlo_out(a1_wr[132]));
			radix2 #(.width(width)) rd_st0_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[5]), .rdlo_in(a0_wr[133]),  .coef_in(coef[5]), .rdup_out(a1_wr[5]), .rdlo_out(a1_wr[133]));
			radix2 #(.width(width)) rd_st0_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[6]), .rdlo_in(a0_wr[134]),  .coef_in(coef[6]), .rdup_out(a1_wr[6]), .rdlo_out(a1_wr[134]));
			radix2 #(.width(width)) rd_st0_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[7]), .rdlo_in(a0_wr[135]),  .coef_in(coef[7]), .rdup_out(a1_wr[7]), .rdlo_out(a1_wr[135]));
			radix2 #(.width(width)) rd_st0_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[8]), .rdlo_in(a0_wr[136]),  .coef_in(coef[8]), .rdup_out(a1_wr[8]), .rdlo_out(a1_wr[136]));
			radix2 #(.width(width)) rd_st0_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[9]), .rdlo_in(a0_wr[137]),  .coef_in(coef[9]), .rdup_out(a1_wr[9]), .rdlo_out(a1_wr[137]));
			radix2 #(.width(width)) rd_st0_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[10]), .rdlo_in(a0_wr[138]),  .coef_in(coef[10]), .rdup_out(a1_wr[10]), .rdlo_out(a1_wr[138]));
			radix2 #(.width(width)) rd_st0_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[11]), .rdlo_in(a0_wr[139]),  .coef_in(coef[11]), .rdup_out(a1_wr[11]), .rdlo_out(a1_wr[139]));
			radix2 #(.width(width)) rd_st0_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[12]), .rdlo_in(a0_wr[140]),  .coef_in(coef[12]), .rdup_out(a1_wr[12]), .rdlo_out(a1_wr[140]));
			radix2 #(.width(width)) rd_st0_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[13]), .rdlo_in(a0_wr[141]),  .coef_in(coef[13]), .rdup_out(a1_wr[13]), .rdlo_out(a1_wr[141]));
			radix2 #(.width(width)) rd_st0_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[14]), .rdlo_in(a0_wr[142]),  .coef_in(coef[14]), .rdup_out(a1_wr[14]), .rdlo_out(a1_wr[142]));
			radix2 #(.width(width)) rd_st0_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[15]), .rdlo_in(a0_wr[143]),  .coef_in(coef[15]), .rdup_out(a1_wr[15]), .rdlo_out(a1_wr[143]));
			radix2 #(.width(width)) rd_st0_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[16]), .rdlo_in(a0_wr[144]),  .coef_in(coef[16]), .rdup_out(a1_wr[16]), .rdlo_out(a1_wr[144]));
			radix2 #(.width(width)) rd_st0_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[17]), .rdlo_in(a0_wr[145]),  .coef_in(coef[17]), .rdup_out(a1_wr[17]), .rdlo_out(a1_wr[145]));
			radix2 #(.width(width)) rd_st0_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[18]), .rdlo_in(a0_wr[146]),  .coef_in(coef[18]), .rdup_out(a1_wr[18]), .rdlo_out(a1_wr[146]));
			radix2 #(.width(width)) rd_st0_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[19]), .rdlo_in(a0_wr[147]),  .coef_in(coef[19]), .rdup_out(a1_wr[19]), .rdlo_out(a1_wr[147]));
			radix2 #(.width(width)) rd_st0_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[20]), .rdlo_in(a0_wr[148]),  .coef_in(coef[20]), .rdup_out(a1_wr[20]), .rdlo_out(a1_wr[148]));
			radix2 #(.width(width)) rd_st0_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[21]), .rdlo_in(a0_wr[149]),  .coef_in(coef[21]), .rdup_out(a1_wr[21]), .rdlo_out(a1_wr[149]));
			radix2 #(.width(width)) rd_st0_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[22]), .rdlo_in(a0_wr[150]),  .coef_in(coef[22]), .rdup_out(a1_wr[22]), .rdlo_out(a1_wr[150]));
			radix2 #(.width(width)) rd_st0_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[23]), .rdlo_in(a0_wr[151]),  .coef_in(coef[23]), .rdup_out(a1_wr[23]), .rdlo_out(a1_wr[151]));
			radix2 #(.width(width)) rd_st0_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[24]), .rdlo_in(a0_wr[152]),  .coef_in(coef[24]), .rdup_out(a1_wr[24]), .rdlo_out(a1_wr[152]));
			radix2 #(.width(width)) rd_st0_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[25]), .rdlo_in(a0_wr[153]),  .coef_in(coef[25]), .rdup_out(a1_wr[25]), .rdlo_out(a1_wr[153]));
			radix2 #(.width(width)) rd_st0_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[26]), .rdlo_in(a0_wr[154]),  .coef_in(coef[26]), .rdup_out(a1_wr[26]), .rdlo_out(a1_wr[154]));
			radix2 #(.width(width)) rd_st0_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[27]), .rdlo_in(a0_wr[155]),  .coef_in(coef[27]), .rdup_out(a1_wr[27]), .rdlo_out(a1_wr[155]));
			radix2 #(.width(width)) rd_st0_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[28]), .rdlo_in(a0_wr[156]),  .coef_in(coef[28]), .rdup_out(a1_wr[28]), .rdlo_out(a1_wr[156]));
			radix2 #(.width(width)) rd_st0_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[29]), .rdlo_in(a0_wr[157]),  .coef_in(coef[29]), .rdup_out(a1_wr[29]), .rdlo_out(a1_wr[157]));
			radix2 #(.width(width)) rd_st0_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[30]), .rdlo_in(a0_wr[158]),  .coef_in(coef[30]), .rdup_out(a1_wr[30]), .rdlo_out(a1_wr[158]));
			radix2 #(.width(width)) rd_st0_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[31]), .rdlo_in(a0_wr[159]),  .coef_in(coef[31]), .rdup_out(a1_wr[31]), .rdlo_out(a1_wr[159]));
			radix2 #(.width(width)) rd_st0_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[32]), .rdlo_in(a0_wr[160]),  .coef_in(coef[32]), .rdup_out(a1_wr[32]), .rdlo_out(a1_wr[160]));
			radix2 #(.width(width)) rd_st0_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[33]), .rdlo_in(a0_wr[161]),  .coef_in(coef[33]), .rdup_out(a1_wr[33]), .rdlo_out(a1_wr[161]));
			radix2 #(.width(width)) rd_st0_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[34]), .rdlo_in(a0_wr[162]),  .coef_in(coef[34]), .rdup_out(a1_wr[34]), .rdlo_out(a1_wr[162]));
			radix2 #(.width(width)) rd_st0_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[35]), .rdlo_in(a0_wr[163]),  .coef_in(coef[35]), .rdup_out(a1_wr[35]), .rdlo_out(a1_wr[163]));
			radix2 #(.width(width)) rd_st0_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[36]), .rdlo_in(a0_wr[164]),  .coef_in(coef[36]), .rdup_out(a1_wr[36]), .rdlo_out(a1_wr[164]));
			radix2 #(.width(width)) rd_st0_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[37]), .rdlo_in(a0_wr[165]),  .coef_in(coef[37]), .rdup_out(a1_wr[37]), .rdlo_out(a1_wr[165]));
			radix2 #(.width(width)) rd_st0_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[38]), .rdlo_in(a0_wr[166]),  .coef_in(coef[38]), .rdup_out(a1_wr[38]), .rdlo_out(a1_wr[166]));
			radix2 #(.width(width)) rd_st0_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[39]), .rdlo_in(a0_wr[167]),  .coef_in(coef[39]), .rdup_out(a1_wr[39]), .rdlo_out(a1_wr[167]));
			radix2 #(.width(width)) rd_st0_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[40]), .rdlo_in(a0_wr[168]),  .coef_in(coef[40]), .rdup_out(a1_wr[40]), .rdlo_out(a1_wr[168]));
			radix2 #(.width(width)) rd_st0_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[41]), .rdlo_in(a0_wr[169]),  .coef_in(coef[41]), .rdup_out(a1_wr[41]), .rdlo_out(a1_wr[169]));
			radix2 #(.width(width)) rd_st0_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[42]), .rdlo_in(a0_wr[170]),  .coef_in(coef[42]), .rdup_out(a1_wr[42]), .rdlo_out(a1_wr[170]));
			radix2 #(.width(width)) rd_st0_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[43]), .rdlo_in(a0_wr[171]),  .coef_in(coef[43]), .rdup_out(a1_wr[43]), .rdlo_out(a1_wr[171]));
			radix2 #(.width(width)) rd_st0_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[44]), .rdlo_in(a0_wr[172]),  .coef_in(coef[44]), .rdup_out(a1_wr[44]), .rdlo_out(a1_wr[172]));
			radix2 #(.width(width)) rd_st0_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[45]), .rdlo_in(a0_wr[173]),  .coef_in(coef[45]), .rdup_out(a1_wr[45]), .rdlo_out(a1_wr[173]));
			radix2 #(.width(width)) rd_st0_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[46]), .rdlo_in(a0_wr[174]),  .coef_in(coef[46]), .rdup_out(a1_wr[46]), .rdlo_out(a1_wr[174]));
			radix2 #(.width(width)) rd_st0_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[47]), .rdlo_in(a0_wr[175]),  .coef_in(coef[47]), .rdup_out(a1_wr[47]), .rdlo_out(a1_wr[175]));
			radix2 #(.width(width)) rd_st0_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[48]), .rdlo_in(a0_wr[176]),  .coef_in(coef[48]), .rdup_out(a1_wr[48]), .rdlo_out(a1_wr[176]));
			radix2 #(.width(width)) rd_st0_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[49]), .rdlo_in(a0_wr[177]),  .coef_in(coef[49]), .rdup_out(a1_wr[49]), .rdlo_out(a1_wr[177]));
			radix2 #(.width(width)) rd_st0_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[50]), .rdlo_in(a0_wr[178]),  .coef_in(coef[50]), .rdup_out(a1_wr[50]), .rdlo_out(a1_wr[178]));
			radix2 #(.width(width)) rd_st0_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[51]), .rdlo_in(a0_wr[179]),  .coef_in(coef[51]), .rdup_out(a1_wr[51]), .rdlo_out(a1_wr[179]));
			radix2 #(.width(width)) rd_st0_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[52]), .rdlo_in(a0_wr[180]),  .coef_in(coef[52]), .rdup_out(a1_wr[52]), .rdlo_out(a1_wr[180]));
			radix2 #(.width(width)) rd_st0_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[53]), .rdlo_in(a0_wr[181]),  .coef_in(coef[53]), .rdup_out(a1_wr[53]), .rdlo_out(a1_wr[181]));
			radix2 #(.width(width)) rd_st0_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[54]), .rdlo_in(a0_wr[182]),  .coef_in(coef[54]), .rdup_out(a1_wr[54]), .rdlo_out(a1_wr[182]));
			radix2 #(.width(width)) rd_st0_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[55]), .rdlo_in(a0_wr[183]),  .coef_in(coef[55]), .rdup_out(a1_wr[55]), .rdlo_out(a1_wr[183]));
			radix2 #(.width(width)) rd_st0_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[56]), .rdlo_in(a0_wr[184]),  .coef_in(coef[56]), .rdup_out(a1_wr[56]), .rdlo_out(a1_wr[184]));
			radix2 #(.width(width)) rd_st0_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[57]), .rdlo_in(a0_wr[185]),  .coef_in(coef[57]), .rdup_out(a1_wr[57]), .rdlo_out(a1_wr[185]));
			radix2 #(.width(width)) rd_st0_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[58]), .rdlo_in(a0_wr[186]),  .coef_in(coef[58]), .rdup_out(a1_wr[58]), .rdlo_out(a1_wr[186]));
			radix2 #(.width(width)) rd_st0_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[59]), .rdlo_in(a0_wr[187]),  .coef_in(coef[59]), .rdup_out(a1_wr[59]), .rdlo_out(a1_wr[187]));
			radix2 #(.width(width)) rd_st0_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[60]), .rdlo_in(a0_wr[188]),  .coef_in(coef[60]), .rdup_out(a1_wr[60]), .rdlo_out(a1_wr[188]));
			radix2 #(.width(width)) rd_st0_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[61]), .rdlo_in(a0_wr[189]),  .coef_in(coef[61]), .rdup_out(a1_wr[61]), .rdlo_out(a1_wr[189]));
			radix2 #(.width(width)) rd_st0_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[62]), .rdlo_in(a0_wr[190]),  .coef_in(coef[62]), .rdup_out(a1_wr[62]), .rdlo_out(a1_wr[190]));
			radix2 #(.width(width)) rd_st0_63  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[63]), .rdlo_in(a0_wr[191]),  .coef_in(coef[63]), .rdup_out(a1_wr[63]), .rdlo_out(a1_wr[191]));
			radix2 #(.width(width)) rd_st0_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[64]), .rdlo_in(a0_wr[192]),  .coef_in(coef[64]), .rdup_out(a1_wr[64]), .rdlo_out(a1_wr[192]));
			radix2 #(.width(width)) rd_st0_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[65]), .rdlo_in(a0_wr[193]),  .coef_in(coef[65]), .rdup_out(a1_wr[65]), .rdlo_out(a1_wr[193]));
			radix2 #(.width(width)) rd_st0_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[66]), .rdlo_in(a0_wr[194]),  .coef_in(coef[66]), .rdup_out(a1_wr[66]), .rdlo_out(a1_wr[194]));
			radix2 #(.width(width)) rd_st0_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[67]), .rdlo_in(a0_wr[195]),  .coef_in(coef[67]), .rdup_out(a1_wr[67]), .rdlo_out(a1_wr[195]));
			radix2 #(.width(width)) rd_st0_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[68]), .rdlo_in(a0_wr[196]),  .coef_in(coef[68]), .rdup_out(a1_wr[68]), .rdlo_out(a1_wr[196]));
			radix2 #(.width(width)) rd_st0_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[69]), .rdlo_in(a0_wr[197]),  .coef_in(coef[69]), .rdup_out(a1_wr[69]), .rdlo_out(a1_wr[197]));
			radix2 #(.width(width)) rd_st0_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[70]), .rdlo_in(a0_wr[198]),  .coef_in(coef[70]), .rdup_out(a1_wr[70]), .rdlo_out(a1_wr[198]));
			radix2 #(.width(width)) rd_st0_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[71]), .rdlo_in(a0_wr[199]),  .coef_in(coef[71]), .rdup_out(a1_wr[71]), .rdlo_out(a1_wr[199]));
			radix2 #(.width(width)) rd_st0_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[72]), .rdlo_in(a0_wr[200]),  .coef_in(coef[72]), .rdup_out(a1_wr[72]), .rdlo_out(a1_wr[200]));
			radix2 #(.width(width)) rd_st0_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[73]), .rdlo_in(a0_wr[201]),  .coef_in(coef[73]), .rdup_out(a1_wr[73]), .rdlo_out(a1_wr[201]));
			radix2 #(.width(width)) rd_st0_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[74]), .rdlo_in(a0_wr[202]),  .coef_in(coef[74]), .rdup_out(a1_wr[74]), .rdlo_out(a1_wr[202]));
			radix2 #(.width(width)) rd_st0_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[75]), .rdlo_in(a0_wr[203]),  .coef_in(coef[75]), .rdup_out(a1_wr[75]), .rdlo_out(a1_wr[203]));
			radix2 #(.width(width)) rd_st0_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[76]), .rdlo_in(a0_wr[204]),  .coef_in(coef[76]), .rdup_out(a1_wr[76]), .rdlo_out(a1_wr[204]));
			radix2 #(.width(width)) rd_st0_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[77]), .rdlo_in(a0_wr[205]),  .coef_in(coef[77]), .rdup_out(a1_wr[77]), .rdlo_out(a1_wr[205]));
			radix2 #(.width(width)) rd_st0_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[78]), .rdlo_in(a0_wr[206]),  .coef_in(coef[78]), .rdup_out(a1_wr[78]), .rdlo_out(a1_wr[206]));
			radix2 #(.width(width)) rd_st0_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[79]), .rdlo_in(a0_wr[207]),  .coef_in(coef[79]), .rdup_out(a1_wr[79]), .rdlo_out(a1_wr[207]));
			radix2 #(.width(width)) rd_st0_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[80]), .rdlo_in(a0_wr[208]),  .coef_in(coef[80]), .rdup_out(a1_wr[80]), .rdlo_out(a1_wr[208]));
			radix2 #(.width(width)) rd_st0_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[81]), .rdlo_in(a0_wr[209]),  .coef_in(coef[81]), .rdup_out(a1_wr[81]), .rdlo_out(a1_wr[209]));
			radix2 #(.width(width)) rd_st0_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[82]), .rdlo_in(a0_wr[210]),  .coef_in(coef[82]), .rdup_out(a1_wr[82]), .rdlo_out(a1_wr[210]));
			radix2 #(.width(width)) rd_st0_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[83]), .rdlo_in(a0_wr[211]),  .coef_in(coef[83]), .rdup_out(a1_wr[83]), .rdlo_out(a1_wr[211]));
			radix2 #(.width(width)) rd_st0_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[84]), .rdlo_in(a0_wr[212]),  .coef_in(coef[84]), .rdup_out(a1_wr[84]), .rdlo_out(a1_wr[212]));
			radix2 #(.width(width)) rd_st0_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[85]), .rdlo_in(a0_wr[213]),  .coef_in(coef[85]), .rdup_out(a1_wr[85]), .rdlo_out(a1_wr[213]));
			radix2 #(.width(width)) rd_st0_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[86]), .rdlo_in(a0_wr[214]),  .coef_in(coef[86]), .rdup_out(a1_wr[86]), .rdlo_out(a1_wr[214]));
			radix2 #(.width(width)) rd_st0_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[87]), .rdlo_in(a0_wr[215]),  .coef_in(coef[87]), .rdup_out(a1_wr[87]), .rdlo_out(a1_wr[215]));
			radix2 #(.width(width)) rd_st0_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[88]), .rdlo_in(a0_wr[216]),  .coef_in(coef[88]), .rdup_out(a1_wr[88]), .rdlo_out(a1_wr[216]));
			radix2 #(.width(width)) rd_st0_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[89]), .rdlo_in(a0_wr[217]),  .coef_in(coef[89]), .rdup_out(a1_wr[89]), .rdlo_out(a1_wr[217]));
			radix2 #(.width(width)) rd_st0_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[90]), .rdlo_in(a0_wr[218]),  .coef_in(coef[90]), .rdup_out(a1_wr[90]), .rdlo_out(a1_wr[218]));
			radix2 #(.width(width)) rd_st0_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[91]), .rdlo_in(a0_wr[219]),  .coef_in(coef[91]), .rdup_out(a1_wr[91]), .rdlo_out(a1_wr[219]));
			radix2 #(.width(width)) rd_st0_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[92]), .rdlo_in(a0_wr[220]),  .coef_in(coef[92]), .rdup_out(a1_wr[92]), .rdlo_out(a1_wr[220]));
			radix2 #(.width(width)) rd_st0_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[93]), .rdlo_in(a0_wr[221]),  .coef_in(coef[93]), .rdup_out(a1_wr[93]), .rdlo_out(a1_wr[221]));
			radix2 #(.width(width)) rd_st0_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[94]), .rdlo_in(a0_wr[222]),  .coef_in(coef[94]), .rdup_out(a1_wr[94]), .rdlo_out(a1_wr[222]));
			radix2 #(.width(width)) rd_st0_95  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[95]), .rdlo_in(a0_wr[223]),  .coef_in(coef[95]), .rdup_out(a1_wr[95]), .rdlo_out(a1_wr[223]));
			radix2 #(.width(width)) rd_st0_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[96]), .rdlo_in(a0_wr[224]),  .coef_in(coef[96]), .rdup_out(a1_wr[96]), .rdlo_out(a1_wr[224]));
			radix2 #(.width(width)) rd_st0_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[97]), .rdlo_in(a0_wr[225]),  .coef_in(coef[97]), .rdup_out(a1_wr[97]), .rdlo_out(a1_wr[225]));
			radix2 #(.width(width)) rd_st0_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[98]), .rdlo_in(a0_wr[226]),  .coef_in(coef[98]), .rdup_out(a1_wr[98]), .rdlo_out(a1_wr[226]));
			radix2 #(.width(width)) rd_st0_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[99]), .rdlo_in(a0_wr[227]),  .coef_in(coef[99]), .rdup_out(a1_wr[99]), .rdlo_out(a1_wr[227]));
			radix2 #(.width(width)) rd_st0_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[100]), .rdlo_in(a0_wr[228]),  .coef_in(coef[100]), .rdup_out(a1_wr[100]), .rdlo_out(a1_wr[228]));
			radix2 #(.width(width)) rd_st0_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[101]), .rdlo_in(a0_wr[229]),  .coef_in(coef[101]), .rdup_out(a1_wr[101]), .rdlo_out(a1_wr[229]));
			radix2 #(.width(width)) rd_st0_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[102]), .rdlo_in(a0_wr[230]),  .coef_in(coef[102]), .rdup_out(a1_wr[102]), .rdlo_out(a1_wr[230]));
			radix2 #(.width(width)) rd_st0_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[103]), .rdlo_in(a0_wr[231]),  .coef_in(coef[103]), .rdup_out(a1_wr[103]), .rdlo_out(a1_wr[231]));
			radix2 #(.width(width)) rd_st0_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[104]), .rdlo_in(a0_wr[232]),  .coef_in(coef[104]), .rdup_out(a1_wr[104]), .rdlo_out(a1_wr[232]));
			radix2 #(.width(width)) rd_st0_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[105]), .rdlo_in(a0_wr[233]),  .coef_in(coef[105]), .rdup_out(a1_wr[105]), .rdlo_out(a1_wr[233]));
			radix2 #(.width(width)) rd_st0_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[106]), .rdlo_in(a0_wr[234]),  .coef_in(coef[106]), .rdup_out(a1_wr[106]), .rdlo_out(a1_wr[234]));
			radix2 #(.width(width)) rd_st0_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[107]), .rdlo_in(a0_wr[235]),  .coef_in(coef[107]), .rdup_out(a1_wr[107]), .rdlo_out(a1_wr[235]));
			radix2 #(.width(width)) rd_st0_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[108]), .rdlo_in(a0_wr[236]),  .coef_in(coef[108]), .rdup_out(a1_wr[108]), .rdlo_out(a1_wr[236]));
			radix2 #(.width(width)) rd_st0_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[109]), .rdlo_in(a0_wr[237]),  .coef_in(coef[109]), .rdup_out(a1_wr[109]), .rdlo_out(a1_wr[237]));
			radix2 #(.width(width)) rd_st0_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[110]), .rdlo_in(a0_wr[238]),  .coef_in(coef[110]), .rdup_out(a1_wr[110]), .rdlo_out(a1_wr[238]));
			radix2 #(.width(width)) rd_st0_111  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[111]), .rdlo_in(a0_wr[239]),  .coef_in(coef[111]), .rdup_out(a1_wr[111]), .rdlo_out(a1_wr[239]));
			radix2 #(.width(width)) rd_st0_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[112]), .rdlo_in(a0_wr[240]),  .coef_in(coef[112]), .rdup_out(a1_wr[112]), .rdlo_out(a1_wr[240]));
			radix2 #(.width(width)) rd_st0_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[113]), .rdlo_in(a0_wr[241]),  .coef_in(coef[113]), .rdup_out(a1_wr[113]), .rdlo_out(a1_wr[241]));
			radix2 #(.width(width)) rd_st0_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[114]), .rdlo_in(a0_wr[242]),  .coef_in(coef[114]), .rdup_out(a1_wr[114]), .rdlo_out(a1_wr[242]));
			radix2 #(.width(width)) rd_st0_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[115]), .rdlo_in(a0_wr[243]),  .coef_in(coef[115]), .rdup_out(a1_wr[115]), .rdlo_out(a1_wr[243]));
			radix2 #(.width(width)) rd_st0_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[116]), .rdlo_in(a0_wr[244]),  .coef_in(coef[116]), .rdup_out(a1_wr[116]), .rdlo_out(a1_wr[244]));
			radix2 #(.width(width)) rd_st0_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[117]), .rdlo_in(a0_wr[245]),  .coef_in(coef[117]), .rdup_out(a1_wr[117]), .rdlo_out(a1_wr[245]));
			radix2 #(.width(width)) rd_st0_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[118]), .rdlo_in(a0_wr[246]),  .coef_in(coef[118]), .rdup_out(a1_wr[118]), .rdlo_out(a1_wr[246]));
			radix2 #(.width(width)) rd_st0_119  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[119]), .rdlo_in(a0_wr[247]),  .coef_in(coef[119]), .rdup_out(a1_wr[119]), .rdlo_out(a1_wr[247]));
			radix2 #(.width(width)) rd_st0_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[120]), .rdlo_in(a0_wr[248]),  .coef_in(coef[120]), .rdup_out(a1_wr[120]), .rdlo_out(a1_wr[248]));
			radix2 #(.width(width)) rd_st0_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[121]), .rdlo_in(a0_wr[249]),  .coef_in(coef[121]), .rdup_out(a1_wr[121]), .rdlo_out(a1_wr[249]));
			radix2 #(.width(width)) rd_st0_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[122]), .rdlo_in(a0_wr[250]),  .coef_in(coef[122]), .rdup_out(a1_wr[122]), .rdlo_out(a1_wr[250]));
			radix2 #(.width(width)) rd_st0_123  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[123]), .rdlo_in(a0_wr[251]),  .coef_in(coef[123]), .rdup_out(a1_wr[123]), .rdlo_out(a1_wr[251]));
			radix2 #(.width(width)) rd_st0_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[124]), .rdlo_in(a0_wr[252]),  .coef_in(coef[124]), .rdup_out(a1_wr[124]), .rdlo_out(a1_wr[252]));
			radix2 #(.width(width)) rd_st0_125  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[125]), .rdlo_in(a0_wr[253]),  .coef_in(coef[125]), .rdup_out(a1_wr[125]), .rdlo_out(a1_wr[253]));
			radix2 #(.width(width)) rd_st0_126  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[126]), .rdlo_in(a0_wr[254]),  .coef_in(coef[126]), .rdup_out(a1_wr[126]), .rdlo_out(a1_wr[254]));
			radix2 #(.width(width)) rd_st0_127  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[127]), .rdlo_in(a0_wr[255]),  .coef_in(coef[127]), .rdup_out(a1_wr[127]), .rdlo_out(a1_wr[255]));

		//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[0]), .rdlo_in(a1_wr[64]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[64]));
			radix2 #(.width(width)) rd_st1_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[1]), .rdlo_in(a1_wr[65]),  .coef_in(coef[2]), .rdup_out(a2_wr[1]), .rdlo_out(a2_wr[65]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[2]), .rdlo_in(a1_wr[66]),  .coef_in(coef[4]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[66]));
			radix2 #(.width(width)) rd_st1_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[3]), .rdlo_in(a1_wr[67]),  .coef_in(coef[6]), .rdup_out(a2_wr[3]), .rdlo_out(a2_wr[67]));
			radix2 #(.width(width)) rd_st1_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[4]), .rdlo_in(a1_wr[68]),  .coef_in(coef[8]), .rdup_out(a2_wr[4]), .rdlo_out(a2_wr[68]));
			radix2 #(.width(width)) rd_st1_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[5]), .rdlo_in(a1_wr[69]),  .coef_in(coef[10]), .rdup_out(a2_wr[5]), .rdlo_out(a2_wr[69]));
			radix2 #(.width(width)) rd_st1_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[6]), .rdlo_in(a1_wr[70]),  .coef_in(coef[12]), .rdup_out(a2_wr[6]), .rdlo_out(a2_wr[70]));
			radix2 #(.width(width)) rd_st1_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[7]), .rdlo_in(a1_wr[71]),  .coef_in(coef[14]), .rdup_out(a2_wr[7]), .rdlo_out(a2_wr[71]));
			radix2 #(.width(width)) rd_st1_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[8]), .rdlo_in(a1_wr[72]),  .coef_in(coef[16]), .rdup_out(a2_wr[8]), .rdlo_out(a2_wr[72]));
			radix2 #(.width(width)) rd_st1_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[9]), .rdlo_in(a1_wr[73]),  .coef_in(coef[18]), .rdup_out(a2_wr[9]), .rdlo_out(a2_wr[73]));
			radix2 #(.width(width)) rd_st1_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[10]), .rdlo_in(a1_wr[74]),  .coef_in(coef[20]), .rdup_out(a2_wr[10]), .rdlo_out(a2_wr[74]));
			radix2 #(.width(width)) rd_st1_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[11]), .rdlo_in(a1_wr[75]),  .coef_in(coef[22]), .rdup_out(a2_wr[11]), .rdlo_out(a2_wr[75]));
			radix2 #(.width(width)) rd_st1_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[12]), .rdlo_in(a1_wr[76]),  .coef_in(coef[24]), .rdup_out(a2_wr[12]), .rdlo_out(a2_wr[76]));
			radix2 #(.width(width)) rd_st1_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[13]), .rdlo_in(a1_wr[77]),  .coef_in(coef[26]), .rdup_out(a2_wr[13]), .rdlo_out(a2_wr[77]));
			radix2 #(.width(width)) rd_st1_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[14]), .rdlo_in(a1_wr[78]),  .coef_in(coef[28]), .rdup_out(a2_wr[14]), .rdlo_out(a2_wr[78]));
			radix2 #(.width(width)) rd_st1_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[15]), .rdlo_in(a1_wr[79]),  .coef_in(coef[30]), .rdup_out(a2_wr[15]), .rdlo_out(a2_wr[79]));
			radix2 #(.width(width)) rd_st1_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[16]), .rdlo_in(a1_wr[80]),  .coef_in(coef[32]), .rdup_out(a2_wr[16]), .rdlo_out(a2_wr[80]));
			radix2 #(.width(width)) rd_st1_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[17]), .rdlo_in(a1_wr[81]),  .coef_in(coef[34]), .rdup_out(a2_wr[17]), .rdlo_out(a2_wr[81]));
			radix2 #(.width(width)) rd_st1_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[18]), .rdlo_in(a1_wr[82]),  .coef_in(coef[36]), .rdup_out(a2_wr[18]), .rdlo_out(a2_wr[82]));
			radix2 #(.width(width)) rd_st1_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[19]), .rdlo_in(a1_wr[83]),  .coef_in(coef[38]), .rdup_out(a2_wr[19]), .rdlo_out(a2_wr[83]));
			radix2 #(.width(width)) rd_st1_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[20]), .rdlo_in(a1_wr[84]),  .coef_in(coef[40]), .rdup_out(a2_wr[20]), .rdlo_out(a2_wr[84]));
			radix2 #(.width(width)) rd_st1_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[21]), .rdlo_in(a1_wr[85]),  .coef_in(coef[42]), .rdup_out(a2_wr[21]), .rdlo_out(a2_wr[85]));
			radix2 #(.width(width)) rd_st1_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[22]), .rdlo_in(a1_wr[86]),  .coef_in(coef[44]), .rdup_out(a2_wr[22]), .rdlo_out(a2_wr[86]));
			radix2 #(.width(width)) rd_st1_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[23]), .rdlo_in(a1_wr[87]),  .coef_in(coef[46]), .rdup_out(a2_wr[23]), .rdlo_out(a2_wr[87]));
			radix2 #(.width(width)) rd_st1_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[24]), .rdlo_in(a1_wr[88]),  .coef_in(coef[48]), .rdup_out(a2_wr[24]), .rdlo_out(a2_wr[88]));
			radix2 #(.width(width)) rd_st1_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[25]), .rdlo_in(a1_wr[89]),  .coef_in(coef[50]), .rdup_out(a2_wr[25]), .rdlo_out(a2_wr[89]));
			radix2 #(.width(width)) rd_st1_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[26]), .rdlo_in(a1_wr[90]),  .coef_in(coef[52]), .rdup_out(a2_wr[26]), .rdlo_out(a2_wr[90]));
			radix2 #(.width(width)) rd_st1_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[27]), .rdlo_in(a1_wr[91]),  .coef_in(coef[54]), .rdup_out(a2_wr[27]), .rdlo_out(a2_wr[91]));
			radix2 #(.width(width)) rd_st1_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[28]), .rdlo_in(a1_wr[92]),  .coef_in(coef[56]), .rdup_out(a2_wr[28]), .rdlo_out(a2_wr[92]));
			radix2 #(.width(width)) rd_st1_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[29]), .rdlo_in(a1_wr[93]),  .coef_in(coef[58]), .rdup_out(a2_wr[29]), .rdlo_out(a2_wr[93]));
			radix2 #(.width(width)) rd_st1_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[30]), .rdlo_in(a1_wr[94]),  .coef_in(coef[60]), .rdup_out(a2_wr[30]), .rdlo_out(a2_wr[94]));
			radix2 #(.width(width)) rd_st1_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[31]), .rdlo_in(a1_wr[95]),  .coef_in(coef[62]), .rdup_out(a2_wr[31]), .rdlo_out(a2_wr[95]));
			radix2 #(.width(width)) rd_st1_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[32]), .rdlo_in(a1_wr[96]),  .coef_in(coef[64]), .rdup_out(a2_wr[32]), .rdlo_out(a2_wr[96]));
			radix2 #(.width(width)) rd_st1_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[33]), .rdlo_in(a1_wr[97]),  .coef_in(coef[66]), .rdup_out(a2_wr[33]), .rdlo_out(a2_wr[97]));
			radix2 #(.width(width)) rd_st1_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[34]), .rdlo_in(a1_wr[98]),  .coef_in(coef[68]), .rdup_out(a2_wr[34]), .rdlo_out(a2_wr[98]));
			radix2 #(.width(width)) rd_st1_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[35]), .rdlo_in(a1_wr[99]),  .coef_in(coef[70]), .rdup_out(a2_wr[35]), .rdlo_out(a2_wr[99]));
			radix2 #(.width(width)) rd_st1_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[36]), .rdlo_in(a1_wr[100]),  .coef_in(coef[72]), .rdup_out(a2_wr[36]), .rdlo_out(a2_wr[100]));
			radix2 #(.width(width)) rd_st1_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[37]), .rdlo_in(a1_wr[101]),  .coef_in(coef[74]), .rdup_out(a2_wr[37]), .rdlo_out(a2_wr[101]));
			radix2 #(.width(width)) rd_st1_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[38]), .rdlo_in(a1_wr[102]),  .coef_in(coef[76]), .rdup_out(a2_wr[38]), .rdlo_out(a2_wr[102]));
			radix2 #(.width(width)) rd_st1_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[39]), .rdlo_in(a1_wr[103]),  .coef_in(coef[78]), .rdup_out(a2_wr[39]), .rdlo_out(a2_wr[103]));
			radix2 #(.width(width)) rd_st1_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[40]), .rdlo_in(a1_wr[104]),  .coef_in(coef[80]), .rdup_out(a2_wr[40]), .rdlo_out(a2_wr[104]));
			radix2 #(.width(width)) rd_st1_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[41]), .rdlo_in(a1_wr[105]),  .coef_in(coef[82]), .rdup_out(a2_wr[41]), .rdlo_out(a2_wr[105]));
			radix2 #(.width(width)) rd_st1_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[42]), .rdlo_in(a1_wr[106]),  .coef_in(coef[84]), .rdup_out(a2_wr[42]), .rdlo_out(a2_wr[106]));
			radix2 #(.width(width)) rd_st1_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[43]), .rdlo_in(a1_wr[107]),  .coef_in(coef[86]), .rdup_out(a2_wr[43]), .rdlo_out(a2_wr[107]));
			radix2 #(.width(width)) rd_st1_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[44]), .rdlo_in(a1_wr[108]),  .coef_in(coef[88]), .rdup_out(a2_wr[44]), .rdlo_out(a2_wr[108]));
			radix2 #(.width(width)) rd_st1_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[45]), .rdlo_in(a1_wr[109]),  .coef_in(coef[90]), .rdup_out(a2_wr[45]), .rdlo_out(a2_wr[109]));
			radix2 #(.width(width)) rd_st1_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[46]), .rdlo_in(a1_wr[110]),  .coef_in(coef[92]), .rdup_out(a2_wr[46]), .rdlo_out(a2_wr[110]));
			radix2 #(.width(width)) rd_st1_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[47]), .rdlo_in(a1_wr[111]),  .coef_in(coef[94]), .rdup_out(a2_wr[47]), .rdlo_out(a2_wr[111]));
			radix2 #(.width(width)) rd_st1_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[48]), .rdlo_in(a1_wr[112]),  .coef_in(coef[96]), .rdup_out(a2_wr[48]), .rdlo_out(a2_wr[112]));
			radix2 #(.width(width)) rd_st1_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[49]), .rdlo_in(a1_wr[113]),  .coef_in(coef[98]), .rdup_out(a2_wr[49]), .rdlo_out(a2_wr[113]));
			radix2 #(.width(width)) rd_st1_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[50]), .rdlo_in(a1_wr[114]),  .coef_in(coef[100]), .rdup_out(a2_wr[50]), .rdlo_out(a2_wr[114]));
			radix2 #(.width(width)) rd_st1_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[51]), .rdlo_in(a1_wr[115]),  .coef_in(coef[102]), .rdup_out(a2_wr[51]), .rdlo_out(a2_wr[115]));
			radix2 #(.width(width)) rd_st1_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[52]), .rdlo_in(a1_wr[116]),  .coef_in(coef[104]), .rdup_out(a2_wr[52]), .rdlo_out(a2_wr[116]));
			radix2 #(.width(width)) rd_st1_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[53]), .rdlo_in(a1_wr[117]),  .coef_in(coef[106]), .rdup_out(a2_wr[53]), .rdlo_out(a2_wr[117]));
			radix2 #(.width(width)) rd_st1_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[54]), .rdlo_in(a1_wr[118]),  .coef_in(coef[108]), .rdup_out(a2_wr[54]), .rdlo_out(a2_wr[118]));
			radix2 #(.width(width)) rd_st1_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[55]), .rdlo_in(a1_wr[119]),  .coef_in(coef[110]), .rdup_out(a2_wr[55]), .rdlo_out(a2_wr[119]));
			radix2 #(.width(width)) rd_st1_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[56]), .rdlo_in(a1_wr[120]),  .coef_in(coef[112]), .rdup_out(a2_wr[56]), .rdlo_out(a2_wr[120]));
			radix2 #(.width(width)) rd_st1_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[57]), .rdlo_in(a1_wr[121]),  .coef_in(coef[114]), .rdup_out(a2_wr[57]), .rdlo_out(a2_wr[121]));
			radix2 #(.width(width)) rd_st1_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[58]), .rdlo_in(a1_wr[122]),  .coef_in(coef[116]), .rdup_out(a2_wr[58]), .rdlo_out(a2_wr[122]));
			radix2 #(.width(width)) rd_st1_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[59]), .rdlo_in(a1_wr[123]),  .coef_in(coef[118]), .rdup_out(a2_wr[59]), .rdlo_out(a2_wr[123]));
			radix2 #(.width(width)) rd_st1_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[60]), .rdlo_in(a1_wr[124]),  .coef_in(coef[120]), .rdup_out(a2_wr[60]), .rdlo_out(a2_wr[124]));
			radix2 #(.width(width)) rd_st1_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[61]), .rdlo_in(a1_wr[125]),  .coef_in(coef[122]), .rdup_out(a2_wr[61]), .rdlo_out(a2_wr[125]));
			radix2 #(.width(width)) rd_st1_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[62]), .rdlo_in(a1_wr[126]),  .coef_in(coef[124]), .rdup_out(a2_wr[62]), .rdlo_out(a2_wr[126]));
			radix2 #(.width(width)) rd_st1_63  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[63]), .rdlo_in(a1_wr[127]),  .coef_in(coef[126]), .rdup_out(a2_wr[63]), .rdlo_out(a2_wr[127]));
			radix2 #(.width(width)) rd_st1_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[128]), .rdlo_in(a1_wr[192]),  .coef_in(coef[0]), .rdup_out(a2_wr[128]), .rdlo_out(a2_wr[192]));
			radix2 #(.width(width)) rd_st1_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[129]), .rdlo_in(a1_wr[193]),  .coef_in(coef[2]), .rdup_out(a2_wr[129]), .rdlo_out(a2_wr[193]));
			radix2 #(.width(width)) rd_st1_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[130]), .rdlo_in(a1_wr[194]),  .coef_in(coef[4]), .rdup_out(a2_wr[130]), .rdlo_out(a2_wr[194]));
			radix2 #(.width(width)) rd_st1_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[131]), .rdlo_in(a1_wr[195]),  .coef_in(coef[6]), .rdup_out(a2_wr[131]), .rdlo_out(a2_wr[195]));
			radix2 #(.width(width)) rd_st1_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[132]), .rdlo_in(a1_wr[196]),  .coef_in(coef[8]), .rdup_out(a2_wr[132]), .rdlo_out(a2_wr[196]));
			radix2 #(.width(width)) rd_st1_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[133]), .rdlo_in(a1_wr[197]),  .coef_in(coef[10]), .rdup_out(a2_wr[133]), .rdlo_out(a2_wr[197]));
			radix2 #(.width(width)) rd_st1_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[134]), .rdlo_in(a1_wr[198]),  .coef_in(coef[12]), .rdup_out(a2_wr[134]), .rdlo_out(a2_wr[198]));
			radix2 #(.width(width)) rd_st1_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[135]), .rdlo_in(a1_wr[199]),  .coef_in(coef[14]), .rdup_out(a2_wr[135]), .rdlo_out(a2_wr[199]));
			radix2 #(.width(width)) rd_st1_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[136]), .rdlo_in(a1_wr[200]),  .coef_in(coef[16]), .rdup_out(a2_wr[136]), .rdlo_out(a2_wr[200]));
			radix2 #(.width(width)) rd_st1_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[137]), .rdlo_in(a1_wr[201]),  .coef_in(coef[18]), .rdup_out(a2_wr[137]), .rdlo_out(a2_wr[201]));
			radix2 #(.width(width)) rd_st1_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[138]), .rdlo_in(a1_wr[202]),  .coef_in(coef[20]), .rdup_out(a2_wr[138]), .rdlo_out(a2_wr[202]));
			radix2 #(.width(width)) rd_st1_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[139]), .rdlo_in(a1_wr[203]),  .coef_in(coef[22]), .rdup_out(a2_wr[139]), .rdlo_out(a2_wr[203]));
			radix2 #(.width(width)) rd_st1_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[140]), .rdlo_in(a1_wr[204]),  .coef_in(coef[24]), .rdup_out(a2_wr[140]), .rdlo_out(a2_wr[204]));
			radix2 #(.width(width)) rd_st1_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[141]), .rdlo_in(a1_wr[205]),  .coef_in(coef[26]), .rdup_out(a2_wr[141]), .rdlo_out(a2_wr[205]));
			radix2 #(.width(width)) rd_st1_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[142]), .rdlo_in(a1_wr[206]),  .coef_in(coef[28]), .rdup_out(a2_wr[142]), .rdlo_out(a2_wr[206]));
			radix2 #(.width(width)) rd_st1_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[143]), .rdlo_in(a1_wr[207]),  .coef_in(coef[30]), .rdup_out(a2_wr[143]), .rdlo_out(a2_wr[207]));
			radix2 #(.width(width)) rd_st1_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[144]), .rdlo_in(a1_wr[208]),  .coef_in(coef[32]), .rdup_out(a2_wr[144]), .rdlo_out(a2_wr[208]));
			radix2 #(.width(width)) rd_st1_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[145]), .rdlo_in(a1_wr[209]),  .coef_in(coef[34]), .rdup_out(a2_wr[145]), .rdlo_out(a2_wr[209]));
			radix2 #(.width(width)) rd_st1_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[146]), .rdlo_in(a1_wr[210]),  .coef_in(coef[36]), .rdup_out(a2_wr[146]), .rdlo_out(a2_wr[210]));
			radix2 #(.width(width)) rd_st1_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[147]), .rdlo_in(a1_wr[211]),  .coef_in(coef[38]), .rdup_out(a2_wr[147]), .rdlo_out(a2_wr[211]));
			radix2 #(.width(width)) rd_st1_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[148]), .rdlo_in(a1_wr[212]),  .coef_in(coef[40]), .rdup_out(a2_wr[148]), .rdlo_out(a2_wr[212]));
			radix2 #(.width(width)) rd_st1_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[149]), .rdlo_in(a1_wr[213]),  .coef_in(coef[42]), .rdup_out(a2_wr[149]), .rdlo_out(a2_wr[213]));
			radix2 #(.width(width)) rd_st1_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[150]), .rdlo_in(a1_wr[214]),  .coef_in(coef[44]), .rdup_out(a2_wr[150]), .rdlo_out(a2_wr[214]));
			radix2 #(.width(width)) rd_st1_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[151]), .rdlo_in(a1_wr[215]),  .coef_in(coef[46]), .rdup_out(a2_wr[151]), .rdlo_out(a2_wr[215]));
			radix2 #(.width(width)) rd_st1_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[152]), .rdlo_in(a1_wr[216]),  .coef_in(coef[48]), .rdup_out(a2_wr[152]), .rdlo_out(a2_wr[216]));
			radix2 #(.width(width)) rd_st1_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[153]), .rdlo_in(a1_wr[217]),  .coef_in(coef[50]), .rdup_out(a2_wr[153]), .rdlo_out(a2_wr[217]));
			radix2 #(.width(width)) rd_st1_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[154]), .rdlo_in(a1_wr[218]),  .coef_in(coef[52]), .rdup_out(a2_wr[154]), .rdlo_out(a2_wr[218]));
			radix2 #(.width(width)) rd_st1_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[155]), .rdlo_in(a1_wr[219]),  .coef_in(coef[54]), .rdup_out(a2_wr[155]), .rdlo_out(a2_wr[219]));
			radix2 #(.width(width)) rd_st1_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[156]), .rdlo_in(a1_wr[220]),  .coef_in(coef[56]), .rdup_out(a2_wr[156]), .rdlo_out(a2_wr[220]));
			radix2 #(.width(width)) rd_st1_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[157]), .rdlo_in(a1_wr[221]),  .coef_in(coef[58]), .rdup_out(a2_wr[157]), .rdlo_out(a2_wr[221]));
			radix2 #(.width(width)) rd_st1_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[158]), .rdlo_in(a1_wr[222]),  .coef_in(coef[60]), .rdup_out(a2_wr[158]), .rdlo_out(a2_wr[222]));
			radix2 #(.width(width)) rd_st1_159  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[159]), .rdlo_in(a1_wr[223]),  .coef_in(coef[62]), .rdup_out(a2_wr[159]), .rdlo_out(a2_wr[223]));
			radix2 #(.width(width)) rd_st1_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[160]), .rdlo_in(a1_wr[224]),  .coef_in(coef[64]), .rdup_out(a2_wr[160]), .rdlo_out(a2_wr[224]));
			radix2 #(.width(width)) rd_st1_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[161]), .rdlo_in(a1_wr[225]),  .coef_in(coef[66]), .rdup_out(a2_wr[161]), .rdlo_out(a2_wr[225]));
			radix2 #(.width(width)) rd_st1_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[162]), .rdlo_in(a1_wr[226]),  .coef_in(coef[68]), .rdup_out(a2_wr[162]), .rdlo_out(a2_wr[226]));
			radix2 #(.width(width)) rd_st1_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[163]), .rdlo_in(a1_wr[227]),  .coef_in(coef[70]), .rdup_out(a2_wr[163]), .rdlo_out(a2_wr[227]));
			radix2 #(.width(width)) rd_st1_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[164]), .rdlo_in(a1_wr[228]),  .coef_in(coef[72]), .rdup_out(a2_wr[164]), .rdlo_out(a2_wr[228]));
			radix2 #(.width(width)) rd_st1_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[165]), .rdlo_in(a1_wr[229]),  .coef_in(coef[74]), .rdup_out(a2_wr[165]), .rdlo_out(a2_wr[229]));
			radix2 #(.width(width)) rd_st1_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[166]), .rdlo_in(a1_wr[230]),  .coef_in(coef[76]), .rdup_out(a2_wr[166]), .rdlo_out(a2_wr[230]));
			radix2 #(.width(width)) rd_st1_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[167]), .rdlo_in(a1_wr[231]),  .coef_in(coef[78]), .rdup_out(a2_wr[167]), .rdlo_out(a2_wr[231]));
			radix2 #(.width(width)) rd_st1_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[168]), .rdlo_in(a1_wr[232]),  .coef_in(coef[80]), .rdup_out(a2_wr[168]), .rdlo_out(a2_wr[232]));
			radix2 #(.width(width)) rd_st1_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[169]), .rdlo_in(a1_wr[233]),  .coef_in(coef[82]), .rdup_out(a2_wr[169]), .rdlo_out(a2_wr[233]));
			radix2 #(.width(width)) rd_st1_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[170]), .rdlo_in(a1_wr[234]),  .coef_in(coef[84]), .rdup_out(a2_wr[170]), .rdlo_out(a2_wr[234]));
			radix2 #(.width(width)) rd_st1_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[171]), .rdlo_in(a1_wr[235]),  .coef_in(coef[86]), .rdup_out(a2_wr[171]), .rdlo_out(a2_wr[235]));
			radix2 #(.width(width)) rd_st1_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[172]), .rdlo_in(a1_wr[236]),  .coef_in(coef[88]), .rdup_out(a2_wr[172]), .rdlo_out(a2_wr[236]));
			radix2 #(.width(width)) rd_st1_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[173]), .rdlo_in(a1_wr[237]),  .coef_in(coef[90]), .rdup_out(a2_wr[173]), .rdlo_out(a2_wr[237]));
			radix2 #(.width(width)) rd_st1_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[174]), .rdlo_in(a1_wr[238]),  .coef_in(coef[92]), .rdup_out(a2_wr[174]), .rdlo_out(a2_wr[238]));
			radix2 #(.width(width)) rd_st1_175  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[175]), .rdlo_in(a1_wr[239]),  .coef_in(coef[94]), .rdup_out(a2_wr[175]), .rdlo_out(a2_wr[239]));
			radix2 #(.width(width)) rd_st1_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[176]), .rdlo_in(a1_wr[240]),  .coef_in(coef[96]), .rdup_out(a2_wr[176]), .rdlo_out(a2_wr[240]));
			radix2 #(.width(width)) rd_st1_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[177]), .rdlo_in(a1_wr[241]),  .coef_in(coef[98]), .rdup_out(a2_wr[177]), .rdlo_out(a2_wr[241]));
			radix2 #(.width(width)) rd_st1_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[178]), .rdlo_in(a1_wr[242]),  .coef_in(coef[100]), .rdup_out(a2_wr[178]), .rdlo_out(a2_wr[242]));
			radix2 #(.width(width)) rd_st1_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[179]), .rdlo_in(a1_wr[243]),  .coef_in(coef[102]), .rdup_out(a2_wr[179]), .rdlo_out(a2_wr[243]));
			radix2 #(.width(width)) rd_st1_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[180]), .rdlo_in(a1_wr[244]),  .coef_in(coef[104]), .rdup_out(a2_wr[180]), .rdlo_out(a2_wr[244]));
			radix2 #(.width(width)) rd_st1_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[181]), .rdlo_in(a1_wr[245]),  .coef_in(coef[106]), .rdup_out(a2_wr[181]), .rdlo_out(a2_wr[245]));
			radix2 #(.width(width)) rd_st1_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[182]), .rdlo_in(a1_wr[246]),  .coef_in(coef[108]), .rdup_out(a2_wr[182]), .rdlo_out(a2_wr[246]));
			radix2 #(.width(width)) rd_st1_183  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[183]), .rdlo_in(a1_wr[247]),  .coef_in(coef[110]), .rdup_out(a2_wr[183]), .rdlo_out(a2_wr[247]));
			radix2 #(.width(width)) rd_st1_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[184]), .rdlo_in(a1_wr[248]),  .coef_in(coef[112]), .rdup_out(a2_wr[184]), .rdlo_out(a2_wr[248]));
			radix2 #(.width(width)) rd_st1_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[185]), .rdlo_in(a1_wr[249]),  .coef_in(coef[114]), .rdup_out(a2_wr[185]), .rdlo_out(a2_wr[249]));
			radix2 #(.width(width)) rd_st1_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[186]), .rdlo_in(a1_wr[250]),  .coef_in(coef[116]), .rdup_out(a2_wr[186]), .rdlo_out(a2_wr[250]));
			radix2 #(.width(width)) rd_st1_187  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[187]), .rdlo_in(a1_wr[251]),  .coef_in(coef[118]), .rdup_out(a2_wr[187]), .rdlo_out(a2_wr[251]));
			radix2 #(.width(width)) rd_st1_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[188]), .rdlo_in(a1_wr[252]),  .coef_in(coef[120]), .rdup_out(a2_wr[188]), .rdlo_out(a2_wr[252]));
			radix2 #(.width(width)) rd_st1_189  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[189]), .rdlo_in(a1_wr[253]),  .coef_in(coef[122]), .rdup_out(a2_wr[189]), .rdlo_out(a2_wr[253]));
			radix2 #(.width(width)) rd_st1_190  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[190]), .rdlo_in(a1_wr[254]),  .coef_in(coef[124]), .rdup_out(a2_wr[190]), .rdlo_out(a2_wr[254]));
			radix2 #(.width(width)) rd_st1_191  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[191]), .rdlo_in(a1_wr[255]),  .coef_in(coef[126]), .rdup_out(a2_wr[191]), .rdlo_out(a2_wr[255]));

		//--- radix stage 2
			radix2 #(.width(width)) rd_st2_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[0]), .rdlo_in(a2_wr[32]),  .coef_in(coef[0]), .rdup_out(a3_wr[0]), .rdlo_out(a3_wr[32]));
			radix2 #(.width(width)) rd_st2_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[1]), .rdlo_in(a2_wr[33]),  .coef_in(coef[4]), .rdup_out(a3_wr[1]), .rdlo_out(a3_wr[33]));
			radix2 #(.width(width)) rd_st2_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[2]), .rdlo_in(a2_wr[34]),  .coef_in(coef[8]), .rdup_out(a3_wr[2]), .rdlo_out(a3_wr[34]));
			radix2 #(.width(width)) rd_st2_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[3]), .rdlo_in(a2_wr[35]),  .coef_in(coef[12]), .rdup_out(a3_wr[3]), .rdlo_out(a3_wr[35]));
			radix2 #(.width(width)) rd_st2_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[4]), .rdlo_in(a2_wr[36]),  .coef_in(coef[16]), .rdup_out(a3_wr[4]), .rdlo_out(a3_wr[36]));
			radix2 #(.width(width)) rd_st2_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[5]), .rdlo_in(a2_wr[37]),  .coef_in(coef[20]), .rdup_out(a3_wr[5]), .rdlo_out(a3_wr[37]));
			radix2 #(.width(width)) rd_st2_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[6]), .rdlo_in(a2_wr[38]),  .coef_in(coef[24]), .rdup_out(a3_wr[6]), .rdlo_out(a3_wr[38]));
			radix2 #(.width(width)) rd_st2_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[7]), .rdlo_in(a2_wr[39]),  .coef_in(coef[28]), .rdup_out(a3_wr[7]), .rdlo_out(a3_wr[39]));
			radix2 #(.width(width)) rd_st2_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[8]), .rdlo_in(a2_wr[40]),  .coef_in(coef[32]), .rdup_out(a3_wr[8]), .rdlo_out(a3_wr[40]));
			radix2 #(.width(width)) rd_st2_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[9]), .rdlo_in(a2_wr[41]),  .coef_in(coef[36]), .rdup_out(a3_wr[9]), .rdlo_out(a3_wr[41]));
			radix2 #(.width(width)) rd_st2_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[10]), .rdlo_in(a2_wr[42]),  .coef_in(coef[40]), .rdup_out(a3_wr[10]), .rdlo_out(a3_wr[42]));
			radix2 #(.width(width)) rd_st2_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[11]), .rdlo_in(a2_wr[43]),  .coef_in(coef[44]), .rdup_out(a3_wr[11]), .rdlo_out(a3_wr[43]));
			radix2 #(.width(width)) rd_st2_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[12]), .rdlo_in(a2_wr[44]),  .coef_in(coef[48]), .rdup_out(a3_wr[12]), .rdlo_out(a3_wr[44]));
			radix2 #(.width(width)) rd_st2_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[13]), .rdlo_in(a2_wr[45]),  .coef_in(coef[52]), .rdup_out(a3_wr[13]), .rdlo_out(a3_wr[45]));
			radix2 #(.width(width)) rd_st2_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[14]), .rdlo_in(a2_wr[46]),  .coef_in(coef[56]), .rdup_out(a3_wr[14]), .rdlo_out(a3_wr[46]));
			radix2 #(.width(width)) rd_st2_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[15]), .rdlo_in(a2_wr[47]),  .coef_in(coef[60]), .rdup_out(a3_wr[15]), .rdlo_out(a3_wr[47]));
			radix2 #(.width(width)) rd_st2_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[16]), .rdlo_in(a2_wr[48]),  .coef_in(coef[64]), .rdup_out(a3_wr[16]), .rdlo_out(a3_wr[48]));
			radix2 #(.width(width)) rd_st2_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[17]), .rdlo_in(a2_wr[49]),  .coef_in(coef[68]), .rdup_out(a3_wr[17]), .rdlo_out(a3_wr[49]));
			radix2 #(.width(width)) rd_st2_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[18]), .rdlo_in(a2_wr[50]),  .coef_in(coef[72]), .rdup_out(a3_wr[18]), .rdlo_out(a3_wr[50]));
			radix2 #(.width(width)) rd_st2_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[19]), .rdlo_in(a2_wr[51]),  .coef_in(coef[76]), .rdup_out(a3_wr[19]), .rdlo_out(a3_wr[51]));
			radix2 #(.width(width)) rd_st2_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[20]), .rdlo_in(a2_wr[52]),  .coef_in(coef[80]), .rdup_out(a3_wr[20]), .rdlo_out(a3_wr[52]));
			radix2 #(.width(width)) rd_st2_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[21]), .rdlo_in(a2_wr[53]),  .coef_in(coef[84]), .rdup_out(a3_wr[21]), .rdlo_out(a3_wr[53]));
			radix2 #(.width(width)) rd_st2_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[22]), .rdlo_in(a2_wr[54]),  .coef_in(coef[88]), .rdup_out(a3_wr[22]), .rdlo_out(a3_wr[54]));
			radix2 #(.width(width)) rd_st2_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[23]), .rdlo_in(a2_wr[55]),  .coef_in(coef[92]), .rdup_out(a3_wr[23]), .rdlo_out(a3_wr[55]));
			radix2 #(.width(width)) rd_st2_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[24]), .rdlo_in(a2_wr[56]),  .coef_in(coef[96]), .rdup_out(a3_wr[24]), .rdlo_out(a3_wr[56]));
			radix2 #(.width(width)) rd_st2_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[25]), .rdlo_in(a2_wr[57]),  .coef_in(coef[100]), .rdup_out(a3_wr[25]), .rdlo_out(a3_wr[57]));
			radix2 #(.width(width)) rd_st2_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[26]), .rdlo_in(a2_wr[58]),  .coef_in(coef[104]), .rdup_out(a3_wr[26]), .rdlo_out(a3_wr[58]));
			radix2 #(.width(width)) rd_st2_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[27]), .rdlo_in(a2_wr[59]),  .coef_in(coef[108]), .rdup_out(a3_wr[27]), .rdlo_out(a3_wr[59]));
			radix2 #(.width(width)) rd_st2_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[28]), .rdlo_in(a2_wr[60]),  .coef_in(coef[112]), .rdup_out(a3_wr[28]), .rdlo_out(a3_wr[60]));
			radix2 #(.width(width)) rd_st2_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[29]), .rdlo_in(a2_wr[61]),  .coef_in(coef[116]), .rdup_out(a3_wr[29]), .rdlo_out(a3_wr[61]));
			radix2 #(.width(width)) rd_st2_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[30]), .rdlo_in(a2_wr[62]),  .coef_in(coef[120]), .rdup_out(a3_wr[30]), .rdlo_out(a3_wr[62]));
			radix2 #(.width(width)) rd_st2_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[31]), .rdlo_in(a2_wr[63]),  .coef_in(coef[124]), .rdup_out(a3_wr[31]), .rdlo_out(a3_wr[63]));
			radix2 #(.width(width)) rd_st2_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[64]), .rdlo_in(a2_wr[96]),  .coef_in(coef[0]), .rdup_out(a3_wr[64]), .rdlo_out(a3_wr[96]));
			radix2 #(.width(width)) rd_st2_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[65]), .rdlo_in(a2_wr[97]),  .coef_in(coef[4]), .rdup_out(a3_wr[65]), .rdlo_out(a3_wr[97]));
			radix2 #(.width(width)) rd_st2_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[66]), .rdlo_in(a2_wr[98]),  .coef_in(coef[8]), .rdup_out(a3_wr[66]), .rdlo_out(a3_wr[98]));
			radix2 #(.width(width)) rd_st2_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[67]), .rdlo_in(a2_wr[99]),  .coef_in(coef[12]), .rdup_out(a3_wr[67]), .rdlo_out(a3_wr[99]));
			radix2 #(.width(width)) rd_st2_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[68]), .rdlo_in(a2_wr[100]),  .coef_in(coef[16]), .rdup_out(a3_wr[68]), .rdlo_out(a3_wr[100]));
			radix2 #(.width(width)) rd_st2_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[69]), .rdlo_in(a2_wr[101]),  .coef_in(coef[20]), .rdup_out(a3_wr[69]), .rdlo_out(a3_wr[101]));
			radix2 #(.width(width)) rd_st2_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[70]), .rdlo_in(a2_wr[102]),  .coef_in(coef[24]), .rdup_out(a3_wr[70]), .rdlo_out(a3_wr[102]));
			radix2 #(.width(width)) rd_st2_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[71]), .rdlo_in(a2_wr[103]),  .coef_in(coef[28]), .rdup_out(a3_wr[71]), .rdlo_out(a3_wr[103]));
			radix2 #(.width(width)) rd_st2_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[72]), .rdlo_in(a2_wr[104]),  .coef_in(coef[32]), .rdup_out(a3_wr[72]), .rdlo_out(a3_wr[104]));
			radix2 #(.width(width)) rd_st2_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[73]), .rdlo_in(a2_wr[105]),  .coef_in(coef[36]), .rdup_out(a3_wr[73]), .rdlo_out(a3_wr[105]));
			radix2 #(.width(width)) rd_st2_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[74]), .rdlo_in(a2_wr[106]),  .coef_in(coef[40]), .rdup_out(a3_wr[74]), .rdlo_out(a3_wr[106]));
			radix2 #(.width(width)) rd_st2_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[75]), .rdlo_in(a2_wr[107]),  .coef_in(coef[44]), .rdup_out(a3_wr[75]), .rdlo_out(a3_wr[107]));
			radix2 #(.width(width)) rd_st2_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[76]), .rdlo_in(a2_wr[108]),  .coef_in(coef[48]), .rdup_out(a3_wr[76]), .rdlo_out(a3_wr[108]));
			radix2 #(.width(width)) rd_st2_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[77]), .rdlo_in(a2_wr[109]),  .coef_in(coef[52]), .rdup_out(a3_wr[77]), .rdlo_out(a3_wr[109]));
			radix2 #(.width(width)) rd_st2_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[78]), .rdlo_in(a2_wr[110]),  .coef_in(coef[56]), .rdup_out(a3_wr[78]), .rdlo_out(a3_wr[110]));
			radix2 #(.width(width)) rd_st2_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[79]), .rdlo_in(a2_wr[111]),  .coef_in(coef[60]), .rdup_out(a3_wr[79]), .rdlo_out(a3_wr[111]));
			radix2 #(.width(width)) rd_st2_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[80]), .rdlo_in(a2_wr[112]),  .coef_in(coef[64]), .rdup_out(a3_wr[80]), .rdlo_out(a3_wr[112]));
			radix2 #(.width(width)) rd_st2_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[81]), .rdlo_in(a2_wr[113]),  .coef_in(coef[68]), .rdup_out(a3_wr[81]), .rdlo_out(a3_wr[113]));
			radix2 #(.width(width)) rd_st2_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[82]), .rdlo_in(a2_wr[114]),  .coef_in(coef[72]), .rdup_out(a3_wr[82]), .rdlo_out(a3_wr[114]));
			radix2 #(.width(width)) rd_st2_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[83]), .rdlo_in(a2_wr[115]),  .coef_in(coef[76]), .rdup_out(a3_wr[83]), .rdlo_out(a3_wr[115]));
			radix2 #(.width(width)) rd_st2_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[84]), .rdlo_in(a2_wr[116]),  .coef_in(coef[80]), .rdup_out(a3_wr[84]), .rdlo_out(a3_wr[116]));
			radix2 #(.width(width)) rd_st2_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[85]), .rdlo_in(a2_wr[117]),  .coef_in(coef[84]), .rdup_out(a3_wr[85]), .rdlo_out(a3_wr[117]));
			radix2 #(.width(width)) rd_st2_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[86]), .rdlo_in(a2_wr[118]),  .coef_in(coef[88]), .rdup_out(a3_wr[86]), .rdlo_out(a3_wr[118]));
			radix2 #(.width(width)) rd_st2_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[87]), .rdlo_in(a2_wr[119]),  .coef_in(coef[92]), .rdup_out(a3_wr[87]), .rdlo_out(a3_wr[119]));
			radix2 #(.width(width)) rd_st2_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[88]), .rdlo_in(a2_wr[120]),  .coef_in(coef[96]), .rdup_out(a3_wr[88]), .rdlo_out(a3_wr[120]));
			radix2 #(.width(width)) rd_st2_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[89]), .rdlo_in(a2_wr[121]),  .coef_in(coef[100]), .rdup_out(a3_wr[89]), .rdlo_out(a3_wr[121]));
			radix2 #(.width(width)) rd_st2_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[90]), .rdlo_in(a2_wr[122]),  .coef_in(coef[104]), .rdup_out(a3_wr[90]), .rdlo_out(a3_wr[122]));
			radix2 #(.width(width)) rd_st2_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[91]), .rdlo_in(a2_wr[123]),  .coef_in(coef[108]), .rdup_out(a3_wr[91]), .rdlo_out(a3_wr[123]));
			radix2 #(.width(width)) rd_st2_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[92]), .rdlo_in(a2_wr[124]),  .coef_in(coef[112]), .rdup_out(a3_wr[92]), .rdlo_out(a3_wr[124]));
			radix2 #(.width(width)) rd_st2_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[93]), .rdlo_in(a2_wr[125]),  .coef_in(coef[116]), .rdup_out(a3_wr[93]), .rdlo_out(a3_wr[125]));
			radix2 #(.width(width)) rd_st2_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[94]), .rdlo_in(a2_wr[126]),  .coef_in(coef[120]), .rdup_out(a3_wr[94]), .rdlo_out(a3_wr[126]));
			radix2 #(.width(width)) rd_st2_95  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[95]), .rdlo_in(a2_wr[127]),  .coef_in(coef[124]), .rdup_out(a3_wr[95]), .rdlo_out(a3_wr[127]));
			radix2 #(.width(width)) rd_st2_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[128]), .rdlo_in(a2_wr[160]),  .coef_in(coef[0]), .rdup_out(a3_wr[128]), .rdlo_out(a3_wr[160]));
			radix2 #(.width(width)) rd_st2_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[129]), .rdlo_in(a2_wr[161]),  .coef_in(coef[4]), .rdup_out(a3_wr[129]), .rdlo_out(a3_wr[161]));
			radix2 #(.width(width)) rd_st2_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[130]), .rdlo_in(a2_wr[162]),  .coef_in(coef[8]), .rdup_out(a3_wr[130]), .rdlo_out(a3_wr[162]));
			radix2 #(.width(width)) rd_st2_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[131]), .rdlo_in(a2_wr[163]),  .coef_in(coef[12]), .rdup_out(a3_wr[131]), .rdlo_out(a3_wr[163]));
			radix2 #(.width(width)) rd_st2_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[132]), .rdlo_in(a2_wr[164]),  .coef_in(coef[16]), .rdup_out(a3_wr[132]), .rdlo_out(a3_wr[164]));
			radix2 #(.width(width)) rd_st2_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[133]), .rdlo_in(a2_wr[165]),  .coef_in(coef[20]), .rdup_out(a3_wr[133]), .rdlo_out(a3_wr[165]));
			radix2 #(.width(width)) rd_st2_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[134]), .rdlo_in(a2_wr[166]),  .coef_in(coef[24]), .rdup_out(a3_wr[134]), .rdlo_out(a3_wr[166]));
			radix2 #(.width(width)) rd_st2_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[135]), .rdlo_in(a2_wr[167]),  .coef_in(coef[28]), .rdup_out(a3_wr[135]), .rdlo_out(a3_wr[167]));
			radix2 #(.width(width)) rd_st2_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[136]), .rdlo_in(a2_wr[168]),  .coef_in(coef[32]), .rdup_out(a3_wr[136]), .rdlo_out(a3_wr[168]));
			radix2 #(.width(width)) rd_st2_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[137]), .rdlo_in(a2_wr[169]),  .coef_in(coef[36]), .rdup_out(a3_wr[137]), .rdlo_out(a3_wr[169]));
			radix2 #(.width(width)) rd_st2_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[138]), .rdlo_in(a2_wr[170]),  .coef_in(coef[40]), .rdup_out(a3_wr[138]), .rdlo_out(a3_wr[170]));
			radix2 #(.width(width)) rd_st2_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[139]), .rdlo_in(a2_wr[171]),  .coef_in(coef[44]), .rdup_out(a3_wr[139]), .rdlo_out(a3_wr[171]));
			radix2 #(.width(width)) rd_st2_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[140]), .rdlo_in(a2_wr[172]),  .coef_in(coef[48]), .rdup_out(a3_wr[140]), .rdlo_out(a3_wr[172]));
			radix2 #(.width(width)) rd_st2_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[141]), .rdlo_in(a2_wr[173]),  .coef_in(coef[52]), .rdup_out(a3_wr[141]), .rdlo_out(a3_wr[173]));
			radix2 #(.width(width)) rd_st2_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[142]), .rdlo_in(a2_wr[174]),  .coef_in(coef[56]), .rdup_out(a3_wr[142]), .rdlo_out(a3_wr[174]));
			radix2 #(.width(width)) rd_st2_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[143]), .rdlo_in(a2_wr[175]),  .coef_in(coef[60]), .rdup_out(a3_wr[143]), .rdlo_out(a3_wr[175]));
			radix2 #(.width(width)) rd_st2_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[144]), .rdlo_in(a2_wr[176]),  .coef_in(coef[64]), .rdup_out(a3_wr[144]), .rdlo_out(a3_wr[176]));
			radix2 #(.width(width)) rd_st2_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[145]), .rdlo_in(a2_wr[177]),  .coef_in(coef[68]), .rdup_out(a3_wr[145]), .rdlo_out(a3_wr[177]));
			radix2 #(.width(width)) rd_st2_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[146]), .rdlo_in(a2_wr[178]),  .coef_in(coef[72]), .rdup_out(a3_wr[146]), .rdlo_out(a3_wr[178]));
			radix2 #(.width(width)) rd_st2_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[147]), .rdlo_in(a2_wr[179]),  .coef_in(coef[76]), .rdup_out(a3_wr[147]), .rdlo_out(a3_wr[179]));
			radix2 #(.width(width)) rd_st2_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[148]), .rdlo_in(a2_wr[180]),  .coef_in(coef[80]), .rdup_out(a3_wr[148]), .rdlo_out(a3_wr[180]));
			radix2 #(.width(width)) rd_st2_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[149]), .rdlo_in(a2_wr[181]),  .coef_in(coef[84]), .rdup_out(a3_wr[149]), .rdlo_out(a3_wr[181]));
			radix2 #(.width(width)) rd_st2_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[150]), .rdlo_in(a2_wr[182]),  .coef_in(coef[88]), .rdup_out(a3_wr[150]), .rdlo_out(a3_wr[182]));
			radix2 #(.width(width)) rd_st2_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[151]), .rdlo_in(a2_wr[183]),  .coef_in(coef[92]), .rdup_out(a3_wr[151]), .rdlo_out(a3_wr[183]));
			radix2 #(.width(width)) rd_st2_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[152]), .rdlo_in(a2_wr[184]),  .coef_in(coef[96]), .rdup_out(a3_wr[152]), .rdlo_out(a3_wr[184]));
			radix2 #(.width(width)) rd_st2_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[153]), .rdlo_in(a2_wr[185]),  .coef_in(coef[100]), .rdup_out(a3_wr[153]), .rdlo_out(a3_wr[185]));
			radix2 #(.width(width)) rd_st2_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[154]), .rdlo_in(a2_wr[186]),  .coef_in(coef[104]), .rdup_out(a3_wr[154]), .rdlo_out(a3_wr[186]));
			radix2 #(.width(width)) rd_st2_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[155]), .rdlo_in(a2_wr[187]),  .coef_in(coef[108]), .rdup_out(a3_wr[155]), .rdlo_out(a3_wr[187]));
			radix2 #(.width(width)) rd_st2_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[156]), .rdlo_in(a2_wr[188]),  .coef_in(coef[112]), .rdup_out(a3_wr[156]), .rdlo_out(a3_wr[188]));
			radix2 #(.width(width)) rd_st2_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[157]), .rdlo_in(a2_wr[189]),  .coef_in(coef[116]), .rdup_out(a3_wr[157]), .rdlo_out(a3_wr[189]));
			radix2 #(.width(width)) rd_st2_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[158]), .rdlo_in(a2_wr[190]),  .coef_in(coef[120]), .rdup_out(a3_wr[158]), .rdlo_out(a3_wr[190]));
			radix2 #(.width(width)) rd_st2_159  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[159]), .rdlo_in(a2_wr[191]),  .coef_in(coef[124]), .rdup_out(a3_wr[159]), .rdlo_out(a3_wr[191]));
			radix2 #(.width(width)) rd_st2_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[192]), .rdlo_in(a2_wr[224]),  .coef_in(coef[0]), .rdup_out(a3_wr[192]), .rdlo_out(a3_wr[224]));
			radix2 #(.width(width)) rd_st2_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[193]), .rdlo_in(a2_wr[225]),  .coef_in(coef[4]), .rdup_out(a3_wr[193]), .rdlo_out(a3_wr[225]));
			radix2 #(.width(width)) rd_st2_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[194]), .rdlo_in(a2_wr[226]),  .coef_in(coef[8]), .rdup_out(a3_wr[194]), .rdlo_out(a3_wr[226]));
			radix2 #(.width(width)) rd_st2_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[195]), .rdlo_in(a2_wr[227]),  .coef_in(coef[12]), .rdup_out(a3_wr[195]), .rdlo_out(a3_wr[227]));
			radix2 #(.width(width)) rd_st2_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[196]), .rdlo_in(a2_wr[228]),  .coef_in(coef[16]), .rdup_out(a3_wr[196]), .rdlo_out(a3_wr[228]));
			radix2 #(.width(width)) rd_st2_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[197]), .rdlo_in(a2_wr[229]),  .coef_in(coef[20]), .rdup_out(a3_wr[197]), .rdlo_out(a3_wr[229]));
			radix2 #(.width(width)) rd_st2_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[198]), .rdlo_in(a2_wr[230]),  .coef_in(coef[24]), .rdup_out(a3_wr[198]), .rdlo_out(a3_wr[230]));
			radix2 #(.width(width)) rd_st2_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[199]), .rdlo_in(a2_wr[231]),  .coef_in(coef[28]), .rdup_out(a3_wr[199]), .rdlo_out(a3_wr[231]));
			radix2 #(.width(width)) rd_st2_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[200]), .rdlo_in(a2_wr[232]),  .coef_in(coef[32]), .rdup_out(a3_wr[200]), .rdlo_out(a3_wr[232]));
			radix2 #(.width(width)) rd_st2_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[201]), .rdlo_in(a2_wr[233]),  .coef_in(coef[36]), .rdup_out(a3_wr[201]), .rdlo_out(a3_wr[233]));
			radix2 #(.width(width)) rd_st2_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[202]), .rdlo_in(a2_wr[234]),  .coef_in(coef[40]), .rdup_out(a3_wr[202]), .rdlo_out(a3_wr[234]));
			radix2 #(.width(width)) rd_st2_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[203]), .rdlo_in(a2_wr[235]),  .coef_in(coef[44]), .rdup_out(a3_wr[203]), .rdlo_out(a3_wr[235]));
			radix2 #(.width(width)) rd_st2_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[204]), .rdlo_in(a2_wr[236]),  .coef_in(coef[48]), .rdup_out(a3_wr[204]), .rdlo_out(a3_wr[236]));
			radix2 #(.width(width)) rd_st2_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[205]), .rdlo_in(a2_wr[237]),  .coef_in(coef[52]), .rdup_out(a3_wr[205]), .rdlo_out(a3_wr[237]));
			radix2 #(.width(width)) rd_st2_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[206]), .rdlo_in(a2_wr[238]),  .coef_in(coef[56]), .rdup_out(a3_wr[206]), .rdlo_out(a3_wr[238]));
			radix2 #(.width(width)) rd_st2_207  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[207]), .rdlo_in(a2_wr[239]),  .coef_in(coef[60]), .rdup_out(a3_wr[207]), .rdlo_out(a3_wr[239]));
			radix2 #(.width(width)) rd_st2_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[208]), .rdlo_in(a2_wr[240]),  .coef_in(coef[64]), .rdup_out(a3_wr[208]), .rdlo_out(a3_wr[240]));
			radix2 #(.width(width)) rd_st2_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[209]), .rdlo_in(a2_wr[241]),  .coef_in(coef[68]), .rdup_out(a3_wr[209]), .rdlo_out(a3_wr[241]));
			radix2 #(.width(width)) rd_st2_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[210]), .rdlo_in(a2_wr[242]),  .coef_in(coef[72]), .rdup_out(a3_wr[210]), .rdlo_out(a3_wr[242]));
			radix2 #(.width(width)) rd_st2_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[211]), .rdlo_in(a2_wr[243]),  .coef_in(coef[76]), .rdup_out(a3_wr[211]), .rdlo_out(a3_wr[243]));
			radix2 #(.width(width)) rd_st2_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[212]), .rdlo_in(a2_wr[244]),  .coef_in(coef[80]), .rdup_out(a3_wr[212]), .rdlo_out(a3_wr[244]));
			radix2 #(.width(width)) rd_st2_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[213]), .rdlo_in(a2_wr[245]),  .coef_in(coef[84]), .rdup_out(a3_wr[213]), .rdlo_out(a3_wr[245]));
			radix2 #(.width(width)) rd_st2_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[214]), .rdlo_in(a2_wr[246]),  .coef_in(coef[88]), .rdup_out(a3_wr[214]), .rdlo_out(a3_wr[246]));
			radix2 #(.width(width)) rd_st2_215  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[215]), .rdlo_in(a2_wr[247]),  .coef_in(coef[92]), .rdup_out(a3_wr[215]), .rdlo_out(a3_wr[247]));
			radix2 #(.width(width)) rd_st2_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[216]), .rdlo_in(a2_wr[248]),  .coef_in(coef[96]), .rdup_out(a3_wr[216]), .rdlo_out(a3_wr[248]));
			radix2 #(.width(width)) rd_st2_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[217]), .rdlo_in(a2_wr[249]),  .coef_in(coef[100]), .rdup_out(a3_wr[217]), .rdlo_out(a3_wr[249]));
			radix2 #(.width(width)) rd_st2_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[218]), .rdlo_in(a2_wr[250]),  .coef_in(coef[104]), .rdup_out(a3_wr[218]), .rdlo_out(a3_wr[250]));
			radix2 #(.width(width)) rd_st2_219  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[219]), .rdlo_in(a2_wr[251]),  .coef_in(coef[108]), .rdup_out(a3_wr[219]), .rdlo_out(a3_wr[251]));
			radix2 #(.width(width)) rd_st2_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[220]), .rdlo_in(a2_wr[252]),  .coef_in(coef[112]), .rdup_out(a3_wr[220]), .rdlo_out(a3_wr[252]));
			radix2 #(.width(width)) rd_st2_221  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[221]), .rdlo_in(a2_wr[253]),  .coef_in(coef[116]), .rdup_out(a3_wr[221]), .rdlo_out(a3_wr[253]));
			radix2 #(.width(width)) rd_st2_222  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[222]), .rdlo_in(a2_wr[254]),  .coef_in(coef[120]), .rdup_out(a3_wr[222]), .rdlo_out(a3_wr[254]));
			radix2 #(.width(width)) rd_st2_223  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[223]), .rdlo_in(a2_wr[255]),  .coef_in(coef[124]), .rdup_out(a3_wr[223]), .rdlo_out(a3_wr[255]));

		//--- radix stage 3
			radix2 #(.width(width)) rd_st3_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[0]), .rdlo_in(a3_wr[16]),  .coef_in(coef[0]), .rdup_out(a4_wr[0]), .rdlo_out(a4_wr[16]));
			radix2 #(.width(width)) rd_st3_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[1]), .rdlo_in(a3_wr[17]),  .coef_in(coef[8]), .rdup_out(a4_wr[1]), .rdlo_out(a4_wr[17]));
			radix2 #(.width(width)) rd_st3_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[2]), .rdlo_in(a3_wr[18]),  .coef_in(coef[16]), .rdup_out(a4_wr[2]), .rdlo_out(a4_wr[18]));
			radix2 #(.width(width)) rd_st3_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[3]), .rdlo_in(a3_wr[19]),  .coef_in(coef[24]), .rdup_out(a4_wr[3]), .rdlo_out(a4_wr[19]));
			radix2 #(.width(width)) rd_st3_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[4]), .rdlo_in(a3_wr[20]),  .coef_in(coef[32]), .rdup_out(a4_wr[4]), .rdlo_out(a4_wr[20]));
			radix2 #(.width(width)) rd_st3_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[5]), .rdlo_in(a3_wr[21]),  .coef_in(coef[40]), .rdup_out(a4_wr[5]), .rdlo_out(a4_wr[21]));
			radix2 #(.width(width)) rd_st3_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[6]), .rdlo_in(a3_wr[22]),  .coef_in(coef[48]), .rdup_out(a4_wr[6]), .rdlo_out(a4_wr[22]));
			radix2 #(.width(width)) rd_st3_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[7]), .rdlo_in(a3_wr[23]),  .coef_in(coef[56]), .rdup_out(a4_wr[7]), .rdlo_out(a4_wr[23]));
			radix2 #(.width(width)) rd_st3_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[8]), .rdlo_in(a3_wr[24]),  .coef_in(coef[64]), .rdup_out(a4_wr[8]), .rdlo_out(a4_wr[24]));
			radix2 #(.width(width)) rd_st3_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[9]), .rdlo_in(a3_wr[25]),  .coef_in(coef[72]), .rdup_out(a4_wr[9]), .rdlo_out(a4_wr[25]));
			radix2 #(.width(width)) rd_st3_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[10]), .rdlo_in(a3_wr[26]),  .coef_in(coef[80]), .rdup_out(a4_wr[10]), .rdlo_out(a4_wr[26]));
			radix2 #(.width(width)) rd_st3_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[11]), .rdlo_in(a3_wr[27]),  .coef_in(coef[88]), .rdup_out(a4_wr[11]), .rdlo_out(a4_wr[27]));
			radix2 #(.width(width)) rd_st3_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[12]), .rdlo_in(a3_wr[28]),  .coef_in(coef[96]), .rdup_out(a4_wr[12]), .rdlo_out(a4_wr[28]));
			radix2 #(.width(width)) rd_st3_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[13]), .rdlo_in(a3_wr[29]),  .coef_in(coef[104]), .rdup_out(a4_wr[13]), .rdlo_out(a4_wr[29]));
			radix2 #(.width(width)) rd_st3_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[14]), .rdlo_in(a3_wr[30]),  .coef_in(coef[112]), .rdup_out(a4_wr[14]), .rdlo_out(a4_wr[30]));
			radix2 #(.width(width)) rd_st3_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[15]), .rdlo_in(a3_wr[31]),  .coef_in(coef[120]), .rdup_out(a4_wr[15]), .rdlo_out(a4_wr[31]));
			radix2 #(.width(width)) rd_st3_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[32]), .rdlo_in(a3_wr[48]),  .coef_in(coef[0]), .rdup_out(a4_wr[32]), .rdlo_out(a4_wr[48]));
			radix2 #(.width(width)) rd_st3_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[33]), .rdlo_in(a3_wr[49]),  .coef_in(coef[8]), .rdup_out(a4_wr[33]), .rdlo_out(a4_wr[49]));
			radix2 #(.width(width)) rd_st3_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[34]), .rdlo_in(a3_wr[50]),  .coef_in(coef[16]), .rdup_out(a4_wr[34]), .rdlo_out(a4_wr[50]));
			radix2 #(.width(width)) rd_st3_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[35]), .rdlo_in(a3_wr[51]),  .coef_in(coef[24]), .rdup_out(a4_wr[35]), .rdlo_out(a4_wr[51]));
			radix2 #(.width(width)) rd_st3_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[36]), .rdlo_in(a3_wr[52]),  .coef_in(coef[32]), .rdup_out(a4_wr[36]), .rdlo_out(a4_wr[52]));
			radix2 #(.width(width)) rd_st3_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[37]), .rdlo_in(a3_wr[53]),  .coef_in(coef[40]), .rdup_out(a4_wr[37]), .rdlo_out(a4_wr[53]));
			radix2 #(.width(width)) rd_st3_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[38]), .rdlo_in(a3_wr[54]),  .coef_in(coef[48]), .rdup_out(a4_wr[38]), .rdlo_out(a4_wr[54]));
			radix2 #(.width(width)) rd_st3_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[39]), .rdlo_in(a3_wr[55]),  .coef_in(coef[56]), .rdup_out(a4_wr[39]), .rdlo_out(a4_wr[55]));
			radix2 #(.width(width)) rd_st3_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[40]), .rdlo_in(a3_wr[56]),  .coef_in(coef[64]), .rdup_out(a4_wr[40]), .rdlo_out(a4_wr[56]));
			radix2 #(.width(width)) rd_st3_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[41]), .rdlo_in(a3_wr[57]),  .coef_in(coef[72]), .rdup_out(a4_wr[41]), .rdlo_out(a4_wr[57]));
			radix2 #(.width(width)) rd_st3_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[42]), .rdlo_in(a3_wr[58]),  .coef_in(coef[80]), .rdup_out(a4_wr[42]), .rdlo_out(a4_wr[58]));
			radix2 #(.width(width)) rd_st3_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[43]), .rdlo_in(a3_wr[59]),  .coef_in(coef[88]), .rdup_out(a4_wr[43]), .rdlo_out(a4_wr[59]));
			radix2 #(.width(width)) rd_st3_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[44]), .rdlo_in(a3_wr[60]),  .coef_in(coef[96]), .rdup_out(a4_wr[44]), .rdlo_out(a4_wr[60]));
			radix2 #(.width(width)) rd_st3_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[45]), .rdlo_in(a3_wr[61]),  .coef_in(coef[104]), .rdup_out(a4_wr[45]), .rdlo_out(a4_wr[61]));
			radix2 #(.width(width)) rd_st3_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[46]), .rdlo_in(a3_wr[62]),  .coef_in(coef[112]), .rdup_out(a4_wr[46]), .rdlo_out(a4_wr[62]));
			radix2 #(.width(width)) rd_st3_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[47]), .rdlo_in(a3_wr[63]),  .coef_in(coef[120]), .rdup_out(a4_wr[47]), .rdlo_out(a4_wr[63]));
			radix2 #(.width(width)) rd_st3_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[64]), .rdlo_in(a3_wr[80]),  .coef_in(coef[0]), .rdup_out(a4_wr[64]), .rdlo_out(a4_wr[80]));
			radix2 #(.width(width)) rd_st3_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[65]), .rdlo_in(a3_wr[81]),  .coef_in(coef[8]), .rdup_out(a4_wr[65]), .rdlo_out(a4_wr[81]));
			radix2 #(.width(width)) rd_st3_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[66]), .rdlo_in(a3_wr[82]),  .coef_in(coef[16]), .rdup_out(a4_wr[66]), .rdlo_out(a4_wr[82]));
			radix2 #(.width(width)) rd_st3_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[67]), .rdlo_in(a3_wr[83]),  .coef_in(coef[24]), .rdup_out(a4_wr[67]), .rdlo_out(a4_wr[83]));
			radix2 #(.width(width)) rd_st3_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[68]), .rdlo_in(a3_wr[84]),  .coef_in(coef[32]), .rdup_out(a4_wr[68]), .rdlo_out(a4_wr[84]));
			radix2 #(.width(width)) rd_st3_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[69]), .rdlo_in(a3_wr[85]),  .coef_in(coef[40]), .rdup_out(a4_wr[69]), .rdlo_out(a4_wr[85]));
			radix2 #(.width(width)) rd_st3_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[70]), .rdlo_in(a3_wr[86]),  .coef_in(coef[48]), .rdup_out(a4_wr[70]), .rdlo_out(a4_wr[86]));
			radix2 #(.width(width)) rd_st3_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[71]), .rdlo_in(a3_wr[87]),  .coef_in(coef[56]), .rdup_out(a4_wr[71]), .rdlo_out(a4_wr[87]));
			radix2 #(.width(width)) rd_st3_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[72]), .rdlo_in(a3_wr[88]),  .coef_in(coef[64]), .rdup_out(a4_wr[72]), .rdlo_out(a4_wr[88]));
			radix2 #(.width(width)) rd_st3_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[73]), .rdlo_in(a3_wr[89]),  .coef_in(coef[72]), .rdup_out(a4_wr[73]), .rdlo_out(a4_wr[89]));
			radix2 #(.width(width)) rd_st3_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[74]), .rdlo_in(a3_wr[90]),  .coef_in(coef[80]), .rdup_out(a4_wr[74]), .rdlo_out(a4_wr[90]));
			radix2 #(.width(width)) rd_st3_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[75]), .rdlo_in(a3_wr[91]),  .coef_in(coef[88]), .rdup_out(a4_wr[75]), .rdlo_out(a4_wr[91]));
			radix2 #(.width(width)) rd_st3_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[76]), .rdlo_in(a3_wr[92]),  .coef_in(coef[96]), .rdup_out(a4_wr[76]), .rdlo_out(a4_wr[92]));
			radix2 #(.width(width)) rd_st3_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[77]), .rdlo_in(a3_wr[93]),  .coef_in(coef[104]), .rdup_out(a4_wr[77]), .rdlo_out(a4_wr[93]));
			radix2 #(.width(width)) rd_st3_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[78]), .rdlo_in(a3_wr[94]),  .coef_in(coef[112]), .rdup_out(a4_wr[78]), .rdlo_out(a4_wr[94]));
			radix2 #(.width(width)) rd_st3_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[79]), .rdlo_in(a3_wr[95]),  .coef_in(coef[120]), .rdup_out(a4_wr[79]), .rdlo_out(a4_wr[95]));
			radix2 #(.width(width)) rd_st3_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[96]), .rdlo_in(a3_wr[112]),  .coef_in(coef[0]), .rdup_out(a4_wr[96]), .rdlo_out(a4_wr[112]));
			radix2 #(.width(width)) rd_st3_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[97]), .rdlo_in(a3_wr[113]),  .coef_in(coef[8]), .rdup_out(a4_wr[97]), .rdlo_out(a4_wr[113]));
			radix2 #(.width(width)) rd_st3_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[98]), .rdlo_in(a3_wr[114]),  .coef_in(coef[16]), .rdup_out(a4_wr[98]), .rdlo_out(a4_wr[114]));
			radix2 #(.width(width)) rd_st3_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[99]), .rdlo_in(a3_wr[115]),  .coef_in(coef[24]), .rdup_out(a4_wr[99]), .rdlo_out(a4_wr[115]));
			radix2 #(.width(width)) rd_st3_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[100]), .rdlo_in(a3_wr[116]),  .coef_in(coef[32]), .rdup_out(a4_wr[100]), .rdlo_out(a4_wr[116]));
			radix2 #(.width(width)) rd_st3_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[101]), .rdlo_in(a3_wr[117]),  .coef_in(coef[40]), .rdup_out(a4_wr[101]), .rdlo_out(a4_wr[117]));
			radix2 #(.width(width)) rd_st3_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[102]), .rdlo_in(a3_wr[118]),  .coef_in(coef[48]), .rdup_out(a4_wr[102]), .rdlo_out(a4_wr[118]));
			radix2 #(.width(width)) rd_st3_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[103]), .rdlo_in(a3_wr[119]),  .coef_in(coef[56]), .rdup_out(a4_wr[103]), .rdlo_out(a4_wr[119]));
			radix2 #(.width(width)) rd_st3_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[104]), .rdlo_in(a3_wr[120]),  .coef_in(coef[64]), .rdup_out(a4_wr[104]), .rdlo_out(a4_wr[120]));
			radix2 #(.width(width)) rd_st3_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[105]), .rdlo_in(a3_wr[121]),  .coef_in(coef[72]), .rdup_out(a4_wr[105]), .rdlo_out(a4_wr[121]));
			radix2 #(.width(width)) rd_st3_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[106]), .rdlo_in(a3_wr[122]),  .coef_in(coef[80]), .rdup_out(a4_wr[106]), .rdlo_out(a4_wr[122]));
			radix2 #(.width(width)) rd_st3_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[107]), .rdlo_in(a3_wr[123]),  .coef_in(coef[88]), .rdup_out(a4_wr[107]), .rdlo_out(a4_wr[123]));
			radix2 #(.width(width)) rd_st3_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[108]), .rdlo_in(a3_wr[124]),  .coef_in(coef[96]), .rdup_out(a4_wr[108]), .rdlo_out(a4_wr[124]));
			radix2 #(.width(width)) rd_st3_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[109]), .rdlo_in(a3_wr[125]),  .coef_in(coef[104]), .rdup_out(a4_wr[109]), .rdlo_out(a4_wr[125]));
			radix2 #(.width(width)) rd_st3_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[110]), .rdlo_in(a3_wr[126]),  .coef_in(coef[112]), .rdup_out(a4_wr[110]), .rdlo_out(a4_wr[126]));
			radix2 #(.width(width)) rd_st3_111  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[111]), .rdlo_in(a3_wr[127]),  .coef_in(coef[120]), .rdup_out(a4_wr[111]), .rdlo_out(a4_wr[127]));
			radix2 #(.width(width)) rd_st3_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[128]), .rdlo_in(a3_wr[144]),  .coef_in(coef[0]), .rdup_out(a4_wr[128]), .rdlo_out(a4_wr[144]));
			radix2 #(.width(width)) rd_st3_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[129]), .rdlo_in(a3_wr[145]),  .coef_in(coef[8]), .rdup_out(a4_wr[129]), .rdlo_out(a4_wr[145]));
			radix2 #(.width(width)) rd_st3_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[130]), .rdlo_in(a3_wr[146]),  .coef_in(coef[16]), .rdup_out(a4_wr[130]), .rdlo_out(a4_wr[146]));
			radix2 #(.width(width)) rd_st3_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[131]), .rdlo_in(a3_wr[147]),  .coef_in(coef[24]), .rdup_out(a4_wr[131]), .rdlo_out(a4_wr[147]));
			radix2 #(.width(width)) rd_st3_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[132]), .rdlo_in(a3_wr[148]),  .coef_in(coef[32]), .rdup_out(a4_wr[132]), .rdlo_out(a4_wr[148]));
			radix2 #(.width(width)) rd_st3_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[133]), .rdlo_in(a3_wr[149]),  .coef_in(coef[40]), .rdup_out(a4_wr[133]), .rdlo_out(a4_wr[149]));
			radix2 #(.width(width)) rd_st3_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[134]), .rdlo_in(a3_wr[150]),  .coef_in(coef[48]), .rdup_out(a4_wr[134]), .rdlo_out(a4_wr[150]));
			radix2 #(.width(width)) rd_st3_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[135]), .rdlo_in(a3_wr[151]),  .coef_in(coef[56]), .rdup_out(a4_wr[135]), .rdlo_out(a4_wr[151]));
			radix2 #(.width(width)) rd_st3_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[136]), .rdlo_in(a3_wr[152]),  .coef_in(coef[64]), .rdup_out(a4_wr[136]), .rdlo_out(a4_wr[152]));
			radix2 #(.width(width)) rd_st3_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[137]), .rdlo_in(a3_wr[153]),  .coef_in(coef[72]), .rdup_out(a4_wr[137]), .rdlo_out(a4_wr[153]));
			radix2 #(.width(width)) rd_st3_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[138]), .rdlo_in(a3_wr[154]),  .coef_in(coef[80]), .rdup_out(a4_wr[138]), .rdlo_out(a4_wr[154]));
			radix2 #(.width(width)) rd_st3_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[139]), .rdlo_in(a3_wr[155]),  .coef_in(coef[88]), .rdup_out(a4_wr[139]), .rdlo_out(a4_wr[155]));
			radix2 #(.width(width)) rd_st3_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[140]), .rdlo_in(a3_wr[156]),  .coef_in(coef[96]), .rdup_out(a4_wr[140]), .rdlo_out(a4_wr[156]));
			radix2 #(.width(width)) rd_st3_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[141]), .rdlo_in(a3_wr[157]),  .coef_in(coef[104]), .rdup_out(a4_wr[141]), .rdlo_out(a4_wr[157]));
			radix2 #(.width(width)) rd_st3_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[142]), .rdlo_in(a3_wr[158]),  .coef_in(coef[112]), .rdup_out(a4_wr[142]), .rdlo_out(a4_wr[158]));
			radix2 #(.width(width)) rd_st3_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[143]), .rdlo_in(a3_wr[159]),  .coef_in(coef[120]), .rdup_out(a4_wr[143]), .rdlo_out(a4_wr[159]));
			radix2 #(.width(width)) rd_st3_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[160]), .rdlo_in(a3_wr[176]),  .coef_in(coef[0]), .rdup_out(a4_wr[160]), .rdlo_out(a4_wr[176]));
			radix2 #(.width(width)) rd_st3_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[161]), .rdlo_in(a3_wr[177]),  .coef_in(coef[8]), .rdup_out(a4_wr[161]), .rdlo_out(a4_wr[177]));
			radix2 #(.width(width)) rd_st3_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[162]), .rdlo_in(a3_wr[178]),  .coef_in(coef[16]), .rdup_out(a4_wr[162]), .rdlo_out(a4_wr[178]));
			radix2 #(.width(width)) rd_st3_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[163]), .rdlo_in(a3_wr[179]),  .coef_in(coef[24]), .rdup_out(a4_wr[163]), .rdlo_out(a4_wr[179]));
			radix2 #(.width(width)) rd_st3_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[164]), .rdlo_in(a3_wr[180]),  .coef_in(coef[32]), .rdup_out(a4_wr[164]), .rdlo_out(a4_wr[180]));
			radix2 #(.width(width)) rd_st3_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[165]), .rdlo_in(a3_wr[181]),  .coef_in(coef[40]), .rdup_out(a4_wr[165]), .rdlo_out(a4_wr[181]));
			radix2 #(.width(width)) rd_st3_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[166]), .rdlo_in(a3_wr[182]),  .coef_in(coef[48]), .rdup_out(a4_wr[166]), .rdlo_out(a4_wr[182]));
			radix2 #(.width(width)) rd_st3_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[167]), .rdlo_in(a3_wr[183]),  .coef_in(coef[56]), .rdup_out(a4_wr[167]), .rdlo_out(a4_wr[183]));
			radix2 #(.width(width)) rd_st3_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[168]), .rdlo_in(a3_wr[184]),  .coef_in(coef[64]), .rdup_out(a4_wr[168]), .rdlo_out(a4_wr[184]));
			radix2 #(.width(width)) rd_st3_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[169]), .rdlo_in(a3_wr[185]),  .coef_in(coef[72]), .rdup_out(a4_wr[169]), .rdlo_out(a4_wr[185]));
			radix2 #(.width(width)) rd_st3_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[170]), .rdlo_in(a3_wr[186]),  .coef_in(coef[80]), .rdup_out(a4_wr[170]), .rdlo_out(a4_wr[186]));
			radix2 #(.width(width)) rd_st3_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[171]), .rdlo_in(a3_wr[187]),  .coef_in(coef[88]), .rdup_out(a4_wr[171]), .rdlo_out(a4_wr[187]));
			radix2 #(.width(width)) rd_st3_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[172]), .rdlo_in(a3_wr[188]),  .coef_in(coef[96]), .rdup_out(a4_wr[172]), .rdlo_out(a4_wr[188]));
			radix2 #(.width(width)) rd_st3_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[173]), .rdlo_in(a3_wr[189]),  .coef_in(coef[104]), .rdup_out(a4_wr[173]), .rdlo_out(a4_wr[189]));
			radix2 #(.width(width)) rd_st3_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[174]), .rdlo_in(a3_wr[190]),  .coef_in(coef[112]), .rdup_out(a4_wr[174]), .rdlo_out(a4_wr[190]));
			radix2 #(.width(width)) rd_st3_175  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[175]), .rdlo_in(a3_wr[191]),  .coef_in(coef[120]), .rdup_out(a4_wr[175]), .rdlo_out(a4_wr[191]));
			radix2 #(.width(width)) rd_st3_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[192]), .rdlo_in(a3_wr[208]),  .coef_in(coef[0]), .rdup_out(a4_wr[192]), .rdlo_out(a4_wr[208]));
			radix2 #(.width(width)) rd_st3_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[193]), .rdlo_in(a3_wr[209]),  .coef_in(coef[8]), .rdup_out(a4_wr[193]), .rdlo_out(a4_wr[209]));
			radix2 #(.width(width)) rd_st3_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[194]), .rdlo_in(a3_wr[210]),  .coef_in(coef[16]), .rdup_out(a4_wr[194]), .rdlo_out(a4_wr[210]));
			radix2 #(.width(width)) rd_st3_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[195]), .rdlo_in(a3_wr[211]),  .coef_in(coef[24]), .rdup_out(a4_wr[195]), .rdlo_out(a4_wr[211]));
			radix2 #(.width(width)) rd_st3_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[196]), .rdlo_in(a3_wr[212]),  .coef_in(coef[32]), .rdup_out(a4_wr[196]), .rdlo_out(a4_wr[212]));
			radix2 #(.width(width)) rd_st3_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[197]), .rdlo_in(a3_wr[213]),  .coef_in(coef[40]), .rdup_out(a4_wr[197]), .rdlo_out(a4_wr[213]));
			radix2 #(.width(width)) rd_st3_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[198]), .rdlo_in(a3_wr[214]),  .coef_in(coef[48]), .rdup_out(a4_wr[198]), .rdlo_out(a4_wr[214]));
			radix2 #(.width(width)) rd_st3_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[199]), .rdlo_in(a3_wr[215]),  .coef_in(coef[56]), .rdup_out(a4_wr[199]), .rdlo_out(a4_wr[215]));
			radix2 #(.width(width)) rd_st3_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[200]), .rdlo_in(a3_wr[216]),  .coef_in(coef[64]), .rdup_out(a4_wr[200]), .rdlo_out(a4_wr[216]));
			radix2 #(.width(width)) rd_st3_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[201]), .rdlo_in(a3_wr[217]),  .coef_in(coef[72]), .rdup_out(a4_wr[201]), .rdlo_out(a4_wr[217]));
			radix2 #(.width(width)) rd_st3_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[202]), .rdlo_in(a3_wr[218]),  .coef_in(coef[80]), .rdup_out(a4_wr[202]), .rdlo_out(a4_wr[218]));
			radix2 #(.width(width)) rd_st3_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[203]), .rdlo_in(a3_wr[219]),  .coef_in(coef[88]), .rdup_out(a4_wr[203]), .rdlo_out(a4_wr[219]));
			radix2 #(.width(width)) rd_st3_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[204]), .rdlo_in(a3_wr[220]),  .coef_in(coef[96]), .rdup_out(a4_wr[204]), .rdlo_out(a4_wr[220]));
			radix2 #(.width(width)) rd_st3_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[205]), .rdlo_in(a3_wr[221]),  .coef_in(coef[104]), .rdup_out(a4_wr[205]), .rdlo_out(a4_wr[221]));
			radix2 #(.width(width)) rd_st3_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[206]), .rdlo_in(a3_wr[222]),  .coef_in(coef[112]), .rdup_out(a4_wr[206]), .rdlo_out(a4_wr[222]));
			radix2 #(.width(width)) rd_st3_207  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[207]), .rdlo_in(a3_wr[223]),  .coef_in(coef[120]), .rdup_out(a4_wr[207]), .rdlo_out(a4_wr[223]));
			radix2 #(.width(width)) rd_st3_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[224]), .rdlo_in(a3_wr[240]),  .coef_in(coef[0]), .rdup_out(a4_wr[224]), .rdlo_out(a4_wr[240]));
			radix2 #(.width(width)) rd_st3_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[225]), .rdlo_in(a3_wr[241]),  .coef_in(coef[8]), .rdup_out(a4_wr[225]), .rdlo_out(a4_wr[241]));
			radix2 #(.width(width)) rd_st3_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[226]), .rdlo_in(a3_wr[242]),  .coef_in(coef[16]), .rdup_out(a4_wr[226]), .rdlo_out(a4_wr[242]));
			radix2 #(.width(width)) rd_st3_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[227]), .rdlo_in(a3_wr[243]),  .coef_in(coef[24]), .rdup_out(a4_wr[227]), .rdlo_out(a4_wr[243]));
			radix2 #(.width(width)) rd_st3_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[228]), .rdlo_in(a3_wr[244]),  .coef_in(coef[32]), .rdup_out(a4_wr[228]), .rdlo_out(a4_wr[244]));
			radix2 #(.width(width)) rd_st3_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[229]), .rdlo_in(a3_wr[245]),  .coef_in(coef[40]), .rdup_out(a4_wr[229]), .rdlo_out(a4_wr[245]));
			radix2 #(.width(width)) rd_st3_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[230]), .rdlo_in(a3_wr[246]),  .coef_in(coef[48]), .rdup_out(a4_wr[230]), .rdlo_out(a4_wr[246]));
			radix2 #(.width(width)) rd_st3_231  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[231]), .rdlo_in(a3_wr[247]),  .coef_in(coef[56]), .rdup_out(a4_wr[231]), .rdlo_out(a4_wr[247]));
			radix2 #(.width(width)) rd_st3_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[232]), .rdlo_in(a3_wr[248]),  .coef_in(coef[64]), .rdup_out(a4_wr[232]), .rdlo_out(a4_wr[248]));
			radix2 #(.width(width)) rd_st3_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[233]), .rdlo_in(a3_wr[249]),  .coef_in(coef[72]), .rdup_out(a4_wr[233]), .rdlo_out(a4_wr[249]));
			radix2 #(.width(width)) rd_st3_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[234]), .rdlo_in(a3_wr[250]),  .coef_in(coef[80]), .rdup_out(a4_wr[234]), .rdlo_out(a4_wr[250]));
			radix2 #(.width(width)) rd_st3_235  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[235]), .rdlo_in(a3_wr[251]),  .coef_in(coef[88]), .rdup_out(a4_wr[235]), .rdlo_out(a4_wr[251]));
			radix2 #(.width(width)) rd_st3_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[236]), .rdlo_in(a3_wr[252]),  .coef_in(coef[96]), .rdup_out(a4_wr[236]), .rdlo_out(a4_wr[252]));
			radix2 #(.width(width)) rd_st3_237  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[237]), .rdlo_in(a3_wr[253]),  .coef_in(coef[104]), .rdup_out(a4_wr[237]), .rdlo_out(a4_wr[253]));
			radix2 #(.width(width)) rd_st3_238  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[238]), .rdlo_in(a3_wr[254]),  .coef_in(coef[112]), .rdup_out(a4_wr[238]), .rdlo_out(a4_wr[254]));
			radix2 #(.width(width)) rd_st3_239  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[239]), .rdlo_in(a3_wr[255]),  .coef_in(coef[120]), .rdup_out(a4_wr[239]), .rdlo_out(a4_wr[255]));

		//--- radix stage 4
			radix2 #(.width(width)) rd_st4_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[0]), .rdlo_in(a4_wr[8]),  .coef_in(coef[0]), .rdup_out(a5_wr[0]), .rdlo_out(a5_wr[8]));
			radix2 #(.width(width)) rd_st4_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[1]), .rdlo_in(a4_wr[9]),  .coef_in(coef[16]), .rdup_out(a5_wr[1]), .rdlo_out(a5_wr[9]));
			radix2 #(.width(width)) rd_st4_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[2]), .rdlo_in(a4_wr[10]),  .coef_in(coef[32]), .rdup_out(a5_wr[2]), .rdlo_out(a5_wr[10]));
			radix2 #(.width(width)) rd_st4_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[3]), .rdlo_in(a4_wr[11]),  .coef_in(coef[48]), .rdup_out(a5_wr[3]), .rdlo_out(a5_wr[11]));
			radix2 #(.width(width)) rd_st4_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[4]), .rdlo_in(a4_wr[12]),  .coef_in(coef[64]), .rdup_out(a5_wr[4]), .rdlo_out(a5_wr[12]));
			radix2 #(.width(width)) rd_st4_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[5]), .rdlo_in(a4_wr[13]),  .coef_in(coef[80]), .rdup_out(a5_wr[5]), .rdlo_out(a5_wr[13]));
			radix2 #(.width(width)) rd_st4_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[6]), .rdlo_in(a4_wr[14]),  .coef_in(coef[96]), .rdup_out(a5_wr[6]), .rdlo_out(a5_wr[14]));
			radix2 #(.width(width)) rd_st4_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[7]), .rdlo_in(a4_wr[15]),  .coef_in(coef[112]), .rdup_out(a5_wr[7]), .rdlo_out(a5_wr[15]));
			radix2 #(.width(width)) rd_st4_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[16]), .rdlo_in(a4_wr[24]),  .coef_in(coef[0]), .rdup_out(a5_wr[16]), .rdlo_out(a5_wr[24]));
			radix2 #(.width(width)) rd_st4_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[17]), .rdlo_in(a4_wr[25]),  .coef_in(coef[16]), .rdup_out(a5_wr[17]), .rdlo_out(a5_wr[25]));
			radix2 #(.width(width)) rd_st4_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[18]), .rdlo_in(a4_wr[26]),  .coef_in(coef[32]), .rdup_out(a5_wr[18]), .rdlo_out(a5_wr[26]));
			radix2 #(.width(width)) rd_st4_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[19]), .rdlo_in(a4_wr[27]),  .coef_in(coef[48]), .rdup_out(a5_wr[19]), .rdlo_out(a5_wr[27]));
			radix2 #(.width(width)) rd_st4_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[20]), .rdlo_in(a4_wr[28]),  .coef_in(coef[64]), .rdup_out(a5_wr[20]), .rdlo_out(a5_wr[28]));
			radix2 #(.width(width)) rd_st4_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[21]), .rdlo_in(a4_wr[29]),  .coef_in(coef[80]), .rdup_out(a5_wr[21]), .rdlo_out(a5_wr[29]));
			radix2 #(.width(width)) rd_st4_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[22]), .rdlo_in(a4_wr[30]),  .coef_in(coef[96]), .rdup_out(a5_wr[22]), .rdlo_out(a5_wr[30]));
			radix2 #(.width(width)) rd_st4_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[23]), .rdlo_in(a4_wr[31]),  .coef_in(coef[112]), .rdup_out(a5_wr[23]), .rdlo_out(a5_wr[31]));
			radix2 #(.width(width)) rd_st4_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[32]), .rdlo_in(a4_wr[40]),  .coef_in(coef[0]), .rdup_out(a5_wr[32]), .rdlo_out(a5_wr[40]));
			radix2 #(.width(width)) rd_st4_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[33]), .rdlo_in(a4_wr[41]),  .coef_in(coef[16]), .rdup_out(a5_wr[33]), .rdlo_out(a5_wr[41]));
			radix2 #(.width(width)) rd_st4_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[34]), .rdlo_in(a4_wr[42]),  .coef_in(coef[32]), .rdup_out(a5_wr[34]), .rdlo_out(a5_wr[42]));
			radix2 #(.width(width)) rd_st4_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[35]), .rdlo_in(a4_wr[43]),  .coef_in(coef[48]), .rdup_out(a5_wr[35]), .rdlo_out(a5_wr[43]));
			radix2 #(.width(width)) rd_st4_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[36]), .rdlo_in(a4_wr[44]),  .coef_in(coef[64]), .rdup_out(a5_wr[36]), .rdlo_out(a5_wr[44]));
			radix2 #(.width(width)) rd_st4_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[37]), .rdlo_in(a4_wr[45]),  .coef_in(coef[80]), .rdup_out(a5_wr[37]), .rdlo_out(a5_wr[45]));
			radix2 #(.width(width)) rd_st4_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[38]), .rdlo_in(a4_wr[46]),  .coef_in(coef[96]), .rdup_out(a5_wr[38]), .rdlo_out(a5_wr[46]));
			radix2 #(.width(width)) rd_st4_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[39]), .rdlo_in(a4_wr[47]),  .coef_in(coef[112]), .rdup_out(a5_wr[39]), .rdlo_out(a5_wr[47]));
			radix2 #(.width(width)) rd_st4_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[48]), .rdlo_in(a4_wr[56]),  .coef_in(coef[0]), .rdup_out(a5_wr[48]), .rdlo_out(a5_wr[56]));
			radix2 #(.width(width)) rd_st4_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[49]), .rdlo_in(a4_wr[57]),  .coef_in(coef[16]), .rdup_out(a5_wr[49]), .rdlo_out(a5_wr[57]));
			radix2 #(.width(width)) rd_st4_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[50]), .rdlo_in(a4_wr[58]),  .coef_in(coef[32]), .rdup_out(a5_wr[50]), .rdlo_out(a5_wr[58]));
			radix2 #(.width(width)) rd_st4_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[51]), .rdlo_in(a4_wr[59]),  .coef_in(coef[48]), .rdup_out(a5_wr[51]), .rdlo_out(a5_wr[59]));
			radix2 #(.width(width)) rd_st4_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[52]), .rdlo_in(a4_wr[60]),  .coef_in(coef[64]), .rdup_out(a5_wr[52]), .rdlo_out(a5_wr[60]));
			radix2 #(.width(width)) rd_st4_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[53]), .rdlo_in(a4_wr[61]),  .coef_in(coef[80]), .rdup_out(a5_wr[53]), .rdlo_out(a5_wr[61]));
			radix2 #(.width(width)) rd_st4_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[54]), .rdlo_in(a4_wr[62]),  .coef_in(coef[96]), .rdup_out(a5_wr[54]), .rdlo_out(a5_wr[62]));
			radix2 #(.width(width)) rd_st4_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[55]), .rdlo_in(a4_wr[63]),  .coef_in(coef[112]), .rdup_out(a5_wr[55]), .rdlo_out(a5_wr[63]));
			radix2 #(.width(width)) rd_st4_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[64]), .rdlo_in(a4_wr[72]),  .coef_in(coef[0]), .rdup_out(a5_wr[64]), .rdlo_out(a5_wr[72]));
			radix2 #(.width(width)) rd_st4_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[65]), .rdlo_in(a4_wr[73]),  .coef_in(coef[16]), .rdup_out(a5_wr[65]), .rdlo_out(a5_wr[73]));
			radix2 #(.width(width)) rd_st4_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[66]), .rdlo_in(a4_wr[74]),  .coef_in(coef[32]), .rdup_out(a5_wr[66]), .rdlo_out(a5_wr[74]));
			radix2 #(.width(width)) rd_st4_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[67]), .rdlo_in(a4_wr[75]),  .coef_in(coef[48]), .rdup_out(a5_wr[67]), .rdlo_out(a5_wr[75]));
			radix2 #(.width(width)) rd_st4_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[68]), .rdlo_in(a4_wr[76]),  .coef_in(coef[64]), .rdup_out(a5_wr[68]), .rdlo_out(a5_wr[76]));
			radix2 #(.width(width)) rd_st4_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[69]), .rdlo_in(a4_wr[77]),  .coef_in(coef[80]), .rdup_out(a5_wr[69]), .rdlo_out(a5_wr[77]));
			radix2 #(.width(width)) rd_st4_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[70]), .rdlo_in(a4_wr[78]),  .coef_in(coef[96]), .rdup_out(a5_wr[70]), .rdlo_out(a5_wr[78]));
			radix2 #(.width(width)) rd_st4_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[71]), .rdlo_in(a4_wr[79]),  .coef_in(coef[112]), .rdup_out(a5_wr[71]), .rdlo_out(a5_wr[79]));
			radix2 #(.width(width)) rd_st4_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[80]), .rdlo_in(a4_wr[88]),  .coef_in(coef[0]), .rdup_out(a5_wr[80]), .rdlo_out(a5_wr[88]));
			radix2 #(.width(width)) rd_st4_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[81]), .rdlo_in(a4_wr[89]),  .coef_in(coef[16]), .rdup_out(a5_wr[81]), .rdlo_out(a5_wr[89]));
			radix2 #(.width(width)) rd_st4_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[82]), .rdlo_in(a4_wr[90]),  .coef_in(coef[32]), .rdup_out(a5_wr[82]), .rdlo_out(a5_wr[90]));
			radix2 #(.width(width)) rd_st4_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[83]), .rdlo_in(a4_wr[91]),  .coef_in(coef[48]), .rdup_out(a5_wr[83]), .rdlo_out(a5_wr[91]));
			radix2 #(.width(width)) rd_st4_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[84]), .rdlo_in(a4_wr[92]),  .coef_in(coef[64]), .rdup_out(a5_wr[84]), .rdlo_out(a5_wr[92]));
			radix2 #(.width(width)) rd_st4_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[85]), .rdlo_in(a4_wr[93]),  .coef_in(coef[80]), .rdup_out(a5_wr[85]), .rdlo_out(a5_wr[93]));
			radix2 #(.width(width)) rd_st4_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[86]), .rdlo_in(a4_wr[94]),  .coef_in(coef[96]), .rdup_out(a5_wr[86]), .rdlo_out(a5_wr[94]));
			radix2 #(.width(width)) rd_st4_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[87]), .rdlo_in(a4_wr[95]),  .coef_in(coef[112]), .rdup_out(a5_wr[87]), .rdlo_out(a5_wr[95]));
			radix2 #(.width(width)) rd_st4_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[96]), .rdlo_in(a4_wr[104]),  .coef_in(coef[0]), .rdup_out(a5_wr[96]), .rdlo_out(a5_wr[104]));
			radix2 #(.width(width)) rd_st4_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[97]), .rdlo_in(a4_wr[105]),  .coef_in(coef[16]), .rdup_out(a5_wr[97]), .rdlo_out(a5_wr[105]));
			radix2 #(.width(width)) rd_st4_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[98]), .rdlo_in(a4_wr[106]),  .coef_in(coef[32]), .rdup_out(a5_wr[98]), .rdlo_out(a5_wr[106]));
			radix2 #(.width(width)) rd_st4_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[99]), .rdlo_in(a4_wr[107]),  .coef_in(coef[48]), .rdup_out(a5_wr[99]), .rdlo_out(a5_wr[107]));
			radix2 #(.width(width)) rd_st4_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[100]), .rdlo_in(a4_wr[108]),  .coef_in(coef[64]), .rdup_out(a5_wr[100]), .rdlo_out(a5_wr[108]));
			radix2 #(.width(width)) rd_st4_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[101]), .rdlo_in(a4_wr[109]),  .coef_in(coef[80]), .rdup_out(a5_wr[101]), .rdlo_out(a5_wr[109]));
			radix2 #(.width(width)) rd_st4_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[102]), .rdlo_in(a4_wr[110]),  .coef_in(coef[96]), .rdup_out(a5_wr[102]), .rdlo_out(a5_wr[110]));
			radix2 #(.width(width)) rd_st4_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[103]), .rdlo_in(a4_wr[111]),  .coef_in(coef[112]), .rdup_out(a5_wr[103]), .rdlo_out(a5_wr[111]));
			radix2 #(.width(width)) rd_st4_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[112]), .rdlo_in(a4_wr[120]),  .coef_in(coef[0]), .rdup_out(a5_wr[112]), .rdlo_out(a5_wr[120]));
			radix2 #(.width(width)) rd_st4_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[113]), .rdlo_in(a4_wr[121]),  .coef_in(coef[16]), .rdup_out(a5_wr[113]), .rdlo_out(a5_wr[121]));
			radix2 #(.width(width)) rd_st4_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[114]), .rdlo_in(a4_wr[122]),  .coef_in(coef[32]), .rdup_out(a5_wr[114]), .rdlo_out(a5_wr[122]));
			radix2 #(.width(width)) rd_st4_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[115]), .rdlo_in(a4_wr[123]),  .coef_in(coef[48]), .rdup_out(a5_wr[115]), .rdlo_out(a5_wr[123]));
			radix2 #(.width(width)) rd_st4_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[116]), .rdlo_in(a4_wr[124]),  .coef_in(coef[64]), .rdup_out(a5_wr[116]), .rdlo_out(a5_wr[124]));
			radix2 #(.width(width)) rd_st4_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[117]), .rdlo_in(a4_wr[125]),  .coef_in(coef[80]), .rdup_out(a5_wr[117]), .rdlo_out(a5_wr[125]));
			radix2 #(.width(width)) rd_st4_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[118]), .rdlo_in(a4_wr[126]),  .coef_in(coef[96]), .rdup_out(a5_wr[118]), .rdlo_out(a5_wr[126]));
			radix2 #(.width(width)) rd_st4_119  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[119]), .rdlo_in(a4_wr[127]),  .coef_in(coef[112]), .rdup_out(a5_wr[119]), .rdlo_out(a5_wr[127]));
			radix2 #(.width(width)) rd_st4_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[128]), .rdlo_in(a4_wr[136]),  .coef_in(coef[0]), .rdup_out(a5_wr[128]), .rdlo_out(a5_wr[136]));
			radix2 #(.width(width)) rd_st4_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[129]), .rdlo_in(a4_wr[137]),  .coef_in(coef[16]), .rdup_out(a5_wr[129]), .rdlo_out(a5_wr[137]));
			radix2 #(.width(width)) rd_st4_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[130]), .rdlo_in(a4_wr[138]),  .coef_in(coef[32]), .rdup_out(a5_wr[130]), .rdlo_out(a5_wr[138]));
			radix2 #(.width(width)) rd_st4_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[131]), .rdlo_in(a4_wr[139]),  .coef_in(coef[48]), .rdup_out(a5_wr[131]), .rdlo_out(a5_wr[139]));
			radix2 #(.width(width)) rd_st4_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[132]), .rdlo_in(a4_wr[140]),  .coef_in(coef[64]), .rdup_out(a5_wr[132]), .rdlo_out(a5_wr[140]));
			radix2 #(.width(width)) rd_st4_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[133]), .rdlo_in(a4_wr[141]),  .coef_in(coef[80]), .rdup_out(a5_wr[133]), .rdlo_out(a5_wr[141]));
			radix2 #(.width(width)) rd_st4_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[134]), .rdlo_in(a4_wr[142]),  .coef_in(coef[96]), .rdup_out(a5_wr[134]), .rdlo_out(a5_wr[142]));
			radix2 #(.width(width)) rd_st4_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[135]), .rdlo_in(a4_wr[143]),  .coef_in(coef[112]), .rdup_out(a5_wr[135]), .rdlo_out(a5_wr[143]));
			radix2 #(.width(width)) rd_st4_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[144]), .rdlo_in(a4_wr[152]),  .coef_in(coef[0]), .rdup_out(a5_wr[144]), .rdlo_out(a5_wr[152]));
			radix2 #(.width(width)) rd_st4_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[145]), .rdlo_in(a4_wr[153]),  .coef_in(coef[16]), .rdup_out(a5_wr[145]), .rdlo_out(a5_wr[153]));
			radix2 #(.width(width)) rd_st4_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[146]), .rdlo_in(a4_wr[154]),  .coef_in(coef[32]), .rdup_out(a5_wr[146]), .rdlo_out(a5_wr[154]));
			radix2 #(.width(width)) rd_st4_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[147]), .rdlo_in(a4_wr[155]),  .coef_in(coef[48]), .rdup_out(a5_wr[147]), .rdlo_out(a5_wr[155]));
			radix2 #(.width(width)) rd_st4_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[148]), .rdlo_in(a4_wr[156]),  .coef_in(coef[64]), .rdup_out(a5_wr[148]), .rdlo_out(a5_wr[156]));
			radix2 #(.width(width)) rd_st4_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[149]), .rdlo_in(a4_wr[157]),  .coef_in(coef[80]), .rdup_out(a5_wr[149]), .rdlo_out(a5_wr[157]));
			radix2 #(.width(width)) rd_st4_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[150]), .rdlo_in(a4_wr[158]),  .coef_in(coef[96]), .rdup_out(a5_wr[150]), .rdlo_out(a5_wr[158]));
			radix2 #(.width(width)) rd_st4_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[151]), .rdlo_in(a4_wr[159]),  .coef_in(coef[112]), .rdup_out(a5_wr[151]), .rdlo_out(a5_wr[159]));
			radix2 #(.width(width)) rd_st4_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[160]), .rdlo_in(a4_wr[168]),  .coef_in(coef[0]), .rdup_out(a5_wr[160]), .rdlo_out(a5_wr[168]));
			radix2 #(.width(width)) rd_st4_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[161]), .rdlo_in(a4_wr[169]),  .coef_in(coef[16]), .rdup_out(a5_wr[161]), .rdlo_out(a5_wr[169]));
			radix2 #(.width(width)) rd_st4_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[162]), .rdlo_in(a4_wr[170]),  .coef_in(coef[32]), .rdup_out(a5_wr[162]), .rdlo_out(a5_wr[170]));
			radix2 #(.width(width)) rd_st4_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[163]), .rdlo_in(a4_wr[171]),  .coef_in(coef[48]), .rdup_out(a5_wr[163]), .rdlo_out(a5_wr[171]));
			radix2 #(.width(width)) rd_st4_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[164]), .rdlo_in(a4_wr[172]),  .coef_in(coef[64]), .rdup_out(a5_wr[164]), .rdlo_out(a5_wr[172]));
			radix2 #(.width(width)) rd_st4_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[165]), .rdlo_in(a4_wr[173]),  .coef_in(coef[80]), .rdup_out(a5_wr[165]), .rdlo_out(a5_wr[173]));
			radix2 #(.width(width)) rd_st4_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[166]), .rdlo_in(a4_wr[174]),  .coef_in(coef[96]), .rdup_out(a5_wr[166]), .rdlo_out(a5_wr[174]));
			radix2 #(.width(width)) rd_st4_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[167]), .rdlo_in(a4_wr[175]),  .coef_in(coef[112]), .rdup_out(a5_wr[167]), .rdlo_out(a5_wr[175]));
			radix2 #(.width(width)) rd_st4_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[176]), .rdlo_in(a4_wr[184]),  .coef_in(coef[0]), .rdup_out(a5_wr[176]), .rdlo_out(a5_wr[184]));
			radix2 #(.width(width)) rd_st4_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[177]), .rdlo_in(a4_wr[185]),  .coef_in(coef[16]), .rdup_out(a5_wr[177]), .rdlo_out(a5_wr[185]));
			radix2 #(.width(width)) rd_st4_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[178]), .rdlo_in(a4_wr[186]),  .coef_in(coef[32]), .rdup_out(a5_wr[178]), .rdlo_out(a5_wr[186]));
			radix2 #(.width(width)) rd_st4_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[179]), .rdlo_in(a4_wr[187]),  .coef_in(coef[48]), .rdup_out(a5_wr[179]), .rdlo_out(a5_wr[187]));
			radix2 #(.width(width)) rd_st4_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[180]), .rdlo_in(a4_wr[188]),  .coef_in(coef[64]), .rdup_out(a5_wr[180]), .rdlo_out(a5_wr[188]));
			radix2 #(.width(width)) rd_st4_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[181]), .rdlo_in(a4_wr[189]),  .coef_in(coef[80]), .rdup_out(a5_wr[181]), .rdlo_out(a5_wr[189]));
			radix2 #(.width(width)) rd_st4_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[182]), .rdlo_in(a4_wr[190]),  .coef_in(coef[96]), .rdup_out(a5_wr[182]), .rdlo_out(a5_wr[190]));
			radix2 #(.width(width)) rd_st4_183  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[183]), .rdlo_in(a4_wr[191]),  .coef_in(coef[112]), .rdup_out(a5_wr[183]), .rdlo_out(a5_wr[191]));
			radix2 #(.width(width)) rd_st4_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[192]), .rdlo_in(a4_wr[200]),  .coef_in(coef[0]), .rdup_out(a5_wr[192]), .rdlo_out(a5_wr[200]));
			radix2 #(.width(width)) rd_st4_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[193]), .rdlo_in(a4_wr[201]),  .coef_in(coef[16]), .rdup_out(a5_wr[193]), .rdlo_out(a5_wr[201]));
			radix2 #(.width(width)) rd_st4_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[194]), .rdlo_in(a4_wr[202]),  .coef_in(coef[32]), .rdup_out(a5_wr[194]), .rdlo_out(a5_wr[202]));
			radix2 #(.width(width)) rd_st4_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[195]), .rdlo_in(a4_wr[203]),  .coef_in(coef[48]), .rdup_out(a5_wr[195]), .rdlo_out(a5_wr[203]));
			radix2 #(.width(width)) rd_st4_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[196]), .rdlo_in(a4_wr[204]),  .coef_in(coef[64]), .rdup_out(a5_wr[196]), .rdlo_out(a5_wr[204]));
			radix2 #(.width(width)) rd_st4_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[197]), .rdlo_in(a4_wr[205]),  .coef_in(coef[80]), .rdup_out(a5_wr[197]), .rdlo_out(a5_wr[205]));
			radix2 #(.width(width)) rd_st4_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[198]), .rdlo_in(a4_wr[206]),  .coef_in(coef[96]), .rdup_out(a5_wr[198]), .rdlo_out(a5_wr[206]));
			radix2 #(.width(width)) rd_st4_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[199]), .rdlo_in(a4_wr[207]),  .coef_in(coef[112]), .rdup_out(a5_wr[199]), .rdlo_out(a5_wr[207]));
			radix2 #(.width(width)) rd_st4_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[208]), .rdlo_in(a4_wr[216]),  .coef_in(coef[0]), .rdup_out(a5_wr[208]), .rdlo_out(a5_wr[216]));
			radix2 #(.width(width)) rd_st4_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[209]), .rdlo_in(a4_wr[217]),  .coef_in(coef[16]), .rdup_out(a5_wr[209]), .rdlo_out(a5_wr[217]));
			radix2 #(.width(width)) rd_st4_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[210]), .rdlo_in(a4_wr[218]),  .coef_in(coef[32]), .rdup_out(a5_wr[210]), .rdlo_out(a5_wr[218]));
			radix2 #(.width(width)) rd_st4_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[211]), .rdlo_in(a4_wr[219]),  .coef_in(coef[48]), .rdup_out(a5_wr[211]), .rdlo_out(a5_wr[219]));
			radix2 #(.width(width)) rd_st4_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[212]), .rdlo_in(a4_wr[220]),  .coef_in(coef[64]), .rdup_out(a5_wr[212]), .rdlo_out(a5_wr[220]));
			radix2 #(.width(width)) rd_st4_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[213]), .rdlo_in(a4_wr[221]),  .coef_in(coef[80]), .rdup_out(a5_wr[213]), .rdlo_out(a5_wr[221]));
			radix2 #(.width(width)) rd_st4_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[214]), .rdlo_in(a4_wr[222]),  .coef_in(coef[96]), .rdup_out(a5_wr[214]), .rdlo_out(a5_wr[222]));
			radix2 #(.width(width)) rd_st4_215  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[215]), .rdlo_in(a4_wr[223]),  .coef_in(coef[112]), .rdup_out(a5_wr[215]), .rdlo_out(a5_wr[223]));
			radix2 #(.width(width)) rd_st4_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[224]), .rdlo_in(a4_wr[232]),  .coef_in(coef[0]), .rdup_out(a5_wr[224]), .rdlo_out(a5_wr[232]));
			radix2 #(.width(width)) rd_st4_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[225]), .rdlo_in(a4_wr[233]),  .coef_in(coef[16]), .rdup_out(a5_wr[225]), .rdlo_out(a5_wr[233]));
			radix2 #(.width(width)) rd_st4_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[226]), .rdlo_in(a4_wr[234]),  .coef_in(coef[32]), .rdup_out(a5_wr[226]), .rdlo_out(a5_wr[234]));
			radix2 #(.width(width)) rd_st4_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[227]), .rdlo_in(a4_wr[235]),  .coef_in(coef[48]), .rdup_out(a5_wr[227]), .rdlo_out(a5_wr[235]));
			radix2 #(.width(width)) rd_st4_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[228]), .rdlo_in(a4_wr[236]),  .coef_in(coef[64]), .rdup_out(a5_wr[228]), .rdlo_out(a5_wr[236]));
			radix2 #(.width(width)) rd_st4_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[229]), .rdlo_in(a4_wr[237]),  .coef_in(coef[80]), .rdup_out(a5_wr[229]), .rdlo_out(a5_wr[237]));
			radix2 #(.width(width)) rd_st4_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[230]), .rdlo_in(a4_wr[238]),  .coef_in(coef[96]), .rdup_out(a5_wr[230]), .rdlo_out(a5_wr[238]));
			radix2 #(.width(width)) rd_st4_231  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[231]), .rdlo_in(a4_wr[239]),  .coef_in(coef[112]), .rdup_out(a5_wr[231]), .rdlo_out(a5_wr[239]));
			radix2 #(.width(width)) rd_st4_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[240]), .rdlo_in(a4_wr[248]),  .coef_in(coef[0]), .rdup_out(a5_wr[240]), .rdlo_out(a5_wr[248]));
			radix2 #(.width(width)) rd_st4_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[241]), .rdlo_in(a4_wr[249]),  .coef_in(coef[16]), .rdup_out(a5_wr[241]), .rdlo_out(a5_wr[249]));
			radix2 #(.width(width)) rd_st4_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[242]), .rdlo_in(a4_wr[250]),  .coef_in(coef[32]), .rdup_out(a5_wr[242]), .rdlo_out(a5_wr[250]));
			radix2 #(.width(width)) rd_st4_243  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[243]), .rdlo_in(a4_wr[251]),  .coef_in(coef[48]), .rdup_out(a5_wr[243]), .rdlo_out(a5_wr[251]));
			radix2 #(.width(width)) rd_st4_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[244]), .rdlo_in(a4_wr[252]),  .coef_in(coef[64]), .rdup_out(a5_wr[244]), .rdlo_out(a5_wr[252]));
			radix2 #(.width(width)) rd_st4_245  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[245]), .rdlo_in(a4_wr[253]),  .coef_in(coef[80]), .rdup_out(a5_wr[245]), .rdlo_out(a5_wr[253]));
			radix2 #(.width(width)) rd_st4_246  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[246]), .rdlo_in(a4_wr[254]),  .coef_in(coef[96]), .rdup_out(a5_wr[246]), .rdlo_out(a5_wr[254]));
			radix2 #(.width(width)) rd_st4_247  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[247]), .rdlo_in(a4_wr[255]),  .coef_in(coef[112]), .rdup_out(a5_wr[247]), .rdlo_out(a5_wr[255]));

		//--- radix stage 5
			radix2 #(.width(width)) rd_st5_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[0]), .rdlo_in(a5_wr[4]),  .coef_in(coef[0]), .rdup_out(a6_wr[0]), .rdlo_out(a6_wr[4]));
			radix2 #(.width(width)) rd_st5_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[1]), .rdlo_in(a5_wr[5]),  .coef_in(coef[32]), .rdup_out(a6_wr[1]), .rdlo_out(a6_wr[5]));
			radix2 #(.width(width)) rd_st5_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[2]), .rdlo_in(a5_wr[6]),  .coef_in(coef[64]), .rdup_out(a6_wr[2]), .rdlo_out(a6_wr[6]));
			radix2 #(.width(width)) rd_st5_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[3]), .rdlo_in(a5_wr[7]),  .coef_in(coef[96]), .rdup_out(a6_wr[3]), .rdlo_out(a6_wr[7]));
			radix2 #(.width(width)) rd_st5_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[8]), .rdlo_in(a5_wr[12]),  .coef_in(coef[0]), .rdup_out(a6_wr[8]), .rdlo_out(a6_wr[12]));
			radix2 #(.width(width)) rd_st5_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[9]), .rdlo_in(a5_wr[13]),  .coef_in(coef[32]), .rdup_out(a6_wr[9]), .rdlo_out(a6_wr[13]));
			radix2 #(.width(width)) rd_st5_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[10]), .rdlo_in(a5_wr[14]),  .coef_in(coef[64]), .rdup_out(a6_wr[10]), .rdlo_out(a6_wr[14]));
			radix2 #(.width(width)) rd_st5_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[11]), .rdlo_in(a5_wr[15]),  .coef_in(coef[96]), .rdup_out(a6_wr[11]), .rdlo_out(a6_wr[15]));
			radix2 #(.width(width)) rd_st5_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[16]), .rdlo_in(a5_wr[20]),  .coef_in(coef[0]), .rdup_out(a6_wr[16]), .rdlo_out(a6_wr[20]));
			radix2 #(.width(width)) rd_st5_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[17]), .rdlo_in(a5_wr[21]),  .coef_in(coef[32]), .rdup_out(a6_wr[17]), .rdlo_out(a6_wr[21]));
			radix2 #(.width(width)) rd_st5_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[18]), .rdlo_in(a5_wr[22]),  .coef_in(coef[64]), .rdup_out(a6_wr[18]), .rdlo_out(a6_wr[22]));
			radix2 #(.width(width)) rd_st5_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[19]), .rdlo_in(a5_wr[23]),  .coef_in(coef[96]), .rdup_out(a6_wr[19]), .rdlo_out(a6_wr[23]));
			radix2 #(.width(width)) rd_st5_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[24]), .rdlo_in(a5_wr[28]),  .coef_in(coef[0]), .rdup_out(a6_wr[24]), .rdlo_out(a6_wr[28]));
			radix2 #(.width(width)) rd_st5_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[25]), .rdlo_in(a5_wr[29]),  .coef_in(coef[32]), .rdup_out(a6_wr[25]), .rdlo_out(a6_wr[29]));
			radix2 #(.width(width)) rd_st5_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[26]), .rdlo_in(a5_wr[30]),  .coef_in(coef[64]), .rdup_out(a6_wr[26]), .rdlo_out(a6_wr[30]));
			radix2 #(.width(width)) rd_st5_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[27]), .rdlo_in(a5_wr[31]),  .coef_in(coef[96]), .rdup_out(a6_wr[27]), .rdlo_out(a6_wr[31]));
			radix2 #(.width(width)) rd_st5_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[32]), .rdlo_in(a5_wr[36]),  .coef_in(coef[0]), .rdup_out(a6_wr[32]), .rdlo_out(a6_wr[36]));
			radix2 #(.width(width)) rd_st5_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[33]), .rdlo_in(a5_wr[37]),  .coef_in(coef[32]), .rdup_out(a6_wr[33]), .rdlo_out(a6_wr[37]));
			radix2 #(.width(width)) rd_st5_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[34]), .rdlo_in(a5_wr[38]),  .coef_in(coef[64]), .rdup_out(a6_wr[34]), .rdlo_out(a6_wr[38]));
			radix2 #(.width(width)) rd_st5_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[35]), .rdlo_in(a5_wr[39]),  .coef_in(coef[96]), .rdup_out(a6_wr[35]), .rdlo_out(a6_wr[39]));
			radix2 #(.width(width)) rd_st5_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[40]), .rdlo_in(a5_wr[44]),  .coef_in(coef[0]), .rdup_out(a6_wr[40]), .rdlo_out(a6_wr[44]));
			radix2 #(.width(width)) rd_st5_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[41]), .rdlo_in(a5_wr[45]),  .coef_in(coef[32]), .rdup_out(a6_wr[41]), .rdlo_out(a6_wr[45]));
			radix2 #(.width(width)) rd_st5_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[42]), .rdlo_in(a5_wr[46]),  .coef_in(coef[64]), .rdup_out(a6_wr[42]), .rdlo_out(a6_wr[46]));
			radix2 #(.width(width)) rd_st5_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[43]), .rdlo_in(a5_wr[47]),  .coef_in(coef[96]), .rdup_out(a6_wr[43]), .rdlo_out(a6_wr[47]));
			radix2 #(.width(width)) rd_st5_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[48]), .rdlo_in(a5_wr[52]),  .coef_in(coef[0]), .rdup_out(a6_wr[48]), .rdlo_out(a6_wr[52]));
			radix2 #(.width(width)) rd_st5_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[49]), .rdlo_in(a5_wr[53]),  .coef_in(coef[32]), .rdup_out(a6_wr[49]), .rdlo_out(a6_wr[53]));
			radix2 #(.width(width)) rd_st5_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[50]), .rdlo_in(a5_wr[54]),  .coef_in(coef[64]), .rdup_out(a6_wr[50]), .rdlo_out(a6_wr[54]));
			radix2 #(.width(width)) rd_st5_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[51]), .rdlo_in(a5_wr[55]),  .coef_in(coef[96]), .rdup_out(a6_wr[51]), .rdlo_out(a6_wr[55]));
			radix2 #(.width(width)) rd_st5_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[56]), .rdlo_in(a5_wr[60]),  .coef_in(coef[0]), .rdup_out(a6_wr[56]), .rdlo_out(a6_wr[60]));
			radix2 #(.width(width)) rd_st5_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[57]), .rdlo_in(a5_wr[61]),  .coef_in(coef[32]), .rdup_out(a6_wr[57]), .rdlo_out(a6_wr[61]));
			radix2 #(.width(width)) rd_st5_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[58]), .rdlo_in(a5_wr[62]),  .coef_in(coef[64]), .rdup_out(a6_wr[58]), .rdlo_out(a6_wr[62]));
			radix2 #(.width(width)) rd_st5_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[59]), .rdlo_in(a5_wr[63]),  .coef_in(coef[96]), .rdup_out(a6_wr[59]), .rdlo_out(a6_wr[63]));
			radix2 #(.width(width)) rd_st5_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[64]), .rdlo_in(a5_wr[68]),  .coef_in(coef[0]), .rdup_out(a6_wr[64]), .rdlo_out(a6_wr[68]));
			radix2 #(.width(width)) rd_st5_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[65]), .rdlo_in(a5_wr[69]),  .coef_in(coef[32]), .rdup_out(a6_wr[65]), .rdlo_out(a6_wr[69]));
			radix2 #(.width(width)) rd_st5_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[66]), .rdlo_in(a5_wr[70]),  .coef_in(coef[64]), .rdup_out(a6_wr[66]), .rdlo_out(a6_wr[70]));
			radix2 #(.width(width)) rd_st5_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[67]), .rdlo_in(a5_wr[71]),  .coef_in(coef[96]), .rdup_out(a6_wr[67]), .rdlo_out(a6_wr[71]));
			radix2 #(.width(width)) rd_st5_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[72]), .rdlo_in(a5_wr[76]),  .coef_in(coef[0]), .rdup_out(a6_wr[72]), .rdlo_out(a6_wr[76]));
			radix2 #(.width(width)) rd_st5_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[73]), .rdlo_in(a5_wr[77]),  .coef_in(coef[32]), .rdup_out(a6_wr[73]), .rdlo_out(a6_wr[77]));
			radix2 #(.width(width)) rd_st5_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[74]), .rdlo_in(a5_wr[78]),  .coef_in(coef[64]), .rdup_out(a6_wr[74]), .rdlo_out(a6_wr[78]));
			radix2 #(.width(width)) rd_st5_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[75]), .rdlo_in(a5_wr[79]),  .coef_in(coef[96]), .rdup_out(a6_wr[75]), .rdlo_out(a6_wr[79]));
			radix2 #(.width(width)) rd_st5_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[80]), .rdlo_in(a5_wr[84]),  .coef_in(coef[0]), .rdup_out(a6_wr[80]), .rdlo_out(a6_wr[84]));
			radix2 #(.width(width)) rd_st5_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[81]), .rdlo_in(a5_wr[85]),  .coef_in(coef[32]), .rdup_out(a6_wr[81]), .rdlo_out(a6_wr[85]));
			radix2 #(.width(width)) rd_st5_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[82]), .rdlo_in(a5_wr[86]),  .coef_in(coef[64]), .rdup_out(a6_wr[82]), .rdlo_out(a6_wr[86]));
			radix2 #(.width(width)) rd_st5_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[83]), .rdlo_in(a5_wr[87]),  .coef_in(coef[96]), .rdup_out(a6_wr[83]), .rdlo_out(a6_wr[87]));
			radix2 #(.width(width)) rd_st5_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[88]), .rdlo_in(a5_wr[92]),  .coef_in(coef[0]), .rdup_out(a6_wr[88]), .rdlo_out(a6_wr[92]));
			radix2 #(.width(width)) rd_st5_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[89]), .rdlo_in(a5_wr[93]),  .coef_in(coef[32]), .rdup_out(a6_wr[89]), .rdlo_out(a6_wr[93]));
			radix2 #(.width(width)) rd_st5_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[90]), .rdlo_in(a5_wr[94]),  .coef_in(coef[64]), .rdup_out(a6_wr[90]), .rdlo_out(a6_wr[94]));
			radix2 #(.width(width)) rd_st5_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[91]), .rdlo_in(a5_wr[95]),  .coef_in(coef[96]), .rdup_out(a6_wr[91]), .rdlo_out(a6_wr[95]));
			radix2 #(.width(width)) rd_st5_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[96]), .rdlo_in(a5_wr[100]),  .coef_in(coef[0]), .rdup_out(a6_wr[96]), .rdlo_out(a6_wr[100]));
			radix2 #(.width(width)) rd_st5_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[97]), .rdlo_in(a5_wr[101]),  .coef_in(coef[32]), .rdup_out(a6_wr[97]), .rdlo_out(a6_wr[101]));
			radix2 #(.width(width)) rd_st5_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[98]), .rdlo_in(a5_wr[102]),  .coef_in(coef[64]), .rdup_out(a6_wr[98]), .rdlo_out(a6_wr[102]));
			radix2 #(.width(width)) rd_st5_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[99]), .rdlo_in(a5_wr[103]),  .coef_in(coef[96]), .rdup_out(a6_wr[99]), .rdlo_out(a6_wr[103]));
			radix2 #(.width(width)) rd_st5_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[104]), .rdlo_in(a5_wr[108]),  .coef_in(coef[0]), .rdup_out(a6_wr[104]), .rdlo_out(a6_wr[108]));
			radix2 #(.width(width)) rd_st5_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[105]), .rdlo_in(a5_wr[109]),  .coef_in(coef[32]), .rdup_out(a6_wr[105]), .rdlo_out(a6_wr[109]));
			radix2 #(.width(width)) rd_st5_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[106]), .rdlo_in(a5_wr[110]),  .coef_in(coef[64]), .rdup_out(a6_wr[106]), .rdlo_out(a6_wr[110]));
			radix2 #(.width(width)) rd_st5_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[107]), .rdlo_in(a5_wr[111]),  .coef_in(coef[96]), .rdup_out(a6_wr[107]), .rdlo_out(a6_wr[111]));
			radix2 #(.width(width)) rd_st5_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[112]), .rdlo_in(a5_wr[116]),  .coef_in(coef[0]), .rdup_out(a6_wr[112]), .rdlo_out(a6_wr[116]));
			radix2 #(.width(width)) rd_st5_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[113]), .rdlo_in(a5_wr[117]),  .coef_in(coef[32]), .rdup_out(a6_wr[113]), .rdlo_out(a6_wr[117]));
			radix2 #(.width(width)) rd_st5_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[114]), .rdlo_in(a5_wr[118]),  .coef_in(coef[64]), .rdup_out(a6_wr[114]), .rdlo_out(a6_wr[118]));
			radix2 #(.width(width)) rd_st5_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[115]), .rdlo_in(a5_wr[119]),  .coef_in(coef[96]), .rdup_out(a6_wr[115]), .rdlo_out(a6_wr[119]));
			radix2 #(.width(width)) rd_st5_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[120]), .rdlo_in(a5_wr[124]),  .coef_in(coef[0]), .rdup_out(a6_wr[120]), .rdlo_out(a6_wr[124]));
			radix2 #(.width(width)) rd_st5_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[121]), .rdlo_in(a5_wr[125]),  .coef_in(coef[32]), .rdup_out(a6_wr[121]), .rdlo_out(a6_wr[125]));
			radix2 #(.width(width)) rd_st5_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[122]), .rdlo_in(a5_wr[126]),  .coef_in(coef[64]), .rdup_out(a6_wr[122]), .rdlo_out(a6_wr[126]));
			radix2 #(.width(width)) rd_st5_123  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[123]), .rdlo_in(a5_wr[127]),  .coef_in(coef[96]), .rdup_out(a6_wr[123]), .rdlo_out(a6_wr[127]));
			radix2 #(.width(width)) rd_st5_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[128]), .rdlo_in(a5_wr[132]),  .coef_in(coef[0]), .rdup_out(a6_wr[128]), .rdlo_out(a6_wr[132]));
			radix2 #(.width(width)) rd_st5_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[129]), .rdlo_in(a5_wr[133]),  .coef_in(coef[32]), .rdup_out(a6_wr[129]), .rdlo_out(a6_wr[133]));
			radix2 #(.width(width)) rd_st5_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[130]), .rdlo_in(a5_wr[134]),  .coef_in(coef[64]), .rdup_out(a6_wr[130]), .rdlo_out(a6_wr[134]));
			radix2 #(.width(width)) rd_st5_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[131]), .rdlo_in(a5_wr[135]),  .coef_in(coef[96]), .rdup_out(a6_wr[131]), .rdlo_out(a6_wr[135]));
			radix2 #(.width(width)) rd_st5_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[136]), .rdlo_in(a5_wr[140]),  .coef_in(coef[0]), .rdup_out(a6_wr[136]), .rdlo_out(a6_wr[140]));
			radix2 #(.width(width)) rd_st5_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[137]), .rdlo_in(a5_wr[141]),  .coef_in(coef[32]), .rdup_out(a6_wr[137]), .rdlo_out(a6_wr[141]));
			radix2 #(.width(width)) rd_st5_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[138]), .rdlo_in(a5_wr[142]),  .coef_in(coef[64]), .rdup_out(a6_wr[138]), .rdlo_out(a6_wr[142]));
			radix2 #(.width(width)) rd_st5_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[139]), .rdlo_in(a5_wr[143]),  .coef_in(coef[96]), .rdup_out(a6_wr[139]), .rdlo_out(a6_wr[143]));
			radix2 #(.width(width)) rd_st5_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[144]), .rdlo_in(a5_wr[148]),  .coef_in(coef[0]), .rdup_out(a6_wr[144]), .rdlo_out(a6_wr[148]));
			radix2 #(.width(width)) rd_st5_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[145]), .rdlo_in(a5_wr[149]),  .coef_in(coef[32]), .rdup_out(a6_wr[145]), .rdlo_out(a6_wr[149]));
			radix2 #(.width(width)) rd_st5_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[146]), .rdlo_in(a5_wr[150]),  .coef_in(coef[64]), .rdup_out(a6_wr[146]), .rdlo_out(a6_wr[150]));
			radix2 #(.width(width)) rd_st5_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[147]), .rdlo_in(a5_wr[151]),  .coef_in(coef[96]), .rdup_out(a6_wr[147]), .rdlo_out(a6_wr[151]));
			radix2 #(.width(width)) rd_st5_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[152]), .rdlo_in(a5_wr[156]),  .coef_in(coef[0]), .rdup_out(a6_wr[152]), .rdlo_out(a6_wr[156]));
			radix2 #(.width(width)) rd_st5_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[153]), .rdlo_in(a5_wr[157]),  .coef_in(coef[32]), .rdup_out(a6_wr[153]), .rdlo_out(a6_wr[157]));
			radix2 #(.width(width)) rd_st5_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[154]), .rdlo_in(a5_wr[158]),  .coef_in(coef[64]), .rdup_out(a6_wr[154]), .rdlo_out(a6_wr[158]));
			radix2 #(.width(width)) rd_st5_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[155]), .rdlo_in(a5_wr[159]),  .coef_in(coef[96]), .rdup_out(a6_wr[155]), .rdlo_out(a6_wr[159]));
			radix2 #(.width(width)) rd_st5_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[160]), .rdlo_in(a5_wr[164]),  .coef_in(coef[0]), .rdup_out(a6_wr[160]), .rdlo_out(a6_wr[164]));
			radix2 #(.width(width)) rd_st5_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[161]), .rdlo_in(a5_wr[165]),  .coef_in(coef[32]), .rdup_out(a6_wr[161]), .rdlo_out(a6_wr[165]));
			radix2 #(.width(width)) rd_st5_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[162]), .rdlo_in(a5_wr[166]),  .coef_in(coef[64]), .rdup_out(a6_wr[162]), .rdlo_out(a6_wr[166]));
			radix2 #(.width(width)) rd_st5_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[163]), .rdlo_in(a5_wr[167]),  .coef_in(coef[96]), .rdup_out(a6_wr[163]), .rdlo_out(a6_wr[167]));
			radix2 #(.width(width)) rd_st5_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[168]), .rdlo_in(a5_wr[172]),  .coef_in(coef[0]), .rdup_out(a6_wr[168]), .rdlo_out(a6_wr[172]));
			radix2 #(.width(width)) rd_st5_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[169]), .rdlo_in(a5_wr[173]),  .coef_in(coef[32]), .rdup_out(a6_wr[169]), .rdlo_out(a6_wr[173]));
			radix2 #(.width(width)) rd_st5_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[170]), .rdlo_in(a5_wr[174]),  .coef_in(coef[64]), .rdup_out(a6_wr[170]), .rdlo_out(a6_wr[174]));
			radix2 #(.width(width)) rd_st5_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[171]), .rdlo_in(a5_wr[175]),  .coef_in(coef[96]), .rdup_out(a6_wr[171]), .rdlo_out(a6_wr[175]));
			radix2 #(.width(width)) rd_st5_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[176]), .rdlo_in(a5_wr[180]),  .coef_in(coef[0]), .rdup_out(a6_wr[176]), .rdlo_out(a6_wr[180]));
			radix2 #(.width(width)) rd_st5_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[177]), .rdlo_in(a5_wr[181]),  .coef_in(coef[32]), .rdup_out(a6_wr[177]), .rdlo_out(a6_wr[181]));
			radix2 #(.width(width)) rd_st5_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[178]), .rdlo_in(a5_wr[182]),  .coef_in(coef[64]), .rdup_out(a6_wr[178]), .rdlo_out(a6_wr[182]));
			radix2 #(.width(width)) rd_st5_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[179]), .rdlo_in(a5_wr[183]),  .coef_in(coef[96]), .rdup_out(a6_wr[179]), .rdlo_out(a6_wr[183]));
			radix2 #(.width(width)) rd_st5_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[184]), .rdlo_in(a5_wr[188]),  .coef_in(coef[0]), .rdup_out(a6_wr[184]), .rdlo_out(a6_wr[188]));
			radix2 #(.width(width)) rd_st5_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[185]), .rdlo_in(a5_wr[189]),  .coef_in(coef[32]), .rdup_out(a6_wr[185]), .rdlo_out(a6_wr[189]));
			radix2 #(.width(width)) rd_st5_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[186]), .rdlo_in(a5_wr[190]),  .coef_in(coef[64]), .rdup_out(a6_wr[186]), .rdlo_out(a6_wr[190]));
			radix2 #(.width(width)) rd_st5_187  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[187]), .rdlo_in(a5_wr[191]),  .coef_in(coef[96]), .rdup_out(a6_wr[187]), .rdlo_out(a6_wr[191]));
			radix2 #(.width(width)) rd_st5_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[192]), .rdlo_in(a5_wr[196]),  .coef_in(coef[0]), .rdup_out(a6_wr[192]), .rdlo_out(a6_wr[196]));
			radix2 #(.width(width)) rd_st5_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[193]), .rdlo_in(a5_wr[197]),  .coef_in(coef[32]), .rdup_out(a6_wr[193]), .rdlo_out(a6_wr[197]));
			radix2 #(.width(width)) rd_st5_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[194]), .rdlo_in(a5_wr[198]),  .coef_in(coef[64]), .rdup_out(a6_wr[194]), .rdlo_out(a6_wr[198]));
			radix2 #(.width(width)) rd_st5_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[195]), .rdlo_in(a5_wr[199]),  .coef_in(coef[96]), .rdup_out(a6_wr[195]), .rdlo_out(a6_wr[199]));
			radix2 #(.width(width)) rd_st5_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[200]), .rdlo_in(a5_wr[204]),  .coef_in(coef[0]), .rdup_out(a6_wr[200]), .rdlo_out(a6_wr[204]));
			radix2 #(.width(width)) rd_st5_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[201]), .rdlo_in(a5_wr[205]),  .coef_in(coef[32]), .rdup_out(a6_wr[201]), .rdlo_out(a6_wr[205]));
			radix2 #(.width(width)) rd_st5_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[202]), .rdlo_in(a5_wr[206]),  .coef_in(coef[64]), .rdup_out(a6_wr[202]), .rdlo_out(a6_wr[206]));
			radix2 #(.width(width)) rd_st5_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[203]), .rdlo_in(a5_wr[207]),  .coef_in(coef[96]), .rdup_out(a6_wr[203]), .rdlo_out(a6_wr[207]));
			radix2 #(.width(width)) rd_st5_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[208]), .rdlo_in(a5_wr[212]),  .coef_in(coef[0]), .rdup_out(a6_wr[208]), .rdlo_out(a6_wr[212]));
			radix2 #(.width(width)) rd_st5_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[209]), .rdlo_in(a5_wr[213]),  .coef_in(coef[32]), .rdup_out(a6_wr[209]), .rdlo_out(a6_wr[213]));
			radix2 #(.width(width)) rd_st5_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[210]), .rdlo_in(a5_wr[214]),  .coef_in(coef[64]), .rdup_out(a6_wr[210]), .rdlo_out(a6_wr[214]));
			radix2 #(.width(width)) rd_st5_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[211]), .rdlo_in(a5_wr[215]),  .coef_in(coef[96]), .rdup_out(a6_wr[211]), .rdlo_out(a6_wr[215]));
			radix2 #(.width(width)) rd_st5_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[216]), .rdlo_in(a5_wr[220]),  .coef_in(coef[0]), .rdup_out(a6_wr[216]), .rdlo_out(a6_wr[220]));
			radix2 #(.width(width)) rd_st5_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[217]), .rdlo_in(a5_wr[221]),  .coef_in(coef[32]), .rdup_out(a6_wr[217]), .rdlo_out(a6_wr[221]));
			radix2 #(.width(width)) rd_st5_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[218]), .rdlo_in(a5_wr[222]),  .coef_in(coef[64]), .rdup_out(a6_wr[218]), .rdlo_out(a6_wr[222]));
			radix2 #(.width(width)) rd_st5_219  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[219]), .rdlo_in(a5_wr[223]),  .coef_in(coef[96]), .rdup_out(a6_wr[219]), .rdlo_out(a6_wr[223]));
			radix2 #(.width(width)) rd_st5_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[224]), .rdlo_in(a5_wr[228]),  .coef_in(coef[0]), .rdup_out(a6_wr[224]), .rdlo_out(a6_wr[228]));
			radix2 #(.width(width)) rd_st5_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[225]), .rdlo_in(a5_wr[229]),  .coef_in(coef[32]), .rdup_out(a6_wr[225]), .rdlo_out(a6_wr[229]));
			radix2 #(.width(width)) rd_st5_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[226]), .rdlo_in(a5_wr[230]),  .coef_in(coef[64]), .rdup_out(a6_wr[226]), .rdlo_out(a6_wr[230]));
			radix2 #(.width(width)) rd_st5_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[227]), .rdlo_in(a5_wr[231]),  .coef_in(coef[96]), .rdup_out(a6_wr[227]), .rdlo_out(a6_wr[231]));
			radix2 #(.width(width)) rd_st5_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[232]), .rdlo_in(a5_wr[236]),  .coef_in(coef[0]), .rdup_out(a6_wr[232]), .rdlo_out(a6_wr[236]));
			radix2 #(.width(width)) rd_st5_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[233]), .rdlo_in(a5_wr[237]),  .coef_in(coef[32]), .rdup_out(a6_wr[233]), .rdlo_out(a6_wr[237]));
			radix2 #(.width(width)) rd_st5_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[234]), .rdlo_in(a5_wr[238]),  .coef_in(coef[64]), .rdup_out(a6_wr[234]), .rdlo_out(a6_wr[238]));
			radix2 #(.width(width)) rd_st5_235  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[235]), .rdlo_in(a5_wr[239]),  .coef_in(coef[96]), .rdup_out(a6_wr[235]), .rdlo_out(a6_wr[239]));
			radix2 #(.width(width)) rd_st5_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[240]), .rdlo_in(a5_wr[244]),  .coef_in(coef[0]), .rdup_out(a6_wr[240]), .rdlo_out(a6_wr[244]));
			radix2 #(.width(width)) rd_st5_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[241]), .rdlo_in(a5_wr[245]),  .coef_in(coef[32]), .rdup_out(a6_wr[241]), .rdlo_out(a6_wr[245]));
			radix2 #(.width(width)) rd_st5_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[242]), .rdlo_in(a5_wr[246]),  .coef_in(coef[64]), .rdup_out(a6_wr[242]), .rdlo_out(a6_wr[246]));
			radix2 #(.width(width)) rd_st5_243  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[243]), .rdlo_in(a5_wr[247]),  .coef_in(coef[96]), .rdup_out(a6_wr[243]), .rdlo_out(a6_wr[247]));
			radix2 #(.width(width)) rd_st5_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[248]), .rdlo_in(a5_wr[252]),  .coef_in(coef[0]), .rdup_out(a6_wr[248]), .rdlo_out(a6_wr[252]));
			radix2 #(.width(width)) rd_st5_249  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[249]), .rdlo_in(a5_wr[253]),  .coef_in(coef[32]), .rdup_out(a6_wr[249]), .rdlo_out(a6_wr[253]));
			radix2 #(.width(width)) rd_st5_250  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[250]), .rdlo_in(a5_wr[254]),  .coef_in(coef[64]), .rdup_out(a6_wr[250]), .rdlo_out(a6_wr[254]));
			radix2 #(.width(width)) rd_st5_251  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[251]), .rdlo_in(a5_wr[255]),  .coef_in(coef[96]), .rdup_out(a6_wr[251]), .rdlo_out(a6_wr[255]));

		//--- radix stage 6
			radix2 #(.width(width)) rd_st6_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[0]), .rdlo_in(a6_wr[2]),  .coef_in(coef[0]), .rdup_out(a7_wr[0]), .rdlo_out(a7_wr[2]));
			radix2 #(.width(width)) rd_st6_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[1]), .rdlo_in(a6_wr[3]),  .coef_in(coef[64]), .rdup_out(a7_wr[1]), .rdlo_out(a7_wr[3]));
			radix2 #(.width(width)) rd_st6_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[4]), .rdlo_in(a6_wr[6]),  .coef_in(coef[0]), .rdup_out(a7_wr[4]), .rdlo_out(a7_wr[6]));
			radix2 #(.width(width)) rd_st6_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[5]), .rdlo_in(a6_wr[7]),  .coef_in(coef[64]), .rdup_out(a7_wr[5]), .rdlo_out(a7_wr[7]));
			radix2 #(.width(width)) rd_st6_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[8]), .rdlo_in(a6_wr[10]),  .coef_in(coef[0]), .rdup_out(a7_wr[8]), .rdlo_out(a7_wr[10]));
			radix2 #(.width(width)) rd_st6_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[9]), .rdlo_in(a6_wr[11]),  .coef_in(coef[64]), .rdup_out(a7_wr[9]), .rdlo_out(a7_wr[11]));
			radix2 #(.width(width)) rd_st6_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[12]), .rdlo_in(a6_wr[14]),  .coef_in(coef[0]), .rdup_out(a7_wr[12]), .rdlo_out(a7_wr[14]));
			radix2 #(.width(width)) rd_st6_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[13]), .rdlo_in(a6_wr[15]),  .coef_in(coef[64]), .rdup_out(a7_wr[13]), .rdlo_out(a7_wr[15]));
			radix2 #(.width(width)) rd_st6_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[16]), .rdlo_in(a6_wr[18]),  .coef_in(coef[0]), .rdup_out(a7_wr[16]), .rdlo_out(a7_wr[18]));
			radix2 #(.width(width)) rd_st6_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[17]), .rdlo_in(a6_wr[19]),  .coef_in(coef[64]), .rdup_out(a7_wr[17]), .rdlo_out(a7_wr[19]));
			radix2 #(.width(width)) rd_st6_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[20]), .rdlo_in(a6_wr[22]),  .coef_in(coef[0]), .rdup_out(a7_wr[20]), .rdlo_out(a7_wr[22]));
			radix2 #(.width(width)) rd_st6_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[21]), .rdlo_in(a6_wr[23]),  .coef_in(coef[64]), .rdup_out(a7_wr[21]), .rdlo_out(a7_wr[23]));
			radix2 #(.width(width)) rd_st6_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[24]), .rdlo_in(a6_wr[26]),  .coef_in(coef[0]), .rdup_out(a7_wr[24]), .rdlo_out(a7_wr[26]));
			radix2 #(.width(width)) rd_st6_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[25]), .rdlo_in(a6_wr[27]),  .coef_in(coef[64]), .rdup_out(a7_wr[25]), .rdlo_out(a7_wr[27]));
			radix2 #(.width(width)) rd_st6_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[28]), .rdlo_in(a6_wr[30]),  .coef_in(coef[0]), .rdup_out(a7_wr[28]), .rdlo_out(a7_wr[30]));
			radix2 #(.width(width)) rd_st6_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[29]), .rdlo_in(a6_wr[31]),  .coef_in(coef[64]), .rdup_out(a7_wr[29]), .rdlo_out(a7_wr[31]));
			radix2 #(.width(width)) rd_st6_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[32]), .rdlo_in(a6_wr[34]),  .coef_in(coef[0]), .rdup_out(a7_wr[32]), .rdlo_out(a7_wr[34]));
			radix2 #(.width(width)) rd_st6_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[33]), .rdlo_in(a6_wr[35]),  .coef_in(coef[64]), .rdup_out(a7_wr[33]), .rdlo_out(a7_wr[35]));
			radix2 #(.width(width)) rd_st6_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[36]), .rdlo_in(a6_wr[38]),  .coef_in(coef[0]), .rdup_out(a7_wr[36]), .rdlo_out(a7_wr[38]));
			radix2 #(.width(width)) rd_st6_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[37]), .rdlo_in(a6_wr[39]),  .coef_in(coef[64]), .rdup_out(a7_wr[37]), .rdlo_out(a7_wr[39]));
			radix2 #(.width(width)) rd_st6_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[40]), .rdlo_in(a6_wr[42]),  .coef_in(coef[0]), .rdup_out(a7_wr[40]), .rdlo_out(a7_wr[42]));
			radix2 #(.width(width)) rd_st6_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[41]), .rdlo_in(a6_wr[43]),  .coef_in(coef[64]), .rdup_out(a7_wr[41]), .rdlo_out(a7_wr[43]));
			radix2 #(.width(width)) rd_st6_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[44]), .rdlo_in(a6_wr[46]),  .coef_in(coef[0]), .rdup_out(a7_wr[44]), .rdlo_out(a7_wr[46]));
			radix2 #(.width(width)) rd_st6_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[45]), .rdlo_in(a6_wr[47]),  .coef_in(coef[64]), .rdup_out(a7_wr[45]), .rdlo_out(a7_wr[47]));
			radix2 #(.width(width)) rd_st6_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[48]), .rdlo_in(a6_wr[50]),  .coef_in(coef[0]), .rdup_out(a7_wr[48]), .rdlo_out(a7_wr[50]));
			radix2 #(.width(width)) rd_st6_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[49]), .rdlo_in(a6_wr[51]),  .coef_in(coef[64]), .rdup_out(a7_wr[49]), .rdlo_out(a7_wr[51]));
			radix2 #(.width(width)) rd_st6_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[52]), .rdlo_in(a6_wr[54]),  .coef_in(coef[0]), .rdup_out(a7_wr[52]), .rdlo_out(a7_wr[54]));
			radix2 #(.width(width)) rd_st6_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[53]), .rdlo_in(a6_wr[55]),  .coef_in(coef[64]), .rdup_out(a7_wr[53]), .rdlo_out(a7_wr[55]));
			radix2 #(.width(width)) rd_st6_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[56]), .rdlo_in(a6_wr[58]),  .coef_in(coef[0]), .rdup_out(a7_wr[56]), .rdlo_out(a7_wr[58]));
			radix2 #(.width(width)) rd_st6_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[57]), .rdlo_in(a6_wr[59]),  .coef_in(coef[64]), .rdup_out(a7_wr[57]), .rdlo_out(a7_wr[59]));
			radix2 #(.width(width)) rd_st6_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[60]), .rdlo_in(a6_wr[62]),  .coef_in(coef[0]), .rdup_out(a7_wr[60]), .rdlo_out(a7_wr[62]));
			radix2 #(.width(width)) rd_st6_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[61]), .rdlo_in(a6_wr[63]),  .coef_in(coef[64]), .rdup_out(a7_wr[61]), .rdlo_out(a7_wr[63]));
			radix2 #(.width(width)) rd_st6_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[64]), .rdlo_in(a6_wr[66]),  .coef_in(coef[0]), .rdup_out(a7_wr[64]), .rdlo_out(a7_wr[66]));
			radix2 #(.width(width)) rd_st6_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[65]), .rdlo_in(a6_wr[67]),  .coef_in(coef[64]), .rdup_out(a7_wr[65]), .rdlo_out(a7_wr[67]));
			radix2 #(.width(width)) rd_st6_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[68]), .rdlo_in(a6_wr[70]),  .coef_in(coef[0]), .rdup_out(a7_wr[68]), .rdlo_out(a7_wr[70]));
			radix2 #(.width(width)) rd_st6_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[69]), .rdlo_in(a6_wr[71]),  .coef_in(coef[64]), .rdup_out(a7_wr[69]), .rdlo_out(a7_wr[71]));
			radix2 #(.width(width)) rd_st6_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[72]), .rdlo_in(a6_wr[74]),  .coef_in(coef[0]), .rdup_out(a7_wr[72]), .rdlo_out(a7_wr[74]));
			radix2 #(.width(width)) rd_st6_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[73]), .rdlo_in(a6_wr[75]),  .coef_in(coef[64]), .rdup_out(a7_wr[73]), .rdlo_out(a7_wr[75]));
			radix2 #(.width(width)) rd_st6_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[76]), .rdlo_in(a6_wr[78]),  .coef_in(coef[0]), .rdup_out(a7_wr[76]), .rdlo_out(a7_wr[78]));
			radix2 #(.width(width)) rd_st6_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[77]), .rdlo_in(a6_wr[79]),  .coef_in(coef[64]), .rdup_out(a7_wr[77]), .rdlo_out(a7_wr[79]));
			radix2 #(.width(width)) rd_st6_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[80]), .rdlo_in(a6_wr[82]),  .coef_in(coef[0]), .rdup_out(a7_wr[80]), .rdlo_out(a7_wr[82]));
			radix2 #(.width(width)) rd_st6_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[81]), .rdlo_in(a6_wr[83]),  .coef_in(coef[64]), .rdup_out(a7_wr[81]), .rdlo_out(a7_wr[83]));
			radix2 #(.width(width)) rd_st6_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[84]), .rdlo_in(a6_wr[86]),  .coef_in(coef[0]), .rdup_out(a7_wr[84]), .rdlo_out(a7_wr[86]));
			radix2 #(.width(width)) rd_st6_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[85]), .rdlo_in(a6_wr[87]),  .coef_in(coef[64]), .rdup_out(a7_wr[85]), .rdlo_out(a7_wr[87]));
			radix2 #(.width(width)) rd_st6_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[88]), .rdlo_in(a6_wr[90]),  .coef_in(coef[0]), .rdup_out(a7_wr[88]), .rdlo_out(a7_wr[90]));
			radix2 #(.width(width)) rd_st6_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[89]), .rdlo_in(a6_wr[91]),  .coef_in(coef[64]), .rdup_out(a7_wr[89]), .rdlo_out(a7_wr[91]));
			radix2 #(.width(width)) rd_st6_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[92]), .rdlo_in(a6_wr[94]),  .coef_in(coef[0]), .rdup_out(a7_wr[92]), .rdlo_out(a7_wr[94]));
			radix2 #(.width(width)) rd_st6_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[93]), .rdlo_in(a6_wr[95]),  .coef_in(coef[64]), .rdup_out(a7_wr[93]), .rdlo_out(a7_wr[95]));
			radix2 #(.width(width)) rd_st6_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[96]), .rdlo_in(a6_wr[98]),  .coef_in(coef[0]), .rdup_out(a7_wr[96]), .rdlo_out(a7_wr[98]));
			radix2 #(.width(width)) rd_st6_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[97]), .rdlo_in(a6_wr[99]),  .coef_in(coef[64]), .rdup_out(a7_wr[97]), .rdlo_out(a7_wr[99]));
			radix2 #(.width(width)) rd_st6_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[100]), .rdlo_in(a6_wr[102]),  .coef_in(coef[0]), .rdup_out(a7_wr[100]), .rdlo_out(a7_wr[102]));
			radix2 #(.width(width)) rd_st6_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[101]), .rdlo_in(a6_wr[103]),  .coef_in(coef[64]), .rdup_out(a7_wr[101]), .rdlo_out(a7_wr[103]));
			radix2 #(.width(width)) rd_st6_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[104]), .rdlo_in(a6_wr[106]),  .coef_in(coef[0]), .rdup_out(a7_wr[104]), .rdlo_out(a7_wr[106]));
			radix2 #(.width(width)) rd_st6_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[105]), .rdlo_in(a6_wr[107]),  .coef_in(coef[64]), .rdup_out(a7_wr[105]), .rdlo_out(a7_wr[107]));
			radix2 #(.width(width)) rd_st6_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[108]), .rdlo_in(a6_wr[110]),  .coef_in(coef[0]), .rdup_out(a7_wr[108]), .rdlo_out(a7_wr[110]));
			radix2 #(.width(width)) rd_st6_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[109]), .rdlo_in(a6_wr[111]),  .coef_in(coef[64]), .rdup_out(a7_wr[109]), .rdlo_out(a7_wr[111]));
			radix2 #(.width(width)) rd_st6_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[112]), .rdlo_in(a6_wr[114]),  .coef_in(coef[0]), .rdup_out(a7_wr[112]), .rdlo_out(a7_wr[114]));
			radix2 #(.width(width)) rd_st6_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[113]), .rdlo_in(a6_wr[115]),  .coef_in(coef[64]), .rdup_out(a7_wr[113]), .rdlo_out(a7_wr[115]));
			radix2 #(.width(width)) rd_st6_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[116]), .rdlo_in(a6_wr[118]),  .coef_in(coef[0]), .rdup_out(a7_wr[116]), .rdlo_out(a7_wr[118]));
			radix2 #(.width(width)) rd_st6_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[117]), .rdlo_in(a6_wr[119]),  .coef_in(coef[64]), .rdup_out(a7_wr[117]), .rdlo_out(a7_wr[119]));
			radix2 #(.width(width)) rd_st6_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[120]), .rdlo_in(a6_wr[122]),  .coef_in(coef[0]), .rdup_out(a7_wr[120]), .rdlo_out(a7_wr[122]));
			radix2 #(.width(width)) rd_st6_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[121]), .rdlo_in(a6_wr[123]),  .coef_in(coef[64]), .rdup_out(a7_wr[121]), .rdlo_out(a7_wr[123]));
			radix2 #(.width(width)) rd_st6_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[124]), .rdlo_in(a6_wr[126]),  .coef_in(coef[0]), .rdup_out(a7_wr[124]), .rdlo_out(a7_wr[126]));
			radix2 #(.width(width)) rd_st6_125  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[125]), .rdlo_in(a6_wr[127]),  .coef_in(coef[64]), .rdup_out(a7_wr[125]), .rdlo_out(a7_wr[127]));
			radix2 #(.width(width)) rd_st6_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[128]), .rdlo_in(a6_wr[130]),  .coef_in(coef[0]), .rdup_out(a7_wr[128]), .rdlo_out(a7_wr[130]));
			radix2 #(.width(width)) rd_st6_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[129]), .rdlo_in(a6_wr[131]),  .coef_in(coef[64]), .rdup_out(a7_wr[129]), .rdlo_out(a7_wr[131]));
			radix2 #(.width(width)) rd_st6_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[132]), .rdlo_in(a6_wr[134]),  .coef_in(coef[0]), .rdup_out(a7_wr[132]), .rdlo_out(a7_wr[134]));
			radix2 #(.width(width)) rd_st6_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[133]), .rdlo_in(a6_wr[135]),  .coef_in(coef[64]), .rdup_out(a7_wr[133]), .rdlo_out(a7_wr[135]));
			radix2 #(.width(width)) rd_st6_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[136]), .rdlo_in(a6_wr[138]),  .coef_in(coef[0]), .rdup_out(a7_wr[136]), .rdlo_out(a7_wr[138]));
			radix2 #(.width(width)) rd_st6_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[137]), .rdlo_in(a6_wr[139]),  .coef_in(coef[64]), .rdup_out(a7_wr[137]), .rdlo_out(a7_wr[139]));
			radix2 #(.width(width)) rd_st6_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[140]), .rdlo_in(a6_wr[142]),  .coef_in(coef[0]), .rdup_out(a7_wr[140]), .rdlo_out(a7_wr[142]));
			radix2 #(.width(width)) rd_st6_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[141]), .rdlo_in(a6_wr[143]),  .coef_in(coef[64]), .rdup_out(a7_wr[141]), .rdlo_out(a7_wr[143]));
			radix2 #(.width(width)) rd_st6_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[144]), .rdlo_in(a6_wr[146]),  .coef_in(coef[0]), .rdup_out(a7_wr[144]), .rdlo_out(a7_wr[146]));
			radix2 #(.width(width)) rd_st6_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[145]), .rdlo_in(a6_wr[147]),  .coef_in(coef[64]), .rdup_out(a7_wr[145]), .rdlo_out(a7_wr[147]));
			radix2 #(.width(width)) rd_st6_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[148]), .rdlo_in(a6_wr[150]),  .coef_in(coef[0]), .rdup_out(a7_wr[148]), .rdlo_out(a7_wr[150]));
			radix2 #(.width(width)) rd_st6_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[149]), .rdlo_in(a6_wr[151]),  .coef_in(coef[64]), .rdup_out(a7_wr[149]), .rdlo_out(a7_wr[151]));
			radix2 #(.width(width)) rd_st6_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[152]), .rdlo_in(a6_wr[154]),  .coef_in(coef[0]), .rdup_out(a7_wr[152]), .rdlo_out(a7_wr[154]));
			radix2 #(.width(width)) rd_st6_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[153]), .rdlo_in(a6_wr[155]),  .coef_in(coef[64]), .rdup_out(a7_wr[153]), .rdlo_out(a7_wr[155]));
			radix2 #(.width(width)) rd_st6_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[156]), .rdlo_in(a6_wr[158]),  .coef_in(coef[0]), .rdup_out(a7_wr[156]), .rdlo_out(a7_wr[158]));
			radix2 #(.width(width)) rd_st6_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[157]), .rdlo_in(a6_wr[159]),  .coef_in(coef[64]), .rdup_out(a7_wr[157]), .rdlo_out(a7_wr[159]));
			radix2 #(.width(width)) rd_st6_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[160]), .rdlo_in(a6_wr[162]),  .coef_in(coef[0]), .rdup_out(a7_wr[160]), .rdlo_out(a7_wr[162]));
			radix2 #(.width(width)) rd_st6_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[161]), .rdlo_in(a6_wr[163]),  .coef_in(coef[64]), .rdup_out(a7_wr[161]), .rdlo_out(a7_wr[163]));
			radix2 #(.width(width)) rd_st6_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[164]), .rdlo_in(a6_wr[166]),  .coef_in(coef[0]), .rdup_out(a7_wr[164]), .rdlo_out(a7_wr[166]));
			radix2 #(.width(width)) rd_st6_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[165]), .rdlo_in(a6_wr[167]),  .coef_in(coef[64]), .rdup_out(a7_wr[165]), .rdlo_out(a7_wr[167]));
			radix2 #(.width(width)) rd_st6_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[168]), .rdlo_in(a6_wr[170]),  .coef_in(coef[0]), .rdup_out(a7_wr[168]), .rdlo_out(a7_wr[170]));
			radix2 #(.width(width)) rd_st6_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[169]), .rdlo_in(a6_wr[171]),  .coef_in(coef[64]), .rdup_out(a7_wr[169]), .rdlo_out(a7_wr[171]));
			radix2 #(.width(width)) rd_st6_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[172]), .rdlo_in(a6_wr[174]),  .coef_in(coef[0]), .rdup_out(a7_wr[172]), .rdlo_out(a7_wr[174]));
			radix2 #(.width(width)) rd_st6_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[173]), .rdlo_in(a6_wr[175]),  .coef_in(coef[64]), .rdup_out(a7_wr[173]), .rdlo_out(a7_wr[175]));
			radix2 #(.width(width)) rd_st6_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[176]), .rdlo_in(a6_wr[178]),  .coef_in(coef[0]), .rdup_out(a7_wr[176]), .rdlo_out(a7_wr[178]));
			radix2 #(.width(width)) rd_st6_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[177]), .rdlo_in(a6_wr[179]),  .coef_in(coef[64]), .rdup_out(a7_wr[177]), .rdlo_out(a7_wr[179]));
			radix2 #(.width(width)) rd_st6_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[180]), .rdlo_in(a6_wr[182]),  .coef_in(coef[0]), .rdup_out(a7_wr[180]), .rdlo_out(a7_wr[182]));
			radix2 #(.width(width)) rd_st6_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[181]), .rdlo_in(a6_wr[183]),  .coef_in(coef[64]), .rdup_out(a7_wr[181]), .rdlo_out(a7_wr[183]));
			radix2 #(.width(width)) rd_st6_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[184]), .rdlo_in(a6_wr[186]),  .coef_in(coef[0]), .rdup_out(a7_wr[184]), .rdlo_out(a7_wr[186]));
			radix2 #(.width(width)) rd_st6_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[185]), .rdlo_in(a6_wr[187]),  .coef_in(coef[64]), .rdup_out(a7_wr[185]), .rdlo_out(a7_wr[187]));
			radix2 #(.width(width)) rd_st6_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[188]), .rdlo_in(a6_wr[190]),  .coef_in(coef[0]), .rdup_out(a7_wr[188]), .rdlo_out(a7_wr[190]));
			radix2 #(.width(width)) rd_st6_189  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[189]), .rdlo_in(a6_wr[191]),  .coef_in(coef[64]), .rdup_out(a7_wr[189]), .rdlo_out(a7_wr[191]));
			radix2 #(.width(width)) rd_st6_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[192]), .rdlo_in(a6_wr[194]),  .coef_in(coef[0]), .rdup_out(a7_wr[192]), .rdlo_out(a7_wr[194]));
			radix2 #(.width(width)) rd_st6_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[193]), .rdlo_in(a6_wr[195]),  .coef_in(coef[64]), .rdup_out(a7_wr[193]), .rdlo_out(a7_wr[195]));
			radix2 #(.width(width)) rd_st6_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[196]), .rdlo_in(a6_wr[198]),  .coef_in(coef[0]), .rdup_out(a7_wr[196]), .rdlo_out(a7_wr[198]));
			radix2 #(.width(width)) rd_st6_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[197]), .rdlo_in(a6_wr[199]),  .coef_in(coef[64]), .rdup_out(a7_wr[197]), .rdlo_out(a7_wr[199]));
			radix2 #(.width(width)) rd_st6_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[200]), .rdlo_in(a6_wr[202]),  .coef_in(coef[0]), .rdup_out(a7_wr[200]), .rdlo_out(a7_wr[202]));
			radix2 #(.width(width)) rd_st6_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[201]), .rdlo_in(a6_wr[203]),  .coef_in(coef[64]), .rdup_out(a7_wr[201]), .rdlo_out(a7_wr[203]));
			radix2 #(.width(width)) rd_st6_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[204]), .rdlo_in(a6_wr[206]),  .coef_in(coef[0]), .rdup_out(a7_wr[204]), .rdlo_out(a7_wr[206]));
			radix2 #(.width(width)) rd_st6_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[205]), .rdlo_in(a6_wr[207]),  .coef_in(coef[64]), .rdup_out(a7_wr[205]), .rdlo_out(a7_wr[207]));
			radix2 #(.width(width)) rd_st6_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[208]), .rdlo_in(a6_wr[210]),  .coef_in(coef[0]), .rdup_out(a7_wr[208]), .rdlo_out(a7_wr[210]));
			radix2 #(.width(width)) rd_st6_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[209]), .rdlo_in(a6_wr[211]),  .coef_in(coef[64]), .rdup_out(a7_wr[209]), .rdlo_out(a7_wr[211]));
			radix2 #(.width(width)) rd_st6_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[212]), .rdlo_in(a6_wr[214]),  .coef_in(coef[0]), .rdup_out(a7_wr[212]), .rdlo_out(a7_wr[214]));
			radix2 #(.width(width)) rd_st6_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[213]), .rdlo_in(a6_wr[215]),  .coef_in(coef[64]), .rdup_out(a7_wr[213]), .rdlo_out(a7_wr[215]));
			radix2 #(.width(width)) rd_st6_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[216]), .rdlo_in(a6_wr[218]),  .coef_in(coef[0]), .rdup_out(a7_wr[216]), .rdlo_out(a7_wr[218]));
			radix2 #(.width(width)) rd_st6_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[217]), .rdlo_in(a6_wr[219]),  .coef_in(coef[64]), .rdup_out(a7_wr[217]), .rdlo_out(a7_wr[219]));
			radix2 #(.width(width)) rd_st6_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[220]), .rdlo_in(a6_wr[222]),  .coef_in(coef[0]), .rdup_out(a7_wr[220]), .rdlo_out(a7_wr[222]));
			radix2 #(.width(width)) rd_st6_221  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[221]), .rdlo_in(a6_wr[223]),  .coef_in(coef[64]), .rdup_out(a7_wr[221]), .rdlo_out(a7_wr[223]));
			radix2 #(.width(width)) rd_st6_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[224]), .rdlo_in(a6_wr[226]),  .coef_in(coef[0]), .rdup_out(a7_wr[224]), .rdlo_out(a7_wr[226]));
			radix2 #(.width(width)) rd_st6_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[225]), .rdlo_in(a6_wr[227]),  .coef_in(coef[64]), .rdup_out(a7_wr[225]), .rdlo_out(a7_wr[227]));
			radix2 #(.width(width)) rd_st6_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[228]), .rdlo_in(a6_wr[230]),  .coef_in(coef[0]), .rdup_out(a7_wr[228]), .rdlo_out(a7_wr[230]));
			radix2 #(.width(width)) rd_st6_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[229]), .rdlo_in(a6_wr[231]),  .coef_in(coef[64]), .rdup_out(a7_wr[229]), .rdlo_out(a7_wr[231]));
			radix2 #(.width(width)) rd_st6_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[232]), .rdlo_in(a6_wr[234]),  .coef_in(coef[0]), .rdup_out(a7_wr[232]), .rdlo_out(a7_wr[234]));
			radix2 #(.width(width)) rd_st6_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[233]), .rdlo_in(a6_wr[235]),  .coef_in(coef[64]), .rdup_out(a7_wr[233]), .rdlo_out(a7_wr[235]));
			radix2 #(.width(width)) rd_st6_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[236]), .rdlo_in(a6_wr[238]),  .coef_in(coef[0]), .rdup_out(a7_wr[236]), .rdlo_out(a7_wr[238]));
			radix2 #(.width(width)) rd_st6_237  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[237]), .rdlo_in(a6_wr[239]),  .coef_in(coef[64]), .rdup_out(a7_wr[237]), .rdlo_out(a7_wr[239]));
			radix2 #(.width(width)) rd_st6_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[240]), .rdlo_in(a6_wr[242]),  .coef_in(coef[0]), .rdup_out(a7_wr[240]), .rdlo_out(a7_wr[242]));
			radix2 #(.width(width)) rd_st6_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[241]), .rdlo_in(a6_wr[243]),  .coef_in(coef[64]), .rdup_out(a7_wr[241]), .rdlo_out(a7_wr[243]));
			radix2 #(.width(width)) rd_st6_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[244]), .rdlo_in(a6_wr[246]),  .coef_in(coef[0]), .rdup_out(a7_wr[244]), .rdlo_out(a7_wr[246]));
			radix2 #(.width(width)) rd_st6_245  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[245]), .rdlo_in(a6_wr[247]),  .coef_in(coef[64]), .rdup_out(a7_wr[245]), .rdlo_out(a7_wr[247]));
			radix2 #(.width(width)) rd_st6_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[248]), .rdlo_in(a6_wr[250]),  .coef_in(coef[0]), .rdup_out(a7_wr[248]), .rdlo_out(a7_wr[250]));
			radix2 #(.width(width)) rd_st6_249  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[249]), .rdlo_in(a6_wr[251]),  .coef_in(coef[64]), .rdup_out(a7_wr[249]), .rdlo_out(a7_wr[251]));
			radix2 #(.width(width)) rd_st6_252  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[252]), .rdlo_in(a6_wr[254]),  .coef_in(coef[0]), .rdup_out(a7_wr[252]), .rdlo_out(a7_wr[254]));
			radix2 #(.width(width)) rd_st6_253  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[253]), .rdlo_in(a6_wr[255]),  .coef_in(coef[64]), .rdup_out(a7_wr[253]), .rdlo_out(a7_wr[255]));

		//--- radix stage 7
			radix2 #(.width(width)) rd_st7_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[0]), .rdlo_in(a7_wr[1]),  .coef_in(coef[0]), .rdup_out(a8_wr[0]), .rdlo_out(a8_wr[1]));
			radix2 #(.width(width)) rd_st7_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[2]), .rdlo_in(a7_wr[3]),  .coef_in(coef[0]), .rdup_out(a8_wr[2]), .rdlo_out(a8_wr[3]));
			radix2 #(.width(width)) rd_st7_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[4]), .rdlo_in(a7_wr[5]),  .coef_in(coef[0]), .rdup_out(a8_wr[4]), .rdlo_out(a8_wr[5]));
			radix2 #(.width(width)) rd_st7_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[6]), .rdlo_in(a7_wr[7]),  .coef_in(coef[0]), .rdup_out(a8_wr[6]), .rdlo_out(a8_wr[7]));
			radix2 #(.width(width)) rd_st7_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[8]), .rdlo_in(a7_wr[9]),  .coef_in(coef[0]), .rdup_out(a8_wr[8]), .rdlo_out(a8_wr[9]));
			radix2 #(.width(width)) rd_st7_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[10]), .rdlo_in(a7_wr[11]),  .coef_in(coef[0]), .rdup_out(a8_wr[10]), .rdlo_out(a8_wr[11]));
			radix2 #(.width(width)) rd_st7_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[12]), .rdlo_in(a7_wr[13]),  .coef_in(coef[0]), .rdup_out(a8_wr[12]), .rdlo_out(a8_wr[13]));
			radix2 #(.width(width)) rd_st7_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[14]), .rdlo_in(a7_wr[15]),  .coef_in(coef[0]), .rdup_out(a8_wr[14]), .rdlo_out(a8_wr[15]));
			radix2 #(.width(width)) rd_st7_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[16]), .rdlo_in(a7_wr[17]),  .coef_in(coef[0]), .rdup_out(a8_wr[16]), .rdlo_out(a8_wr[17]));
			radix2 #(.width(width)) rd_st7_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[18]), .rdlo_in(a7_wr[19]),  .coef_in(coef[0]), .rdup_out(a8_wr[18]), .rdlo_out(a8_wr[19]));
			radix2 #(.width(width)) rd_st7_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[20]), .rdlo_in(a7_wr[21]),  .coef_in(coef[0]), .rdup_out(a8_wr[20]), .rdlo_out(a8_wr[21]));
			radix2 #(.width(width)) rd_st7_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[22]), .rdlo_in(a7_wr[23]),  .coef_in(coef[0]), .rdup_out(a8_wr[22]), .rdlo_out(a8_wr[23]));
			radix2 #(.width(width)) rd_st7_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[24]), .rdlo_in(a7_wr[25]),  .coef_in(coef[0]), .rdup_out(a8_wr[24]), .rdlo_out(a8_wr[25]));
			radix2 #(.width(width)) rd_st7_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[26]), .rdlo_in(a7_wr[27]),  .coef_in(coef[0]), .rdup_out(a8_wr[26]), .rdlo_out(a8_wr[27]));
			radix2 #(.width(width)) rd_st7_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[28]), .rdlo_in(a7_wr[29]),  .coef_in(coef[0]), .rdup_out(a8_wr[28]), .rdlo_out(a8_wr[29]));
			radix2 #(.width(width)) rd_st7_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[30]), .rdlo_in(a7_wr[31]),  .coef_in(coef[0]), .rdup_out(a8_wr[30]), .rdlo_out(a8_wr[31]));
			radix2 #(.width(width)) rd_st7_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[32]), .rdlo_in(a7_wr[33]),  .coef_in(coef[0]), .rdup_out(a8_wr[32]), .rdlo_out(a8_wr[33]));
			radix2 #(.width(width)) rd_st7_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[34]), .rdlo_in(a7_wr[35]),  .coef_in(coef[0]), .rdup_out(a8_wr[34]), .rdlo_out(a8_wr[35]));
			radix2 #(.width(width)) rd_st7_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[36]), .rdlo_in(a7_wr[37]),  .coef_in(coef[0]), .rdup_out(a8_wr[36]), .rdlo_out(a8_wr[37]));
			radix2 #(.width(width)) rd_st7_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[38]), .rdlo_in(a7_wr[39]),  .coef_in(coef[0]), .rdup_out(a8_wr[38]), .rdlo_out(a8_wr[39]));
			radix2 #(.width(width)) rd_st7_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[40]), .rdlo_in(a7_wr[41]),  .coef_in(coef[0]), .rdup_out(a8_wr[40]), .rdlo_out(a8_wr[41]));
			radix2 #(.width(width)) rd_st7_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[42]), .rdlo_in(a7_wr[43]),  .coef_in(coef[0]), .rdup_out(a8_wr[42]), .rdlo_out(a8_wr[43]));
			radix2 #(.width(width)) rd_st7_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[44]), .rdlo_in(a7_wr[45]),  .coef_in(coef[0]), .rdup_out(a8_wr[44]), .rdlo_out(a8_wr[45]));
			radix2 #(.width(width)) rd_st7_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[46]), .rdlo_in(a7_wr[47]),  .coef_in(coef[0]), .rdup_out(a8_wr[46]), .rdlo_out(a8_wr[47]));
			radix2 #(.width(width)) rd_st7_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[48]), .rdlo_in(a7_wr[49]),  .coef_in(coef[0]), .rdup_out(a8_wr[48]), .rdlo_out(a8_wr[49]));
			radix2 #(.width(width)) rd_st7_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[50]), .rdlo_in(a7_wr[51]),  .coef_in(coef[0]), .rdup_out(a8_wr[50]), .rdlo_out(a8_wr[51]));
			radix2 #(.width(width)) rd_st7_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[52]), .rdlo_in(a7_wr[53]),  .coef_in(coef[0]), .rdup_out(a8_wr[52]), .rdlo_out(a8_wr[53]));
			radix2 #(.width(width)) rd_st7_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[54]), .rdlo_in(a7_wr[55]),  .coef_in(coef[0]), .rdup_out(a8_wr[54]), .rdlo_out(a8_wr[55]));
			radix2 #(.width(width)) rd_st7_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[56]), .rdlo_in(a7_wr[57]),  .coef_in(coef[0]), .rdup_out(a8_wr[56]), .rdlo_out(a8_wr[57]));
			radix2 #(.width(width)) rd_st7_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[58]), .rdlo_in(a7_wr[59]),  .coef_in(coef[0]), .rdup_out(a8_wr[58]), .rdlo_out(a8_wr[59]));
			radix2 #(.width(width)) rd_st7_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[60]), .rdlo_in(a7_wr[61]),  .coef_in(coef[0]), .rdup_out(a8_wr[60]), .rdlo_out(a8_wr[61]));
			radix2 #(.width(width)) rd_st7_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[62]), .rdlo_in(a7_wr[63]),  .coef_in(coef[0]), .rdup_out(a8_wr[62]), .rdlo_out(a8_wr[63]));
			radix2 #(.width(width)) rd_st7_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[64]), .rdlo_in(a7_wr[65]),  .coef_in(coef[0]), .rdup_out(a8_wr[64]), .rdlo_out(a8_wr[65]));
			radix2 #(.width(width)) rd_st7_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[66]), .rdlo_in(a7_wr[67]),  .coef_in(coef[0]), .rdup_out(a8_wr[66]), .rdlo_out(a8_wr[67]));
			radix2 #(.width(width)) rd_st7_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[68]), .rdlo_in(a7_wr[69]),  .coef_in(coef[0]), .rdup_out(a8_wr[68]), .rdlo_out(a8_wr[69]));
			radix2 #(.width(width)) rd_st7_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[70]), .rdlo_in(a7_wr[71]),  .coef_in(coef[0]), .rdup_out(a8_wr[70]), .rdlo_out(a8_wr[71]));
			radix2 #(.width(width)) rd_st7_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[72]), .rdlo_in(a7_wr[73]),  .coef_in(coef[0]), .rdup_out(a8_wr[72]), .rdlo_out(a8_wr[73]));
			radix2 #(.width(width)) rd_st7_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[74]), .rdlo_in(a7_wr[75]),  .coef_in(coef[0]), .rdup_out(a8_wr[74]), .rdlo_out(a8_wr[75]));
			radix2 #(.width(width)) rd_st7_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[76]), .rdlo_in(a7_wr[77]),  .coef_in(coef[0]), .rdup_out(a8_wr[76]), .rdlo_out(a8_wr[77]));
			radix2 #(.width(width)) rd_st7_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[78]), .rdlo_in(a7_wr[79]),  .coef_in(coef[0]), .rdup_out(a8_wr[78]), .rdlo_out(a8_wr[79]));
			radix2 #(.width(width)) rd_st7_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[80]), .rdlo_in(a7_wr[81]),  .coef_in(coef[0]), .rdup_out(a8_wr[80]), .rdlo_out(a8_wr[81]));
			radix2 #(.width(width)) rd_st7_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[82]), .rdlo_in(a7_wr[83]),  .coef_in(coef[0]), .rdup_out(a8_wr[82]), .rdlo_out(a8_wr[83]));
			radix2 #(.width(width)) rd_st7_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[84]), .rdlo_in(a7_wr[85]),  .coef_in(coef[0]), .rdup_out(a8_wr[84]), .rdlo_out(a8_wr[85]));
			radix2 #(.width(width)) rd_st7_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[86]), .rdlo_in(a7_wr[87]),  .coef_in(coef[0]), .rdup_out(a8_wr[86]), .rdlo_out(a8_wr[87]));
			radix2 #(.width(width)) rd_st7_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[88]), .rdlo_in(a7_wr[89]),  .coef_in(coef[0]), .rdup_out(a8_wr[88]), .rdlo_out(a8_wr[89]));
			radix2 #(.width(width)) rd_st7_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[90]), .rdlo_in(a7_wr[91]),  .coef_in(coef[0]), .rdup_out(a8_wr[90]), .rdlo_out(a8_wr[91]));
			radix2 #(.width(width)) rd_st7_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[92]), .rdlo_in(a7_wr[93]),  .coef_in(coef[0]), .rdup_out(a8_wr[92]), .rdlo_out(a8_wr[93]));
			radix2 #(.width(width)) rd_st7_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[94]), .rdlo_in(a7_wr[95]),  .coef_in(coef[0]), .rdup_out(a8_wr[94]), .rdlo_out(a8_wr[95]));
			radix2 #(.width(width)) rd_st7_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[96]), .rdlo_in(a7_wr[97]),  .coef_in(coef[0]), .rdup_out(a8_wr[96]), .rdlo_out(a8_wr[97]));
			radix2 #(.width(width)) rd_st7_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[98]), .rdlo_in(a7_wr[99]),  .coef_in(coef[0]), .rdup_out(a8_wr[98]), .rdlo_out(a8_wr[99]));
			radix2 #(.width(width)) rd_st7_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[100]), .rdlo_in(a7_wr[101]),  .coef_in(coef[0]), .rdup_out(a8_wr[100]), .rdlo_out(a8_wr[101]));
			radix2 #(.width(width)) rd_st7_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[102]), .rdlo_in(a7_wr[103]),  .coef_in(coef[0]), .rdup_out(a8_wr[102]), .rdlo_out(a8_wr[103]));
			radix2 #(.width(width)) rd_st7_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[104]), .rdlo_in(a7_wr[105]),  .coef_in(coef[0]), .rdup_out(a8_wr[104]), .rdlo_out(a8_wr[105]));
			radix2 #(.width(width)) rd_st7_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[106]), .rdlo_in(a7_wr[107]),  .coef_in(coef[0]), .rdup_out(a8_wr[106]), .rdlo_out(a8_wr[107]));
			radix2 #(.width(width)) rd_st7_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[108]), .rdlo_in(a7_wr[109]),  .coef_in(coef[0]), .rdup_out(a8_wr[108]), .rdlo_out(a8_wr[109]));
			radix2 #(.width(width)) rd_st7_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[110]), .rdlo_in(a7_wr[111]),  .coef_in(coef[0]), .rdup_out(a8_wr[110]), .rdlo_out(a8_wr[111]));
			radix2 #(.width(width)) rd_st7_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[112]), .rdlo_in(a7_wr[113]),  .coef_in(coef[0]), .rdup_out(a8_wr[112]), .rdlo_out(a8_wr[113]));
			radix2 #(.width(width)) rd_st7_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[114]), .rdlo_in(a7_wr[115]),  .coef_in(coef[0]), .rdup_out(a8_wr[114]), .rdlo_out(a8_wr[115]));
			radix2 #(.width(width)) rd_st7_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[116]), .rdlo_in(a7_wr[117]),  .coef_in(coef[0]), .rdup_out(a8_wr[116]), .rdlo_out(a8_wr[117]));
			radix2 #(.width(width)) rd_st7_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[118]), .rdlo_in(a7_wr[119]),  .coef_in(coef[0]), .rdup_out(a8_wr[118]), .rdlo_out(a8_wr[119]));
			radix2 #(.width(width)) rd_st7_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[120]), .rdlo_in(a7_wr[121]),  .coef_in(coef[0]), .rdup_out(a8_wr[120]), .rdlo_out(a8_wr[121]));
			radix2 #(.width(width)) rd_st7_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[122]), .rdlo_in(a7_wr[123]),  .coef_in(coef[0]), .rdup_out(a8_wr[122]), .rdlo_out(a8_wr[123]));
			radix2 #(.width(width)) rd_st7_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[124]), .rdlo_in(a7_wr[125]),  .coef_in(coef[0]), .rdup_out(a8_wr[124]), .rdlo_out(a8_wr[125]));
			radix2 #(.width(width)) rd_st7_126  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[126]), .rdlo_in(a7_wr[127]),  .coef_in(coef[0]), .rdup_out(a8_wr[126]), .rdlo_out(a8_wr[127]));
			radix2 #(.width(width)) rd_st7_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[128]), .rdlo_in(a7_wr[129]),  .coef_in(coef[0]), .rdup_out(a8_wr[128]), .rdlo_out(a8_wr[129]));
			radix2 #(.width(width)) rd_st7_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[130]), .rdlo_in(a7_wr[131]),  .coef_in(coef[0]), .rdup_out(a8_wr[130]), .rdlo_out(a8_wr[131]));
			radix2 #(.width(width)) rd_st7_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[132]), .rdlo_in(a7_wr[133]),  .coef_in(coef[0]), .rdup_out(a8_wr[132]), .rdlo_out(a8_wr[133]));
			radix2 #(.width(width)) rd_st7_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[134]), .rdlo_in(a7_wr[135]),  .coef_in(coef[0]), .rdup_out(a8_wr[134]), .rdlo_out(a8_wr[135]));
			radix2 #(.width(width)) rd_st7_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[136]), .rdlo_in(a7_wr[137]),  .coef_in(coef[0]), .rdup_out(a8_wr[136]), .rdlo_out(a8_wr[137]));
			radix2 #(.width(width)) rd_st7_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[138]), .rdlo_in(a7_wr[139]),  .coef_in(coef[0]), .rdup_out(a8_wr[138]), .rdlo_out(a8_wr[139]));
			radix2 #(.width(width)) rd_st7_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[140]), .rdlo_in(a7_wr[141]),  .coef_in(coef[0]), .rdup_out(a8_wr[140]), .rdlo_out(a8_wr[141]));
			radix2 #(.width(width)) rd_st7_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[142]), .rdlo_in(a7_wr[143]),  .coef_in(coef[0]), .rdup_out(a8_wr[142]), .rdlo_out(a8_wr[143]));
			radix2 #(.width(width)) rd_st7_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[144]), .rdlo_in(a7_wr[145]),  .coef_in(coef[0]), .rdup_out(a8_wr[144]), .rdlo_out(a8_wr[145]));
			radix2 #(.width(width)) rd_st7_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[146]), .rdlo_in(a7_wr[147]),  .coef_in(coef[0]), .rdup_out(a8_wr[146]), .rdlo_out(a8_wr[147]));
			radix2 #(.width(width)) rd_st7_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[148]), .rdlo_in(a7_wr[149]),  .coef_in(coef[0]), .rdup_out(a8_wr[148]), .rdlo_out(a8_wr[149]));
			radix2 #(.width(width)) rd_st7_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[150]), .rdlo_in(a7_wr[151]),  .coef_in(coef[0]), .rdup_out(a8_wr[150]), .rdlo_out(a8_wr[151]));
			radix2 #(.width(width)) rd_st7_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[152]), .rdlo_in(a7_wr[153]),  .coef_in(coef[0]), .rdup_out(a8_wr[152]), .rdlo_out(a8_wr[153]));
			radix2 #(.width(width)) rd_st7_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[154]), .rdlo_in(a7_wr[155]),  .coef_in(coef[0]), .rdup_out(a8_wr[154]), .rdlo_out(a8_wr[155]));
			radix2 #(.width(width)) rd_st7_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[156]), .rdlo_in(a7_wr[157]),  .coef_in(coef[0]), .rdup_out(a8_wr[156]), .rdlo_out(a8_wr[157]));
			radix2 #(.width(width)) rd_st7_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[158]), .rdlo_in(a7_wr[159]),  .coef_in(coef[0]), .rdup_out(a8_wr[158]), .rdlo_out(a8_wr[159]));
			radix2 #(.width(width)) rd_st7_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[160]), .rdlo_in(a7_wr[161]),  .coef_in(coef[0]), .rdup_out(a8_wr[160]), .rdlo_out(a8_wr[161]));
			radix2 #(.width(width)) rd_st7_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[162]), .rdlo_in(a7_wr[163]),  .coef_in(coef[0]), .rdup_out(a8_wr[162]), .rdlo_out(a8_wr[163]));
			radix2 #(.width(width)) rd_st7_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[164]), .rdlo_in(a7_wr[165]),  .coef_in(coef[0]), .rdup_out(a8_wr[164]), .rdlo_out(a8_wr[165]));
			radix2 #(.width(width)) rd_st7_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[166]), .rdlo_in(a7_wr[167]),  .coef_in(coef[0]), .rdup_out(a8_wr[166]), .rdlo_out(a8_wr[167]));
			radix2 #(.width(width)) rd_st7_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[168]), .rdlo_in(a7_wr[169]),  .coef_in(coef[0]), .rdup_out(a8_wr[168]), .rdlo_out(a8_wr[169]));
			radix2 #(.width(width)) rd_st7_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[170]), .rdlo_in(a7_wr[171]),  .coef_in(coef[0]), .rdup_out(a8_wr[170]), .rdlo_out(a8_wr[171]));
			radix2 #(.width(width)) rd_st7_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[172]), .rdlo_in(a7_wr[173]),  .coef_in(coef[0]), .rdup_out(a8_wr[172]), .rdlo_out(a8_wr[173]));
			radix2 #(.width(width)) rd_st7_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[174]), .rdlo_in(a7_wr[175]),  .coef_in(coef[0]), .rdup_out(a8_wr[174]), .rdlo_out(a8_wr[175]));
			radix2 #(.width(width)) rd_st7_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[176]), .rdlo_in(a7_wr[177]),  .coef_in(coef[0]), .rdup_out(a8_wr[176]), .rdlo_out(a8_wr[177]));
			radix2 #(.width(width)) rd_st7_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[178]), .rdlo_in(a7_wr[179]),  .coef_in(coef[0]), .rdup_out(a8_wr[178]), .rdlo_out(a8_wr[179]));
			radix2 #(.width(width)) rd_st7_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[180]), .rdlo_in(a7_wr[181]),  .coef_in(coef[0]), .rdup_out(a8_wr[180]), .rdlo_out(a8_wr[181]));
			radix2 #(.width(width)) rd_st7_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[182]), .rdlo_in(a7_wr[183]),  .coef_in(coef[0]), .rdup_out(a8_wr[182]), .rdlo_out(a8_wr[183]));
			radix2 #(.width(width)) rd_st7_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[184]), .rdlo_in(a7_wr[185]),  .coef_in(coef[0]), .rdup_out(a8_wr[184]), .rdlo_out(a8_wr[185]));
			radix2 #(.width(width)) rd_st7_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[186]), .rdlo_in(a7_wr[187]),  .coef_in(coef[0]), .rdup_out(a8_wr[186]), .rdlo_out(a8_wr[187]));
			radix2 #(.width(width)) rd_st7_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[188]), .rdlo_in(a7_wr[189]),  .coef_in(coef[0]), .rdup_out(a8_wr[188]), .rdlo_out(a8_wr[189]));
			radix2 #(.width(width)) rd_st7_190  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[190]), .rdlo_in(a7_wr[191]),  .coef_in(coef[0]), .rdup_out(a8_wr[190]), .rdlo_out(a8_wr[191]));
			radix2 #(.width(width)) rd_st7_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[192]), .rdlo_in(a7_wr[193]),  .coef_in(coef[0]), .rdup_out(a8_wr[192]), .rdlo_out(a8_wr[193]));
			radix2 #(.width(width)) rd_st7_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[194]), .rdlo_in(a7_wr[195]),  .coef_in(coef[0]), .rdup_out(a8_wr[194]), .rdlo_out(a8_wr[195]));
			radix2 #(.width(width)) rd_st7_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[196]), .rdlo_in(a7_wr[197]),  .coef_in(coef[0]), .rdup_out(a8_wr[196]), .rdlo_out(a8_wr[197]));
			radix2 #(.width(width)) rd_st7_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[198]), .rdlo_in(a7_wr[199]),  .coef_in(coef[0]), .rdup_out(a8_wr[198]), .rdlo_out(a8_wr[199]));
			radix2 #(.width(width)) rd_st7_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[200]), .rdlo_in(a7_wr[201]),  .coef_in(coef[0]), .rdup_out(a8_wr[200]), .rdlo_out(a8_wr[201]));
			radix2 #(.width(width)) rd_st7_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[202]), .rdlo_in(a7_wr[203]),  .coef_in(coef[0]), .rdup_out(a8_wr[202]), .rdlo_out(a8_wr[203]));
			radix2 #(.width(width)) rd_st7_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[204]), .rdlo_in(a7_wr[205]),  .coef_in(coef[0]), .rdup_out(a8_wr[204]), .rdlo_out(a8_wr[205]));
			radix2 #(.width(width)) rd_st7_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[206]), .rdlo_in(a7_wr[207]),  .coef_in(coef[0]), .rdup_out(a8_wr[206]), .rdlo_out(a8_wr[207]));
			radix2 #(.width(width)) rd_st7_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[208]), .rdlo_in(a7_wr[209]),  .coef_in(coef[0]), .rdup_out(a8_wr[208]), .rdlo_out(a8_wr[209]));
			radix2 #(.width(width)) rd_st7_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[210]), .rdlo_in(a7_wr[211]),  .coef_in(coef[0]), .rdup_out(a8_wr[210]), .rdlo_out(a8_wr[211]));
			radix2 #(.width(width)) rd_st7_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[212]), .rdlo_in(a7_wr[213]),  .coef_in(coef[0]), .rdup_out(a8_wr[212]), .rdlo_out(a8_wr[213]));
			radix2 #(.width(width)) rd_st7_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[214]), .rdlo_in(a7_wr[215]),  .coef_in(coef[0]), .rdup_out(a8_wr[214]), .rdlo_out(a8_wr[215]));
			radix2 #(.width(width)) rd_st7_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[216]), .rdlo_in(a7_wr[217]),  .coef_in(coef[0]), .rdup_out(a8_wr[216]), .rdlo_out(a8_wr[217]));
			radix2 #(.width(width)) rd_st7_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[218]), .rdlo_in(a7_wr[219]),  .coef_in(coef[0]), .rdup_out(a8_wr[218]), .rdlo_out(a8_wr[219]));
			radix2 #(.width(width)) rd_st7_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[220]), .rdlo_in(a7_wr[221]),  .coef_in(coef[0]), .rdup_out(a8_wr[220]), .rdlo_out(a8_wr[221]));
			radix2 #(.width(width)) rd_st7_222  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[222]), .rdlo_in(a7_wr[223]),  .coef_in(coef[0]), .rdup_out(a8_wr[222]), .rdlo_out(a8_wr[223]));
			radix2 #(.width(width)) rd_st7_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[224]), .rdlo_in(a7_wr[225]),  .coef_in(coef[0]), .rdup_out(a8_wr[224]), .rdlo_out(a8_wr[225]));
			radix2 #(.width(width)) rd_st7_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[226]), .rdlo_in(a7_wr[227]),  .coef_in(coef[0]), .rdup_out(a8_wr[226]), .rdlo_out(a8_wr[227]));
			radix2 #(.width(width)) rd_st7_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[228]), .rdlo_in(a7_wr[229]),  .coef_in(coef[0]), .rdup_out(a8_wr[228]), .rdlo_out(a8_wr[229]));
			radix2 #(.width(width)) rd_st7_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[230]), .rdlo_in(a7_wr[231]),  .coef_in(coef[0]), .rdup_out(a8_wr[230]), .rdlo_out(a8_wr[231]));
			radix2 #(.width(width)) rd_st7_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[232]), .rdlo_in(a7_wr[233]),  .coef_in(coef[0]), .rdup_out(a8_wr[232]), .rdlo_out(a8_wr[233]));
			radix2 #(.width(width)) rd_st7_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[234]), .rdlo_in(a7_wr[235]),  .coef_in(coef[0]), .rdup_out(a8_wr[234]), .rdlo_out(a8_wr[235]));
			radix2 #(.width(width)) rd_st7_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[236]), .rdlo_in(a7_wr[237]),  .coef_in(coef[0]), .rdup_out(a8_wr[236]), .rdlo_out(a8_wr[237]));
			radix2 #(.width(width)) rd_st7_238  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[238]), .rdlo_in(a7_wr[239]),  .coef_in(coef[0]), .rdup_out(a8_wr[238]), .rdlo_out(a8_wr[239]));
			radix2 #(.width(width)) rd_st7_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[240]), .rdlo_in(a7_wr[241]),  .coef_in(coef[0]), .rdup_out(a8_wr[240]), .rdlo_out(a8_wr[241]));
			radix2 #(.width(width)) rd_st7_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[242]), .rdlo_in(a7_wr[243]),  .coef_in(coef[0]), .rdup_out(a8_wr[242]), .rdlo_out(a8_wr[243]));
			radix2 #(.width(width)) rd_st7_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[244]), .rdlo_in(a7_wr[245]),  .coef_in(coef[0]), .rdup_out(a8_wr[244]), .rdlo_out(a8_wr[245]));
			radix2 #(.width(width)) rd_st7_246  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[246]), .rdlo_in(a7_wr[247]),  .coef_in(coef[0]), .rdup_out(a8_wr[246]), .rdlo_out(a8_wr[247]));
			radix2 #(.width(width)) rd_st7_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[248]), .rdlo_in(a7_wr[249]),  .coef_in(coef[0]), .rdup_out(a8_wr[248]), .rdlo_out(a8_wr[249]));
			radix2 #(.width(width)) rd_st7_250  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[250]), .rdlo_in(a7_wr[251]),  .coef_in(coef[0]), .rdup_out(a8_wr[250]), .rdlo_out(a8_wr[251]));
			radix2 #(.width(width)) rd_st7_252  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[252]), .rdlo_in(a7_wr[253]),  .coef_in(coef[0]), .rdup_out(a8_wr[252]), .rdlo_out(a8_wr[253]));
			radix2 #(.width(width)) rd_st7_254  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[254]), .rdlo_in(a7_wr[255]),  .coef_in(coef[0]), .rdup_out(a8_wr[254]), .rdlo_out(a8_wr[255]));

		//--- output stage (bit reversal)
			assign x0_out       = a8_wr[0];                    
			assign x1_out       = a8_wr[128];                  
			assign x2_out       = a8_wr[64];                   
			assign x3_out       = a8_wr[192];                  
			assign x4_out       = a8_wr[32];                   
			assign x5_out       = a8_wr[160];                  
			assign x6_out       = a8_wr[96];                   
			assign x7_out       = a8_wr[224];                  
			assign x8_out       = a8_wr[16];                   
			assign x9_out       = a8_wr[144];                  
			assign x10_out      = a8_wr[80];                   
			assign x11_out      = a8_wr[208];                  
			assign x12_out      = a8_wr[48];                   
			assign x13_out      = a8_wr[176];                  
			assign x14_out      = a8_wr[112];                  
			assign x15_out      = a8_wr[240];                  
			assign x16_out      = a8_wr[8];                    
			assign x17_out      = a8_wr[136];                  
			assign x18_out      = a8_wr[72];                   
			assign x19_out      = a8_wr[200];                  
			assign x20_out      = a8_wr[40];                   
			assign x21_out      = a8_wr[168];                  
			assign x22_out      = a8_wr[104];                  
			assign x23_out      = a8_wr[232];                  
			assign x24_out      = a8_wr[24];                   
			assign x25_out      = a8_wr[152];                  
			assign x26_out      = a8_wr[88];                   
			assign x27_out      = a8_wr[216];                  
			assign x28_out      = a8_wr[56];                   
			assign x29_out      = a8_wr[184];                  
			assign x30_out      = a8_wr[120];                  
			assign x31_out      = a8_wr[248];                  
			assign x32_out      = a8_wr[4];                    
			assign x33_out      = a8_wr[132];                  
			assign x34_out      = a8_wr[68];                   
			assign x35_out      = a8_wr[196];                  
			assign x36_out      = a8_wr[36];                   
			assign x37_out      = a8_wr[164];                  
			assign x38_out      = a8_wr[100];                  
			assign x39_out      = a8_wr[228];                  
			assign x40_out      = a8_wr[20];                   
			assign x41_out      = a8_wr[148];                  
			assign x42_out      = a8_wr[84];                   
			assign x43_out      = a8_wr[212];                  
			assign x44_out      = a8_wr[52];                   
			assign x45_out      = a8_wr[180];                  
			assign x46_out      = a8_wr[116];                  
			assign x47_out      = a8_wr[244];                  
			assign x48_out      = a8_wr[12];                   
			assign x49_out      = a8_wr[140];                  
			assign x50_out      = a8_wr[76];                   
			assign x51_out      = a8_wr[204];                  
			assign x52_out      = a8_wr[44];                   
			assign x53_out      = a8_wr[172];                  
			assign x54_out      = a8_wr[108];                  
			assign x55_out      = a8_wr[236];                  
			assign x56_out      = a8_wr[28];                   
			assign x57_out      = a8_wr[156];                  
			assign x58_out      = a8_wr[92];                   
			assign x59_out      = a8_wr[220];                  
			assign x60_out      = a8_wr[60];                   
			assign x61_out      = a8_wr[188];                  
			assign x62_out      = a8_wr[124];                  
			assign x63_out      = a8_wr[252];                  
			assign x64_out      = a8_wr[2];                    
			assign x65_out      = a8_wr[130];                  
			assign x66_out      = a8_wr[66];                   
			assign x67_out      = a8_wr[194];                  
			assign x68_out      = a8_wr[34];                   
			assign x69_out      = a8_wr[162];                  
			assign x70_out      = a8_wr[98];                   
			assign x71_out      = a8_wr[226];                  
			assign x72_out      = a8_wr[18];                   
			assign x73_out      = a8_wr[146];                  
			assign x74_out      = a8_wr[82];                   
			assign x75_out      = a8_wr[210];                  
			assign x76_out      = a8_wr[50];                   
			assign x77_out      = a8_wr[178];                  
			assign x78_out      = a8_wr[114];                  
			assign x79_out      = a8_wr[242];                  
			assign x80_out      = a8_wr[10];                   
			assign x81_out      = a8_wr[138];                  
			assign x82_out      = a8_wr[74];                   
			assign x83_out      = a8_wr[202];                  
			assign x84_out      = a8_wr[42];                   
			assign x85_out      = a8_wr[170];                  
			assign x86_out      = a8_wr[106];                  
			assign x87_out      = a8_wr[234];                  
			assign x88_out      = a8_wr[26];                   
			assign x89_out      = a8_wr[154];                  
			assign x90_out      = a8_wr[90];                   
			assign x91_out      = a8_wr[218];                  
			assign x92_out      = a8_wr[58];                   
			assign x93_out      = a8_wr[186];                  
			assign x94_out      = a8_wr[122];                  
			assign x95_out      = a8_wr[250];                  
			assign x96_out      = a8_wr[6];                    
			assign x97_out      = a8_wr[134];                  
			assign x98_out      = a8_wr[70];                   
			assign x99_out      = a8_wr[198];                  
			assign x100_out     = a8_wr[38];                   
			assign x101_out     = a8_wr[166];                  
			assign x102_out     = a8_wr[102];                  
			assign x103_out     = a8_wr[230];                  
			assign x104_out     = a8_wr[22];                   
			assign x105_out     = a8_wr[150];                  
			assign x106_out     = a8_wr[86];                   
			assign x107_out     = a8_wr[214];                  
			assign x108_out     = a8_wr[54];                   
			assign x109_out     = a8_wr[182];                  
			assign x110_out     = a8_wr[118];                  
			assign x111_out     = a8_wr[246];                  
			assign x112_out     = a8_wr[14];                   
			assign x113_out     = a8_wr[142];                  
			assign x114_out     = a8_wr[78];                   
			assign x115_out     = a8_wr[206];                  
			assign x116_out     = a8_wr[46];                   
			assign x117_out     = a8_wr[174];                  
			assign x118_out     = a8_wr[110];                  
			assign x119_out     = a8_wr[238];                  
			assign x120_out     = a8_wr[30];                   
			assign x121_out     = a8_wr[158];                  
			assign x122_out     = a8_wr[94];                   
			assign x123_out     = a8_wr[222];                  
			assign x124_out     = a8_wr[62];                   
			assign x125_out     = a8_wr[190];                  
			assign x126_out     = a8_wr[126];                  
			assign x127_out     = a8_wr[254];                  
			assign x128_out     = a8_wr[1];                    
			assign x129_out     = a8_wr[129];                  
			assign x130_out     = a8_wr[65];                   
			assign x131_out     = a8_wr[193];                  
			assign x132_out     = a8_wr[33];                   
			assign x133_out     = a8_wr[161];                  
			assign x134_out     = a8_wr[97];                   
			assign x135_out     = a8_wr[225];                  
			assign x136_out     = a8_wr[17];                   
			assign x137_out     = a8_wr[145];                  
			assign x138_out     = a8_wr[81];                   
			assign x139_out     = a8_wr[209];                  
			assign x140_out     = a8_wr[49];                   
			assign x141_out     = a8_wr[177];                  
			assign x142_out     = a8_wr[113];                  
			assign x143_out     = a8_wr[241];                  
			assign x144_out     = a8_wr[9];                    
			assign x145_out     = a8_wr[137];                  
			assign x146_out     = a8_wr[73];                   
			assign x147_out     = a8_wr[201];                  
			assign x148_out     = a8_wr[41];                   
			assign x149_out     = a8_wr[169];                  
			assign x150_out     = a8_wr[105];                  
			assign x151_out     = a8_wr[233];                  
			assign x152_out     = a8_wr[25];                   
			assign x153_out     = a8_wr[153];                  
			assign x154_out     = a8_wr[89];                   
			assign x155_out     = a8_wr[217];                  
			assign x156_out     = a8_wr[57];                   
			assign x157_out     = a8_wr[185];                  
			assign x158_out     = a8_wr[121];                  
			assign x159_out     = a8_wr[249];                  
			assign x160_out     = a8_wr[5];                    
			assign x161_out     = a8_wr[133];                  
			assign x162_out     = a8_wr[69];                   
			assign x163_out     = a8_wr[197];                  
			assign x164_out     = a8_wr[37];                   
			assign x165_out     = a8_wr[165];                  
			assign x166_out     = a8_wr[101];                  
			assign x167_out     = a8_wr[229];                  
			assign x168_out     = a8_wr[21];                   
			assign x169_out     = a8_wr[149];                  
			assign x170_out     = a8_wr[85];                   
			assign x171_out     = a8_wr[213];                  
			assign x172_out     = a8_wr[53];                   
			assign x173_out     = a8_wr[181];                  
			assign x174_out     = a8_wr[117];                  
			assign x175_out     = a8_wr[245];                  
			assign x176_out     = a8_wr[13];                   
			assign x177_out     = a8_wr[141];                  
			assign x178_out     = a8_wr[77];                   
			assign x179_out     = a8_wr[205];                  
			assign x180_out     = a8_wr[45];                   
			assign x181_out     = a8_wr[173];                  
			assign x182_out     = a8_wr[109];                  
			assign x183_out     = a8_wr[237];                  
			assign x184_out     = a8_wr[29];                   
			assign x185_out     = a8_wr[157];                  
			assign x186_out     = a8_wr[93];                   
			assign x187_out     = a8_wr[221];                  
			assign x188_out     = a8_wr[61];                   
			assign x189_out     = a8_wr[189];                  
			assign x190_out     = a8_wr[125];                  
			assign x191_out     = a8_wr[253];                  
			assign x192_out     = a8_wr[3];                    
			assign x193_out     = a8_wr[131];                  
			assign x194_out     = a8_wr[67];                   
			assign x195_out     = a8_wr[195];                  
			assign x196_out     = a8_wr[35];                   
			assign x197_out     = a8_wr[163];                  
			assign x198_out     = a8_wr[99];                   
			assign x199_out     = a8_wr[227];                  
			assign x200_out     = a8_wr[19];                   
			assign x201_out     = a8_wr[147];                  
			assign x202_out     = a8_wr[83];                   
			assign x203_out     = a8_wr[211];                  
			assign x204_out     = a8_wr[51];                   
			assign x205_out     = a8_wr[179];                  
			assign x206_out     = a8_wr[115];                  
			assign x207_out     = a8_wr[243];                  
			assign x208_out     = a8_wr[11];                   
			assign x209_out     = a8_wr[139];                  
			assign x210_out     = a8_wr[75];                   
			assign x211_out     = a8_wr[203];                  
			assign x212_out     = a8_wr[43];                   
			assign x213_out     = a8_wr[171];                  
			assign x214_out     = a8_wr[107];                  
			assign x215_out     = a8_wr[235];                  
			assign x216_out     = a8_wr[27];                   
			assign x217_out     = a8_wr[155];                  
			assign x218_out     = a8_wr[91];                   
			assign x219_out     = a8_wr[219];                  
			assign x220_out     = a8_wr[59];                   
			assign x221_out     = a8_wr[187];                  
			assign x222_out     = a8_wr[123];                  
			assign x223_out     = a8_wr[251];                  
			assign x224_out     = a8_wr[7];                    
			assign x225_out     = a8_wr[135];                  
			assign x226_out     = a8_wr[71];                   
			assign x227_out     = a8_wr[199];                  
			assign x228_out     = a8_wr[39];                   
			assign x229_out     = a8_wr[167];                  
			assign x230_out     = a8_wr[103];                  
			assign x231_out     = a8_wr[231];                  
			assign x232_out     = a8_wr[23];                   
			assign x233_out     = a8_wr[151];                  
			assign x234_out     = a8_wr[87];                   
			assign x235_out     = a8_wr[215];                  
			assign x236_out     = a8_wr[55];                   
			assign x237_out     = a8_wr[183];                  
			assign x238_out     = a8_wr[119];                  
			assign x239_out     = a8_wr[247];                  
			assign x240_out     = a8_wr[15];                   
			assign x241_out     = a8_wr[143];                  
			assign x242_out     = a8_wr[79];                   
			assign x243_out     = a8_wr[207];                  
			assign x244_out     = a8_wr[47];                   
			assign x245_out     = a8_wr[175];                  
			assign x246_out     = a8_wr[111];                  
			assign x247_out     = a8_wr[239];                  
			assign x248_out     = a8_wr[31];                   
			assign x249_out     = a8_wr[159];                  
			assign x250_out     = a8_wr[95];                   
			assign x251_out     = a8_wr[223];                  
			assign x252_out     = a8_wr[63];                   
			assign x253_out     = a8_wr[191];                  
			assign x254_out     = a8_wr[127];                  
			assign x255_out     = a8_wr[255];                  


endmodule
