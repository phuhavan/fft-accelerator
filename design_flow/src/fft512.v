`include "macros.h"

module fft512
#(
		//--- data bit-width
			parameter width = 24,
		//--- fft size
			parameter size=512
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
			input    [width-1:0]    x256_in,                      
			input    [width-1:0]    x257_in,                      
			input    [width-1:0]    x258_in,                      
			input    [width-1:0]    x259_in,                      
			input    [width-1:0]    x260_in,                      
			input    [width-1:0]    x261_in,                      
			input    [width-1:0]    x262_in,                      
			input    [width-1:0]    x263_in,                      
			input    [width-1:0]    x264_in,                      
			input    [width-1:0]    x265_in,                      
			input    [width-1:0]    x266_in,                      
			input    [width-1:0]    x267_in,                      
			input    [width-1:0]    x268_in,                      
			input    [width-1:0]    x269_in,                      
			input    [width-1:0]    x270_in,                      
			input    [width-1:0]    x271_in,                      
			input    [width-1:0]    x272_in,                      
			input    [width-1:0]    x273_in,                      
			input    [width-1:0]    x274_in,                      
			input    [width-1:0]    x275_in,                      
			input    [width-1:0]    x276_in,                      
			input    [width-1:0]    x277_in,                      
			input    [width-1:0]    x278_in,                      
			input    [width-1:0]    x279_in,                      
			input    [width-1:0]    x280_in,                      
			input    [width-1:0]    x281_in,                      
			input    [width-1:0]    x282_in,                      
			input    [width-1:0]    x283_in,                      
			input    [width-1:0]    x284_in,                      
			input    [width-1:0]    x285_in,                      
			input    [width-1:0]    x286_in,                      
			input    [width-1:0]    x287_in,                      
			input    [width-1:0]    x288_in,                      
			input    [width-1:0]    x289_in,                      
			input    [width-1:0]    x290_in,                      
			input    [width-1:0]    x291_in,                      
			input    [width-1:0]    x292_in,                      
			input    [width-1:0]    x293_in,                      
			input    [width-1:0]    x294_in,                      
			input    [width-1:0]    x295_in,                      
			input    [width-1:0]    x296_in,                      
			input    [width-1:0]    x297_in,                      
			input    [width-1:0]    x298_in,                      
			input    [width-1:0]    x299_in,                      
			input    [width-1:0]    x300_in,                      
			input    [width-1:0]    x301_in,                      
			input    [width-1:0]    x302_in,                      
			input    [width-1:0]    x303_in,                      
			input    [width-1:0]    x304_in,                      
			input    [width-1:0]    x305_in,                      
			input    [width-1:0]    x306_in,                      
			input    [width-1:0]    x307_in,                      
			input    [width-1:0]    x308_in,                      
			input    [width-1:0]    x309_in,                      
			input    [width-1:0]    x310_in,                      
			input    [width-1:0]    x311_in,                      
			input    [width-1:0]    x312_in,                      
			input    [width-1:0]    x313_in,                      
			input    [width-1:0]    x314_in,                      
			input    [width-1:0]    x315_in,                      
			input    [width-1:0]    x316_in,                      
			input    [width-1:0]    x317_in,                      
			input    [width-1:0]    x318_in,                      
			input    [width-1:0]    x319_in,                      
			input    [width-1:0]    x320_in,                      
			input    [width-1:0]    x321_in,                      
			input    [width-1:0]    x322_in,                      
			input    [width-1:0]    x323_in,                      
			input    [width-1:0]    x324_in,                      
			input    [width-1:0]    x325_in,                      
			input    [width-1:0]    x326_in,                      
			input    [width-1:0]    x327_in,                      
			input    [width-1:0]    x328_in,                      
			input    [width-1:0]    x329_in,                      
			input    [width-1:0]    x330_in,                      
			input    [width-1:0]    x331_in,                      
			input    [width-1:0]    x332_in,                      
			input    [width-1:0]    x333_in,                      
			input    [width-1:0]    x334_in,                      
			input    [width-1:0]    x335_in,                      
			input    [width-1:0]    x336_in,                      
			input    [width-1:0]    x337_in,                      
			input    [width-1:0]    x338_in,                      
			input    [width-1:0]    x339_in,                      
			input    [width-1:0]    x340_in,                      
			input    [width-1:0]    x341_in,                      
			input    [width-1:0]    x342_in,                      
			input    [width-1:0]    x343_in,                      
			input    [width-1:0]    x344_in,                      
			input    [width-1:0]    x345_in,                      
			input    [width-1:0]    x346_in,                      
			input    [width-1:0]    x347_in,                      
			input    [width-1:0]    x348_in,                      
			input    [width-1:0]    x349_in,                      
			input    [width-1:0]    x350_in,                      
			input    [width-1:0]    x351_in,                      
			input    [width-1:0]    x352_in,                      
			input    [width-1:0]    x353_in,                      
			input    [width-1:0]    x354_in,                      
			input    [width-1:0]    x355_in,                      
			input    [width-1:0]    x356_in,                      
			input    [width-1:0]    x357_in,                      
			input    [width-1:0]    x358_in,                      
			input    [width-1:0]    x359_in,                      
			input    [width-1:0]    x360_in,                      
			input    [width-1:0]    x361_in,                      
			input    [width-1:0]    x362_in,                      
			input    [width-1:0]    x363_in,                      
			input    [width-1:0]    x364_in,                      
			input    [width-1:0]    x365_in,                      
			input    [width-1:0]    x366_in,                      
			input    [width-1:0]    x367_in,                      
			input    [width-1:0]    x368_in,                      
			input    [width-1:0]    x369_in,                      
			input    [width-1:0]    x370_in,                      
			input    [width-1:0]    x371_in,                      
			input    [width-1:0]    x372_in,                      
			input    [width-1:0]    x373_in,                      
			input    [width-1:0]    x374_in,                      
			input    [width-1:0]    x375_in,                      
			input    [width-1:0]    x376_in,                      
			input    [width-1:0]    x377_in,                      
			input    [width-1:0]    x378_in,                      
			input    [width-1:0]    x379_in,                      
			input    [width-1:0]    x380_in,                      
			input    [width-1:0]    x381_in,                      
			input    [width-1:0]    x382_in,                      
			input    [width-1:0]    x383_in,                      
			input    [width-1:0]    x384_in,                      
			input    [width-1:0]    x385_in,                      
			input    [width-1:0]    x386_in,                      
			input    [width-1:0]    x387_in,                      
			input    [width-1:0]    x388_in,                      
			input    [width-1:0]    x389_in,                      
			input    [width-1:0]    x390_in,                      
			input    [width-1:0]    x391_in,                      
			input    [width-1:0]    x392_in,                      
			input    [width-1:0]    x393_in,                      
			input    [width-1:0]    x394_in,                      
			input    [width-1:0]    x395_in,                      
			input    [width-1:0]    x396_in,                      
			input    [width-1:0]    x397_in,                      
			input    [width-1:0]    x398_in,                      
			input    [width-1:0]    x399_in,                      
			input    [width-1:0]    x400_in,                      
			input    [width-1:0]    x401_in,                      
			input    [width-1:0]    x402_in,                      
			input    [width-1:0]    x403_in,                      
			input    [width-1:0]    x404_in,                      
			input    [width-1:0]    x405_in,                      
			input    [width-1:0]    x406_in,                      
			input    [width-1:0]    x407_in,                      
			input    [width-1:0]    x408_in,                      
			input    [width-1:0]    x409_in,                      
			input    [width-1:0]    x410_in,                      
			input    [width-1:0]    x411_in,                      
			input    [width-1:0]    x412_in,                      
			input    [width-1:0]    x413_in,                      
			input    [width-1:0]    x414_in,                      
			input    [width-1:0]    x415_in,                      
			input    [width-1:0]    x416_in,                      
			input    [width-1:0]    x417_in,                      
			input    [width-1:0]    x418_in,                      
			input    [width-1:0]    x419_in,                      
			input    [width-1:0]    x420_in,                      
			input    [width-1:0]    x421_in,                      
			input    [width-1:0]    x422_in,                      
			input    [width-1:0]    x423_in,                      
			input    [width-1:0]    x424_in,                      
			input    [width-1:0]    x425_in,                      
			input    [width-1:0]    x426_in,                      
			input    [width-1:0]    x427_in,                      
			input    [width-1:0]    x428_in,                      
			input    [width-1:0]    x429_in,                      
			input    [width-1:0]    x430_in,                      
			input    [width-1:0]    x431_in,                      
			input    [width-1:0]    x432_in,                      
			input    [width-1:0]    x433_in,                      
			input    [width-1:0]    x434_in,                      
			input    [width-1:0]    x435_in,                      
			input    [width-1:0]    x436_in,                      
			input    [width-1:0]    x437_in,                      
			input    [width-1:0]    x438_in,                      
			input    [width-1:0]    x439_in,                      
			input    [width-1:0]    x440_in,                      
			input    [width-1:0]    x441_in,                      
			input    [width-1:0]    x442_in,                      
			input    [width-1:0]    x443_in,                      
			input    [width-1:0]    x444_in,                      
			input    [width-1:0]    x445_in,                      
			input    [width-1:0]    x446_in,                      
			input    [width-1:0]    x447_in,                      
			input    [width-1:0]    x448_in,                      
			input    [width-1:0]    x449_in,                      
			input    [width-1:0]    x450_in,                      
			input    [width-1:0]    x451_in,                      
			input    [width-1:0]    x452_in,                      
			input    [width-1:0]    x453_in,                      
			input    [width-1:0]    x454_in,                      
			input    [width-1:0]    x455_in,                      
			input    [width-1:0]    x456_in,                      
			input    [width-1:0]    x457_in,                      
			input    [width-1:0]    x458_in,                      
			input    [width-1:0]    x459_in,                      
			input    [width-1:0]    x460_in,                      
			input    [width-1:0]    x461_in,                      
			input    [width-1:0]    x462_in,                      
			input    [width-1:0]    x463_in,                      
			input    [width-1:0]    x464_in,                      
			input    [width-1:0]    x465_in,                      
			input    [width-1:0]    x466_in,                      
			input    [width-1:0]    x467_in,                      
			input    [width-1:0]    x468_in,                      
			input    [width-1:0]    x469_in,                      
			input    [width-1:0]    x470_in,                      
			input    [width-1:0]    x471_in,                      
			input    [width-1:0]    x472_in,                      
			input    [width-1:0]    x473_in,                      
			input    [width-1:0]    x474_in,                      
			input    [width-1:0]    x475_in,                      
			input    [width-1:0]    x476_in,                      
			input    [width-1:0]    x477_in,                      
			input    [width-1:0]    x478_in,                      
			input    [width-1:0]    x479_in,                      
			input    [width-1:0]    x480_in,                      
			input    [width-1:0]    x481_in,                      
			input    [width-1:0]    x482_in,                      
			input    [width-1:0]    x483_in,                      
			input    [width-1:0]    x484_in,                      
			input    [width-1:0]    x485_in,                      
			input    [width-1:0]    x486_in,                      
			input    [width-1:0]    x487_in,                      
			input    [width-1:0]    x488_in,                      
			input    [width-1:0]    x489_in,                      
			input    [width-1:0]    x490_in,                      
			input    [width-1:0]    x491_in,                      
			input    [width-1:0]    x492_in,                      
			input    [width-1:0]    x493_in,                      
			input    [width-1:0]    x494_in,                      
			input    [width-1:0]    x495_in,                      
			input    [width-1:0]    x496_in,                      
			input    [width-1:0]    x497_in,                      
			input    [width-1:0]    x498_in,                      
			input    [width-1:0]    x499_in,                      
			input    [width-1:0]    x500_in,                      
			input    [width-1:0]    x501_in,                      
			input    [width-1:0]    x502_in,                      
			input    [width-1:0]    x503_in,                      
			input    [width-1:0]    x504_in,                      
			input    [width-1:0]    x505_in,                      
			input    [width-1:0]    x506_in,                      
			input    [width-1:0]    x507_in,                      
			input    [width-1:0]    x508_in,                      
			input    [width-1:0]    x509_in,                      
			input    [width-1:0]    x510_in,                      
			input    [width-1:0]    x511_in,                      
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
			output   [width-1:0]    x255_out,                     
			output   [width-1:0]    x256_out,                     
			output   [width-1:0]    x257_out,                     
			output   [width-1:0]    x258_out,                     
			output   [width-1:0]    x259_out,                     
			output   [width-1:0]    x260_out,                     
			output   [width-1:0]    x261_out,                     
			output   [width-1:0]    x262_out,                     
			output   [width-1:0]    x263_out,                     
			output   [width-1:0]    x264_out,                     
			output   [width-1:0]    x265_out,                     
			output   [width-1:0]    x266_out,                     
			output   [width-1:0]    x267_out,                     
			output   [width-1:0]    x268_out,                     
			output   [width-1:0]    x269_out,                     
			output   [width-1:0]    x270_out,                     
			output   [width-1:0]    x271_out,                     
			output   [width-1:0]    x272_out,                     
			output   [width-1:0]    x273_out,                     
			output   [width-1:0]    x274_out,                     
			output   [width-1:0]    x275_out,                     
			output   [width-1:0]    x276_out,                     
			output   [width-1:0]    x277_out,                     
			output   [width-1:0]    x278_out,                     
			output   [width-1:0]    x279_out,                     
			output   [width-1:0]    x280_out,                     
			output   [width-1:0]    x281_out,                     
			output   [width-1:0]    x282_out,                     
			output   [width-1:0]    x283_out,                     
			output   [width-1:0]    x284_out,                     
			output   [width-1:0]    x285_out,                     
			output   [width-1:0]    x286_out,                     
			output   [width-1:0]    x287_out,                     
			output   [width-1:0]    x288_out,                     
			output   [width-1:0]    x289_out,                     
			output   [width-1:0]    x290_out,                     
			output   [width-1:0]    x291_out,                     
			output   [width-1:0]    x292_out,                     
			output   [width-1:0]    x293_out,                     
			output   [width-1:0]    x294_out,                     
			output   [width-1:0]    x295_out,                     
			output   [width-1:0]    x296_out,                     
			output   [width-1:0]    x297_out,                     
			output   [width-1:0]    x298_out,                     
			output   [width-1:0]    x299_out,                     
			output   [width-1:0]    x300_out,                     
			output   [width-1:0]    x301_out,                     
			output   [width-1:0]    x302_out,                     
			output   [width-1:0]    x303_out,                     
			output   [width-1:0]    x304_out,                     
			output   [width-1:0]    x305_out,                     
			output   [width-1:0]    x306_out,                     
			output   [width-1:0]    x307_out,                     
			output   [width-1:0]    x308_out,                     
			output   [width-1:0]    x309_out,                     
			output   [width-1:0]    x310_out,                     
			output   [width-1:0]    x311_out,                     
			output   [width-1:0]    x312_out,                     
			output   [width-1:0]    x313_out,                     
			output   [width-1:0]    x314_out,                     
			output   [width-1:0]    x315_out,                     
			output   [width-1:0]    x316_out,                     
			output   [width-1:0]    x317_out,                     
			output   [width-1:0]    x318_out,                     
			output   [width-1:0]    x319_out,                     
			output   [width-1:0]    x320_out,                     
			output   [width-1:0]    x321_out,                     
			output   [width-1:0]    x322_out,                     
			output   [width-1:0]    x323_out,                     
			output   [width-1:0]    x324_out,                     
			output   [width-1:0]    x325_out,                     
			output   [width-1:0]    x326_out,                     
			output   [width-1:0]    x327_out,                     
			output   [width-1:0]    x328_out,                     
			output   [width-1:0]    x329_out,                     
			output   [width-1:0]    x330_out,                     
			output   [width-1:0]    x331_out,                     
			output   [width-1:0]    x332_out,                     
			output   [width-1:0]    x333_out,                     
			output   [width-1:0]    x334_out,                     
			output   [width-1:0]    x335_out,                     
			output   [width-1:0]    x336_out,                     
			output   [width-1:0]    x337_out,                     
			output   [width-1:0]    x338_out,                     
			output   [width-1:0]    x339_out,                     
			output   [width-1:0]    x340_out,                     
			output   [width-1:0]    x341_out,                     
			output   [width-1:0]    x342_out,                     
			output   [width-1:0]    x343_out,                     
			output   [width-1:0]    x344_out,                     
			output   [width-1:0]    x345_out,                     
			output   [width-1:0]    x346_out,                     
			output   [width-1:0]    x347_out,                     
			output   [width-1:0]    x348_out,                     
			output   [width-1:0]    x349_out,                     
			output   [width-1:0]    x350_out,                     
			output   [width-1:0]    x351_out,                     
			output   [width-1:0]    x352_out,                     
			output   [width-1:0]    x353_out,                     
			output   [width-1:0]    x354_out,                     
			output   [width-1:0]    x355_out,                     
			output   [width-1:0]    x356_out,                     
			output   [width-1:0]    x357_out,                     
			output   [width-1:0]    x358_out,                     
			output   [width-1:0]    x359_out,                     
			output   [width-1:0]    x360_out,                     
			output   [width-1:0]    x361_out,                     
			output   [width-1:0]    x362_out,                     
			output   [width-1:0]    x363_out,                     
			output   [width-1:0]    x364_out,                     
			output   [width-1:0]    x365_out,                     
			output   [width-1:0]    x366_out,                     
			output   [width-1:0]    x367_out,                     
			output   [width-1:0]    x368_out,                     
			output   [width-1:0]    x369_out,                     
			output   [width-1:0]    x370_out,                     
			output   [width-1:0]    x371_out,                     
			output   [width-1:0]    x372_out,                     
			output   [width-1:0]    x373_out,                     
			output   [width-1:0]    x374_out,                     
			output   [width-1:0]    x375_out,                     
			output   [width-1:0]    x376_out,                     
			output   [width-1:0]    x377_out,                     
			output   [width-1:0]    x378_out,                     
			output   [width-1:0]    x379_out,                     
			output   [width-1:0]    x380_out,                     
			output   [width-1:0]    x381_out,                     
			output   [width-1:0]    x382_out,                     
			output   [width-1:0]    x383_out,                     
			output   [width-1:0]    x384_out,                     
			output   [width-1:0]    x385_out,                     
			output   [width-1:0]    x386_out,                     
			output   [width-1:0]    x387_out,                     
			output   [width-1:0]    x388_out,                     
			output   [width-1:0]    x389_out,                     
			output   [width-1:0]    x390_out,                     
			output   [width-1:0]    x391_out,                     
			output   [width-1:0]    x392_out,                     
			output   [width-1:0]    x393_out,                     
			output   [width-1:0]    x394_out,                     
			output   [width-1:0]    x395_out,                     
			output   [width-1:0]    x396_out,                     
			output   [width-1:0]    x397_out,                     
			output   [width-1:0]    x398_out,                     
			output   [width-1:0]    x399_out,                     
			output   [width-1:0]    x400_out,                     
			output   [width-1:0]    x401_out,                     
			output   [width-1:0]    x402_out,                     
			output   [width-1:0]    x403_out,                     
			output   [width-1:0]    x404_out,                     
			output   [width-1:0]    x405_out,                     
			output   [width-1:0]    x406_out,                     
			output   [width-1:0]    x407_out,                     
			output   [width-1:0]    x408_out,                     
			output   [width-1:0]    x409_out,                     
			output   [width-1:0]    x410_out,                     
			output   [width-1:0]    x411_out,                     
			output   [width-1:0]    x412_out,                     
			output   [width-1:0]    x413_out,                     
			output   [width-1:0]    x414_out,                     
			output   [width-1:0]    x415_out,                     
			output   [width-1:0]    x416_out,                     
			output   [width-1:0]    x417_out,                     
			output   [width-1:0]    x418_out,                     
			output   [width-1:0]    x419_out,                     
			output   [width-1:0]    x420_out,                     
			output   [width-1:0]    x421_out,                     
			output   [width-1:0]    x422_out,                     
			output   [width-1:0]    x423_out,                     
			output   [width-1:0]    x424_out,                     
			output   [width-1:0]    x425_out,                     
			output   [width-1:0]    x426_out,                     
			output   [width-1:0]    x427_out,                     
			output   [width-1:0]    x428_out,                     
			output   [width-1:0]    x429_out,                     
			output   [width-1:0]    x430_out,                     
			output   [width-1:0]    x431_out,                     
			output   [width-1:0]    x432_out,                     
			output   [width-1:0]    x433_out,                     
			output   [width-1:0]    x434_out,                     
			output   [width-1:0]    x435_out,                     
			output   [width-1:0]    x436_out,                     
			output   [width-1:0]    x437_out,                     
			output   [width-1:0]    x438_out,                     
			output   [width-1:0]    x439_out,                     
			output   [width-1:0]    x440_out,                     
			output   [width-1:0]    x441_out,                     
			output   [width-1:0]    x442_out,                     
			output   [width-1:0]    x443_out,                     
			output   [width-1:0]    x444_out,                     
			output   [width-1:0]    x445_out,                     
			output   [width-1:0]    x446_out,                     
			output   [width-1:0]    x447_out,                     
			output   [width-1:0]    x448_out,                     
			output   [width-1:0]    x449_out,                     
			output   [width-1:0]    x450_out,                     
			output   [width-1:0]    x451_out,                     
			output   [width-1:0]    x452_out,                     
			output   [width-1:0]    x453_out,                     
			output   [width-1:0]    x454_out,                     
			output   [width-1:0]    x455_out,                     
			output   [width-1:0]    x456_out,                     
			output   [width-1:0]    x457_out,                     
			output   [width-1:0]    x458_out,                     
			output   [width-1:0]    x459_out,                     
			output   [width-1:0]    x460_out,                     
			output   [width-1:0]    x461_out,                     
			output   [width-1:0]    x462_out,                     
			output   [width-1:0]    x463_out,                     
			output   [width-1:0]    x464_out,                     
			output   [width-1:0]    x465_out,                     
			output   [width-1:0]    x466_out,                     
			output   [width-1:0]    x467_out,                     
			output   [width-1:0]    x468_out,                     
			output   [width-1:0]    x469_out,                     
			output   [width-1:0]    x470_out,                     
			output   [width-1:0]    x471_out,                     
			output   [width-1:0]    x472_out,                     
			output   [width-1:0]    x473_out,                     
			output   [width-1:0]    x474_out,                     
			output   [width-1:0]    x475_out,                     
			output   [width-1:0]    x476_out,                     
			output   [width-1:0]    x477_out,                     
			output   [width-1:0]    x478_out,                     
			output   [width-1:0]    x479_out,                     
			output   [width-1:0]    x480_out,                     
			output   [width-1:0]    x481_out,                     
			output   [width-1:0]    x482_out,                     
			output   [width-1:0]    x483_out,                     
			output   [width-1:0]    x484_out,                     
			output   [width-1:0]    x485_out,                     
			output   [width-1:0]    x486_out,                     
			output   [width-1:0]    x487_out,                     
			output   [width-1:0]    x488_out,                     
			output   [width-1:0]    x489_out,                     
			output   [width-1:0]    x490_out,                     
			output   [width-1:0]    x491_out,                     
			output   [width-1:0]    x492_out,                     
			output   [width-1:0]    x493_out,                     
			output   [width-1:0]    x494_out,                     
			output   [width-1:0]    x495_out,                     
			output   [width-1:0]    x496_out,                     
			output   [width-1:0]    x497_out,                     
			output   [width-1:0]    x498_out,                     
			output   [width-1:0]    x499_out,                     
			output   [width-1:0]    x500_out,                     
			output   [width-1:0]    x501_out,                     
			output   [width-1:0]    x502_out,                     
			output   [width-1:0]    x503_out,                     
			output   [width-1:0]    x504_out,                     
			output   [width-1:0]    x505_out,                     
			output   [width-1:0]    x506_out,                     
			output   [width-1:0]    x507_out,                     
			output   [width-1:0]    x508_out,                     
			output   [width-1:0]    x509_out,                     
			output   [width-1:0]    x510_out,                     
			output   [width-1:0]    x511_out                      
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
			wire  [width-1:0]        a9_wr[size-1:0];
			wire                     comb_stall;

		//--- cofficient assignment
			assign coef[0] =    {12'b011111111111, 12'b000000000000};
			assign coef[1] =    {12'b011111111111, 12'b111111100111};
			assign coef[2] =    {12'b011111111110, 12'b111111001110};
			assign coef[3] =    {12'b011111111110, 12'b111110110101};
			assign coef[4] =    {12'b011111111101, 12'b111110011100};
			assign coef[5] =    {12'b011111111011, 12'b111110000010};
			assign coef[6] =    {12'b011111111010, 12'b111101101001};
			assign coef[7] =    {12'b011111111000, 12'b111101010000};
			assign coef[8] =    {12'b011111110101, 12'b111100110111};
			assign coef[9] =    {12'b011111110011, 12'b111100011110};
			assign coef[10] =   {12'b011111110000, 12'b111100000101};
			assign coef[11] =   {12'b011111101100, 12'b111011101100};
			assign coef[12] =   {12'b011111101001, 12'b111011010100};
			assign coef[13] =   {12'b011111100101, 12'b111010111011};
			assign coef[14] =   {12'b011111100001, 12'b111010100010};
			assign coef[15] =   {12'b011111011100, 12'b111010001001};
			assign coef[16] =   {12'b011111011000, 12'b111001110001};
			assign coef[17] =   {12'b011111010011, 12'b111001011000};
			assign coef[18] =   {12'b011111001101, 12'b111000111111};
			assign coef[19] =   {12'b011111001000, 12'b111000100111};
			assign coef[20] =   {12'b011111000010, 12'b111000001111};
			assign coef[21] =   {12'b011110111011, 12'b110111110110};
			assign coef[22] =   {12'b011110110101, 12'b110111011110};
			assign coef[23] =   {12'b011110101110, 12'b110111000110};
			assign coef[24] =   {12'b011110100111, 12'b110110101110};
			assign coef[25] =   {12'b011110011111, 12'b110110010110};
			assign coef[26] =   {12'b011110011000, 12'b110101111110};
			assign coef[27] =   {12'b011110010000, 12'b110101100110};
			assign coef[28] =   {12'b011110000111, 12'b110101001110};
			assign coef[29] =   {12'b011101111111, 12'b110100110111};
			assign coef[30] =   {12'b011101110110, 12'b110100011111};
			assign coef[31] =   {12'b011101101101, 12'b110100001000};
			assign coef[32] =   {12'b011101100011, 12'b110011110001};
			assign coef[33] =   {12'b011101011001, 12'b110011011001};
			assign coef[34] =   {12'b011101001111, 12'b110011000010};
			assign coef[35] =   {12'b011101000101, 12'b110010101100};
			assign coef[36] =   {12'b011100111011, 12'b110010010101};
			assign coef[37] =   {12'b011100110000, 12'b110001111110};
			assign coef[38] =   {12'b011100100100, 12'b110001101000};
			assign coef[39] =   {12'b011100011001, 12'b110001010001};
			assign coef[40] =   {12'b011100001101, 12'b110000111011};
			assign coef[41] =   {12'b011100000001, 12'b110000100101};
			assign coef[42] =   {12'b011011110101, 12'b110000001111};
			assign coef[43] =   {12'b011011101001, 12'b101111111001};
			assign coef[44] =   {12'b011011011100, 12'b101111100100};
			assign coef[45] =   {12'b011011001111, 12'b101111001110};
			assign coef[46] =   {12'b011011000001, 12'b101110111001};
			assign coef[47] =   {12'b011010110100, 12'b101110100100};
			assign coef[48] =   {12'b011010100110, 12'b101110001111};
			assign coef[49] =   {12'b011010011000, 12'b101101111010};
			assign coef[50] =   {12'b011010001010, 12'b101101100101};
			assign coef[51] =   {12'b011001111011, 12'b101101010001};
			assign coef[52] =   {12'b011001101100, 12'b101100111101};
			assign coef[53] =   {12'b011001011101, 12'b101100101000};
			assign coef[54] =   {12'b011001001110, 12'b101100010101};
			assign coef[55] =   {12'b011000111110, 12'b101100000001};
			assign coef[56] =   {12'b011000101110, 12'b101011101101};
			assign coef[57] =   {12'b011000011110, 12'b101011011010};
			assign coef[58] =   {12'b011000001110, 12'b101011000111};
			assign coef[59] =   {12'b010111111110, 12'b101010110100};
			assign coef[60] =   {12'b010111101101, 12'b101010100001};
			assign coef[61] =   {12'b010111011100, 12'b101010001111};
			assign coef[62] =   {12'b010111001011, 12'b101001111100};
			assign coef[63] =   {12'b010110111001, 12'b101001101010};
			assign coef[64] =   {12'b010110100111, 12'b101001011001};
			assign coef[65] =   {12'b010110010110, 12'b101001000111};
			assign coef[66] =   {12'b010110000100, 12'b101000110101};
			assign coef[67] =   {12'b010101110001, 12'b101000100100};
			assign coef[68] =   {12'b010101011111, 12'b101000010011};
			assign coef[69] =   {12'b010101001100, 12'b101000000010};
			assign coef[70] =   {12'b010100111001, 12'b100111110010};
			assign coef[71] =   {12'b010100100110, 12'b100111100010};
			assign coef[72] =   {12'b010100010011, 12'b100111010010};
			assign coef[73] =   {12'b010011111111, 12'b100111000010};
			assign coef[74] =   {12'b010011101011, 12'b100110110010};
			assign coef[75] =   {12'b010011011000, 12'b100110100011};
			assign coef[76] =   {12'b010011000011, 12'b100110010100};
			assign coef[77] =   {12'b010010101111, 12'b100110000101};
			assign coef[78] =   {12'b010010011011, 12'b100101110110};
			assign coef[79] =   {12'b010010000110, 12'b100101101000};
			assign coef[80] =   {12'b010001110001, 12'b100101011010};
			assign coef[81] =   {12'b010001011100, 12'b100101001100};
			assign coef[82] =   {12'b010001000111, 12'b100100111111};
			assign coef[83] =   {12'b010000110010, 12'b100100110001};
			assign coef[84] =   {12'b010000011100, 12'b100100100100};
			assign coef[85] =   {12'b010000000111, 12'b100100010111};
			assign coef[86] =   {12'b001111110001, 12'b100100001011};
			assign coef[87] =   {12'b001111011011, 12'b100011111111};
			assign coef[88] =   {12'b001111000101, 12'b100011110011};
			assign coef[89] =   {12'b001110101111, 12'b100011100111};
			assign coef[90] =   {12'b001110011000, 12'b100011011100};
			assign coef[91] =   {12'b001110000010, 12'b100011010000};
			assign coef[92] =   {12'b001101101011, 12'b100011000101};
			assign coef[93] =   {12'b001101010100, 12'b100010111011};
			assign coef[94] =   {12'b001100111110, 12'b100010110001};
			assign coef[95] =   {12'b001100100111, 12'b100010100111};
			assign coef[96] =   {12'b001100001111, 12'b100010011101};
			assign coef[97] =   {12'b001011111000, 12'b100010010011};
			assign coef[98] =   {12'b001011100001, 12'b100010001010};
			assign coef[99] =   {12'b001011001001, 12'b100010000001};
			assign coef[100] =  {12'b001010110010, 12'b100001111001};
			assign coef[101] =  {12'b001010011010, 12'b100001110000};
			assign coef[102] =  {12'b001010000010, 12'b100001101000};
			assign coef[103] =  {12'b001001101010, 12'b100001100001};
			assign coef[104] =  {12'b001001010010, 12'b100001011001};
			assign coef[105] =  {12'b001000111010, 12'b100001010010};
			assign coef[106] =  {12'b001000100010, 12'b100001001011};
			assign coef[107] =  {12'b001000001010, 12'b100001000101};
			assign coef[108] =  {12'b000111110001, 12'b100000111110};
			assign coef[109] =  {12'b000111011001, 12'b100000111000};
			assign coef[110] =  {12'b000111000001, 12'b100000110011};
			assign coef[111] =  {12'b000110101000, 12'b100000101101};
			assign coef[112] =  {12'b000110001111, 12'b100000101000};
			assign coef[113] =  {12'b000101110111, 12'b100000100100};
			assign coef[114] =  {12'b000101011110, 12'b100000011111};
			assign coef[115] =  {12'b000101000101, 12'b100000011011};
			assign coef[116] =  {12'b000100101100, 12'b100000010111};
			assign coef[117] =  {12'b000100010100, 12'b100000010100};
			assign coef[118] =  {12'b000011111011, 12'b100000010000};
			assign coef[119] =  {12'b000011100010, 12'b100000001101};
			assign coef[120] =  {12'b000011001001, 12'b100000001011};
			assign coef[121] =  {12'b000010110000, 12'b100000001000};
			assign coef[122] =  {12'b000010010111, 12'b100000000110};
			assign coef[123] =  {12'b000001111110, 12'b100000000101};
			assign coef[124] =  {12'b000001100100, 12'b100000000011};
			assign coef[125] =  {12'b000001001011, 12'b100000000010};
			assign coef[126] =  {12'b000000110010, 12'b100000000010};
			assign coef[127] =  {12'b000000011001, 12'b100000000001};
			assign coef[128] =  {12'b000000000000, 12'b100000000001};
			assign coef[129] =  {12'b111111100111, 12'b100000000001};
			assign coef[130] =  {12'b111111001110, 12'b100000000010};
			assign coef[131] =  {12'b111110110101, 12'b100000000010};
			assign coef[132] =  {12'b111110011100, 12'b100000000011};
			assign coef[133] =  {12'b111110000010, 12'b100000000101};
			assign coef[134] =  {12'b111101101001, 12'b100000000110};
			assign coef[135] =  {12'b111101010000, 12'b100000001000};
			assign coef[136] =  {12'b111100110111, 12'b100000001011};
			assign coef[137] =  {12'b111100011110, 12'b100000001101};
			assign coef[138] =  {12'b111100000101, 12'b100000010000};
			assign coef[139] =  {12'b111011101100, 12'b100000010100};
			assign coef[140] =  {12'b111011010100, 12'b100000010111};
			assign coef[141] =  {12'b111010111011, 12'b100000011011};
			assign coef[142] =  {12'b111010100010, 12'b100000011111};
			assign coef[143] =  {12'b111010001001, 12'b100000100100};
			assign coef[144] =  {12'b111001110001, 12'b100000101000};
			assign coef[145] =  {12'b111001011000, 12'b100000101101};
			assign coef[146] =  {12'b111000111111, 12'b100000110011};
			assign coef[147] =  {12'b111000100111, 12'b100000111000};
			assign coef[148] =  {12'b111000001111, 12'b100000111110};
			assign coef[149] =  {12'b110111110110, 12'b100001000101};
			assign coef[150] =  {12'b110111011110, 12'b100001001011};
			assign coef[151] =  {12'b110111000110, 12'b100001010010};
			assign coef[152] =  {12'b110110101110, 12'b100001011001};
			assign coef[153] =  {12'b110110010110, 12'b100001100001};
			assign coef[154] =  {12'b110101111110, 12'b100001101000};
			assign coef[155] =  {12'b110101100110, 12'b100001110000};
			assign coef[156] =  {12'b110101001110, 12'b100001111001};
			assign coef[157] =  {12'b110100110111, 12'b100010000001};
			assign coef[158] =  {12'b110100011111, 12'b100010001010};
			assign coef[159] =  {12'b110100001000, 12'b100010010011};
			assign coef[160] =  {12'b110011110001, 12'b100010011101};
			assign coef[161] =  {12'b110011011001, 12'b100010100111};
			assign coef[162] =  {12'b110011000010, 12'b100010110001};
			assign coef[163] =  {12'b110010101100, 12'b100010111011};
			assign coef[164] =  {12'b110010010101, 12'b100011000101};
			assign coef[165] =  {12'b110001111110, 12'b100011010000};
			assign coef[166] =  {12'b110001101000, 12'b100011011100};
			assign coef[167] =  {12'b110001010001, 12'b100011100111};
			assign coef[168] =  {12'b110000111011, 12'b100011110011};
			assign coef[169] =  {12'b110000100101, 12'b100011111111};
			assign coef[170] =  {12'b110000001111, 12'b100100001011};
			assign coef[171] =  {12'b101111111001, 12'b100100010111};
			assign coef[172] =  {12'b101111100100, 12'b100100100100};
			assign coef[173] =  {12'b101111001110, 12'b100100110001};
			assign coef[174] =  {12'b101110111001, 12'b100100111111};
			assign coef[175] =  {12'b101110100100, 12'b100101001100};
			assign coef[176] =  {12'b101110001111, 12'b100101011010};
			assign coef[177] =  {12'b101101111010, 12'b100101101000};
			assign coef[178] =  {12'b101101100101, 12'b100101110110};
			assign coef[179] =  {12'b101101010001, 12'b100110000101};
			assign coef[180] =  {12'b101100111101, 12'b100110010100};
			assign coef[181] =  {12'b101100101000, 12'b100110100011};
			assign coef[182] =  {12'b101100010101, 12'b100110110010};
			assign coef[183] =  {12'b101100000001, 12'b100111000010};
			assign coef[184] =  {12'b101011101101, 12'b100111010010};
			assign coef[185] =  {12'b101011011010, 12'b100111100010};
			assign coef[186] =  {12'b101011000111, 12'b100111110010};
			assign coef[187] =  {12'b101010110100, 12'b101000000010};
			assign coef[188] =  {12'b101010100001, 12'b101000010011};
			assign coef[189] =  {12'b101010001111, 12'b101000100100};
			assign coef[190] =  {12'b101001111100, 12'b101000110101};
			assign coef[191] =  {12'b101001101010, 12'b101001000111};
			assign coef[192] =  {12'b101001011001, 12'b101001011001};
			assign coef[193] =  {12'b101001000111, 12'b101001101010};
			assign coef[194] =  {12'b101000110101, 12'b101001111100};
			assign coef[195] =  {12'b101000100100, 12'b101010001111};
			assign coef[196] =  {12'b101000010011, 12'b101010100001};
			assign coef[197] =  {12'b101000000010, 12'b101010110100};
			assign coef[198] =  {12'b100111110010, 12'b101011000111};
			assign coef[199] =  {12'b100111100010, 12'b101011011010};
			assign coef[200] =  {12'b100111010010, 12'b101011101101};
			assign coef[201] =  {12'b100111000010, 12'b101100000001};
			assign coef[202] =  {12'b100110110010, 12'b101100010101};
			assign coef[203] =  {12'b100110100011, 12'b101100101000};
			assign coef[204] =  {12'b100110010100, 12'b101100111101};
			assign coef[205] =  {12'b100110000101, 12'b101101010001};
			assign coef[206] =  {12'b100101110110, 12'b101101100101};
			assign coef[207] =  {12'b100101101000, 12'b101101111010};
			assign coef[208] =  {12'b100101011010, 12'b101110001111};
			assign coef[209] =  {12'b100101001100, 12'b101110100100};
			assign coef[210] =  {12'b100100111111, 12'b101110111001};
			assign coef[211] =  {12'b100100110001, 12'b101111001110};
			assign coef[212] =  {12'b100100100100, 12'b101111100100};
			assign coef[213] =  {12'b100100010111, 12'b101111111001};
			assign coef[214] =  {12'b100100001011, 12'b110000001111};
			assign coef[215] =  {12'b100011111111, 12'b110000100101};
			assign coef[216] =  {12'b100011110011, 12'b110000111011};
			assign coef[217] =  {12'b100011100111, 12'b110001010001};
			assign coef[218] =  {12'b100011011100, 12'b110001101000};
			assign coef[219] =  {12'b100011010000, 12'b110001111110};
			assign coef[220] =  {12'b100011000101, 12'b110010010101};
			assign coef[221] =  {12'b100010111011, 12'b110010101100};
			assign coef[222] =  {12'b100010110001, 12'b110011000010};
			assign coef[223] =  {12'b100010100111, 12'b110011011001};
			assign coef[224] =  {12'b100010011101, 12'b110011110001};
			assign coef[225] =  {12'b100010010011, 12'b110100001000};
			assign coef[226] =  {12'b100010001010, 12'b110100011111};
			assign coef[227] =  {12'b100010000001, 12'b110100110111};
			assign coef[228] =  {12'b100001111001, 12'b110101001110};
			assign coef[229] =  {12'b100001110000, 12'b110101100110};
			assign coef[230] =  {12'b100001101000, 12'b110101111110};
			assign coef[231] =  {12'b100001100001, 12'b110110010110};
			assign coef[232] =  {12'b100001011001, 12'b110110101110};
			assign coef[233] =  {12'b100001010010, 12'b110111000110};
			assign coef[234] =  {12'b100001001011, 12'b110111011110};
			assign coef[235] =  {12'b100001000101, 12'b110111110110};
			assign coef[236] =  {12'b100000111110, 12'b111000001111};
			assign coef[237] =  {12'b100000111000, 12'b111000100111};
			assign coef[238] =  {12'b100000110011, 12'b111000111111};
			assign coef[239] =  {12'b100000101101, 12'b111001011000};
			assign coef[240] =  {12'b100000101000, 12'b111001110001};
			assign coef[241] =  {12'b100000100100, 12'b111010001001};
			assign coef[242] =  {12'b100000011111, 12'b111010100010};
			assign coef[243] =  {12'b100000011011, 12'b111010111011};
			assign coef[244] =  {12'b100000010111, 12'b111011010100};
			assign coef[245] =  {12'b100000010100, 12'b111011101100};
			assign coef[246] =  {12'b100000010000, 12'b111100000101};
			assign coef[247] =  {12'b100000001101, 12'b111100011110};
			assign coef[248] =  {12'b100000001011, 12'b111100110111};
			assign coef[249] =  {12'b100000001000, 12'b111101010000};
			assign coef[250] =  {12'b100000000110, 12'b111101101001};
			assign coef[251] =  {12'b100000000101, 12'b111110000010};
			assign coef[252] =  {12'b100000000011, 12'b111110011100};
			assign coef[253] =  {12'b100000000010, 12'b111110110101};
			assign coef[254] =  {12'b100000000010, 12'b111111001110};
			assign coef[255] =  {12'b100000000001, 12'b111111100111};

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
					a0_wr[256]     <= 0;                           
					a0_wr[257]     <= 0;                           
					a0_wr[258]     <= 0;                           
					a0_wr[259]     <= 0;                           
					a0_wr[260]     <= 0;                           
					a0_wr[261]     <= 0;                           
					a0_wr[262]     <= 0;                           
					a0_wr[263]     <= 0;                           
					a0_wr[264]     <= 0;                           
					a0_wr[265]     <= 0;                           
					a0_wr[266]     <= 0;                           
					a0_wr[267]     <= 0;                           
					a0_wr[268]     <= 0;                           
					a0_wr[269]     <= 0;                           
					a0_wr[270]     <= 0;                           
					a0_wr[271]     <= 0;                           
					a0_wr[272]     <= 0;                           
					a0_wr[273]     <= 0;                           
					a0_wr[274]     <= 0;                           
					a0_wr[275]     <= 0;                           
					a0_wr[276]     <= 0;                           
					a0_wr[277]     <= 0;                           
					a0_wr[278]     <= 0;                           
					a0_wr[279]     <= 0;                           
					a0_wr[280]     <= 0;                           
					a0_wr[281]     <= 0;                           
					a0_wr[282]     <= 0;                           
					a0_wr[283]     <= 0;                           
					a0_wr[284]     <= 0;                           
					a0_wr[285]     <= 0;                           
					a0_wr[286]     <= 0;                           
					a0_wr[287]     <= 0;                           
					a0_wr[288]     <= 0;                           
					a0_wr[289]     <= 0;                           
					a0_wr[290]     <= 0;                           
					a0_wr[291]     <= 0;                           
					a0_wr[292]     <= 0;                           
					a0_wr[293]     <= 0;                           
					a0_wr[294]     <= 0;                           
					a0_wr[295]     <= 0;                           
					a0_wr[296]     <= 0;                           
					a0_wr[297]     <= 0;                           
					a0_wr[298]     <= 0;                           
					a0_wr[299]     <= 0;                           
					a0_wr[300]     <= 0;                           
					a0_wr[301]     <= 0;                           
					a0_wr[302]     <= 0;                           
					a0_wr[303]     <= 0;                           
					a0_wr[304]     <= 0;                           
					a0_wr[305]     <= 0;                           
					a0_wr[306]     <= 0;                           
					a0_wr[307]     <= 0;                           
					a0_wr[308]     <= 0;                           
					a0_wr[309]     <= 0;                           
					a0_wr[310]     <= 0;                           
					a0_wr[311]     <= 0;                           
					a0_wr[312]     <= 0;                           
					a0_wr[313]     <= 0;                           
					a0_wr[314]     <= 0;                           
					a0_wr[315]     <= 0;                           
					a0_wr[316]     <= 0;                           
					a0_wr[317]     <= 0;                           
					a0_wr[318]     <= 0;                           
					a0_wr[319]     <= 0;                           
					a0_wr[320]     <= 0;                           
					a0_wr[321]     <= 0;                           
					a0_wr[322]     <= 0;                           
					a0_wr[323]     <= 0;                           
					a0_wr[324]     <= 0;                           
					a0_wr[325]     <= 0;                           
					a0_wr[326]     <= 0;                           
					a0_wr[327]     <= 0;                           
					a0_wr[328]     <= 0;                           
					a0_wr[329]     <= 0;                           
					a0_wr[330]     <= 0;                           
					a0_wr[331]     <= 0;                           
					a0_wr[332]     <= 0;                           
					a0_wr[333]     <= 0;                           
					a0_wr[334]     <= 0;                           
					a0_wr[335]     <= 0;                           
					a0_wr[336]     <= 0;                           
					a0_wr[337]     <= 0;                           
					a0_wr[338]     <= 0;                           
					a0_wr[339]     <= 0;                           
					a0_wr[340]     <= 0;                           
					a0_wr[341]     <= 0;                           
					a0_wr[342]     <= 0;                           
					a0_wr[343]     <= 0;                           
					a0_wr[344]     <= 0;                           
					a0_wr[345]     <= 0;                           
					a0_wr[346]     <= 0;                           
					a0_wr[347]     <= 0;                           
					a0_wr[348]     <= 0;                           
					a0_wr[349]     <= 0;                           
					a0_wr[350]     <= 0;                           
					a0_wr[351]     <= 0;                           
					a0_wr[352]     <= 0;                           
					a0_wr[353]     <= 0;                           
					a0_wr[354]     <= 0;                           
					a0_wr[355]     <= 0;                           
					a0_wr[356]     <= 0;                           
					a0_wr[357]     <= 0;                           
					a0_wr[358]     <= 0;                           
					a0_wr[359]     <= 0;                           
					a0_wr[360]     <= 0;                           
					a0_wr[361]     <= 0;                           
					a0_wr[362]     <= 0;                           
					a0_wr[363]     <= 0;                           
					a0_wr[364]     <= 0;                           
					a0_wr[365]     <= 0;                           
					a0_wr[366]     <= 0;                           
					a0_wr[367]     <= 0;                           
					a0_wr[368]     <= 0;                           
					a0_wr[369]     <= 0;                           
					a0_wr[370]     <= 0;                           
					a0_wr[371]     <= 0;                           
					a0_wr[372]     <= 0;                           
					a0_wr[373]     <= 0;                           
					a0_wr[374]     <= 0;                           
					a0_wr[375]     <= 0;                           
					a0_wr[376]     <= 0;                           
					a0_wr[377]     <= 0;                           
					a0_wr[378]     <= 0;                           
					a0_wr[379]     <= 0;                           
					a0_wr[380]     <= 0;                           
					a0_wr[381]     <= 0;                           
					a0_wr[382]     <= 0;                           
					a0_wr[383]     <= 0;                           
					a0_wr[384]     <= 0;                           
					a0_wr[385]     <= 0;                           
					a0_wr[386]     <= 0;                           
					a0_wr[387]     <= 0;                           
					a0_wr[388]     <= 0;                           
					a0_wr[389]     <= 0;                           
					a0_wr[390]     <= 0;                           
					a0_wr[391]     <= 0;                           
					a0_wr[392]     <= 0;                           
					a0_wr[393]     <= 0;                           
					a0_wr[394]     <= 0;                           
					a0_wr[395]     <= 0;                           
					a0_wr[396]     <= 0;                           
					a0_wr[397]     <= 0;                           
					a0_wr[398]     <= 0;                           
					a0_wr[399]     <= 0;                           
					a0_wr[400]     <= 0;                           
					a0_wr[401]     <= 0;                           
					a0_wr[402]     <= 0;                           
					a0_wr[403]     <= 0;                           
					a0_wr[404]     <= 0;                           
					a0_wr[405]     <= 0;                           
					a0_wr[406]     <= 0;                           
					a0_wr[407]     <= 0;                           
					a0_wr[408]     <= 0;                           
					a0_wr[409]     <= 0;                           
					a0_wr[410]     <= 0;                           
					a0_wr[411]     <= 0;                           
					a0_wr[412]     <= 0;                           
					a0_wr[413]     <= 0;                           
					a0_wr[414]     <= 0;                           
					a0_wr[415]     <= 0;                           
					a0_wr[416]     <= 0;                           
					a0_wr[417]     <= 0;                           
					a0_wr[418]     <= 0;                           
					a0_wr[419]     <= 0;                           
					a0_wr[420]     <= 0;                           
					a0_wr[421]     <= 0;                           
					a0_wr[422]     <= 0;                           
					a0_wr[423]     <= 0;                           
					a0_wr[424]     <= 0;                           
					a0_wr[425]     <= 0;                           
					a0_wr[426]     <= 0;                           
					a0_wr[427]     <= 0;                           
					a0_wr[428]     <= 0;                           
					a0_wr[429]     <= 0;                           
					a0_wr[430]     <= 0;                           
					a0_wr[431]     <= 0;                           
					a0_wr[432]     <= 0;                           
					a0_wr[433]     <= 0;                           
					a0_wr[434]     <= 0;                           
					a0_wr[435]     <= 0;                           
					a0_wr[436]     <= 0;                           
					a0_wr[437]     <= 0;                           
					a0_wr[438]     <= 0;                           
					a0_wr[439]     <= 0;                           
					a0_wr[440]     <= 0;                           
					a0_wr[441]     <= 0;                           
					a0_wr[442]     <= 0;                           
					a0_wr[443]     <= 0;                           
					a0_wr[444]     <= 0;                           
					a0_wr[445]     <= 0;                           
					a0_wr[446]     <= 0;                           
					a0_wr[447]     <= 0;                           
					a0_wr[448]     <= 0;                           
					a0_wr[449]     <= 0;                           
					a0_wr[450]     <= 0;                           
					a0_wr[451]     <= 0;                           
					a0_wr[452]     <= 0;                           
					a0_wr[453]     <= 0;                           
					a0_wr[454]     <= 0;                           
					a0_wr[455]     <= 0;                           
					a0_wr[456]     <= 0;                           
					a0_wr[457]     <= 0;                           
					a0_wr[458]     <= 0;                           
					a0_wr[459]     <= 0;                           
					a0_wr[460]     <= 0;                           
					a0_wr[461]     <= 0;                           
					a0_wr[462]     <= 0;                           
					a0_wr[463]     <= 0;                           
					a0_wr[464]     <= 0;                           
					a0_wr[465]     <= 0;                           
					a0_wr[466]     <= 0;                           
					a0_wr[467]     <= 0;                           
					a0_wr[468]     <= 0;                           
					a0_wr[469]     <= 0;                           
					a0_wr[470]     <= 0;                           
					a0_wr[471]     <= 0;                           
					a0_wr[472]     <= 0;                           
					a0_wr[473]     <= 0;                           
					a0_wr[474]     <= 0;                           
					a0_wr[475]     <= 0;                           
					a0_wr[476]     <= 0;                           
					a0_wr[477]     <= 0;                           
					a0_wr[478]     <= 0;                           
					a0_wr[479]     <= 0;                           
					a0_wr[480]     <= 0;                           
					a0_wr[481]     <= 0;                           
					a0_wr[482]     <= 0;                           
					a0_wr[483]     <= 0;                           
					a0_wr[484]     <= 0;                           
					a0_wr[485]     <= 0;                           
					a0_wr[486]     <= 0;                           
					a0_wr[487]     <= 0;                           
					a0_wr[488]     <= 0;                           
					a0_wr[489]     <= 0;                           
					a0_wr[490]     <= 0;                           
					a0_wr[491]     <= 0;                           
					a0_wr[492]     <= 0;                           
					a0_wr[493]     <= 0;                           
					a0_wr[494]     <= 0;                           
					a0_wr[495]     <= 0;                           
					a0_wr[496]     <= 0;                           
					a0_wr[497]     <= 0;                           
					a0_wr[498]     <= 0;                           
					a0_wr[499]     <= 0;                           
					a0_wr[500]     <= 0;                           
					a0_wr[501]     <= 0;                           
					a0_wr[502]     <= 0;                           
					a0_wr[503]     <= 0;                           
					a0_wr[504]     <= 0;                           
					a0_wr[505]     <= 0;                           
					a0_wr[506]     <= 0;                           
					a0_wr[507]     <= 0;                           
					a0_wr[508]     <= 0;                           
					a0_wr[509]     <= 0;                           
					a0_wr[510]     <= 0;                           
					a0_wr[511]     <= 0;                           
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
						a0_wr[256]    <= x256_in;                     
						a0_wr[257]    <= x257_in;                     
						a0_wr[258]    <= x258_in;                     
						a0_wr[259]    <= x259_in;                     
						a0_wr[260]    <= x260_in;                     
						a0_wr[261]    <= x261_in;                     
						a0_wr[262]    <= x262_in;                     
						a0_wr[263]    <= x263_in;                     
						a0_wr[264]    <= x264_in;                     
						a0_wr[265]    <= x265_in;                     
						a0_wr[266]    <= x266_in;                     
						a0_wr[267]    <= x267_in;                     
						a0_wr[268]    <= x268_in;                     
						a0_wr[269]    <= x269_in;                     
						a0_wr[270]    <= x270_in;                     
						a0_wr[271]    <= x271_in;                     
						a0_wr[272]    <= x272_in;                     
						a0_wr[273]    <= x273_in;                     
						a0_wr[274]    <= x274_in;                     
						a0_wr[275]    <= x275_in;                     
						a0_wr[276]    <= x276_in;                     
						a0_wr[277]    <= x277_in;                     
						a0_wr[278]    <= x278_in;                     
						a0_wr[279]    <= x279_in;                     
						a0_wr[280]    <= x280_in;                     
						a0_wr[281]    <= x281_in;                     
						a0_wr[282]    <= x282_in;                     
						a0_wr[283]    <= x283_in;                     
						a0_wr[284]    <= x284_in;                     
						a0_wr[285]    <= x285_in;                     
						a0_wr[286]    <= x286_in;                     
						a0_wr[287]    <= x287_in;                     
						a0_wr[288]    <= x288_in;                     
						a0_wr[289]    <= x289_in;                     
						a0_wr[290]    <= x290_in;                     
						a0_wr[291]    <= x291_in;                     
						a0_wr[292]    <= x292_in;                     
						a0_wr[293]    <= x293_in;                     
						a0_wr[294]    <= x294_in;                     
						a0_wr[295]    <= x295_in;                     
						a0_wr[296]    <= x296_in;                     
						a0_wr[297]    <= x297_in;                     
						a0_wr[298]    <= x298_in;                     
						a0_wr[299]    <= x299_in;                     
						a0_wr[300]    <= x300_in;                     
						a0_wr[301]    <= x301_in;                     
						a0_wr[302]    <= x302_in;                     
						a0_wr[303]    <= x303_in;                     
						a0_wr[304]    <= x304_in;                     
						a0_wr[305]    <= x305_in;                     
						a0_wr[306]    <= x306_in;                     
						a0_wr[307]    <= x307_in;                     
						a0_wr[308]    <= x308_in;                     
						a0_wr[309]    <= x309_in;                     
						a0_wr[310]    <= x310_in;                     
						a0_wr[311]    <= x311_in;                     
						a0_wr[312]    <= x312_in;                     
						a0_wr[313]    <= x313_in;                     
						a0_wr[314]    <= x314_in;                     
						a0_wr[315]    <= x315_in;                     
						a0_wr[316]    <= x316_in;                     
						a0_wr[317]    <= x317_in;                     
						a0_wr[318]    <= x318_in;                     
						a0_wr[319]    <= x319_in;                     
						a0_wr[320]    <= x320_in;                     
						a0_wr[321]    <= x321_in;                     
						a0_wr[322]    <= x322_in;                     
						a0_wr[323]    <= x323_in;                     
						a0_wr[324]    <= x324_in;                     
						a0_wr[325]    <= x325_in;                     
						a0_wr[326]    <= x326_in;                     
						a0_wr[327]    <= x327_in;                     
						a0_wr[328]    <= x328_in;                     
						a0_wr[329]    <= x329_in;                     
						a0_wr[330]    <= x330_in;                     
						a0_wr[331]    <= x331_in;                     
						a0_wr[332]    <= x332_in;                     
						a0_wr[333]    <= x333_in;                     
						a0_wr[334]    <= x334_in;                     
						a0_wr[335]    <= x335_in;                     
						a0_wr[336]    <= x336_in;                     
						a0_wr[337]    <= x337_in;                     
						a0_wr[338]    <= x338_in;                     
						a0_wr[339]    <= x339_in;                     
						a0_wr[340]    <= x340_in;                     
						a0_wr[341]    <= x341_in;                     
						a0_wr[342]    <= x342_in;                     
						a0_wr[343]    <= x343_in;                     
						a0_wr[344]    <= x344_in;                     
						a0_wr[345]    <= x345_in;                     
						a0_wr[346]    <= x346_in;                     
						a0_wr[347]    <= x347_in;                     
						a0_wr[348]    <= x348_in;                     
						a0_wr[349]    <= x349_in;                     
						a0_wr[350]    <= x350_in;                     
						a0_wr[351]    <= x351_in;                     
						a0_wr[352]    <= x352_in;                     
						a0_wr[353]    <= x353_in;                     
						a0_wr[354]    <= x354_in;                     
						a0_wr[355]    <= x355_in;                     
						a0_wr[356]    <= x356_in;                     
						a0_wr[357]    <= x357_in;                     
						a0_wr[358]    <= x358_in;                     
						a0_wr[359]    <= x359_in;                     
						a0_wr[360]    <= x360_in;                     
						a0_wr[361]    <= x361_in;                     
						a0_wr[362]    <= x362_in;                     
						a0_wr[363]    <= x363_in;                     
						a0_wr[364]    <= x364_in;                     
						a0_wr[365]    <= x365_in;                     
						a0_wr[366]    <= x366_in;                     
						a0_wr[367]    <= x367_in;                     
						a0_wr[368]    <= x368_in;                     
						a0_wr[369]    <= x369_in;                     
						a0_wr[370]    <= x370_in;                     
						a0_wr[371]    <= x371_in;                     
						a0_wr[372]    <= x372_in;                     
						a0_wr[373]    <= x373_in;                     
						a0_wr[374]    <= x374_in;                     
						a0_wr[375]    <= x375_in;                     
						a0_wr[376]    <= x376_in;                     
						a0_wr[377]    <= x377_in;                     
						a0_wr[378]    <= x378_in;                     
						a0_wr[379]    <= x379_in;                     
						a0_wr[380]    <= x380_in;                     
						a0_wr[381]    <= x381_in;                     
						a0_wr[382]    <= x382_in;                     
						a0_wr[383]    <= x383_in;                     
						a0_wr[384]    <= x384_in;                     
						a0_wr[385]    <= x385_in;                     
						a0_wr[386]    <= x386_in;                     
						a0_wr[387]    <= x387_in;                     
						a0_wr[388]    <= x388_in;                     
						a0_wr[389]    <= x389_in;                     
						a0_wr[390]    <= x390_in;                     
						a0_wr[391]    <= x391_in;                     
						a0_wr[392]    <= x392_in;                     
						a0_wr[393]    <= x393_in;                     
						a0_wr[394]    <= x394_in;                     
						a0_wr[395]    <= x395_in;                     
						a0_wr[396]    <= x396_in;                     
						a0_wr[397]    <= x397_in;                     
						a0_wr[398]    <= x398_in;                     
						a0_wr[399]    <= x399_in;                     
						a0_wr[400]    <= x400_in;                     
						a0_wr[401]    <= x401_in;                     
						a0_wr[402]    <= x402_in;                     
						a0_wr[403]    <= x403_in;                     
						a0_wr[404]    <= x404_in;                     
						a0_wr[405]    <= x405_in;                     
						a0_wr[406]    <= x406_in;                     
						a0_wr[407]    <= x407_in;                     
						a0_wr[408]    <= x408_in;                     
						a0_wr[409]    <= x409_in;                     
						a0_wr[410]    <= x410_in;                     
						a0_wr[411]    <= x411_in;                     
						a0_wr[412]    <= x412_in;                     
						a0_wr[413]    <= x413_in;                     
						a0_wr[414]    <= x414_in;                     
						a0_wr[415]    <= x415_in;                     
						a0_wr[416]    <= x416_in;                     
						a0_wr[417]    <= x417_in;                     
						a0_wr[418]    <= x418_in;                     
						a0_wr[419]    <= x419_in;                     
						a0_wr[420]    <= x420_in;                     
						a0_wr[421]    <= x421_in;                     
						a0_wr[422]    <= x422_in;                     
						a0_wr[423]    <= x423_in;                     
						a0_wr[424]    <= x424_in;                     
						a0_wr[425]    <= x425_in;                     
						a0_wr[426]    <= x426_in;                     
						a0_wr[427]    <= x427_in;                     
						a0_wr[428]    <= x428_in;                     
						a0_wr[429]    <= x429_in;                     
						a0_wr[430]    <= x430_in;                     
						a0_wr[431]    <= x431_in;                     
						a0_wr[432]    <= x432_in;                     
						a0_wr[433]    <= x433_in;                     
						a0_wr[434]    <= x434_in;                     
						a0_wr[435]    <= x435_in;                     
						a0_wr[436]    <= x436_in;                     
						a0_wr[437]    <= x437_in;                     
						a0_wr[438]    <= x438_in;                     
						a0_wr[439]    <= x439_in;                     
						a0_wr[440]    <= x440_in;                     
						a0_wr[441]    <= x441_in;                     
						a0_wr[442]    <= x442_in;                     
						a0_wr[443]    <= x443_in;                     
						a0_wr[444]    <= x444_in;                     
						a0_wr[445]    <= x445_in;                     
						a0_wr[446]    <= x446_in;                     
						a0_wr[447]    <= x447_in;                     
						a0_wr[448]    <= x448_in;                     
						a0_wr[449]    <= x449_in;                     
						a0_wr[450]    <= x450_in;                     
						a0_wr[451]    <= x451_in;                     
						a0_wr[452]    <= x452_in;                     
						a0_wr[453]    <= x453_in;                     
						a0_wr[454]    <= x454_in;                     
						a0_wr[455]    <= x455_in;                     
						a0_wr[456]    <= x456_in;                     
						a0_wr[457]    <= x457_in;                     
						a0_wr[458]    <= x458_in;                     
						a0_wr[459]    <= x459_in;                     
						a0_wr[460]    <= x460_in;                     
						a0_wr[461]    <= x461_in;                     
						a0_wr[462]    <= x462_in;                     
						a0_wr[463]    <= x463_in;                     
						a0_wr[464]    <= x464_in;                     
						a0_wr[465]    <= x465_in;                     
						a0_wr[466]    <= x466_in;                     
						a0_wr[467]    <= x467_in;                     
						a0_wr[468]    <= x468_in;                     
						a0_wr[469]    <= x469_in;                     
						a0_wr[470]    <= x470_in;                     
						a0_wr[471]    <= x471_in;                     
						a0_wr[472]    <= x472_in;                     
						a0_wr[473]    <= x473_in;                     
						a0_wr[474]    <= x474_in;                     
						a0_wr[475]    <= x475_in;                     
						a0_wr[476]    <= x476_in;                     
						a0_wr[477]    <= x477_in;                     
						a0_wr[478]    <= x478_in;                     
						a0_wr[479]    <= x479_in;                     
						a0_wr[480]    <= x480_in;                     
						a0_wr[481]    <= x481_in;                     
						a0_wr[482]    <= x482_in;                     
						a0_wr[483]    <= x483_in;                     
						a0_wr[484]    <= x484_in;                     
						a0_wr[485]    <= x485_in;                     
						a0_wr[486]    <= x486_in;                     
						a0_wr[487]    <= x487_in;                     
						a0_wr[488]    <= x488_in;                     
						a0_wr[489]    <= x489_in;                     
						a0_wr[490]    <= x490_in;                     
						a0_wr[491]    <= x491_in;                     
						a0_wr[492]    <= x492_in;                     
						a0_wr[493]    <= x493_in;                     
						a0_wr[494]    <= x494_in;                     
						a0_wr[495]    <= x495_in;                     
						a0_wr[496]    <= x496_in;                     
						a0_wr[497]    <= x497_in;                     
						a0_wr[498]    <= x498_in;                     
						a0_wr[499]    <= x499_in;                     
						a0_wr[500]    <= x500_in;                     
						a0_wr[501]    <= x501_in;                     
						a0_wr[502]    <= x502_in;                     
						a0_wr[503]    <= x503_in;                     
						a0_wr[504]    <= x504_in;                     
						a0_wr[505]    <= x505_in;                     
						a0_wr[506]    <= x506_in;                     
						a0_wr[507]    <= x507_in;                     
						a0_wr[508]    <= x508_in;                     
						a0_wr[509]    <= x509_in;                     
						a0_wr[510]    <= x510_in;                     
						a0_wr[511]    <= x511_in;                     
					end
				end
			end

		//--- radix stage 0
			radix2 #(.width(width)) rd_st0_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[0]), .rdlo_in(a0_wr[256]),  .coef_in(coef[0]), .rdup_out(a1_wr[0]), .rdlo_out(a1_wr[256]));
			radix2 #(.width(width)) rd_st0_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[1]), .rdlo_in(a0_wr[257]),  .coef_in(coef[1]), .rdup_out(a1_wr[1]), .rdlo_out(a1_wr[257]));
			radix2 #(.width(width)) rd_st0_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[2]), .rdlo_in(a0_wr[258]),  .coef_in(coef[2]), .rdup_out(a1_wr[2]), .rdlo_out(a1_wr[258]));
			radix2 #(.width(width)) rd_st0_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[3]), .rdlo_in(a0_wr[259]),  .coef_in(coef[3]), .rdup_out(a1_wr[3]), .rdlo_out(a1_wr[259]));
			radix2 #(.width(width)) rd_st0_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[4]), .rdlo_in(a0_wr[260]),  .coef_in(coef[4]), .rdup_out(a1_wr[4]), .rdlo_out(a1_wr[260]));
			radix2 #(.width(width)) rd_st0_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[5]), .rdlo_in(a0_wr[261]),  .coef_in(coef[5]), .rdup_out(a1_wr[5]), .rdlo_out(a1_wr[261]));
			radix2 #(.width(width)) rd_st0_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[6]), .rdlo_in(a0_wr[262]),  .coef_in(coef[6]), .rdup_out(a1_wr[6]), .rdlo_out(a1_wr[262]));
			radix2 #(.width(width)) rd_st0_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[7]), .rdlo_in(a0_wr[263]),  .coef_in(coef[7]), .rdup_out(a1_wr[7]), .rdlo_out(a1_wr[263]));
			radix2 #(.width(width)) rd_st0_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[8]), .rdlo_in(a0_wr[264]),  .coef_in(coef[8]), .rdup_out(a1_wr[8]), .rdlo_out(a1_wr[264]));
			radix2 #(.width(width)) rd_st0_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[9]), .rdlo_in(a0_wr[265]),  .coef_in(coef[9]), .rdup_out(a1_wr[9]), .rdlo_out(a1_wr[265]));
			radix2 #(.width(width)) rd_st0_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[10]), .rdlo_in(a0_wr[266]),  .coef_in(coef[10]), .rdup_out(a1_wr[10]), .rdlo_out(a1_wr[266]));
			radix2 #(.width(width)) rd_st0_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[11]), .rdlo_in(a0_wr[267]),  .coef_in(coef[11]), .rdup_out(a1_wr[11]), .rdlo_out(a1_wr[267]));
			radix2 #(.width(width)) rd_st0_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[12]), .rdlo_in(a0_wr[268]),  .coef_in(coef[12]), .rdup_out(a1_wr[12]), .rdlo_out(a1_wr[268]));
			radix2 #(.width(width)) rd_st0_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[13]), .rdlo_in(a0_wr[269]),  .coef_in(coef[13]), .rdup_out(a1_wr[13]), .rdlo_out(a1_wr[269]));
			radix2 #(.width(width)) rd_st0_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[14]), .rdlo_in(a0_wr[270]),  .coef_in(coef[14]), .rdup_out(a1_wr[14]), .rdlo_out(a1_wr[270]));
			radix2 #(.width(width)) rd_st0_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[15]), .rdlo_in(a0_wr[271]),  .coef_in(coef[15]), .rdup_out(a1_wr[15]), .rdlo_out(a1_wr[271]));
			radix2 #(.width(width)) rd_st0_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[16]), .rdlo_in(a0_wr[272]),  .coef_in(coef[16]), .rdup_out(a1_wr[16]), .rdlo_out(a1_wr[272]));
			radix2 #(.width(width)) rd_st0_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[17]), .rdlo_in(a0_wr[273]),  .coef_in(coef[17]), .rdup_out(a1_wr[17]), .rdlo_out(a1_wr[273]));
			radix2 #(.width(width)) rd_st0_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[18]), .rdlo_in(a0_wr[274]),  .coef_in(coef[18]), .rdup_out(a1_wr[18]), .rdlo_out(a1_wr[274]));
			radix2 #(.width(width)) rd_st0_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[19]), .rdlo_in(a0_wr[275]),  .coef_in(coef[19]), .rdup_out(a1_wr[19]), .rdlo_out(a1_wr[275]));
			radix2 #(.width(width)) rd_st0_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[20]), .rdlo_in(a0_wr[276]),  .coef_in(coef[20]), .rdup_out(a1_wr[20]), .rdlo_out(a1_wr[276]));
			radix2 #(.width(width)) rd_st0_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[21]), .rdlo_in(a0_wr[277]),  .coef_in(coef[21]), .rdup_out(a1_wr[21]), .rdlo_out(a1_wr[277]));
			radix2 #(.width(width)) rd_st0_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[22]), .rdlo_in(a0_wr[278]),  .coef_in(coef[22]), .rdup_out(a1_wr[22]), .rdlo_out(a1_wr[278]));
			radix2 #(.width(width)) rd_st0_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[23]), .rdlo_in(a0_wr[279]),  .coef_in(coef[23]), .rdup_out(a1_wr[23]), .rdlo_out(a1_wr[279]));
			radix2 #(.width(width)) rd_st0_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[24]), .rdlo_in(a0_wr[280]),  .coef_in(coef[24]), .rdup_out(a1_wr[24]), .rdlo_out(a1_wr[280]));
			radix2 #(.width(width)) rd_st0_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[25]), .rdlo_in(a0_wr[281]),  .coef_in(coef[25]), .rdup_out(a1_wr[25]), .rdlo_out(a1_wr[281]));
			radix2 #(.width(width)) rd_st0_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[26]), .rdlo_in(a0_wr[282]),  .coef_in(coef[26]), .rdup_out(a1_wr[26]), .rdlo_out(a1_wr[282]));
			radix2 #(.width(width)) rd_st0_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[27]), .rdlo_in(a0_wr[283]),  .coef_in(coef[27]), .rdup_out(a1_wr[27]), .rdlo_out(a1_wr[283]));
			radix2 #(.width(width)) rd_st0_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[28]), .rdlo_in(a0_wr[284]),  .coef_in(coef[28]), .rdup_out(a1_wr[28]), .rdlo_out(a1_wr[284]));
			radix2 #(.width(width)) rd_st0_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[29]), .rdlo_in(a0_wr[285]),  .coef_in(coef[29]), .rdup_out(a1_wr[29]), .rdlo_out(a1_wr[285]));
			radix2 #(.width(width)) rd_st0_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[30]), .rdlo_in(a0_wr[286]),  .coef_in(coef[30]), .rdup_out(a1_wr[30]), .rdlo_out(a1_wr[286]));
			radix2 #(.width(width)) rd_st0_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[31]), .rdlo_in(a0_wr[287]),  .coef_in(coef[31]), .rdup_out(a1_wr[31]), .rdlo_out(a1_wr[287]));
			radix2 #(.width(width)) rd_st0_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[32]), .rdlo_in(a0_wr[288]),  .coef_in(coef[32]), .rdup_out(a1_wr[32]), .rdlo_out(a1_wr[288]));
			radix2 #(.width(width)) rd_st0_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[33]), .rdlo_in(a0_wr[289]),  .coef_in(coef[33]), .rdup_out(a1_wr[33]), .rdlo_out(a1_wr[289]));
			radix2 #(.width(width)) rd_st0_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[34]), .rdlo_in(a0_wr[290]),  .coef_in(coef[34]), .rdup_out(a1_wr[34]), .rdlo_out(a1_wr[290]));
			radix2 #(.width(width)) rd_st0_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[35]), .rdlo_in(a0_wr[291]),  .coef_in(coef[35]), .rdup_out(a1_wr[35]), .rdlo_out(a1_wr[291]));
			radix2 #(.width(width)) rd_st0_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[36]), .rdlo_in(a0_wr[292]),  .coef_in(coef[36]), .rdup_out(a1_wr[36]), .rdlo_out(a1_wr[292]));
			radix2 #(.width(width)) rd_st0_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[37]), .rdlo_in(a0_wr[293]),  .coef_in(coef[37]), .rdup_out(a1_wr[37]), .rdlo_out(a1_wr[293]));
			radix2 #(.width(width)) rd_st0_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[38]), .rdlo_in(a0_wr[294]),  .coef_in(coef[38]), .rdup_out(a1_wr[38]), .rdlo_out(a1_wr[294]));
			radix2 #(.width(width)) rd_st0_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[39]), .rdlo_in(a0_wr[295]),  .coef_in(coef[39]), .rdup_out(a1_wr[39]), .rdlo_out(a1_wr[295]));
			radix2 #(.width(width)) rd_st0_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[40]), .rdlo_in(a0_wr[296]),  .coef_in(coef[40]), .rdup_out(a1_wr[40]), .rdlo_out(a1_wr[296]));
			radix2 #(.width(width)) rd_st0_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[41]), .rdlo_in(a0_wr[297]),  .coef_in(coef[41]), .rdup_out(a1_wr[41]), .rdlo_out(a1_wr[297]));
			radix2 #(.width(width)) rd_st0_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[42]), .rdlo_in(a0_wr[298]),  .coef_in(coef[42]), .rdup_out(a1_wr[42]), .rdlo_out(a1_wr[298]));
			radix2 #(.width(width)) rd_st0_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[43]), .rdlo_in(a0_wr[299]),  .coef_in(coef[43]), .rdup_out(a1_wr[43]), .rdlo_out(a1_wr[299]));
			radix2 #(.width(width)) rd_st0_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[44]), .rdlo_in(a0_wr[300]),  .coef_in(coef[44]), .rdup_out(a1_wr[44]), .rdlo_out(a1_wr[300]));
			radix2 #(.width(width)) rd_st0_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[45]), .rdlo_in(a0_wr[301]),  .coef_in(coef[45]), .rdup_out(a1_wr[45]), .rdlo_out(a1_wr[301]));
			radix2 #(.width(width)) rd_st0_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[46]), .rdlo_in(a0_wr[302]),  .coef_in(coef[46]), .rdup_out(a1_wr[46]), .rdlo_out(a1_wr[302]));
			radix2 #(.width(width)) rd_st0_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[47]), .rdlo_in(a0_wr[303]),  .coef_in(coef[47]), .rdup_out(a1_wr[47]), .rdlo_out(a1_wr[303]));
			radix2 #(.width(width)) rd_st0_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[48]), .rdlo_in(a0_wr[304]),  .coef_in(coef[48]), .rdup_out(a1_wr[48]), .rdlo_out(a1_wr[304]));
			radix2 #(.width(width)) rd_st0_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[49]), .rdlo_in(a0_wr[305]),  .coef_in(coef[49]), .rdup_out(a1_wr[49]), .rdlo_out(a1_wr[305]));
			radix2 #(.width(width)) rd_st0_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[50]), .rdlo_in(a0_wr[306]),  .coef_in(coef[50]), .rdup_out(a1_wr[50]), .rdlo_out(a1_wr[306]));
			radix2 #(.width(width)) rd_st0_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[51]), .rdlo_in(a0_wr[307]),  .coef_in(coef[51]), .rdup_out(a1_wr[51]), .rdlo_out(a1_wr[307]));
			radix2 #(.width(width)) rd_st0_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[52]), .rdlo_in(a0_wr[308]),  .coef_in(coef[52]), .rdup_out(a1_wr[52]), .rdlo_out(a1_wr[308]));
			radix2 #(.width(width)) rd_st0_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[53]), .rdlo_in(a0_wr[309]),  .coef_in(coef[53]), .rdup_out(a1_wr[53]), .rdlo_out(a1_wr[309]));
			radix2 #(.width(width)) rd_st0_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[54]), .rdlo_in(a0_wr[310]),  .coef_in(coef[54]), .rdup_out(a1_wr[54]), .rdlo_out(a1_wr[310]));
			radix2 #(.width(width)) rd_st0_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[55]), .rdlo_in(a0_wr[311]),  .coef_in(coef[55]), .rdup_out(a1_wr[55]), .rdlo_out(a1_wr[311]));
			radix2 #(.width(width)) rd_st0_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[56]), .rdlo_in(a0_wr[312]),  .coef_in(coef[56]), .rdup_out(a1_wr[56]), .rdlo_out(a1_wr[312]));
			radix2 #(.width(width)) rd_st0_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[57]), .rdlo_in(a0_wr[313]),  .coef_in(coef[57]), .rdup_out(a1_wr[57]), .rdlo_out(a1_wr[313]));
			radix2 #(.width(width)) rd_st0_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[58]), .rdlo_in(a0_wr[314]),  .coef_in(coef[58]), .rdup_out(a1_wr[58]), .rdlo_out(a1_wr[314]));
			radix2 #(.width(width)) rd_st0_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[59]), .rdlo_in(a0_wr[315]),  .coef_in(coef[59]), .rdup_out(a1_wr[59]), .rdlo_out(a1_wr[315]));
			radix2 #(.width(width)) rd_st0_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[60]), .rdlo_in(a0_wr[316]),  .coef_in(coef[60]), .rdup_out(a1_wr[60]), .rdlo_out(a1_wr[316]));
			radix2 #(.width(width)) rd_st0_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[61]), .rdlo_in(a0_wr[317]),  .coef_in(coef[61]), .rdup_out(a1_wr[61]), .rdlo_out(a1_wr[317]));
			radix2 #(.width(width)) rd_st0_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[62]), .rdlo_in(a0_wr[318]),  .coef_in(coef[62]), .rdup_out(a1_wr[62]), .rdlo_out(a1_wr[318]));
			radix2 #(.width(width)) rd_st0_63  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[63]), .rdlo_in(a0_wr[319]),  .coef_in(coef[63]), .rdup_out(a1_wr[63]), .rdlo_out(a1_wr[319]));
			radix2 #(.width(width)) rd_st0_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[64]), .rdlo_in(a0_wr[320]),  .coef_in(coef[64]), .rdup_out(a1_wr[64]), .rdlo_out(a1_wr[320]));
			radix2 #(.width(width)) rd_st0_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[65]), .rdlo_in(a0_wr[321]),  .coef_in(coef[65]), .rdup_out(a1_wr[65]), .rdlo_out(a1_wr[321]));
			radix2 #(.width(width)) rd_st0_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[66]), .rdlo_in(a0_wr[322]),  .coef_in(coef[66]), .rdup_out(a1_wr[66]), .rdlo_out(a1_wr[322]));
			radix2 #(.width(width)) rd_st0_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[67]), .rdlo_in(a0_wr[323]),  .coef_in(coef[67]), .rdup_out(a1_wr[67]), .rdlo_out(a1_wr[323]));
			radix2 #(.width(width)) rd_st0_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[68]), .rdlo_in(a0_wr[324]),  .coef_in(coef[68]), .rdup_out(a1_wr[68]), .rdlo_out(a1_wr[324]));
			radix2 #(.width(width)) rd_st0_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[69]), .rdlo_in(a0_wr[325]),  .coef_in(coef[69]), .rdup_out(a1_wr[69]), .rdlo_out(a1_wr[325]));
			radix2 #(.width(width)) rd_st0_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[70]), .rdlo_in(a0_wr[326]),  .coef_in(coef[70]), .rdup_out(a1_wr[70]), .rdlo_out(a1_wr[326]));
			radix2 #(.width(width)) rd_st0_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[71]), .rdlo_in(a0_wr[327]),  .coef_in(coef[71]), .rdup_out(a1_wr[71]), .rdlo_out(a1_wr[327]));
			radix2 #(.width(width)) rd_st0_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[72]), .rdlo_in(a0_wr[328]),  .coef_in(coef[72]), .rdup_out(a1_wr[72]), .rdlo_out(a1_wr[328]));
			radix2 #(.width(width)) rd_st0_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[73]), .rdlo_in(a0_wr[329]),  .coef_in(coef[73]), .rdup_out(a1_wr[73]), .rdlo_out(a1_wr[329]));
			radix2 #(.width(width)) rd_st0_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[74]), .rdlo_in(a0_wr[330]),  .coef_in(coef[74]), .rdup_out(a1_wr[74]), .rdlo_out(a1_wr[330]));
			radix2 #(.width(width)) rd_st0_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[75]), .rdlo_in(a0_wr[331]),  .coef_in(coef[75]), .rdup_out(a1_wr[75]), .rdlo_out(a1_wr[331]));
			radix2 #(.width(width)) rd_st0_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[76]), .rdlo_in(a0_wr[332]),  .coef_in(coef[76]), .rdup_out(a1_wr[76]), .rdlo_out(a1_wr[332]));
			radix2 #(.width(width)) rd_st0_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[77]), .rdlo_in(a0_wr[333]),  .coef_in(coef[77]), .rdup_out(a1_wr[77]), .rdlo_out(a1_wr[333]));
			radix2 #(.width(width)) rd_st0_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[78]), .rdlo_in(a0_wr[334]),  .coef_in(coef[78]), .rdup_out(a1_wr[78]), .rdlo_out(a1_wr[334]));
			radix2 #(.width(width)) rd_st0_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[79]), .rdlo_in(a0_wr[335]),  .coef_in(coef[79]), .rdup_out(a1_wr[79]), .rdlo_out(a1_wr[335]));
			radix2 #(.width(width)) rd_st0_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[80]), .rdlo_in(a0_wr[336]),  .coef_in(coef[80]), .rdup_out(a1_wr[80]), .rdlo_out(a1_wr[336]));
			radix2 #(.width(width)) rd_st0_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[81]), .rdlo_in(a0_wr[337]),  .coef_in(coef[81]), .rdup_out(a1_wr[81]), .rdlo_out(a1_wr[337]));
			radix2 #(.width(width)) rd_st0_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[82]), .rdlo_in(a0_wr[338]),  .coef_in(coef[82]), .rdup_out(a1_wr[82]), .rdlo_out(a1_wr[338]));
			radix2 #(.width(width)) rd_st0_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[83]), .rdlo_in(a0_wr[339]),  .coef_in(coef[83]), .rdup_out(a1_wr[83]), .rdlo_out(a1_wr[339]));
			radix2 #(.width(width)) rd_st0_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[84]), .rdlo_in(a0_wr[340]),  .coef_in(coef[84]), .rdup_out(a1_wr[84]), .rdlo_out(a1_wr[340]));
			radix2 #(.width(width)) rd_st0_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[85]), .rdlo_in(a0_wr[341]),  .coef_in(coef[85]), .rdup_out(a1_wr[85]), .rdlo_out(a1_wr[341]));
			radix2 #(.width(width)) rd_st0_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[86]), .rdlo_in(a0_wr[342]),  .coef_in(coef[86]), .rdup_out(a1_wr[86]), .rdlo_out(a1_wr[342]));
			radix2 #(.width(width)) rd_st0_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[87]), .rdlo_in(a0_wr[343]),  .coef_in(coef[87]), .rdup_out(a1_wr[87]), .rdlo_out(a1_wr[343]));
			radix2 #(.width(width)) rd_st0_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[88]), .rdlo_in(a0_wr[344]),  .coef_in(coef[88]), .rdup_out(a1_wr[88]), .rdlo_out(a1_wr[344]));
			radix2 #(.width(width)) rd_st0_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[89]), .rdlo_in(a0_wr[345]),  .coef_in(coef[89]), .rdup_out(a1_wr[89]), .rdlo_out(a1_wr[345]));
			radix2 #(.width(width)) rd_st0_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[90]), .rdlo_in(a0_wr[346]),  .coef_in(coef[90]), .rdup_out(a1_wr[90]), .rdlo_out(a1_wr[346]));
			radix2 #(.width(width)) rd_st0_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[91]), .rdlo_in(a0_wr[347]),  .coef_in(coef[91]), .rdup_out(a1_wr[91]), .rdlo_out(a1_wr[347]));
			radix2 #(.width(width)) rd_st0_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[92]), .rdlo_in(a0_wr[348]),  .coef_in(coef[92]), .rdup_out(a1_wr[92]), .rdlo_out(a1_wr[348]));
			radix2 #(.width(width)) rd_st0_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[93]), .rdlo_in(a0_wr[349]),  .coef_in(coef[93]), .rdup_out(a1_wr[93]), .rdlo_out(a1_wr[349]));
			radix2 #(.width(width)) rd_st0_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[94]), .rdlo_in(a0_wr[350]),  .coef_in(coef[94]), .rdup_out(a1_wr[94]), .rdlo_out(a1_wr[350]));
			radix2 #(.width(width)) rd_st0_95  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[95]), .rdlo_in(a0_wr[351]),  .coef_in(coef[95]), .rdup_out(a1_wr[95]), .rdlo_out(a1_wr[351]));
			radix2 #(.width(width)) rd_st0_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[96]), .rdlo_in(a0_wr[352]),  .coef_in(coef[96]), .rdup_out(a1_wr[96]), .rdlo_out(a1_wr[352]));
			radix2 #(.width(width)) rd_st0_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[97]), .rdlo_in(a0_wr[353]),  .coef_in(coef[97]), .rdup_out(a1_wr[97]), .rdlo_out(a1_wr[353]));
			radix2 #(.width(width)) rd_st0_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[98]), .rdlo_in(a0_wr[354]),  .coef_in(coef[98]), .rdup_out(a1_wr[98]), .rdlo_out(a1_wr[354]));
			radix2 #(.width(width)) rd_st0_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[99]), .rdlo_in(a0_wr[355]),  .coef_in(coef[99]), .rdup_out(a1_wr[99]), .rdlo_out(a1_wr[355]));
			radix2 #(.width(width)) rd_st0_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[100]), .rdlo_in(a0_wr[356]),  .coef_in(coef[100]), .rdup_out(a1_wr[100]), .rdlo_out(a1_wr[356]));
			radix2 #(.width(width)) rd_st0_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[101]), .rdlo_in(a0_wr[357]),  .coef_in(coef[101]), .rdup_out(a1_wr[101]), .rdlo_out(a1_wr[357]));
			radix2 #(.width(width)) rd_st0_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[102]), .rdlo_in(a0_wr[358]),  .coef_in(coef[102]), .rdup_out(a1_wr[102]), .rdlo_out(a1_wr[358]));
			radix2 #(.width(width)) rd_st0_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[103]), .rdlo_in(a0_wr[359]),  .coef_in(coef[103]), .rdup_out(a1_wr[103]), .rdlo_out(a1_wr[359]));
			radix2 #(.width(width)) rd_st0_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[104]), .rdlo_in(a0_wr[360]),  .coef_in(coef[104]), .rdup_out(a1_wr[104]), .rdlo_out(a1_wr[360]));
			radix2 #(.width(width)) rd_st0_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[105]), .rdlo_in(a0_wr[361]),  .coef_in(coef[105]), .rdup_out(a1_wr[105]), .rdlo_out(a1_wr[361]));
			radix2 #(.width(width)) rd_st0_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[106]), .rdlo_in(a0_wr[362]),  .coef_in(coef[106]), .rdup_out(a1_wr[106]), .rdlo_out(a1_wr[362]));
			radix2 #(.width(width)) rd_st0_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[107]), .rdlo_in(a0_wr[363]),  .coef_in(coef[107]), .rdup_out(a1_wr[107]), .rdlo_out(a1_wr[363]));
			radix2 #(.width(width)) rd_st0_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[108]), .rdlo_in(a0_wr[364]),  .coef_in(coef[108]), .rdup_out(a1_wr[108]), .rdlo_out(a1_wr[364]));
			radix2 #(.width(width)) rd_st0_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[109]), .rdlo_in(a0_wr[365]),  .coef_in(coef[109]), .rdup_out(a1_wr[109]), .rdlo_out(a1_wr[365]));
			radix2 #(.width(width)) rd_st0_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[110]), .rdlo_in(a0_wr[366]),  .coef_in(coef[110]), .rdup_out(a1_wr[110]), .rdlo_out(a1_wr[366]));
			radix2 #(.width(width)) rd_st0_111  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[111]), .rdlo_in(a0_wr[367]),  .coef_in(coef[111]), .rdup_out(a1_wr[111]), .rdlo_out(a1_wr[367]));
			radix2 #(.width(width)) rd_st0_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[112]), .rdlo_in(a0_wr[368]),  .coef_in(coef[112]), .rdup_out(a1_wr[112]), .rdlo_out(a1_wr[368]));
			radix2 #(.width(width)) rd_st0_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[113]), .rdlo_in(a0_wr[369]),  .coef_in(coef[113]), .rdup_out(a1_wr[113]), .rdlo_out(a1_wr[369]));
			radix2 #(.width(width)) rd_st0_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[114]), .rdlo_in(a0_wr[370]),  .coef_in(coef[114]), .rdup_out(a1_wr[114]), .rdlo_out(a1_wr[370]));
			radix2 #(.width(width)) rd_st0_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[115]), .rdlo_in(a0_wr[371]),  .coef_in(coef[115]), .rdup_out(a1_wr[115]), .rdlo_out(a1_wr[371]));
			radix2 #(.width(width)) rd_st0_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[116]), .rdlo_in(a0_wr[372]),  .coef_in(coef[116]), .rdup_out(a1_wr[116]), .rdlo_out(a1_wr[372]));
			radix2 #(.width(width)) rd_st0_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[117]), .rdlo_in(a0_wr[373]),  .coef_in(coef[117]), .rdup_out(a1_wr[117]), .rdlo_out(a1_wr[373]));
			radix2 #(.width(width)) rd_st0_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[118]), .rdlo_in(a0_wr[374]),  .coef_in(coef[118]), .rdup_out(a1_wr[118]), .rdlo_out(a1_wr[374]));
			radix2 #(.width(width)) rd_st0_119  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[119]), .rdlo_in(a0_wr[375]),  .coef_in(coef[119]), .rdup_out(a1_wr[119]), .rdlo_out(a1_wr[375]));
			radix2 #(.width(width)) rd_st0_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[120]), .rdlo_in(a0_wr[376]),  .coef_in(coef[120]), .rdup_out(a1_wr[120]), .rdlo_out(a1_wr[376]));
			radix2 #(.width(width)) rd_st0_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[121]), .rdlo_in(a0_wr[377]),  .coef_in(coef[121]), .rdup_out(a1_wr[121]), .rdlo_out(a1_wr[377]));
			radix2 #(.width(width)) rd_st0_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[122]), .rdlo_in(a0_wr[378]),  .coef_in(coef[122]), .rdup_out(a1_wr[122]), .rdlo_out(a1_wr[378]));
			radix2 #(.width(width)) rd_st0_123  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[123]), .rdlo_in(a0_wr[379]),  .coef_in(coef[123]), .rdup_out(a1_wr[123]), .rdlo_out(a1_wr[379]));
			radix2 #(.width(width)) rd_st0_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[124]), .rdlo_in(a0_wr[380]),  .coef_in(coef[124]), .rdup_out(a1_wr[124]), .rdlo_out(a1_wr[380]));
			radix2 #(.width(width)) rd_st0_125  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[125]), .rdlo_in(a0_wr[381]),  .coef_in(coef[125]), .rdup_out(a1_wr[125]), .rdlo_out(a1_wr[381]));
			radix2 #(.width(width)) rd_st0_126  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[126]), .rdlo_in(a0_wr[382]),  .coef_in(coef[126]), .rdup_out(a1_wr[126]), .rdlo_out(a1_wr[382]));
			radix2 #(.width(width)) rd_st0_127  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[127]), .rdlo_in(a0_wr[383]),  .coef_in(coef[127]), .rdup_out(a1_wr[127]), .rdlo_out(a1_wr[383]));
			radix2 #(.width(width)) rd_st0_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[128]), .rdlo_in(a0_wr[384]),  .coef_in(coef[128]), .rdup_out(a1_wr[128]), .rdlo_out(a1_wr[384]));
			radix2 #(.width(width)) rd_st0_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[129]), .rdlo_in(a0_wr[385]),  .coef_in(coef[129]), .rdup_out(a1_wr[129]), .rdlo_out(a1_wr[385]));
			radix2 #(.width(width)) rd_st0_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[130]), .rdlo_in(a0_wr[386]),  .coef_in(coef[130]), .rdup_out(a1_wr[130]), .rdlo_out(a1_wr[386]));
			radix2 #(.width(width)) rd_st0_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[131]), .rdlo_in(a0_wr[387]),  .coef_in(coef[131]), .rdup_out(a1_wr[131]), .rdlo_out(a1_wr[387]));
			radix2 #(.width(width)) rd_st0_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[132]), .rdlo_in(a0_wr[388]),  .coef_in(coef[132]), .rdup_out(a1_wr[132]), .rdlo_out(a1_wr[388]));
			radix2 #(.width(width)) rd_st0_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[133]), .rdlo_in(a0_wr[389]),  .coef_in(coef[133]), .rdup_out(a1_wr[133]), .rdlo_out(a1_wr[389]));
			radix2 #(.width(width)) rd_st0_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[134]), .rdlo_in(a0_wr[390]),  .coef_in(coef[134]), .rdup_out(a1_wr[134]), .rdlo_out(a1_wr[390]));
			radix2 #(.width(width)) rd_st0_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[135]), .rdlo_in(a0_wr[391]),  .coef_in(coef[135]), .rdup_out(a1_wr[135]), .rdlo_out(a1_wr[391]));
			radix2 #(.width(width)) rd_st0_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[136]), .rdlo_in(a0_wr[392]),  .coef_in(coef[136]), .rdup_out(a1_wr[136]), .rdlo_out(a1_wr[392]));
			radix2 #(.width(width)) rd_st0_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[137]), .rdlo_in(a0_wr[393]),  .coef_in(coef[137]), .rdup_out(a1_wr[137]), .rdlo_out(a1_wr[393]));
			radix2 #(.width(width)) rd_st0_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[138]), .rdlo_in(a0_wr[394]),  .coef_in(coef[138]), .rdup_out(a1_wr[138]), .rdlo_out(a1_wr[394]));
			radix2 #(.width(width)) rd_st0_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[139]), .rdlo_in(a0_wr[395]),  .coef_in(coef[139]), .rdup_out(a1_wr[139]), .rdlo_out(a1_wr[395]));
			radix2 #(.width(width)) rd_st0_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[140]), .rdlo_in(a0_wr[396]),  .coef_in(coef[140]), .rdup_out(a1_wr[140]), .rdlo_out(a1_wr[396]));
			radix2 #(.width(width)) rd_st0_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[141]), .rdlo_in(a0_wr[397]),  .coef_in(coef[141]), .rdup_out(a1_wr[141]), .rdlo_out(a1_wr[397]));
			radix2 #(.width(width)) rd_st0_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[142]), .rdlo_in(a0_wr[398]),  .coef_in(coef[142]), .rdup_out(a1_wr[142]), .rdlo_out(a1_wr[398]));
			radix2 #(.width(width)) rd_st0_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[143]), .rdlo_in(a0_wr[399]),  .coef_in(coef[143]), .rdup_out(a1_wr[143]), .rdlo_out(a1_wr[399]));
			radix2 #(.width(width)) rd_st0_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[144]), .rdlo_in(a0_wr[400]),  .coef_in(coef[144]), .rdup_out(a1_wr[144]), .rdlo_out(a1_wr[400]));
			radix2 #(.width(width)) rd_st0_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[145]), .rdlo_in(a0_wr[401]),  .coef_in(coef[145]), .rdup_out(a1_wr[145]), .rdlo_out(a1_wr[401]));
			radix2 #(.width(width)) rd_st0_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[146]), .rdlo_in(a0_wr[402]),  .coef_in(coef[146]), .rdup_out(a1_wr[146]), .rdlo_out(a1_wr[402]));
			radix2 #(.width(width)) rd_st0_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[147]), .rdlo_in(a0_wr[403]),  .coef_in(coef[147]), .rdup_out(a1_wr[147]), .rdlo_out(a1_wr[403]));
			radix2 #(.width(width)) rd_st0_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[148]), .rdlo_in(a0_wr[404]),  .coef_in(coef[148]), .rdup_out(a1_wr[148]), .rdlo_out(a1_wr[404]));
			radix2 #(.width(width)) rd_st0_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[149]), .rdlo_in(a0_wr[405]),  .coef_in(coef[149]), .rdup_out(a1_wr[149]), .rdlo_out(a1_wr[405]));
			radix2 #(.width(width)) rd_st0_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[150]), .rdlo_in(a0_wr[406]),  .coef_in(coef[150]), .rdup_out(a1_wr[150]), .rdlo_out(a1_wr[406]));
			radix2 #(.width(width)) rd_st0_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[151]), .rdlo_in(a0_wr[407]),  .coef_in(coef[151]), .rdup_out(a1_wr[151]), .rdlo_out(a1_wr[407]));
			radix2 #(.width(width)) rd_st0_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[152]), .rdlo_in(a0_wr[408]),  .coef_in(coef[152]), .rdup_out(a1_wr[152]), .rdlo_out(a1_wr[408]));
			radix2 #(.width(width)) rd_st0_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[153]), .rdlo_in(a0_wr[409]),  .coef_in(coef[153]), .rdup_out(a1_wr[153]), .rdlo_out(a1_wr[409]));
			radix2 #(.width(width)) rd_st0_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[154]), .rdlo_in(a0_wr[410]),  .coef_in(coef[154]), .rdup_out(a1_wr[154]), .rdlo_out(a1_wr[410]));
			radix2 #(.width(width)) rd_st0_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[155]), .rdlo_in(a0_wr[411]),  .coef_in(coef[155]), .rdup_out(a1_wr[155]), .rdlo_out(a1_wr[411]));
			radix2 #(.width(width)) rd_st0_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[156]), .rdlo_in(a0_wr[412]),  .coef_in(coef[156]), .rdup_out(a1_wr[156]), .rdlo_out(a1_wr[412]));
			radix2 #(.width(width)) rd_st0_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[157]), .rdlo_in(a0_wr[413]),  .coef_in(coef[157]), .rdup_out(a1_wr[157]), .rdlo_out(a1_wr[413]));
			radix2 #(.width(width)) rd_st0_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[158]), .rdlo_in(a0_wr[414]),  .coef_in(coef[158]), .rdup_out(a1_wr[158]), .rdlo_out(a1_wr[414]));
			radix2 #(.width(width)) rd_st0_159  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[159]), .rdlo_in(a0_wr[415]),  .coef_in(coef[159]), .rdup_out(a1_wr[159]), .rdlo_out(a1_wr[415]));
			radix2 #(.width(width)) rd_st0_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[160]), .rdlo_in(a0_wr[416]),  .coef_in(coef[160]), .rdup_out(a1_wr[160]), .rdlo_out(a1_wr[416]));
			radix2 #(.width(width)) rd_st0_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[161]), .rdlo_in(a0_wr[417]),  .coef_in(coef[161]), .rdup_out(a1_wr[161]), .rdlo_out(a1_wr[417]));
			radix2 #(.width(width)) rd_st0_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[162]), .rdlo_in(a0_wr[418]),  .coef_in(coef[162]), .rdup_out(a1_wr[162]), .rdlo_out(a1_wr[418]));
			radix2 #(.width(width)) rd_st0_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[163]), .rdlo_in(a0_wr[419]),  .coef_in(coef[163]), .rdup_out(a1_wr[163]), .rdlo_out(a1_wr[419]));
			radix2 #(.width(width)) rd_st0_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[164]), .rdlo_in(a0_wr[420]),  .coef_in(coef[164]), .rdup_out(a1_wr[164]), .rdlo_out(a1_wr[420]));
			radix2 #(.width(width)) rd_st0_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[165]), .rdlo_in(a0_wr[421]),  .coef_in(coef[165]), .rdup_out(a1_wr[165]), .rdlo_out(a1_wr[421]));
			radix2 #(.width(width)) rd_st0_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[166]), .rdlo_in(a0_wr[422]),  .coef_in(coef[166]), .rdup_out(a1_wr[166]), .rdlo_out(a1_wr[422]));
			radix2 #(.width(width)) rd_st0_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[167]), .rdlo_in(a0_wr[423]),  .coef_in(coef[167]), .rdup_out(a1_wr[167]), .rdlo_out(a1_wr[423]));
			radix2 #(.width(width)) rd_st0_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[168]), .rdlo_in(a0_wr[424]),  .coef_in(coef[168]), .rdup_out(a1_wr[168]), .rdlo_out(a1_wr[424]));
			radix2 #(.width(width)) rd_st0_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[169]), .rdlo_in(a0_wr[425]),  .coef_in(coef[169]), .rdup_out(a1_wr[169]), .rdlo_out(a1_wr[425]));
			radix2 #(.width(width)) rd_st0_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[170]), .rdlo_in(a0_wr[426]),  .coef_in(coef[170]), .rdup_out(a1_wr[170]), .rdlo_out(a1_wr[426]));
			radix2 #(.width(width)) rd_st0_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[171]), .rdlo_in(a0_wr[427]),  .coef_in(coef[171]), .rdup_out(a1_wr[171]), .rdlo_out(a1_wr[427]));
			radix2 #(.width(width)) rd_st0_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[172]), .rdlo_in(a0_wr[428]),  .coef_in(coef[172]), .rdup_out(a1_wr[172]), .rdlo_out(a1_wr[428]));
			radix2 #(.width(width)) rd_st0_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[173]), .rdlo_in(a0_wr[429]),  .coef_in(coef[173]), .rdup_out(a1_wr[173]), .rdlo_out(a1_wr[429]));
			radix2 #(.width(width)) rd_st0_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[174]), .rdlo_in(a0_wr[430]),  .coef_in(coef[174]), .rdup_out(a1_wr[174]), .rdlo_out(a1_wr[430]));
			radix2 #(.width(width)) rd_st0_175  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[175]), .rdlo_in(a0_wr[431]),  .coef_in(coef[175]), .rdup_out(a1_wr[175]), .rdlo_out(a1_wr[431]));
			radix2 #(.width(width)) rd_st0_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[176]), .rdlo_in(a0_wr[432]),  .coef_in(coef[176]), .rdup_out(a1_wr[176]), .rdlo_out(a1_wr[432]));
			radix2 #(.width(width)) rd_st0_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[177]), .rdlo_in(a0_wr[433]),  .coef_in(coef[177]), .rdup_out(a1_wr[177]), .rdlo_out(a1_wr[433]));
			radix2 #(.width(width)) rd_st0_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[178]), .rdlo_in(a0_wr[434]),  .coef_in(coef[178]), .rdup_out(a1_wr[178]), .rdlo_out(a1_wr[434]));
			radix2 #(.width(width)) rd_st0_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[179]), .rdlo_in(a0_wr[435]),  .coef_in(coef[179]), .rdup_out(a1_wr[179]), .rdlo_out(a1_wr[435]));
			radix2 #(.width(width)) rd_st0_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[180]), .rdlo_in(a0_wr[436]),  .coef_in(coef[180]), .rdup_out(a1_wr[180]), .rdlo_out(a1_wr[436]));
			radix2 #(.width(width)) rd_st0_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[181]), .rdlo_in(a0_wr[437]),  .coef_in(coef[181]), .rdup_out(a1_wr[181]), .rdlo_out(a1_wr[437]));
			radix2 #(.width(width)) rd_st0_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[182]), .rdlo_in(a0_wr[438]),  .coef_in(coef[182]), .rdup_out(a1_wr[182]), .rdlo_out(a1_wr[438]));
			radix2 #(.width(width)) rd_st0_183  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[183]), .rdlo_in(a0_wr[439]),  .coef_in(coef[183]), .rdup_out(a1_wr[183]), .rdlo_out(a1_wr[439]));
			radix2 #(.width(width)) rd_st0_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[184]), .rdlo_in(a0_wr[440]),  .coef_in(coef[184]), .rdup_out(a1_wr[184]), .rdlo_out(a1_wr[440]));
			radix2 #(.width(width)) rd_st0_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[185]), .rdlo_in(a0_wr[441]),  .coef_in(coef[185]), .rdup_out(a1_wr[185]), .rdlo_out(a1_wr[441]));
			radix2 #(.width(width)) rd_st0_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[186]), .rdlo_in(a0_wr[442]),  .coef_in(coef[186]), .rdup_out(a1_wr[186]), .rdlo_out(a1_wr[442]));
			radix2 #(.width(width)) rd_st0_187  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[187]), .rdlo_in(a0_wr[443]),  .coef_in(coef[187]), .rdup_out(a1_wr[187]), .rdlo_out(a1_wr[443]));
			radix2 #(.width(width)) rd_st0_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[188]), .rdlo_in(a0_wr[444]),  .coef_in(coef[188]), .rdup_out(a1_wr[188]), .rdlo_out(a1_wr[444]));
			radix2 #(.width(width)) rd_st0_189  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[189]), .rdlo_in(a0_wr[445]),  .coef_in(coef[189]), .rdup_out(a1_wr[189]), .rdlo_out(a1_wr[445]));
			radix2 #(.width(width)) rd_st0_190  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[190]), .rdlo_in(a0_wr[446]),  .coef_in(coef[190]), .rdup_out(a1_wr[190]), .rdlo_out(a1_wr[446]));
			radix2 #(.width(width)) rd_st0_191  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[191]), .rdlo_in(a0_wr[447]),  .coef_in(coef[191]), .rdup_out(a1_wr[191]), .rdlo_out(a1_wr[447]));
			radix2 #(.width(width)) rd_st0_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[192]), .rdlo_in(a0_wr[448]),  .coef_in(coef[192]), .rdup_out(a1_wr[192]), .rdlo_out(a1_wr[448]));
			radix2 #(.width(width)) rd_st0_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[193]), .rdlo_in(a0_wr[449]),  .coef_in(coef[193]), .rdup_out(a1_wr[193]), .rdlo_out(a1_wr[449]));
			radix2 #(.width(width)) rd_st0_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[194]), .rdlo_in(a0_wr[450]),  .coef_in(coef[194]), .rdup_out(a1_wr[194]), .rdlo_out(a1_wr[450]));
			radix2 #(.width(width)) rd_st0_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[195]), .rdlo_in(a0_wr[451]),  .coef_in(coef[195]), .rdup_out(a1_wr[195]), .rdlo_out(a1_wr[451]));
			radix2 #(.width(width)) rd_st0_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[196]), .rdlo_in(a0_wr[452]),  .coef_in(coef[196]), .rdup_out(a1_wr[196]), .rdlo_out(a1_wr[452]));
			radix2 #(.width(width)) rd_st0_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[197]), .rdlo_in(a0_wr[453]),  .coef_in(coef[197]), .rdup_out(a1_wr[197]), .rdlo_out(a1_wr[453]));
			radix2 #(.width(width)) rd_st0_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[198]), .rdlo_in(a0_wr[454]),  .coef_in(coef[198]), .rdup_out(a1_wr[198]), .rdlo_out(a1_wr[454]));
			radix2 #(.width(width)) rd_st0_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[199]), .rdlo_in(a0_wr[455]),  .coef_in(coef[199]), .rdup_out(a1_wr[199]), .rdlo_out(a1_wr[455]));
			radix2 #(.width(width)) rd_st0_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[200]), .rdlo_in(a0_wr[456]),  .coef_in(coef[200]), .rdup_out(a1_wr[200]), .rdlo_out(a1_wr[456]));
			radix2 #(.width(width)) rd_st0_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[201]), .rdlo_in(a0_wr[457]),  .coef_in(coef[201]), .rdup_out(a1_wr[201]), .rdlo_out(a1_wr[457]));
			radix2 #(.width(width)) rd_st0_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[202]), .rdlo_in(a0_wr[458]),  .coef_in(coef[202]), .rdup_out(a1_wr[202]), .rdlo_out(a1_wr[458]));
			radix2 #(.width(width)) rd_st0_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[203]), .rdlo_in(a0_wr[459]),  .coef_in(coef[203]), .rdup_out(a1_wr[203]), .rdlo_out(a1_wr[459]));
			radix2 #(.width(width)) rd_st0_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[204]), .rdlo_in(a0_wr[460]),  .coef_in(coef[204]), .rdup_out(a1_wr[204]), .rdlo_out(a1_wr[460]));
			radix2 #(.width(width)) rd_st0_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[205]), .rdlo_in(a0_wr[461]),  .coef_in(coef[205]), .rdup_out(a1_wr[205]), .rdlo_out(a1_wr[461]));
			radix2 #(.width(width)) rd_st0_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[206]), .rdlo_in(a0_wr[462]),  .coef_in(coef[206]), .rdup_out(a1_wr[206]), .rdlo_out(a1_wr[462]));
			radix2 #(.width(width)) rd_st0_207  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[207]), .rdlo_in(a0_wr[463]),  .coef_in(coef[207]), .rdup_out(a1_wr[207]), .rdlo_out(a1_wr[463]));
			radix2 #(.width(width)) rd_st0_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[208]), .rdlo_in(a0_wr[464]),  .coef_in(coef[208]), .rdup_out(a1_wr[208]), .rdlo_out(a1_wr[464]));
			radix2 #(.width(width)) rd_st0_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[209]), .rdlo_in(a0_wr[465]),  .coef_in(coef[209]), .rdup_out(a1_wr[209]), .rdlo_out(a1_wr[465]));
			radix2 #(.width(width)) rd_st0_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[210]), .rdlo_in(a0_wr[466]),  .coef_in(coef[210]), .rdup_out(a1_wr[210]), .rdlo_out(a1_wr[466]));
			radix2 #(.width(width)) rd_st0_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[211]), .rdlo_in(a0_wr[467]),  .coef_in(coef[211]), .rdup_out(a1_wr[211]), .rdlo_out(a1_wr[467]));
			radix2 #(.width(width)) rd_st0_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[212]), .rdlo_in(a0_wr[468]),  .coef_in(coef[212]), .rdup_out(a1_wr[212]), .rdlo_out(a1_wr[468]));
			radix2 #(.width(width)) rd_st0_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[213]), .rdlo_in(a0_wr[469]),  .coef_in(coef[213]), .rdup_out(a1_wr[213]), .rdlo_out(a1_wr[469]));
			radix2 #(.width(width)) rd_st0_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[214]), .rdlo_in(a0_wr[470]),  .coef_in(coef[214]), .rdup_out(a1_wr[214]), .rdlo_out(a1_wr[470]));
			radix2 #(.width(width)) rd_st0_215  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[215]), .rdlo_in(a0_wr[471]),  .coef_in(coef[215]), .rdup_out(a1_wr[215]), .rdlo_out(a1_wr[471]));
			radix2 #(.width(width)) rd_st0_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[216]), .rdlo_in(a0_wr[472]),  .coef_in(coef[216]), .rdup_out(a1_wr[216]), .rdlo_out(a1_wr[472]));
			radix2 #(.width(width)) rd_st0_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[217]), .rdlo_in(a0_wr[473]),  .coef_in(coef[217]), .rdup_out(a1_wr[217]), .rdlo_out(a1_wr[473]));
			radix2 #(.width(width)) rd_st0_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[218]), .rdlo_in(a0_wr[474]),  .coef_in(coef[218]), .rdup_out(a1_wr[218]), .rdlo_out(a1_wr[474]));
			radix2 #(.width(width)) rd_st0_219  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[219]), .rdlo_in(a0_wr[475]),  .coef_in(coef[219]), .rdup_out(a1_wr[219]), .rdlo_out(a1_wr[475]));
			radix2 #(.width(width)) rd_st0_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[220]), .rdlo_in(a0_wr[476]),  .coef_in(coef[220]), .rdup_out(a1_wr[220]), .rdlo_out(a1_wr[476]));
			radix2 #(.width(width)) rd_st0_221  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[221]), .rdlo_in(a0_wr[477]),  .coef_in(coef[221]), .rdup_out(a1_wr[221]), .rdlo_out(a1_wr[477]));
			radix2 #(.width(width)) rd_st0_222  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[222]), .rdlo_in(a0_wr[478]),  .coef_in(coef[222]), .rdup_out(a1_wr[222]), .rdlo_out(a1_wr[478]));
			radix2 #(.width(width)) rd_st0_223  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[223]), .rdlo_in(a0_wr[479]),  .coef_in(coef[223]), .rdup_out(a1_wr[223]), .rdlo_out(a1_wr[479]));
			radix2 #(.width(width)) rd_st0_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[224]), .rdlo_in(a0_wr[480]),  .coef_in(coef[224]), .rdup_out(a1_wr[224]), .rdlo_out(a1_wr[480]));
			radix2 #(.width(width)) rd_st0_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[225]), .rdlo_in(a0_wr[481]),  .coef_in(coef[225]), .rdup_out(a1_wr[225]), .rdlo_out(a1_wr[481]));
			radix2 #(.width(width)) rd_st0_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[226]), .rdlo_in(a0_wr[482]),  .coef_in(coef[226]), .rdup_out(a1_wr[226]), .rdlo_out(a1_wr[482]));
			radix2 #(.width(width)) rd_st0_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[227]), .rdlo_in(a0_wr[483]),  .coef_in(coef[227]), .rdup_out(a1_wr[227]), .rdlo_out(a1_wr[483]));
			radix2 #(.width(width)) rd_st0_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[228]), .rdlo_in(a0_wr[484]),  .coef_in(coef[228]), .rdup_out(a1_wr[228]), .rdlo_out(a1_wr[484]));
			radix2 #(.width(width)) rd_st0_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[229]), .rdlo_in(a0_wr[485]),  .coef_in(coef[229]), .rdup_out(a1_wr[229]), .rdlo_out(a1_wr[485]));
			radix2 #(.width(width)) rd_st0_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[230]), .rdlo_in(a0_wr[486]),  .coef_in(coef[230]), .rdup_out(a1_wr[230]), .rdlo_out(a1_wr[486]));
			radix2 #(.width(width)) rd_st0_231  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[231]), .rdlo_in(a0_wr[487]),  .coef_in(coef[231]), .rdup_out(a1_wr[231]), .rdlo_out(a1_wr[487]));
			radix2 #(.width(width)) rd_st0_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[232]), .rdlo_in(a0_wr[488]),  .coef_in(coef[232]), .rdup_out(a1_wr[232]), .rdlo_out(a1_wr[488]));
			radix2 #(.width(width)) rd_st0_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[233]), .rdlo_in(a0_wr[489]),  .coef_in(coef[233]), .rdup_out(a1_wr[233]), .rdlo_out(a1_wr[489]));
			radix2 #(.width(width)) rd_st0_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[234]), .rdlo_in(a0_wr[490]),  .coef_in(coef[234]), .rdup_out(a1_wr[234]), .rdlo_out(a1_wr[490]));
			radix2 #(.width(width)) rd_st0_235  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[235]), .rdlo_in(a0_wr[491]),  .coef_in(coef[235]), .rdup_out(a1_wr[235]), .rdlo_out(a1_wr[491]));
			radix2 #(.width(width)) rd_st0_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[236]), .rdlo_in(a0_wr[492]),  .coef_in(coef[236]), .rdup_out(a1_wr[236]), .rdlo_out(a1_wr[492]));
			radix2 #(.width(width)) rd_st0_237  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[237]), .rdlo_in(a0_wr[493]),  .coef_in(coef[237]), .rdup_out(a1_wr[237]), .rdlo_out(a1_wr[493]));
			radix2 #(.width(width)) rd_st0_238  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[238]), .rdlo_in(a0_wr[494]),  .coef_in(coef[238]), .rdup_out(a1_wr[238]), .rdlo_out(a1_wr[494]));
			radix2 #(.width(width)) rd_st0_239  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[239]), .rdlo_in(a0_wr[495]),  .coef_in(coef[239]), .rdup_out(a1_wr[239]), .rdlo_out(a1_wr[495]));
			radix2 #(.width(width)) rd_st0_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[240]), .rdlo_in(a0_wr[496]),  .coef_in(coef[240]), .rdup_out(a1_wr[240]), .rdlo_out(a1_wr[496]));
			radix2 #(.width(width)) rd_st0_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[241]), .rdlo_in(a0_wr[497]),  .coef_in(coef[241]), .rdup_out(a1_wr[241]), .rdlo_out(a1_wr[497]));
			radix2 #(.width(width)) rd_st0_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[242]), .rdlo_in(a0_wr[498]),  .coef_in(coef[242]), .rdup_out(a1_wr[242]), .rdlo_out(a1_wr[498]));
			radix2 #(.width(width)) rd_st0_243  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[243]), .rdlo_in(a0_wr[499]),  .coef_in(coef[243]), .rdup_out(a1_wr[243]), .rdlo_out(a1_wr[499]));
			radix2 #(.width(width)) rd_st0_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[244]), .rdlo_in(a0_wr[500]),  .coef_in(coef[244]), .rdup_out(a1_wr[244]), .rdlo_out(a1_wr[500]));
			radix2 #(.width(width)) rd_st0_245  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[245]), .rdlo_in(a0_wr[501]),  .coef_in(coef[245]), .rdup_out(a1_wr[245]), .rdlo_out(a1_wr[501]));
			radix2 #(.width(width)) rd_st0_246  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[246]), .rdlo_in(a0_wr[502]),  .coef_in(coef[246]), .rdup_out(a1_wr[246]), .rdlo_out(a1_wr[502]));
			radix2 #(.width(width)) rd_st0_247  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[247]), .rdlo_in(a0_wr[503]),  .coef_in(coef[247]), .rdup_out(a1_wr[247]), .rdlo_out(a1_wr[503]));
			radix2 #(.width(width)) rd_st0_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[248]), .rdlo_in(a0_wr[504]),  .coef_in(coef[248]), .rdup_out(a1_wr[248]), .rdlo_out(a1_wr[504]));
			radix2 #(.width(width)) rd_st0_249  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[249]), .rdlo_in(a0_wr[505]),  .coef_in(coef[249]), .rdup_out(a1_wr[249]), .rdlo_out(a1_wr[505]));
			radix2 #(.width(width)) rd_st0_250  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[250]), .rdlo_in(a0_wr[506]),  .coef_in(coef[250]), .rdup_out(a1_wr[250]), .rdlo_out(a1_wr[506]));
			radix2 #(.width(width)) rd_st0_251  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[251]), .rdlo_in(a0_wr[507]),  .coef_in(coef[251]), .rdup_out(a1_wr[251]), .rdlo_out(a1_wr[507]));
			radix2 #(.width(width)) rd_st0_252  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[252]), .rdlo_in(a0_wr[508]),  .coef_in(coef[252]), .rdup_out(a1_wr[252]), .rdlo_out(a1_wr[508]));
			radix2 #(.width(width)) rd_st0_253  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[253]), .rdlo_in(a0_wr[509]),  .coef_in(coef[253]), .rdup_out(a1_wr[253]), .rdlo_out(a1_wr[509]));
			radix2 #(.width(width)) rd_st0_254  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[254]), .rdlo_in(a0_wr[510]),  .coef_in(coef[254]), .rdup_out(a1_wr[254]), .rdlo_out(a1_wr[510]));
			radix2 #(.width(width)) rd_st0_255  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a0_wr[255]), .rdlo_in(a0_wr[511]),  .coef_in(coef[255]), .rdup_out(a1_wr[255]), .rdlo_out(a1_wr[511]));

		//--- radix stage 1
			radix2 #(.width(width)) rd_st1_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[0]), .rdlo_in(a1_wr[128]),  .coef_in(coef[0]), .rdup_out(a2_wr[0]), .rdlo_out(a2_wr[128]));
			radix2 #(.width(width)) rd_st1_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[1]), .rdlo_in(a1_wr[129]),  .coef_in(coef[2]), .rdup_out(a2_wr[1]), .rdlo_out(a2_wr[129]));
			radix2 #(.width(width)) rd_st1_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[2]), .rdlo_in(a1_wr[130]),  .coef_in(coef[4]), .rdup_out(a2_wr[2]), .rdlo_out(a2_wr[130]));
			radix2 #(.width(width)) rd_st1_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[3]), .rdlo_in(a1_wr[131]),  .coef_in(coef[6]), .rdup_out(a2_wr[3]), .rdlo_out(a2_wr[131]));
			radix2 #(.width(width)) rd_st1_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[4]), .rdlo_in(a1_wr[132]),  .coef_in(coef[8]), .rdup_out(a2_wr[4]), .rdlo_out(a2_wr[132]));
			radix2 #(.width(width)) rd_st1_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[5]), .rdlo_in(a1_wr[133]),  .coef_in(coef[10]), .rdup_out(a2_wr[5]), .rdlo_out(a2_wr[133]));
			radix2 #(.width(width)) rd_st1_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[6]), .rdlo_in(a1_wr[134]),  .coef_in(coef[12]), .rdup_out(a2_wr[6]), .rdlo_out(a2_wr[134]));
			radix2 #(.width(width)) rd_st1_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[7]), .rdlo_in(a1_wr[135]),  .coef_in(coef[14]), .rdup_out(a2_wr[7]), .rdlo_out(a2_wr[135]));
			radix2 #(.width(width)) rd_st1_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[8]), .rdlo_in(a1_wr[136]),  .coef_in(coef[16]), .rdup_out(a2_wr[8]), .rdlo_out(a2_wr[136]));
			radix2 #(.width(width)) rd_st1_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[9]), .rdlo_in(a1_wr[137]),  .coef_in(coef[18]), .rdup_out(a2_wr[9]), .rdlo_out(a2_wr[137]));
			radix2 #(.width(width)) rd_st1_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[10]), .rdlo_in(a1_wr[138]),  .coef_in(coef[20]), .rdup_out(a2_wr[10]), .rdlo_out(a2_wr[138]));
			radix2 #(.width(width)) rd_st1_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[11]), .rdlo_in(a1_wr[139]),  .coef_in(coef[22]), .rdup_out(a2_wr[11]), .rdlo_out(a2_wr[139]));
			radix2 #(.width(width)) rd_st1_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[12]), .rdlo_in(a1_wr[140]),  .coef_in(coef[24]), .rdup_out(a2_wr[12]), .rdlo_out(a2_wr[140]));
			radix2 #(.width(width)) rd_st1_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[13]), .rdlo_in(a1_wr[141]),  .coef_in(coef[26]), .rdup_out(a2_wr[13]), .rdlo_out(a2_wr[141]));
			radix2 #(.width(width)) rd_st1_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[14]), .rdlo_in(a1_wr[142]),  .coef_in(coef[28]), .rdup_out(a2_wr[14]), .rdlo_out(a2_wr[142]));
			radix2 #(.width(width)) rd_st1_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[15]), .rdlo_in(a1_wr[143]),  .coef_in(coef[30]), .rdup_out(a2_wr[15]), .rdlo_out(a2_wr[143]));
			radix2 #(.width(width)) rd_st1_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[16]), .rdlo_in(a1_wr[144]),  .coef_in(coef[32]), .rdup_out(a2_wr[16]), .rdlo_out(a2_wr[144]));
			radix2 #(.width(width)) rd_st1_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[17]), .rdlo_in(a1_wr[145]),  .coef_in(coef[34]), .rdup_out(a2_wr[17]), .rdlo_out(a2_wr[145]));
			radix2 #(.width(width)) rd_st1_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[18]), .rdlo_in(a1_wr[146]),  .coef_in(coef[36]), .rdup_out(a2_wr[18]), .rdlo_out(a2_wr[146]));
			radix2 #(.width(width)) rd_st1_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[19]), .rdlo_in(a1_wr[147]),  .coef_in(coef[38]), .rdup_out(a2_wr[19]), .rdlo_out(a2_wr[147]));
			radix2 #(.width(width)) rd_st1_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[20]), .rdlo_in(a1_wr[148]),  .coef_in(coef[40]), .rdup_out(a2_wr[20]), .rdlo_out(a2_wr[148]));
			radix2 #(.width(width)) rd_st1_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[21]), .rdlo_in(a1_wr[149]),  .coef_in(coef[42]), .rdup_out(a2_wr[21]), .rdlo_out(a2_wr[149]));
			radix2 #(.width(width)) rd_st1_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[22]), .rdlo_in(a1_wr[150]),  .coef_in(coef[44]), .rdup_out(a2_wr[22]), .rdlo_out(a2_wr[150]));
			radix2 #(.width(width)) rd_st1_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[23]), .rdlo_in(a1_wr[151]),  .coef_in(coef[46]), .rdup_out(a2_wr[23]), .rdlo_out(a2_wr[151]));
			radix2 #(.width(width)) rd_st1_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[24]), .rdlo_in(a1_wr[152]),  .coef_in(coef[48]), .rdup_out(a2_wr[24]), .rdlo_out(a2_wr[152]));
			radix2 #(.width(width)) rd_st1_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[25]), .rdlo_in(a1_wr[153]),  .coef_in(coef[50]), .rdup_out(a2_wr[25]), .rdlo_out(a2_wr[153]));
			radix2 #(.width(width)) rd_st1_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[26]), .rdlo_in(a1_wr[154]),  .coef_in(coef[52]), .rdup_out(a2_wr[26]), .rdlo_out(a2_wr[154]));
			radix2 #(.width(width)) rd_st1_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[27]), .rdlo_in(a1_wr[155]),  .coef_in(coef[54]), .rdup_out(a2_wr[27]), .rdlo_out(a2_wr[155]));
			radix2 #(.width(width)) rd_st1_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[28]), .rdlo_in(a1_wr[156]),  .coef_in(coef[56]), .rdup_out(a2_wr[28]), .rdlo_out(a2_wr[156]));
			radix2 #(.width(width)) rd_st1_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[29]), .rdlo_in(a1_wr[157]),  .coef_in(coef[58]), .rdup_out(a2_wr[29]), .rdlo_out(a2_wr[157]));
			radix2 #(.width(width)) rd_st1_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[30]), .rdlo_in(a1_wr[158]),  .coef_in(coef[60]), .rdup_out(a2_wr[30]), .rdlo_out(a2_wr[158]));
			radix2 #(.width(width)) rd_st1_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[31]), .rdlo_in(a1_wr[159]),  .coef_in(coef[62]), .rdup_out(a2_wr[31]), .rdlo_out(a2_wr[159]));
			radix2 #(.width(width)) rd_st1_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[32]), .rdlo_in(a1_wr[160]),  .coef_in(coef[64]), .rdup_out(a2_wr[32]), .rdlo_out(a2_wr[160]));
			radix2 #(.width(width)) rd_st1_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[33]), .rdlo_in(a1_wr[161]),  .coef_in(coef[66]), .rdup_out(a2_wr[33]), .rdlo_out(a2_wr[161]));
			radix2 #(.width(width)) rd_st1_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[34]), .rdlo_in(a1_wr[162]),  .coef_in(coef[68]), .rdup_out(a2_wr[34]), .rdlo_out(a2_wr[162]));
			radix2 #(.width(width)) rd_st1_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[35]), .rdlo_in(a1_wr[163]),  .coef_in(coef[70]), .rdup_out(a2_wr[35]), .rdlo_out(a2_wr[163]));
			radix2 #(.width(width)) rd_st1_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[36]), .rdlo_in(a1_wr[164]),  .coef_in(coef[72]), .rdup_out(a2_wr[36]), .rdlo_out(a2_wr[164]));
			radix2 #(.width(width)) rd_st1_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[37]), .rdlo_in(a1_wr[165]),  .coef_in(coef[74]), .rdup_out(a2_wr[37]), .rdlo_out(a2_wr[165]));
			radix2 #(.width(width)) rd_st1_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[38]), .rdlo_in(a1_wr[166]),  .coef_in(coef[76]), .rdup_out(a2_wr[38]), .rdlo_out(a2_wr[166]));
			radix2 #(.width(width)) rd_st1_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[39]), .rdlo_in(a1_wr[167]),  .coef_in(coef[78]), .rdup_out(a2_wr[39]), .rdlo_out(a2_wr[167]));
			radix2 #(.width(width)) rd_st1_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[40]), .rdlo_in(a1_wr[168]),  .coef_in(coef[80]), .rdup_out(a2_wr[40]), .rdlo_out(a2_wr[168]));
			radix2 #(.width(width)) rd_st1_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[41]), .rdlo_in(a1_wr[169]),  .coef_in(coef[82]), .rdup_out(a2_wr[41]), .rdlo_out(a2_wr[169]));
			radix2 #(.width(width)) rd_st1_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[42]), .rdlo_in(a1_wr[170]),  .coef_in(coef[84]), .rdup_out(a2_wr[42]), .rdlo_out(a2_wr[170]));
			radix2 #(.width(width)) rd_st1_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[43]), .rdlo_in(a1_wr[171]),  .coef_in(coef[86]), .rdup_out(a2_wr[43]), .rdlo_out(a2_wr[171]));
			radix2 #(.width(width)) rd_st1_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[44]), .rdlo_in(a1_wr[172]),  .coef_in(coef[88]), .rdup_out(a2_wr[44]), .rdlo_out(a2_wr[172]));
			radix2 #(.width(width)) rd_st1_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[45]), .rdlo_in(a1_wr[173]),  .coef_in(coef[90]), .rdup_out(a2_wr[45]), .rdlo_out(a2_wr[173]));
			radix2 #(.width(width)) rd_st1_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[46]), .rdlo_in(a1_wr[174]),  .coef_in(coef[92]), .rdup_out(a2_wr[46]), .rdlo_out(a2_wr[174]));
			radix2 #(.width(width)) rd_st1_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[47]), .rdlo_in(a1_wr[175]),  .coef_in(coef[94]), .rdup_out(a2_wr[47]), .rdlo_out(a2_wr[175]));
			radix2 #(.width(width)) rd_st1_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[48]), .rdlo_in(a1_wr[176]),  .coef_in(coef[96]), .rdup_out(a2_wr[48]), .rdlo_out(a2_wr[176]));
			radix2 #(.width(width)) rd_st1_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[49]), .rdlo_in(a1_wr[177]),  .coef_in(coef[98]), .rdup_out(a2_wr[49]), .rdlo_out(a2_wr[177]));
			radix2 #(.width(width)) rd_st1_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[50]), .rdlo_in(a1_wr[178]),  .coef_in(coef[100]), .rdup_out(a2_wr[50]), .rdlo_out(a2_wr[178]));
			radix2 #(.width(width)) rd_st1_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[51]), .rdlo_in(a1_wr[179]),  .coef_in(coef[102]), .rdup_out(a2_wr[51]), .rdlo_out(a2_wr[179]));
			radix2 #(.width(width)) rd_st1_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[52]), .rdlo_in(a1_wr[180]),  .coef_in(coef[104]), .rdup_out(a2_wr[52]), .rdlo_out(a2_wr[180]));
			radix2 #(.width(width)) rd_st1_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[53]), .rdlo_in(a1_wr[181]),  .coef_in(coef[106]), .rdup_out(a2_wr[53]), .rdlo_out(a2_wr[181]));
			radix2 #(.width(width)) rd_st1_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[54]), .rdlo_in(a1_wr[182]),  .coef_in(coef[108]), .rdup_out(a2_wr[54]), .rdlo_out(a2_wr[182]));
			radix2 #(.width(width)) rd_st1_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[55]), .rdlo_in(a1_wr[183]),  .coef_in(coef[110]), .rdup_out(a2_wr[55]), .rdlo_out(a2_wr[183]));
			radix2 #(.width(width)) rd_st1_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[56]), .rdlo_in(a1_wr[184]),  .coef_in(coef[112]), .rdup_out(a2_wr[56]), .rdlo_out(a2_wr[184]));
			radix2 #(.width(width)) rd_st1_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[57]), .rdlo_in(a1_wr[185]),  .coef_in(coef[114]), .rdup_out(a2_wr[57]), .rdlo_out(a2_wr[185]));
			radix2 #(.width(width)) rd_st1_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[58]), .rdlo_in(a1_wr[186]),  .coef_in(coef[116]), .rdup_out(a2_wr[58]), .rdlo_out(a2_wr[186]));
			radix2 #(.width(width)) rd_st1_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[59]), .rdlo_in(a1_wr[187]),  .coef_in(coef[118]), .rdup_out(a2_wr[59]), .rdlo_out(a2_wr[187]));
			radix2 #(.width(width)) rd_st1_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[60]), .rdlo_in(a1_wr[188]),  .coef_in(coef[120]), .rdup_out(a2_wr[60]), .rdlo_out(a2_wr[188]));
			radix2 #(.width(width)) rd_st1_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[61]), .rdlo_in(a1_wr[189]),  .coef_in(coef[122]), .rdup_out(a2_wr[61]), .rdlo_out(a2_wr[189]));
			radix2 #(.width(width)) rd_st1_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[62]), .rdlo_in(a1_wr[190]),  .coef_in(coef[124]), .rdup_out(a2_wr[62]), .rdlo_out(a2_wr[190]));
			radix2 #(.width(width)) rd_st1_63  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[63]), .rdlo_in(a1_wr[191]),  .coef_in(coef[126]), .rdup_out(a2_wr[63]), .rdlo_out(a2_wr[191]));
			radix2 #(.width(width)) rd_st1_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[64]), .rdlo_in(a1_wr[192]),  .coef_in(coef[128]), .rdup_out(a2_wr[64]), .rdlo_out(a2_wr[192]));
			radix2 #(.width(width)) rd_st1_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[65]), .rdlo_in(a1_wr[193]),  .coef_in(coef[130]), .rdup_out(a2_wr[65]), .rdlo_out(a2_wr[193]));
			radix2 #(.width(width)) rd_st1_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[66]), .rdlo_in(a1_wr[194]),  .coef_in(coef[132]), .rdup_out(a2_wr[66]), .rdlo_out(a2_wr[194]));
			radix2 #(.width(width)) rd_st1_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[67]), .rdlo_in(a1_wr[195]),  .coef_in(coef[134]), .rdup_out(a2_wr[67]), .rdlo_out(a2_wr[195]));
			radix2 #(.width(width)) rd_st1_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[68]), .rdlo_in(a1_wr[196]),  .coef_in(coef[136]), .rdup_out(a2_wr[68]), .rdlo_out(a2_wr[196]));
			radix2 #(.width(width)) rd_st1_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[69]), .rdlo_in(a1_wr[197]),  .coef_in(coef[138]), .rdup_out(a2_wr[69]), .rdlo_out(a2_wr[197]));
			radix2 #(.width(width)) rd_st1_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[70]), .rdlo_in(a1_wr[198]),  .coef_in(coef[140]), .rdup_out(a2_wr[70]), .rdlo_out(a2_wr[198]));
			radix2 #(.width(width)) rd_st1_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[71]), .rdlo_in(a1_wr[199]),  .coef_in(coef[142]), .rdup_out(a2_wr[71]), .rdlo_out(a2_wr[199]));
			radix2 #(.width(width)) rd_st1_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[72]), .rdlo_in(a1_wr[200]),  .coef_in(coef[144]), .rdup_out(a2_wr[72]), .rdlo_out(a2_wr[200]));
			radix2 #(.width(width)) rd_st1_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[73]), .rdlo_in(a1_wr[201]),  .coef_in(coef[146]), .rdup_out(a2_wr[73]), .rdlo_out(a2_wr[201]));
			radix2 #(.width(width)) rd_st1_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[74]), .rdlo_in(a1_wr[202]),  .coef_in(coef[148]), .rdup_out(a2_wr[74]), .rdlo_out(a2_wr[202]));
			radix2 #(.width(width)) rd_st1_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[75]), .rdlo_in(a1_wr[203]),  .coef_in(coef[150]), .rdup_out(a2_wr[75]), .rdlo_out(a2_wr[203]));
			radix2 #(.width(width)) rd_st1_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[76]), .rdlo_in(a1_wr[204]),  .coef_in(coef[152]), .rdup_out(a2_wr[76]), .rdlo_out(a2_wr[204]));
			radix2 #(.width(width)) rd_st1_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[77]), .rdlo_in(a1_wr[205]),  .coef_in(coef[154]), .rdup_out(a2_wr[77]), .rdlo_out(a2_wr[205]));
			radix2 #(.width(width)) rd_st1_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[78]), .rdlo_in(a1_wr[206]),  .coef_in(coef[156]), .rdup_out(a2_wr[78]), .rdlo_out(a2_wr[206]));
			radix2 #(.width(width)) rd_st1_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[79]), .rdlo_in(a1_wr[207]),  .coef_in(coef[158]), .rdup_out(a2_wr[79]), .rdlo_out(a2_wr[207]));
			radix2 #(.width(width)) rd_st1_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[80]), .rdlo_in(a1_wr[208]),  .coef_in(coef[160]), .rdup_out(a2_wr[80]), .rdlo_out(a2_wr[208]));
			radix2 #(.width(width)) rd_st1_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[81]), .rdlo_in(a1_wr[209]),  .coef_in(coef[162]), .rdup_out(a2_wr[81]), .rdlo_out(a2_wr[209]));
			radix2 #(.width(width)) rd_st1_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[82]), .rdlo_in(a1_wr[210]),  .coef_in(coef[164]), .rdup_out(a2_wr[82]), .rdlo_out(a2_wr[210]));
			radix2 #(.width(width)) rd_st1_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[83]), .rdlo_in(a1_wr[211]),  .coef_in(coef[166]), .rdup_out(a2_wr[83]), .rdlo_out(a2_wr[211]));
			radix2 #(.width(width)) rd_st1_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[84]), .rdlo_in(a1_wr[212]),  .coef_in(coef[168]), .rdup_out(a2_wr[84]), .rdlo_out(a2_wr[212]));
			radix2 #(.width(width)) rd_st1_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[85]), .rdlo_in(a1_wr[213]),  .coef_in(coef[170]), .rdup_out(a2_wr[85]), .rdlo_out(a2_wr[213]));
			radix2 #(.width(width)) rd_st1_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[86]), .rdlo_in(a1_wr[214]),  .coef_in(coef[172]), .rdup_out(a2_wr[86]), .rdlo_out(a2_wr[214]));
			radix2 #(.width(width)) rd_st1_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[87]), .rdlo_in(a1_wr[215]),  .coef_in(coef[174]), .rdup_out(a2_wr[87]), .rdlo_out(a2_wr[215]));
			radix2 #(.width(width)) rd_st1_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[88]), .rdlo_in(a1_wr[216]),  .coef_in(coef[176]), .rdup_out(a2_wr[88]), .rdlo_out(a2_wr[216]));
			radix2 #(.width(width)) rd_st1_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[89]), .rdlo_in(a1_wr[217]),  .coef_in(coef[178]), .rdup_out(a2_wr[89]), .rdlo_out(a2_wr[217]));
			radix2 #(.width(width)) rd_st1_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[90]), .rdlo_in(a1_wr[218]),  .coef_in(coef[180]), .rdup_out(a2_wr[90]), .rdlo_out(a2_wr[218]));
			radix2 #(.width(width)) rd_st1_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[91]), .rdlo_in(a1_wr[219]),  .coef_in(coef[182]), .rdup_out(a2_wr[91]), .rdlo_out(a2_wr[219]));
			radix2 #(.width(width)) rd_st1_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[92]), .rdlo_in(a1_wr[220]),  .coef_in(coef[184]), .rdup_out(a2_wr[92]), .rdlo_out(a2_wr[220]));
			radix2 #(.width(width)) rd_st1_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[93]), .rdlo_in(a1_wr[221]),  .coef_in(coef[186]), .rdup_out(a2_wr[93]), .rdlo_out(a2_wr[221]));
			radix2 #(.width(width)) rd_st1_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[94]), .rdlo_in(a1_wr[222]),  .coef_in(coef[188]), .rdup_out(a2_wr[94]), .rdlo_out(a2_wr[222]));
			radix2 #(.width(width)) rd_st1_95  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[95]), .rdlo_in(a1_wr[223]),  .coef_in(coef[190]), .rdup_out(a2_wr[95]), .rdlo_out(a2_wr[223]));
			radix2 #(.width(width)) rd_st1_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[96]), .rdlo_in(a1_wr[224]),  .coef_in(coef[192]), .rdup_out(a2_wr[96]), .rdlo_out(a2_wr[224]));
			radix2 #(.width(width)) rd_st1_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[97]), .rdlo_in(a1_wr[225]),  .coef_in(coef[194]), .rdup_out(a2_wr[97]), .rdlo_out(a2_wr[225]));
			radix2 #(.width(width)) rd_st1_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[98]), .rdlo_in(a1_wr[226]),  .coef_in(coef[196]), .rdup_out(a2_wr[98]), .rdlo_out(a2_wr[226]));
			radix2 #(.width(width)) rd_st1_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[99]), .rdlo_in(a1_wr[227]),  .coef_in(coef[198]), .rdup_out(a2_wr[99]), .rdlo_out(a2_wr[227]));
			radix2 #(.width(width)) rd_st1_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[100]), .rdlo_in(a1_wr[228]),  .coef_in(coef[200]), .rdup_out(a2_wr[100]), .rdlo_out(a2_wr[228]));
			radix2 #(.width(width)) rd_st1_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[101]), .rdlo_in(a1_wr[229]),  .coef_in(coef[202]), .rdup_out(a2_wr[101]), .rdlo_out(a2_wr[229]));
			radix2 #(.width(width)) rd_st1_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[102]), .rdlo_in(a1_wr[230]),  .coef_in(coef[204]), .rdup_out(a2_wr[102]), .rdlo_out(a2_wr[230]));
			radix2 #(.width(width)) rd_st1_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[103]), .rdlo_in(a1_wr[231]),  .coef_in(coef[206]), .rdup_out(a2_wr[103]), .rdlo_out(a2_wr[231]));
			radix2 #(.width(width)) rd_st1_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[104]), .rdlo_in(a1_wr[232]),  .coef_in(coef[208]), .rdup_out(a2_wr[104]), .rdlo_out(a2_wr[232]));
			radix2 #(.width(width)) rd_st1_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[105]), .rdlo_in(a1_wr[233]),  .coef_in(coef[210]), .rdup_out(a2_wr[105]), .rdlo_out(a2_wr[233]));
			radix2 #(.width(width)) rd_st1_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[106]), .rdlo_in(a1_wr[234]),  .coef_in(coef[212]), .rdup_out(a2_wr[106]), .rdlo_out(a2_wr[234]));
			radix2 #(.width(width)) rd_st1_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[107]), .rdlo_in(a1_wr[235]),  .coef_in(coef[214]), .rdup_out(a2_wr[107]), .rdlo_out(a2_wr[235]));
			radix2 #(.width(width)) rd_st1_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[108]), .rdlo_in(a1_wr[236]),  .coef_in(coef[216]), .rdup_out(a2_wr[108]), .rdlo_out(a2_wr[236]));
			radix2 #(.width(width)) rd_st1_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[109]), .rdlo_in(a1_wr[237]),  .coef_in(coef[218]), .rdup_out(a2_wr[109]), .rdlo_out(a2_wr[237]));
			radix2 #(.width(width)) rd_st1_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[110]), .rdlo_in(a1_wr[238]),  .coef_in(coef[220]), .rdup_out(a2_wr[110]), .rdlo_out(a2_wr[238]));
			radix2 #(.width(width)) rd_st1_111  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[111]), .rdlo_in(a1_wr[239]),  .coef_in(coef[222]), .rdup_out(a2_wr[111]), .rdlo_out(a2_wr[239]));
			radix2 #(.width(width)) rd_st1_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[112]), .rdlo_in(a1_wr[240]),  .coef_in(coef[224]), .rdup_out(a2_wr[112]), .rdlo_out(a2_wr[240]));
			radix2 #(.width(width)) rd_st1_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[113]), .rdlo_in(a1_wr[241]),  .coef_in(coef[226]), .rdup_out(a2_wr[113]), .rdlo_out(a2_wr[241]));
			radix2 #(.width(width)) rd_st1_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[114]), .rdlo_in(a1_wr[242]),  .coef_in(coef[228]), .rdup_out(a2_wr[114]), .rdlo_out(a2_wr[242]));
			radix2 #(.width(width)) rd_st1_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[115]), .rdlo_in(a1_wr[243]),  .coef_in(coef[230]), .rdup_out(a2_wr[115]), .rdlo_out(a2_wr[243]));
			radix2 #(.width(width)) rd_st1_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[116]), .rdlo_in(a1_wr[244]),  .coef_in(coef[232]), .rdup_out(a2_wr[116]), .rdlo_out(a2_wr[244]));
			radix2 #(.width(width)) rd_st1_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[117]), .rdlo_in(a1_wr[245]),  .coef_in(coef[234]), .rdup_out(a2_wr[117]), .rdlo_out(a2_wr[245]));
			radix2 #(.width(width)) rd_st1_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[118]), .rdlo_in(a1_wr[246]),  .coef_in(coef[236]), .rdup_out(a2_wr[118]), .rdlo_out(a2_wr[246]));
			radix2 #(.width(width)) rd_st1_119  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[119]), .rdlo_in(a1_wr[247]),  .coef_in(coef[238]), .rdup_out(a2_wr[119]), .rdlo_out(a2_wr[247]));
			radix2 #(.width(width)) rd_st1_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[120]), .rdlo_in(a1_wr[248]),  .coef_in(coef[240]), .rdup_out(a2_wr[120]), .rdlo_out(a2_wr[248]));
			radix2 #(.width(width)) rd_st1_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[121]), .rdlo_in(a1_wr[249]),  .coef_in(coef[242]), .rdup_out(a2_wr[121]), .rdlo_out(a2_wr[249]));
			radix2 #(.width(width)) rd_st1_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[122]), .rdlo_in(a1_wr[250]),  .coef_in(coef[244]), .rdup_out(a2_wr[122]), .rdlo_out(a2_wr[250]));
			radix2 #(.width(width)) rd_st1_123  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[123]), .rdlo_in(a1_wr[251]),  .coef_in(coef[246]), .rdup_out(a2_wr[123]), .rdlo_out(a2_wr[251]));
			radix2 #(.width(width)) rd_st1_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[124]), .rdlo_in(a1_wr[252]),  .coef_in(coef[248]), .rdup_out(a2_wr[124]), .rdlo_out(a2_wr[252]));
			radix2 #(.width(width)) rd_st1_125  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[125]), .rdlo_in(a1_wr[253]),  .coef_in(coef[250]), .rdup_out(a2_wr[125]), .rdlo_out(a2_wr[253]));
			radix2 #(.width(width)) rd_st1_126  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[126]), .rdlo_in(a1_wr[254]),  .coef_in(coef[252]), .rdup_out(a2_wr[126]), .rdlo_out(a2_wr[254]));
			radix2 #(.width(width)) rd_st1_127  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[127]), .rdlo_in(a1_wr[255]),  .coef_in(coef[254]), .rdup_out(a2_wr[127]), .rdlo_out(a2_wr[255]));
			radix2 #(.width(width)) rd_st1_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[256]), .rdlo_in(a1_wr[384]),  .coef_in(coef[0]), .rdup_out(a2_wr[256]), .rdlo_out(a2_wr[384]));
			radix2 #(.width(width)) rd_st1_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[257]), .rdlo_in(a1_wr[385]),  .coef_in(coef[2]), .rdup_out(a2_wr[257]), .rdlo_out(a2_wr[385]));
			radix2 #(.width(width)) rd_st1_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[258]), .rdlo_in(a1_wr[386]),  .coef_in(coef[4]), .rdup_out(a2_wr[258]), .rdlo_out(a2_wr[386]));
			radix2 #(.width(width)) rd_st1_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[259]), .rdlo_in(a1_wr[387]),  .coef_in(coef[6]), .rdup_out(a2_wr[259]), .rdlo_out(a2_wr[387]));
			radix2 #(.width(width)) rd_st1_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[260]), .rdlo_in(a1_wr[388]),  .coef_in(coef[8]), .rdup_out(a2_wr[260]), .rdlo_out(a2_wr[388]));
			radix2 #(.width(width)) rd_st1_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[261]), .rdlo_in(a1_wr[389]),  .coef_in(coef[10]), .rdup_out(a2_wr[261]), .rdlo_out(a2_wr[389]));
			radix2 #(.width(width)) rd_st1_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[262]), .rdlo_in(a1_wr[390]),  .coef_in(coef[12]), .rdup_out(a2_wr[262]), .rdlo_out(a2_wr[390]));
			radix2 #(.width(width)) rd_st1_263  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[263]), .rdlo_in(a1_wr[391]),  .coef_in(coef[14]), .rdup_out(a2_wr[263]), .rdlo_out(a2_wr[391]));
			radix2 #(.width(width)) rd_st1_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[264]), .rdlo_in(a1_wr[392]),  .coef_in(coef[16]), .rdup_out(a2_wr[264]), .rdlo_out(a2_wr[392]));
			radix2 #(.width(width)) rd_st1_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[265]), .rdlo_in(a1_wr[393]),  .coef_in(coef[18]), .rdup_out(a2_wr[265]), .rdlo_out(a2_wr[393]));
			radix2 #(.width(width)) rd_st1_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[266]), .rdlo_in(a1_wr[394]),  .coef_in(coef[20]), .rdup_out(a2_wr[266]), .rdlo_out(a2_wr[394]));
			radix2 #(.width(width)) rd_st1_267  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[267]), .rdlo_in(a1_wr[395]),  .coef_in(coef[22]), .rdup_out(a2_wr[267]), .rdlo_out(a2_wr[395]));
			radix2 #(.width(width)) rd_st1_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[268]), .rdlo_in(a1_wr[396]),  .coef_in(coef[24]), .rdup_out(a2_wr[268]), .rdlo_out(a2_wr[396]));
			radix2 #(.width(width)) rd_st1_269  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[269]), .rdlo_in(a1_wr[397]),  .coef_in(coef[26]), .rdup_out(a2_wr[269]), .rdlo_out(a2_wr[397]));
			radix2 #(.width(width)) rd_st1_270  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[270]), .rdlo_in(a1_wr[398]),  .coef_in(coef[28]), .rdup_out(a2_wr[270]), .rdlo_out(a2_wr[398]));
			radix2 #(.width(width)) rd_st1_271  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[271]), .rdlo_in(a1_wr[399]),  .coef_in(coef[30]), .rdup_out(a2_wr[271]), .rdlo_out(a2_wr[399]));
			radix2 #(.width(width)) rd_st1_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[272]), .rdlo_in(a1_wr[400]),  .coef_in(coef[32]), .rdup_out(a2_wr[272]), .rdlo_out(a2_wr[400]));
			radix2 #(.width(width)) rd_st1_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[273]), .rdlo_in(a1_wr[401]),  .coef_in(coef[34]), .rdup_out(a2_wr[273]), .rdlo_out(a2_wr[401]));
			radix2 #(.width(width)) rd_st1_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[274]), .rdlo_in(a1_wr[402]),  .coef_in(coef[36]), .rdup_out(a2_wr[274]), .rdlo_out(a2_wr[402]));
			radix2 #(.width(width)) rd_st1_275  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[275]), .rdlo_in(a1_wr[403]),  .coef_in(coef[38]), .rdup_out(a2_wr[275]), .rdlo_out(a2_wr[403]));
			radix2 #(.width(width)) rd_st1_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[276]), .rdlo_in(a1_wr[404]),  .coef_in(coef[40]), .rdup_out(a2_wr[276]), .rdlo_out(a2_wr[404]));
			radix2 #(.width(width)) rd_st1_277  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[277]), .rdlo_in(a1_wr[405]),  .coef_in(coef[42]), .rdup_out(a2_wr[277]), .rdlo_out(a2_wr[405]));
			radix2 #(.width(width)) rd_st1_278  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[278]), .rdlo_in(a1_wr[406]),  .coef_in(coef[44]), .rdup_out(a2_wr[278]), .rdlo_out(a2_wr[406]));
			radix2 #(.width(width)) rd_st1_279  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[279]), .rdlo_in(a1_wr[407]),  .coef_in(coef[46]), .rdup_out(a2_wr[279]), .rdlo_out(a2_wr[407]));
			radix2 #(.width(width)) rd_st1_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[280]), .rdlo_in(a1_wr[408]),  .coef_in(coef[48]), .rdup_out(a2_wr[280]), .rdlo_out(a2_wr[408]));
			radix2 #(.width(width)) rd_st1_281  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[281]), .rdlo_in(a1_wr[409]),  .coef_in(coef[50]), .rdup_out(a2_wr[281]), .rdlo_out(a2_wr[409]));
			radix2 #(.width(width)) rd_st1_282  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[282]), .rdlo_in(a1_wr[410]),  .coef_in(coef[52]), .rdup_out(a2_wr[282]), .rdlo_out(a2_wr[410]));
			radix2 #(.width(width)) rd_st1_283  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[283]), .rdlo_in(a1_wr[411]),  .coef_in(coef[54]), .rdup_out(a2_wr[283]), .rdlo_out(a2_wr[411]));
			radix2 #(.width(width)) rd_st1_284  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[284]), .rdlo_in(a1_wr[412]),  .coef_in(coef[56]), .rdup_out(a2_wr[284]), .rdlo_out(a2_wr[412]));
			radix2 #(.width(width)) rd_st1_285  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[285]), .rdlo_in(a1_wr[413]),  .coef_in(coef[58]), .rdup_out(a2_wr[285]), .rdlo_out(a2_wr[413]));
			radix2 #(.width(width)) rd_st1_286  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[286]), .rdlo_in(a1_wr[414]),  .coef_in(coef[60]), .rdup_out(a2_wr[286]), .rdlo_out(a2_wr[414]));
			radix2 #(.width(width)) rd_st1_287  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[287]), .rdlo_in(a1_wr[415]),  .coef_in(coef[62]), .rdup_out(a2_wr[287]), .rdlo_out(a2_wr[415]));
			radix2 #(.width(width)) rd_st1_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[288]), .rdlo_in(a1_wr[416]),  .coef_in(coef[64]), .rdup_out(a2_wr[288]), .rdlo_out(a2_wr[416]));
			radix2 #(.width(width)) rd_st1_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[289]), .rdlo_in(a1_wr[417]),  .coef_in(coef[66]), .rdup_out(a2_wr[289]), .rdlo_out(a2_wr[417]));
			radix2 #(.width(width)) rd_st1_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[290]), .rdlo_in(a1_wr[418]),  .coef_in(coef[68]), .rdup_out(a2_wr[290]), .rdlo_out(a2_wr[418]));
			radix2 #(.width(width)) rd_st1_291  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[291]), .rdlo_in(a1_wr[419]),  .coef_in(coef[70]), .rdup_out(a2_wr[291]), .rdlo_out(a2_wr[419]));
			radix2 #(.width(width)) rd_st1_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[292]), .rdlo_in(a1_wr[420]),  .coef_in(coef[72]), .rdup_out(a2_wr[292]), .rdlo_out(a2_wr[420]));
			radix2 #(.width(width)) rd_st1_293  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[293]), .rdlo_in(a1_wr[421]),  .coef_in(coef[74]), .rdup_out(a2_wr[293]), .rdlo_out(a2_wr[421]));
			radix2 #(.width(width)) rd_st1_294  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[294]), .rdlo_in(a1_wr[422]),  .coef_in(coef[76]), .rdup_out(a2_wr[294]), .rdlo_out(a2_wr[422]));
			radix2 #(.width(width)) rd_st1_295  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[295]), .rdlo_in(a1_wr[423]),  .coef_in(coef[78]), .rdup_out(a2_wr[295]), .rdlo_out(a2_wr[423]));
			radix2 #(.width(width)) rd_st1_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[296]), .rdlo_in(a1_wr[424]),  .coef_in(coef[80]), .rdup_out(a2_wr[296]), .rdlo_out(a2_wr[424]));
			radix2 #(.width(width)) rd_st1_297  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[297]), .rdlo_in(a1_wr[425]),  .coef_in(coef[82]), .rdup_out(a2_wr[297]), .rdlo_out(a2_wr[425]));
			radix2 #(.width(width)) rd_st1_298  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[298]), .rdlo_in(a1_wr[426]),  .coef_in(coef[84]), .rdup_out(a2_wr[298]), .rdlo_out(a2_wr[426]));
			radix2 #(.width(width)) rd_st1_299  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[299]), .rdlo_in(a1_wr[427]),  .coef_in(coef[86]), .rdup_out(a2_wr[299]), .rdlo_out(a2_wr[427]));
			radix2 #(.width(width)) rd_st1_300  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[300]), .rdlo_in(a1_wr[428]),  .coef_in(coef[88]), .rdup_out(a2_wr[300]), .rdlo_out(a2_wr[428]));
			radix2 #(.width(width)) rd_st1_301  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[301]), .rdlo_in(a1_wr[429]),  .coef_in(coef[90]), .rdup_out(a2_wr[301]), .rdlo_out(a2_wr[429]));
			radix2 #(.width(width)) rd_st1_302  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[302]), .rdlo_in(a1_wr[430]),  .coef_in(coef[92]), .rdup_out(a2_wr[302]), .rdlo_out(a2_wr[430]));
			radix2 #(.width(width)) rd_st1_303  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[303]), .rdlo_in(a1_wr[431]),  .coef_in(coef[94]), .rdup_out(a2_wr[303]), .rdlo_out(a2_wr[431]));
			radix2 #(.width(width)) rd_st1_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[304]), .rdlo_in(a1_wr[432]),  .coef_in(coef[96]), .rdup_out(a2_wr[304]), .rdlo_out(a2_wr[432]));
			radix2 #(.width(width)) rd_st1_305  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[305]), .rdlo_in(a1_wr[433]),  .coef_in(coef[98]), .rdup_out(a2_wr[305]), .rdlo_out(a2_wr[433]));
			radix2 #(.width(width)) rd_st1_306  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[306]), .rdlo_in(a1_wr[434]),  .coef_in(coef[100]), .rdup_out(a2_wr[306]), .rdlo_out(a2_wr[434]));
			radix2 #(.width(width)) rd_st1_307  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[307]), .rdlo_in(a1_wr[435]),  .coef_in(coef[102]), .rdup_out(a2_wr[307]), .rdlo_out(a2_wr[435]));
			radix2 #(.width(width)) rd_st1_308  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[308]), .rdlo_in(a1_wr[436]),  .coef_in(coef[104]), .rdup_out(a2_wr[308]), .rdlo_out(a2_wr[436]));
			radix2 #(.width(width)) rd_st1_309  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[309]), .rdlo_in(a1_wr[437]),  .coef_in(coef[106]), .rdup_out(a2_wr[309]), .rdlo_out(a2_wr[437]));
			radix2 #(.width(width)) rd_st1_310  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[310]), .rdlo_in(a1_wr[438]),  .coef_in(coef[108]), .rdup_out(a2_wr[310]), .rdlo_out(a2_wr[438]));
			radix2 #(.width(width)) rd_st1_311  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[311]), .rdlo_in(a1_wr[439]),  .coef_in(coef[110]), .rdup_out(a2_wr[311]), .rdlo_out(a2_wr[439]));
			radix2 #(.width(width)) rd_st1_312  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[312]), .rdlo_in(a1_wr[440]),  .coef_in(coef[112]), .rdup_out(a2_wr[312]), .rdlo_out(a2_wr[440]));
			radix2 #(.width(width)) rd_st1_313  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[313]), .rdlo_in(a1_wr[441]),  .coef_in(coef[114]), .rdup_out(a2_wr[313]), .rdlo_out(a2_wr[441]));
			radix2 #(.width(width)) rd_st1_314  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[314]), .rdlo_in(a1_wr[442]),  .coef_in(coef[116]), .rdup_out(a2_wr[314]), .rdlo_out(a2_wr[442]));
			radix2 #(.width(width)) rd_st1_315  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[315]), .rdlo_in(a1_wr[443]),  .coef_in(coef[118]), .rdup_out(a2_wr[315]), .rdlo_out(a2_wr[443]));
			radix2 #(.width(width)) rd_st1_316  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[316]), .rdlo_in(a1_wr[444]),  .coef_in(coef[120]), .rdup_out(a2_wr[316]), .rdlo_out(a2_wr[444]));
			radix2 #(.width(width)) rd_st1_317  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[317]), .rdlo_in(a1_wr[445]),  .coef_in(coef[122]), .rdup_out(a2_wr[317]), .rdlo_out(a2_wr[445]));
			radix2 #(.width(width)) rd_st1_318  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[318]), .rdlo_in(a1_wr[446]),  .coef_in(coef[124]), .rdup_out(a2_wr[318]), .rdlo_out(a2_wr[446]));
			radix2 #(.width(width)) rd_st1_319  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[319]), .rdlo_in(a1_wr[447]),  .coef_in(coef[126]), .rdup_out(a2_wr[319]), .rdlo_out(a2_wr[447]));
			radix2 #(.width(width)) rd_st1_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[320]), .rdlo_in(a1_wr[448]),  .coef_in(coef[128]), .rdup_out(a2_wr[320]), .rdlo_out(a2_wr[448]));
			radix2 #(.width(width)) rd_st1_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[321]), .rdlo_in(a1_wr[449]),  .coef_in(coef[130]), .rdup_out(a2_wr[321]), .rdlo_out(a2_wr[449]));
			radix2 #(.width(width)) rd_st1_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[322]), .rdlo_in(a1_wr[450]),  .coef_in(coef[132]), .rdup_out(a2_wr[322]), .rdlo_out(a2_wr[450]));
			radix2 #(.width(width)) rd_st1_323  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[323]), .rdlo_in(a1_wr[451]),  .coef_in(coef[134]), .rdup_out(a2_wr[323]), .rdlo_out(a2_wr[451]));
			radix2 #(.width(width)) rd_st1_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[324]), .rdlo_in(a1_wr[452]),  .coef_in(coef[136]), .rdup_out(a2_wr[324]), .rdlo_out(a2_wr[452]));
			radix2 #(.width(width)) rd_st1_325  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[325]), .rdlo_in(a1_wr[453]),  .coef_in(coef[138]), .rdup_out(a2_wr[325]), .rdlo_out(a2_wr[453]));
			radix2 #(.width(width)) rd_st1_326  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[326]), .rdlo_in(a1_wr[454]),  .coef_in(coef[140]), .rdup_out(a2_wr[326]), .rdlo_out(a2_wr[454]));
			radix2 #(.width(width)) rd_st1_327  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[327]), .rdlo_in(a1_wr[455]),  .coef_in(coef[142]), .rdup_out(a2_wr[327]), .rdlo_out(a2_wr[455]));
			radix2 #(.width(width)) rd_st1_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[328]), .rdlo_in(a1_wr[456]),  .coef_in(coef[144]), .rdup_out(a2_wr[328]), .rdlo_out(a2_wr[456]));
			radix2 #(.width(width)) rd_st1_329  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[329]), .rdlo_in(a1_wr[457]),  .coef_in(coef[146]), .rdup_out(a2_wr[329]), .rdlo_out(a2_wr[457]));
			radix2 #(.width(width)) rd_st1_330  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[330]), .rdlo_in(a1_wr[458]),  .coef_in(coef[148]), .rdup_out(a2_wr[330]), .rdlo_out(a2_wr[458]));
			radix2 #(.width(width)) rd_st1_331  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[331]), .rdlo_in(a1_wr[459]),  .coef_in(coef[150]), .rdup_out(a2_wr[331]), .rdlo_out(a2_wr[459]));
			radix2 #(.width(width)) rd_st1_332  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[332]), .rdlo_in(a1_wr[460]),  .coef_in(coef[152]), .rdup_out(a2_wr[332]), .rdlo_out(a2_wr[460]));
			radix2 #(.width(width)) rd_st1_333  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[333]), .rdlo_in(a1_wr[461]),  .coef_in(coef[154]), .rdup_out(a2_wr[333]), .rdlo_out(a2_wr[461]));
			radix2 #(.width(width)) rd_st1_334  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[334]), .rdlo_in(a1_wr[462]),  .coef_in(coef[156]), .rdup_out(a2_wr[334]), .rdlo_out(a2_wr[462]));
			radix2 #(.width(width)) rd_st1_335  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[335]), .rdlo_in(a1_wr[463]),  .coef_in(coef[158]), .rdup_out(a2_wr[335]), .rdlo_out(a2_wr[463]));
			radix2 #(.width(width)) rd_st1_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[336]), .rdlo_in(a1_wr[464]),  .coef_in(coef[160]), .rdup_out(a2_wr[336]), .rdlo_out(a2_wr[464]));
			radix2 #(.width(width)) rd_st1_337  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[337]), .rdlo_in(a1_wr[465]),  .coef_in(coef[162]), .rdup_out(a2_wr[337]), .rdlo_out(a2_wr[465]));
			radix2 #(.width(width)) rd_st1_338  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[338]), .rdlo_in(a1_wr[466]),  .coef_in(coef[164]), .rdup_out(a2_wr[338]), .rdlo_out(a2_wr[466]));
			radix2 #(.width(width)) rd_st1_339  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[339]), .rdlo_in(a1_wr[467]),  .coef_in(coef[166]), .rdup_out(a2_wr[339]), .rdlo_out(a2_wr[467]));
			radix2 #(.width(width)) rd_st1_340  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[340]), .rdlo_in(a1_wr[468]),  .coef_in(coef[168]), .rdup_out(a2_wr[340]), .rdlo_out(a2_wr[468]));
			radix2 #(.width(width)) rd_st1_341  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[341]), .rdlo_in(a1_wr[469]),  .coef_in(coef[170]), .rdup_out(a2_wr[341]), .rdlo_out(a2_wr[469]));
			radix2 #(.width(width)) rd_st1_342  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[342]), .rdlo_in(a1_wr[470]),  .coef_in(coef[172]), .rdup_out(a2_wr[342]), .rdlo_out(a2_wr[470]));
			radix2 #(.width(width)) rd_st1_343  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[343]), .rdlo_in(a1_wr[471]),  .coef_in(coef[174]), .rdup_out(a2_wr[343]), .rdlo_out(a2_wr[471]));
			radix2 #(.width(width)) rd_st1_344  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[344]), .rdlo_in(a1_wr[472]),  .coef_in(coef[176]), .rdup_out(a2_wr[344]), .rdlo_out(a2_wr[472]));
			radix2 #(.width(width)) rd_st1_345  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[345]), .rdlo_in(a1_wr[473]),  .coef_in(coef[178]), .rdup_out(a2_wr[345]), .rdlo_out(a2_wr[473]));
			radix2 #(.width(width)) rd_st1_346  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[346]), .rdlo_in(a1_wr[474]),  .coef_in(coef[180]), .rdup_out(a2_wr[346]), .rdlo_out(a2_wr[474]));
			radix2 #(.width(width)) rd_st1_347  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[347]), .rdlo_in(a1_wr[475]),  .coef_in(coef[182]), .rdup_out(a2_wr[347]), .rdlo_out(a2_wr[475]));
			radix2 #(.width(width)) rd_st1_348  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[348]), .rdlo_in(a1_wr[476]),  .coef_in(coef[184]), .rdup_out(a2_wr[348]), .rdlo_out(a2_wr[476]));
			radix2 #(.width(width)) rd_st1_349  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[349]), .rdlo_in(a1_wr[477]),  .coef_in(coef[186]), .rdup_out(a2_wr[349]), .rdlo_out(a2_wr[477]));
			radix2 #(.width(width)) rd_st1_350  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[350]), .rdlo_in(a1_wr[478]),  .coef_in(coef[188]), .rdup_out(a2_wr[350]), .rdlo_out(a2_wr[478]));
			radix2 #(.width(width)) rd_st1_351  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[351]), .rdlo_in(a1_wr[479]),  .coef_in(coef[190]), .rdup_out(a2_wr[351]), .rdlo_out(a2_wr[479]));
			radix2 #(.width(width)) rd_st1_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[352]), .rdlo_in(a1_wr[480]),  .coef_in(coef[192]), .rdup_out(a2_wr[352]), .rdlo_out(a2_wr[480]));
			radix2 #(.width(width)) rd_st1_353  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[353]), .rdlo_in(a1_wr[481]),  .coef_in(coef[194]), .rdup_out(a2_wr[353]), .rdlo_out(a2_wr[481]));
			radix2 #(.width(width)) rd_st1_354  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[354]), .rdlo_in(a1_wr[482]),  .coef_in(coef[196]), .rdup_out(a2_wr[354]), .rdlo_out(a2_wr[482]));
			radix2 #(.width(width)) rd_st1_355  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[355]), .rdlo_in(a1_wr[483]),  .coef_in(coef[198]), .rdup_out(a2_wr[355]), .rdlo_out(a2_wr[483]));
			radix2 #(.width(width)) rd_st1_356  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[356]), .rdlo_in(a1_wr[484]),  .coef_in(coef[200]), .rdup_out(a2_wr[356]), .rdlo_out(a2_wr[484]));
			radix2 #(.width(width)) rd_st1_357  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[357]), .rdlo_in(a1_wr[485]),  .coef_in(coef[202]), .rdup_out(a2_wr[357]), .rdlo_out(a2_wr[485]));
			radix2 #(.width(width)) rd_st1_358  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[358]), .rdlo_in(a1_wr[486]),  .coef_in(coef[204]), .rdup_out(a2_wr[358]), .rdlo_out(a2_wr[486]));
			radix2 #(.width(width)) rd_st1_359  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[359]), .rdlo_in(a1_wr[487]),  .coef_in(coef[206]), .rdup_out(a2_wr[359]), .rdlo_out(a2_wr[487]));
			radix2 #(.width(width)) rd_st1_360  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[360]), .rdlo_in(a1_wr[488]),  .coef_in(coef[208]), .rdup_out(a2_wr[360]), .rdlo_out(a2_wr[488]));
			radix2 #(.width(width)) rd_st1_361  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[361]), .rdlo_in(a1_wr[489]),  .coef_in(coef[210]), .rdup_out(a2_wr[361]), .rdlo_out(a2_wr[489]));
			radix2 #(.width(width)) rd_st1_362  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[362]), .rdlo_in(a1_wr[490]),  .coef_in(coef[212]), .rdup_out(a2_wr[362]), .rdlo_out(a2_wr[490]));
			radix2 #(.width(width)) rd_st1_363  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[363]), .rdlo_in(a1_wr[491]),  .coef_in(coef[214]), .rdup_out(a2_wr[363]), .rdlo_out(a2_wr[491]));
			radix2 #(.width(width)) rd_st1_364  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[364]), .rdlo_in(a1_wr[492]),  .coef_in(coef[216]), .rdup_out(a2_wr[364]), .rdlo_out(a2_wr[492]));
			radix2 #(.width(width)) rd_st1_365  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[365]), .rdlo_in(a1_wr[493]),  .coef_in(coef[218]), .rdup_out(a2_wr[365]), .rdlo_out(a2_wr[493]));
			radix2 #(.width(width)) rd_st1_366  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[366]), .rdlo_in(a1_wr[494]),  .coef_in(coef[220]), .rdup_out(a2_wr[366]), .rdlo_out(a2_wr[494]));
			radix2 #(.width(width)) rd_st1_367  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[367]), .rdlo_in(a1_wr[495]),  .coef_in(coef[222]), .rdup_out(a2_wr[367]), .rdlo_out(a2_wr[495]));
			radix2 #(.width(width)) rd_st1_368  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[368]), .rdlo_in(a1_wr[496]),  .coef_in(coef[224]), .rdup_out(a2_wr[368]), .rdlo_out(a2_wr[496]));
			radix2 #(.width(width)) rd_st1_369  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[369]), .rdlo_in(a1_wr[497]),  .coef_in(coef[226]), .rdup_out(a2_wr[369]), .rdlo_out(a2_wr[497]));
			radix2 #(.width(width)) rd_st1_370  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[370]), .rdlo_in(a1_wr[498]),  .coef_in(coef[228]), .rdup_out(a2_wr[370]), .rdlo_out(a2_wr[498]));
			radix2 #(.width(width)) rd_st1_371  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[371]), .rdlo_in(a1_wr[499]),  .coef_in(coef[230]), .rdup_out(a2_wr[371]), .rdlo_out(a2_wr[499]));
			radix2 #(.width(width)) rd_st1_372  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[372]), .rdlo_in(a1_wr[500]),  .coef_in(coef[232]), .rdup_out(a2_wr[372]), .rdlo_out(a2_wr[500]));
			radix2 #(.width(width)) rd_st1_373  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[373]), .rdlo_in(a1_wr[501]),  .coef_in(coef[234]), .rdup_out(a2_wr[373]), .rdlo_out(a2_wr[501]));
			radix2 #(.width(width)) rd_st1_374  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[374]), .rdlo_in(a1_wr[502]),  .coef_in(coef[236]), .rdup_out(a2_wr[374]), .rdlo_out(a2_wr[502]));
			radix2 #(.width(width)) rd_st1_375  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[375]), .rdlo_in(a1_wr[503]),  .coef_in(coef[238]), .rdup_out(a2_wr[375]), .rdlo_out(a2_wr[503]));
			radix2 #(.width(width)) rd_st1_376  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[376]), .rdlo_in(a1_wr[504]),  .coef_in(coef[240]), .rdup_out(a2_wr[376]), .rdlo_out(a2_wr[504]));
			radix2 #(.width(width)) rd_st1_377  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[377]), .rdlo_in(a1_wr[505]),  .coef_in(coef[242]), .rdup_out(a2_wr[377]), .rdlo_out(a2_wr[505]));
			radix2 #(.width(width)) rd_st1_378  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[378]), .rdlo_in(a1_wr[506]),  .coef_in(coef[244]), .rdup_out(a2_wr[378]), .rdlo_out(a2_wr[506]));
			radix2 #(.width(width)) rd_st1_379  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[379]), .rdlo_in(a1_wr[507]),  .coef_in(coef[246]), .rdup_out(a2_wr[379]), .rdlo_out(a2_wr[507]));
			radix2 #(.width(width)) rd_st1_380  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[380]), .rdlo_in(a1_wr[508]),  .coef_in(coef[248]), .rdup_out(a2_wr[380]), .rdlo_out(a2_wr[508]));
			radix2 #(.width(width)) rd_st1_381  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[381]), .rdlo_in(a1_wr[509]),  .coef_in(coef[250]), .rdup_out(a2_wr[381]), .rdlo_out(a2_wr[509]));
			radix2 #(.width(width)) rd_st1_382  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[382]), .rdlo_in(a1_wr[510]),  .coef_in(coef[252]), .rdup_out(a2_wr[382]), .rdlo_out(a2_wr[510]));
			radix2 #(.width(width)) rd_st1_383  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a1_wr[383]), .rdlo_in(a1_wr[511]),  .coef_in(coef[254]), .rdup_out(a2_wr[383]), .rdlo_out(a2_wr[511]));

		//--- radix stage 2
			radix2 #(.width(width)) rd_st2_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[0]), .rdlo_in(a2_wr[64]),  .coef_in(coef[0]), .rdup_out(a3_wr[0]), .rdlo_out(a3_wr[64]));
			radix2 #(.width(width)) rd_st2_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[1]), .rdlo_in(a2_wr[65]),  .coef_in(coef[4]), .rdup_out(a3_wr[1]), .rdlo_out(a3_wr[65]));
			radix2 #(.width(width)) rd_st2_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[2]), .rdlo_in(a2_wr[66]),  .coef_in(coef[8]), .rdup_out(a3_wr[2]), .rdlo_out(a3_wr[66]));
			radix2 #(.width(width)) rd_st2_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[3]), .rdlo_in(a2_wr[67]),  .coef_in(coef[12]), .rdup_out(a3_wr[3]), .rdlo_out(a3_wr[67]));
			radix2 #(.width(width)) rd_st2_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[4]), .rdlo_in(a2_wr[68]),  .coef_in(coef[16]), .rdup_out(a3_wr[4]), .rdlo_out(a3_wr[68]));
			radix2 #(.width(width)) rd_st2_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[5]), .rdlo_in(a2_wr[69]),  .coef_in(coef[20]), .rdup_out(a3_wr[5]), .rdlo_out(a3_wr[69]));
			radix2 #(.width(width)) rd_st2_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[6]), .rdlo_in(a2_wr[70]),  .coef_in(coef[24]), .rdup_out(a3_wr[6]), .rdlo_out(a3_wr[70]));
			radix2 #(.width(width)) rd_st2_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[7]), .rdlo_in(a2_wr[71]),  .coef_in(coef[28]), .rdup_out(a3_wr[7]), .rdlo_out(a3_wr[71]));
			radix2 #(.width(width)) rd_st2_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[8]), .rdlo_in(a2_wr[72]),  .coef_in(coef[32]), .rdup_out(a3_wr[8]), .rdlo_out(a3_wr[72]));
			radix2 #(.width(width)) rd_st2_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[9]), .rdlo_in(a2_wr[73]),  .coef_in(coef[36]), .rdup_out(a3_wr[9]), .rdlo_out(a3_wr[73]));
			radix2 #(.width(width)) rd_st2_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[10]), .rdlo_in(a2_wr[74]),  .coef_in(coef[40]), .rdup_out(a3_wr[10]), .rdlo_out(a3_wr[74]));
			radix2 #(.width(width)) rd_st2_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[11]), .rdlo_in(a2_wr[75]),  .coef_in(coef[44]), .rdup_out(a3_wr[11]), .rdlo_out(a3_wr[75]));
			radix2 #(.width(width)) rd_st2_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[12]), .rdlo_in(a2_wr[76]),  .coef_in(coef[48]), .rdup_out(a3_wr[12]), .rdlo_out(a3_wr[76]));
			radix2 #(.width(width)) rd_st2_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[13]), .rdlo_in(a2_wr[77]),  .coef_in(coef[52]), .rdup_out(a3_wr[13]), .rdlo_out(a3_wr[77]));
			radix2 #(.width(width)) rd_st2_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[14]), .rdlo_in(a2_wr[78]),  .coef_in(coef[56]), .rdup_out(a3_wr[14]), .rdlo_out(a3_wr[78]));
			radix2 #(.width(width)) rd_st2_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[15]), .rdlo_in(a2_wr[79]),  .coef_in(coef[60]), .rdup_out(a3_wr[15]), .rdlo_out(a3_wr[79]));
			radix2 #(.width(width)) rd_st2_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[16]), .rdlo_in(a2_wr[80]),  .coef_in(coef[64]), .rdup_out(a3_wr[16]), .rdlo_out(a3_wr[80]));
			radix2 #(.width(width)) rd_st2_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[17]), .rdlo_in(a2_wr[81]),  .coef_in(coef[68]), .rdup_out(a3_wr[17]), .rdlo_out(a3_wr[81]));
			radix2 #(.width(width)) rd_st2_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[18]), .rdlo_in(a2_wr[82]),  .coef_in(coef[72]), .rdup_out(a3_wr[18]), .rdlo_out(a3_wr[82]));
			radix2 #(.width(width)) rd_st2_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[19]), .rdlo_in(a2_wr[83]),  .coef_in(coef[76]), .rdup_out(a3_wr[19]), .rdlo_out(a3_wr[83]));
			radix2 #(.width(width)) rd_st2_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[20]), .rdlo_in(a2_wr[84]),  .coef_in(coef[80]), .rdup_out(a3_wr[20]), .rdlo_out(a3_wr[84]));
			radix2 #(.width(width)) rd_st2_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[21]), .rdlo_in(a2_wr[85]),  .coef_in(coef[84]), .rdup_out(a3_wr[21]), .rdlo_out(a3_wr[85]));
			radix2 #(.width(width)) rd_st2_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[22]), .rdlo_in(a2_wr[86]),  .coef_in(coef[88]), .rdup_out(a3_wr[22]), .rdlo_out(a3_wr[86]));
			radix2 #(.width(width)) rd_st2_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[23]), .rdlo_in(a2_wr[87]),  .coef_in(coef[92]), .rdup_out(a3_wr[23]), .rdlo_out(a3_wr[87]));
			radix2 #(.width(width)) rd_st2_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[24]), .rdlo_in(a2_wr[88]),  .coef_in(coef[96]), .rdup_out(a3_wr[24]), .rdlo_out(a3_wr[88]));
			radix2 #(.width(width)) rd_st2_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[25]), .rdlo_in(a2_wr[89]),  .coef_in(coef[100]), .rdup_out(a3_wr[25]), .rdlo_out(a3_wr[89]));
			radix2 #(.width(width)) rd_st2_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[26]), .rdlo_in(a2_wr[90]),  .coef_in(coef[104]), .rdup_out(a3_wr[26]), .rdlo_out(a3_wr[90]));
			radix2 #(.width(width)) rd_st2_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[27]), .rdlo_in(a2_wr[91]),  .coef_in(coef[108]), .rdup_out(a3_wr[27]), .rdlo_out(a3_wr[91]));
			radix2 #(.width(width)) rd_st2_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[28]), .rdlo_in(a2_wr[92]),  .coef_in(coef[112]), .rdup_out(a3_wr[28]), .rdlo_out(a3_wr[92]));
			radix2 #(.width(width)) rd_st2_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[29]), .rdlo_in(a2_wr[93]),  .coef_in(coef[116]), .rdup_out(a3_wr[29]), .rdlo_out(a3_wr[93]));
			radix2 #(.width(width)) rd_st2_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[30]), .rdlo_in(a2_wr[94]),  .coef_in(coef[120]), .rdup_out(a3_wr[30]), .rdlo_out(a3_wr[94]));
			radix2 #(.width(width)) rd_st2_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[31]), .rdlo_in(a2_wr[95]),  .coef_in(coef[124]), .rdup_out(a3_wr[31]), .rdlo_out(a3_wr[95]));
			radix2 #(.width(width)) rd_st2_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[32]), .rdlo_in(a2_wr[96]),  .coef_in(coef[128]), .rdup_out(a3_wr[32]), .rdlo_out(a3_wr[96]));
			radix2 #(.width(width)) rd_st2_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[33]), .rdlo_in(a2_wr[97]),  .coef_in(coef[132]), .rdup_out(a3_wr[33]), .rdlo_out(a3_wr[97]));
			radix2 #(.width(width)) rd_st2_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[34]), .rdlo_in(a2_wr[98]),  .coef_in(coef[136]), .rdup_out(a3_wr[34]), .rdlo_out(a3_wr[98]));
			radix2 #(.width(width)) rd_st2_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[35]), .rdlo_in(a2_wr[99]),  .coef_in(coef[140]), .rdup_out(a3_wr[35]), .rdlo_out(a3_wr[99]));
			radix2 #(.width(width)) rd_st2_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[36]), .rdlo_in(a2_wr[100]),  .coef_in(coef[144]), .rdup_out(a3_wr[36]), .rdlo_out(a3_wr[100]));
			radix2 #(.width(width)) rd_st2_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[37]), .rdlo_in(a2_wr[101]),  .coef_in(coef[148]), .rdup_out(a3_wr[37]), .rdlo_out(a3_wr[101]));
			radix2 #(.width(width)) rd_st2_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[38]), .rdlo_in(a2_wr[102]),  .coef_in(coef[152]), .rdup_out(a3_wr[38]), .rdlo_out(a3_wr[102]));
			radix2 #(.width(width)) rd_st2_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[39]), .rdlo_in(a2_wr[103]),  .coef_in(coef[156]), .rdup_out(a3_wr[39]), .rdlo_out(a3_wr[103]));
			radix2 #(.width(width)) rd_st2_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[40]), .rdlo_in(a2_wr[104]),  .coef_in(coef[160]), .rdup_out(a3_wr[40]), .rdlo_out(a3_wr[104]));
			radix2 #(.width(width)) rd_st2_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[41]), .rdlo_in(a2_wr[105]),  .coef_in(coef[164]), .rdup_out(a3_wr[41]), .rdlo_out(a3_wr[105]));
			radix2 #(.width(width)) rd_st2_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[42]), .rdlo_in(a2_wr[106]),  .coef_in(coef[168]), .rdup_out(a3_wr[42]), .rdlo_out(a3_wr[106]));
			radix2 #(.width(width)) rd_st2_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[43]), .rdlo_in(a2_wr[107]),  .coef_in(coef[172]), .rdup_out(a3_wr[43]), .rdlo_out(a3_wr[107]));
			radix2 #(.width(width)) rd_st2_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[44]), .rdlo_in(a2_wr[108]),  .coef_in(coef[176]), .rdup_out(a3_wr[44]), .rdlo_out(a3_wr[108]));
			radix2 #(.width(width)) rd_st2_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[45]), .rdlo_in(a2_wr[109]),  .coef_in(coef[180]), .rdup_out(a3_wr[45]), .rdlo_out(a3_wr[109]));
			radix2 #(.width(width)) rd_st2_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[46]), .rdlo_in(a2_wr[110]),  .coef_in(coef[184]), .rdup_out(a3_wr[46]), .rdlo_out(a3_wr[110]));
			radix2 #(.width(width)) rd_st2_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[47]), .rdlo_in(a2_wr[111]),  .coef_in(coef[188]), .rdup_out(a3_wr[47]), .rdlo_out(a3_wr[111]));
			radix2 #(.width(width)) rd_st2_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[48]), .rdlo_in(a2_wr[112]),  .coef_in(coef[192]), .rdup_out(a3_wr[48]), .rdlo_out(a3_wr[112]));
			radix2 #(.width(width)) rd_st2_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[49]), .rdlo_in(a2_wr[113]),  .coef_in(coef[196]), .rdup_out(a3_wr[49]), .rdlo_out(a3_wr[113]));
			radix2 #(.width(width)) rd_st2_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[50]), .rdlo_in(a2_wr[114]),  .coef_in(coef[200]), .rdup_out(a3_wr[50]), .rdlo_out(a3_wr[114]));
			radix2 #(.width(width)) rd_st2_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[51]), .rdlo_in(a2_wr[115]),  .coef_in(coef[204]), .rdup_out(a3_wr[51]), .rdlo_out(a3_wr[115]));
			radix2 #(.width(width)) rd_st2_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[52]), .rdlo_in(a2_wr[116]),  .coef_in(coef[208]), .rdup_out(a3_wr[52]), .rdlo_out(a3_wr[116]));
			radix2 #(.width(width)) rd_st2_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[53]), .rdlo_in(a2_wr[117]),  .coef_in(coef[212]), .rdup_out(a3_wr[53]), .rdlo_out(a3_wr[117]));
			radix2 #(.width(width)) rd_st2_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[54]), .rdlo_in(a2_wr[118]),  .coef_in(coef[216]), .rdup_out(a3_wr[54]), .rdlo_out(a3_wr[118]));
			radix2 #(.width(width)) rd_st2_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[55]), .rdlo_in(a2_wr[119]),  .coef_in(coef[220]), .rdup_out(a3_wr[55]), .rdlo_out(a3_wr[119]));
			radix2 #(.width(width)) rd_st2_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[56]), .rdlo_in(a2_wr[120]),  .coef_in(coef[224]), .rdup_out(a3_wr[56]), .rdlo_out(a3_wr[120]));
			radix2 #(.width(width)) rd_st2_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[57]), .rdlo_in(a2_wr[121]),  .coef_in(coef[228]), .rdup_out(a3_wr[57]), .rdlo_out(a3_wr[121]));
			radix2 #(.width(width)) rd_st2_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[58]), .rdlo_in(a2_wr[122]),  .coef_in(coef[232]), .rdup_out(a3_wr[58]), .rdlo_out(a3_wr[122]));
			radix2 #(.width(width)) rd_st2_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[59]), .rdlo_in(a2_wr[123]),  .coef_in(coef[236]), .rdup_out(a3_wr[59]), .rdlo_out(a3_wr[123]));
			radix2 #(.width(width)) rd_st2_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[60]), .rdlo_in(a2_wr[124]),  .coef_in(coef[240]), .rdup_out(a3_wr[60]), .rdlo_out(a3_wr[124]));
			radix2 #(.width(width)) rd_st2_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[61]), .rdlo_in(a2_wr[125]),  .coef_in(coef[244]), .rdup_out(a3_wr[61]), .rdlo_out(a3_wr[125]));
			radix2 #(.width(width)) rd_st2_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[62]), .rdlo_in(a2_wr[126]),  .coef_in(coef[248]), .rdup_out(a3_wr[62]), .rdlo_out(a3_wr[126]));
			radix2 #(.width(width)) rd_st2_63  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[63]), .rdlo_in(a2_wr[127]),  .coef_in(coef[252]), .rdup_out(a3_wr[63]), .rdlo_out(a3_wr[127]));
			radix2 #(.width(width)) rd_st2_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[128]), .rdlo_in(a2_wr[192]),  .coef_in(coef[0]), .rdup_out(a3_wr[128]), .rdlo_out(a3_wr[192]));
			radix2 #(.width(width)) rd_st2_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[129]), .rdlo_in(a2_wr[193]),  .coef_in(coef[4]), .rdup_out(a3_wr[129]), .rdlo_out(a3_wr[193]));
			radix2 #(.width(width)) rd_st2_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[130]), .rdlo_in(a2_wr[194]),  .coef_in(coef[8]), .rdup_out(a3_wr[130]), .rdlo_out(a3_wr[194]));
			radix2 #(.width(width)) rd_st2_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[131]), .rdlo_in(a2_wr[195]),  .coef_in(coef[12]), .rdup_out(a3_wr[131]), .rdlo_out(a3_wr[195]));
			radix2 #(.width(width)) rd_st2_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[132]), .rdlo_in(a2_wr[196]),  .coef_in(coef[16]), .rdup_out(a3_wr[132]), .rdlo_out(a3_wr[196]));
			radix2 #(.width(width)) rd_st2_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[133]), .rdlo_in(a2_wr[197]),  .coef_in(coef[20]), .rdup_out(a3_wr[133]), .rdlo_out(a3_wr[197]));
			radix2 #(.width(width)) rd_st2_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[134]), .rdlo_in(a2_wr[198]),  .coef_in(coef[24]), .rdup_out(a3_wr[134]), .rdlo_out(a3_wr[198]));
			radix2 #(.width(width)) rd_st2_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[135]), .rdlo_in(a2_wr[199]),  .coef_in(coef[28]), .rdup_out(a3_wr[135]), .rdlo_out(a3_wr[199]));
			radix2 #(.width(width)) rd_st2_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[136]), .rdlo_in(a2_wr[200]),  .coef_in(coef[32]), .rdup_out(a3_wr[136]), .rdlo_out(a3_wr[200]));
			radix2 #(.width(width)) rd_st2_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[137]), .rdlo_in(a2_wr[201]),  .coef_in(coef[36]), .rdup_out(a3_wr[137]), .rdlo_out(a3_wr[201]));
			radix2 #(.width(width)) rd_st2_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[138]), .rdlo_in(a2_wr[202]),  .coef_in(coef[40]), .rdup_out(a3_wr[138]), .rdlo_out(a3_wr[202]));
			radix2 #(.width(width)) rd_st2_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[139]), .rdlo_in(a2_wr[203]),  .coef_in(coef[44]), .rdup_out(a3_wr[139]), .rdlo_out(a3_wr[203]));
			radix2 #(.width(width)) rd_st2_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[140]), .rdlo_in(a2_wr[204]),  .coef_in(coef[48]), .rdup_out(a3_wr[140]), .rdlo_out(a3_wr[204]));
			radix2 #(.width(width)) rd_st2_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[141]), .rdlo_in(a2_wr[205]),  .coef_in(coef[52]), .rdup_out(a3_wr[141]), .rdlo_out(a3_wr[205]));
			radix2 #(.width(width)) rd_st2_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[142]), .rdlo_in(a2_wr[206]),  .coef_in(coef[56]), .rdup_out(a3_wr[142]), .rdlo_out(a3_wr[206]));
			radix2 #(.width(width)) rd_st2_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[143]), .rdlo_in(a2_wr[207]),  .coef_in(coef[60]), .rdup_out(a3_wr[143]), .rdlo_out(a3_wr[207]));
			radix2 #(.width(width)) rd_st2_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[144]), .rdlo_in(a2_wr[208]),  .coef_in(coef[64]), .rdup_out(a3_wr[144]), .rdlo_out(a3_wr[208]));
			radix2 #(.width(width)) rd_st2_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[145]), .rdlo_in(a2_wr[209]),  .coef_in(coef[68]), .rdup_out(a3_wr[145]), .rdlo_out(a3_wr[209]));
			radix2 #(.width(width)) rd_st2_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[146]), .rdlo_in(a2_wr[210]),  .coef_in(coef[72]), .rdup_out(a3_wr[146]), .rdlo_out(a3_wr[210]));
			radix2 #(.width(width)) rd_st2_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[147]), .rdlo_in(a2_wr[211]),  .coef_in(coef[76]), .rdup_out(a3_wr[147]), .rdlo_out(a3_wr[211]));
			radix2 #(.width(width)) rd_st2_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[148]), .rdlo_in(a2_wr[212]),  .coef_in(coef[80]), .rdup_out(a3_wr[148]), .rdlo_out(a3_wr[212]));
			radix2 #(.width(width)) rd_st2_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[149]), .rdlo_in(a2_wr[213]),  .coef_in(coef[84]), .rdup_out(a3_wr[149]), .rdlo_out(a3_wr[213]));
			radix2 #(.width(width)) rd_st2_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[150]), .rdlo_in(a2_wr[214]),  .coef_in(coef[88]), .rdup_out(a3_wr[150]), .rdlo_out(a3_wr[214]));
			radix2 #(.width(width)) rd_st2_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[151]), .rdlo_in(a2_wr[215]),  .coef_in(coef[92]), .rdup_out(a3_wr[151]), .rdlo_out(a3_wr[215]));
			radix2 #(.width(width)) rd_st2_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[152]), .rdlo_in(a2_wr[216]),  .coef_in(coef[96]), .rdup_out(a3_wr[152]), .rdlo_out(a3_wr[216]));
			radix2 #(.width(width)) rd_st2_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[153]), .rdlo_in(a2_wr[217]),  .coef_in(coef[100]), .rdup_out(a3_wr[153]), .rdlo_out(a3_wr[217]));
			radix2 #(.width(width)) rd_st2_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[154]), .rdlo_in(a2_wr[218]),  .coef_in(coef[104]), .rdup_out(a3_wr[154]), .rdlo_out(a3_wr[218]));
			radix2 #(.width(width)) rd_st2_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[155]), .rdlo_in(a2_wr[219]),  .coef_in(coef[108]), .rdup_out(a3_wr[155]), .rdlo_out(a3_wr[219]));
			radix2 #(.width(width)) rd_st2_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[156]), .rdlo_in(a2_wr[220]),  .coef_in(coef[112]), .rdup_out(a3_wr[156]), .rdlo_out(a3_wr[220]));
			radix2 #(.width(width)) rd_st2_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[157]), .rdlo_in(a2_wr[221]),  .coef_in(coef[116]), .rdup_out(a3_wr[157]), .rdlo_out(a3_wr[221]));
			radix2 #(.width(width)) rd_st2_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[158]), .rdlo_in(a2_wr[222]),  .coef_in(coef[120]), .rdup_out(a3_wr[158]), .rdlo_out(a3_wr[222]));
			radix2 #(.width(width)) rd_st2_159  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[159]), .rdlo_in(a2_wr[223]),  .coef_in(coef[124]), .rdup_out(a3_wr[159]), .rdlo_out(a3_wr[223]));
			radix2 #(.width(width)) rd_st2_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[160]), .rdlo_in(a2_wr[224]),  .coef_in(coef[128]), .rdup_out(a3_wr[160]), .rdlo_out(a3_wr[224]));
			radix2 #(.width(width)) rd_st2_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[161]), .rdlo_in(a2_wr[225]),  .coef_in(coef[132]), .rdup_out(a3_wr[161]), .rdlo_out(a3_wr[225]));
			radix2 #(.width(width)) rd_st2_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[162]), .rdlo_in(a2_wr[226]),  .coef_in(coef[136]), .rdup_out(a3_wr[162]), .rdlo_out(a3_wr[226]));
			radix2 #(.width(width)) rd_st2_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[163]), .rdlo_in(a2_wr[227]),  .coef_in(coef[140]), .rdup_out(a3_wr[163]), .rdlo_out(a3_wr[227]));
			radix2 #(.width(width)) rd_st2_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[164]), .rdlo_in(a2_wr[228]),  .coef_in(coef[144]), .rdup_out(a3_wr[164]), .rdlo_out(a3_wr[228]));
			radix2 #(.width(width)) rd_st2_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[165]), .rdlo_in(a2_wr[229]),  .coef_in(coef[148]), .rdup_out(a3_wr[165]), .rdlo_out(a3_wr[229]));
			radix2 #(.width(width)) rd_st2_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[166]), .rdlo_in(a2_wr[230]),  .coef_in(coef[152]), .rdup_out(a3_wr[166]), .rdlo_out(a3_wr[230]));
			radix2 #(.width(width)) rd_st2_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[167]), .rdlo_in(a2_wr[231]),  .coef_in(coef[156]), .rdup_out(a3_wr[167]), .rdlo_out(a3_wr[231]));
			radix2 #(.width(width)) rd_st2_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[168]), .rdlo_in(a2_wr[232]),  .coef_in(coef[160]), .rdup_out(a3_wr[168]), .rdlo_out(a3_wr[232]));
			radix2 #(.width(width)) rd_st2_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[169]), .rdlo_in(a2_wr[233]),  .coef_in(coef[164]), .rdup_out(a3_wr[169]), .rdlo_out(a3_wr[233]));
			radix2 #(.width(width)) rd_st2_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[170]), .rdlo_in(a2_wr[234]),  .coef_in(coef[168]), .rdup_out(a3_wr[170]), .rdlo_out(a3_wr[234]));
			radix2 #(.width(width)) rd_st2_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[171]), .rdlo_in(a2_wr[235]),  .coef_in(coef[172]), .rdup_out(a3_wr[171]), .rdlo_out(a3_wr[235]));
			radix2 #(.width(width)) rd_st2_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[172]), .rdlo_in(a2_wr[236]),  .coef_in(coef[176]), .rdup_out(a3_wr[172]), .rdlo_out(a3_wr[236]));
			radix2 #(.width(width)) rd_st2_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[173]), .rdlo_in(a2_wr[237]),  .coef_in(coef[180]), .rdup_out(a3_wr[173]), .rdlo_out(a3_wr[237]));
			radix2 #(.width(width)) rd_st2_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[174]), .rdlo_in(a2_wr[238]),  .coef_in(coef[184]), .rdup_out(a3_wr[174]), .rdlo_out(a3_wr[238]));
			radix2 #(.width(width)) rd_st2_175  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[175]), .rdlo_in(a2_wr[239]),  .coef_in(coef[188]), .rdup_out(a3_wr[175]), .rdlo_out(a3_wr[239]));
			radix2 #(.width(width)) rd_st2_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[176]), .rdlo_in(a2_wr[240]),  .coef_in(coef[192]), .rdup_out(a3_wr[176]), .rdlo_out(a3_wr[240]));
			radix2 #(.width(width)) rd_st2_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[177]), .rdlo_in(a2_wr[241]),  .coef_in(coef[196]), .rdup_out(a3_wr[177]), .rdlo_out(a3_wr[241]));
			radix2 #(.width(width)) rd_st2_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[178]), .rdlo_in(a2_wr[242]),  .coef_in(coef[200]), .rdup_out(a3_wr[178]), .rdlo_out(a3_wr[242]));
			radix2 #(.width(width)) rd_st2_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[179]), .rdlo_in(a2_wr[243]),  .coef_in(coef[204]), .rdup_out(a3_wr[179]), .rdlo_out(a3_wr[243]));
			radix2 #(.width(width)) rd_st2_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[180]), .rdlo_in(a2_wr[244]),  .coef_in(coef[208]), .rdup_out(a3_wr[180]), .rdlo_out(a3_wr[244]));
			radix2 #(.width(width)) rd_st2_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[181]), .rdlo_in(a2_wr[245]),  .coef_in(coef[212]), .rdup_out(a3_wr[181]), .rdlo_out(a3_wr[245]));
			radix2 #(.width(width)) rd_st2_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[182]), .rdlo_in(a2_wr[246]),  .coef_in(coef[216]), .rdup_out(a3_wr[182]), .rdlo_out(a3_wr[246]));
			radix2 #(.width(width)) rd_st2_183  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[183]), .rdlo_in(a2_wr[247]),  .coef_in(coef[220]), .rdup_out(a3_wr[183]), .rdlo_out(a3_wr[247]));
			radix2 #(.width(width)) rd_st2_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[184]), .rdlo_in(a2_wr[248]),  .coef_in(coef[224]), .rdup_out(a3_wr[184]), .rdlo_out(a3_wr[248]));
			radix2 #(.width(width)) rd_st2_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[185]), .rdlo_in(a2_wr[249]),  .coef_in(coef[228]), .rdup_out(a3_wr[185]), .rdlo_out(a3_wr[249]));
			radix2 #(.width(width)) rd_st2_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[186]), .rdlo_in(a2_wr[250]),  .coef_in(coef[232]), .rdup_out(a3_wr[186]), .rdlo_out(a3_wr[250]));
			radix2 #(.width(width)) rd_st2_187  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[187]), .rdlo_in(a2_wr[251]),  .coef_in(coef[236]), .rdup_out(a3_wr[187]), .rdlo_out(a3_wr[251]));
			radix2 #(.width(width)) rd_st2_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[188]), .rdlo_in(a2_wr[252]),  .coef_in(coef[240]), .rdup_out(a3_wr[188]), .rdlo_out(a3_wr[252]));
			radix2 #(.width(width)) rd_st2_189  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[189]), .rdlo_in(a2_wr[253]),  .coef_in(coef[244]), .rdup_out(a3_wr[189]), .rdlo_out(a3_wr[253]));
			radix2 #(.width(width)) rd_st2_190  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[190]), .rdlo_in(a2_wr[254]),  .coef_in(coef[248]), .rdup_out(a3_wr[190]), .rdlo_out(a3_wr[254]));
			radix2 #(.width(width)) rd_st2_191  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[191]), .rdlo_in(a2_wr[255]),  .coef_in(coef[252]), .rdup_out(a3_wr[191]), .rdlo_out(a3_wr[255]));
			radix2 #(.width(width)) rd_st2_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[256]), .rdlo_in(a2_wr[320]),  .coef_in(coef[0]), .rdup_out(a3_wr[256]), .rdlo_out(a3_wr[320]));
			radix2 #(.width(width)) rd_st2_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[257]), .rdlo_in(a2_wr[321]),  .coef_in(coef[4]), .rdup_out(a3_wr[257]), .rdlo_out(a3_wr[321]));
			radix2 #(.width(width)) rd_st2_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[258]), .rdlo_in(a2_wr[322]),  .coef_in(coef[8]), .rdup_out(a3_wr[258]), .rdlo_out(a3_wr[322]));
			radix2 #(.width(width)) rd_st2_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[259]), .rdlo_in(a2_wr[323]),  .coef_in(coef[12]), .rdup_out(a3_wr[259]), .rdlo_out(a3_wr[323]));
			radix2 #(.width(width)) rd_st2_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[260]), .rdlo_in(a2_wr[324]),  .coef_in(coef[16]), .rdup_out(a3_wr[260]), .rdlo_out(a3_wr[324]));
			radix2 #(.width(width)) rd_st2_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[261]), .rdlo_in(a2_wr[325]),  .coef_in(coef[20]), .rdup_out(a3_wr[261]), .rdlo_out(a3_wr[325]));
			radix2 #(.width(width)) rd_st2_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[262]), .rdlo_in(a2_wr[326]),  .coef_in(coef[24]), .rdup_out(a3_wr[262]), .rdlo_out(a3_wr[326]));
			radix2 #(.width(width)) rd_st2_263  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[263]), .rdlo_in(a2_wr[327]),  .coef_in(coef[28]), .rdup_out(a3_wr[263]), .rdlo_out(a3_wr[327]));
			radix2 #(.width(width)) rd_st2_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[264]), .rdlo_in(a2_wr[328]),  .coef_in(coef[32]), .rdup_out(a3_wr[264]), .rdlo_out(a3_wr[328]));
			radix2 #(.width(width)) rd_st2_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[265]), .rdlo_in(a2_wr[329]),  .coef_in(coef[36]), .rdup_out(a3_wr[265]), .rdlo_out(a3_wr[329]));
			radix2 #(.width(width)) rd_st2_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[266]), .rdlo_in(a2_wr[330]),  .coef_in(coef[40]), .rdup_out(a3_wr[266]), .rdlo_out(a3_wr[330]));
			radix2 #(.width(width)) rd_st2_267  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[267]), .rdlo_in(a2_wr[331]),  .coef_in(coef[44]), .rdup_out(a3_wr[267]), .rdlo_out(a3_wr[331]));
			radix2 #(.width(width)) rd_st2_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[268]), .rdlo_in(a2_wr[332]),  .coef_in(coef[48]), .rdup_out(a3_wr[268]), .rdlo_out(a3_wr[332]));
			radix2 #(.width(width)) rd_st2_269  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[269]), .rdlo_in(a2_wr[333]),  .coef_in(coef[52]), .rdup_out(a3_wr[269]), .rdlo_out(a3_wr[333]));
			radix2 #(.width(width)) rd_st2_270  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[270]), .rdlo_in(a2_wr[334]),  .coef_in(coef[56]), .rdup_out(a3_wr[270]), .rdlo_out(a3_wr[334]));
			radix2 #(.width(width)) rd_st2_271  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[271]), .rdlo_in(a2_wr[335]),  .coef_in(coef[60]), .rdup_out(a3_wr[271]), .rdlo_out(a3_wr[335]));
			radix2 #(.width(width)) rd_st2_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[272]), .rdlo_in(a2_wr[336]),  .coef_in(coef[64]), .rdup_out(a3_wr[272]), .rdlo_out(a3_wr[336]));
			radix2 #(.width(width)) rd_st2_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[273]), .rdlo_in(a2_wr[337]),  .coef_in(coef[68]), .rdup_out(a3_wr[273]), .rdlo_out(a3_wr[337]));
			radix2 #(.width(width)) rd_st2_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[274]), .rdlo_in(a2_wr[338]),  .coef_in(coef[72]), .rdup_out(a3_wr[274]), .rdlo_out(a3_wr[338]));
			radix2 #(.width(width)) rd_st2_275  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[275]), .rdlo_in(a2_wr[339]),  .coef_in(coef[76]), .rdup_out(a3_wr[275]), .rdlo_out(a3_wr[339]));
			radix2 #(.width(width)) rd_st2_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[276]), .rdlo_in(a2_wr[340]),  .coef_in(coef[80]), .rdup_out(a3_wr[276]), .rdlo_out(a3_wr[340]));
			radix2 #(.width(width)) rd_st2_277  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[277]), .rdlo_in(a2_wr[341]),  .coef_in(coef[84]), .rdup_out(a3_wr[277]), .rdlo_out(a3_wr[341]));
			radix2 #(.width(width)) rd_st2_278  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[278]), .rdlo_in(a2_wr[342]),  .coef_in(coef[88]), .rdup_out(a3_wr[278]), .rdlo_out(a3_wr[342]));
			radix2 #(.width(width)) rd_st2_279  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[279]), .rdlo_in(a2_wr[343]),  .coef_in(coef[92]), .rdup_out(a3_wr[279]), .rdlo_out(a3_wr[343]));
			radix2 #(.width(width)) rd_st2_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[280]), .rdlo_in(a2_wr[344]),  .coef_in(coef[96]), .rdup_out(a3_wr[280]), .rdlo_out(a3_wr[344]));
			radix2 #(.width(width)) rd_st2_281  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[281]), .rdlo_in(a2_wr[345]),  .coef_in(coef[100]), .rdup_out(a3_wr[281]), .rdlo_out(a3_wr[345]));
			radix2 #(.width(width)) rd_st2_282  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[282]), .rdlo_in(a2_wr[346]),  .coef_in(coef[104]), .rdup_out(a3_wr[282]), .rdlo_out(a3_wr[346]));
			radix2 #(.width(width)) rd_st2_283  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[283]), .rdlo_in(a2_wr[347]),  .coef_in(coef[108]), .rdup_out(a3_wr[283]), .rdlo_out(a3_wr[347]));
			radix2 #(.width(width)) rd_st2_284  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[284]), .rdlo_in(a2_wr[348]),  .coef_in(coef[112]), .rdup_out(a3_wr[284]), .rdlo_out(a3_wr[348]));
			radix2 #(.width(width)) rd_st2_285  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[285]), .rdlo_in(a2_wr[349]),  .coef_in(coef[116]), .rdup_out(a3_wr[285]), .rdlo_out(a3_wr[349]));
			radix2 #(.width(width)) rd_st2_286  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[286]), .rdlo_in(a2_wr[350]),  .coef_in(coef[120]), .rdup_out(a3_wr[286]), .rdlo_out(a3_wr[350]));
			radix2 #(.width(width)) rd_st2_287  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[287]), .rdlo_in(a2_wr[351]),  .coef_in(coef[124]), .rdup_out(a3_wr[287]), .rdlo_out(a3_wr[351]));
			radix2 #(.width(width)) rd_st2_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[288]), .rdlo_in(a2_wr[352]),  .coef_in(coef[128]), .rdup_out(a3_wr[288]), .rdlo_out(a3_wr[352]));
			radix2 #(.width(width)) rd_st2_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[289]), .rdlo_in(a2_wr[353]),  .coef_in(coef[132]), .rdup_out(a3_wr[289]), .rdlo_out(a3_wr[353]));
			radix2 #(.width(width)) rd_st2_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[290]), .rdlo_in(a2_wr[354]),  .coef_in(coef[136]), .rdup_out(a3_wr[290]), .rdlo_out(a3_wr[354]));
			radix2 #(.width(width)) rd_st2_291  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[291]), .rdlo_in(a2_wr[355]),  .coef_in(coef[140]), .rdup_out(a3_wr[291]), .rdlo_out(a3_wr[355]));
			radix2 #(.width(width)) rd_st2_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[292]), .rdlo_in(a2_wr[356]),  .coef_in(coef[144]), .rdup_out(a3_wr[292]), .rdlo_out(a3_wr[356]));
			radix2 #(.width(width)) rd_st2_293  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[293]), .rdlo_in(a2_wr[357]),  .coef_in(coef[148]), .rdup_out(a3_wr[293]), .rdlo_out(a3_wr[357]));
			radix2 #(.width(width)) rd_st2_294  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[294]), .rdlo_in(a2_wr[358]),  .coef_in(coef[152]), .rdup_out(a3_wr[294]), .rdlo_out(a3_wr[358]));
			radix2 #(.width(width)) rd_st2_295  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[295]), .rdlo_in(a2_wr[359]),  .coef_in(coef[156]), .rdup_out(a3_wr[295]), .rdlo_out(a3_wr[359]));
			radix2 #(.width(width)) rd_st2_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[296]), .rdlo_in(a2_wr[360]),  .coef_in(coef[160]), .rdup_out(a3_wr[296]), .rdlo_out(a3_wr[360]));
			radix2 #(.width(width)) rd_st2_297  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[297]), .rdlo_in(a2_wr[361]),  .coef_in(coef[164]), .rdup_out(a3_wr[297]), .rdlo_out(a3_wr[361]));
			radix2 #(.width(width)) rd_st2_298  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[298]), .rdlo_in(a2_wr[362]),  .coef_in(coef[168]), .rdup_out(a3_wr[298]), .rdlo_out(a3_wr[362]));
			radix2 #(.width(width)) rd_st2_299  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[299]), .rdlo_in(a2_wr[363]),  .coef_in(coef[172]), .rdup_out(a3_wr[299]), .rdlo_out(a3_wr[363]));
			radix2 #(.width(width)) rd_st2_300  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[300]), .rdlo_in(a2_wr[364]),  .coef_in(coef[176]), .rdup_out(a3_wr[300]), .rdlo_out(a3_wr[364]));
			radix2 #(.width(width)) rd_st2_301  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[301]), .rdlo_in(a2_wr[365]),  .coef_in(coef[180]), .rdup_out(a3_wr[301]), .rdlo_out(a3_wr[365]));
			radix2 #(.width(width)) rd_st2_302  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[302]), .rdlo_in(a2_wr[366]),  .coef_in(coef[184]), .rdup_out(a3_wr[302]), .rdlo_out(a3_wr[366]));
			radix2 #(.width(width)) rd_st2_303  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[303]), .rdlo_in(a2_wr[367]),  .coef_in(coef[188]), .rdup_out(a3_wr[303]), .rdlo_out(a3_wr[367]));
			radix2 #(.width(width)) rd_st2_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[304]), .rdlo_in(a2_wr[368]),  .coef_in(coef[192]), .rdup_out(a3_wr[304]), .rdlo_out(a3_wr[368]));
			radix2 #(.width(width)) rd_st2_305  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[305]), .rdlo_in(a2_wr[369]),  .coef_in(coef[196]), .rdup_out(a3_wr[305]), .rdlo_out(a3_wr[369]));
			radix2 #(.width(width)) rd_st2_306  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[306]), .rdlo_in(a2_wr[370]),  .coef_in(coef[200]), .rdup_out(a3_wr[306]), .rdlo_out(a3_wr[370]));
			radix2 #(.width(width)) rd_st2_307  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[307]), .rdlo_in(a2_wr[371]),  .coef_in(coef[204]), .rdup_out(a3_wr[307]), .rdlo_out(a3_wr[371]));
			radix2 #(.width(width)) rd_st2_308  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[308]), .rdlo_in(a2_wr[372]),  .coef_in(coef[208]), .rdup_out(a3_wr[308]), .rdlo_out(a3_wr[372]));
			radix2 #(.width(width)) rd_st2_309  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[309]), .rdlo_in(a2_wr[373]),  .coef_in(coef[212]), .rdup_out(a3_wr[309]), .rdlo_out(a3_wr[373]));
			radix2 #(.width(width)) rd_st2_310  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[310]), .rdlo_in(a2_wr[374]),  .coef_in(coef[216]), .rdup_out(a3_wr[310]), .rdlo_out(a3_wr[374]));
			radix2 #(.width(width)) rd_st2_311  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[311]), .rdlo_in(a2_wr[375]),  .coef_in(coef[220]), .rdup_out(a3_wr[311]), .rdlo_out(a3_wr[375]));
			radix2 #(.width(width)) rd_st2_312  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[312]), .rdlo_in(a2_wr[376]),  .coef_in(coef[224]), .rdup_out(a3_wr[312]), .rdlo_out(a3_wr[376]));
			radix2 #(.width(width)) rd_st2_313  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[313]), .rdlo_in(a2_wr[377]),  .coef_in(coef[228]), .rdup_out(a3_wr[313]), .rdlo_out(a3_wr[377]));
			radix2 #(.width(width)) rd_st2_314  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[314]), .rdlo_in(a2_wr[378]),  .coef_in(coef[232]), .rdup_out(a3_wr[314]), .rdlo_out(a3_wr[378]));
			radix2 #(.width(width)) rd_st2_315  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[315]), .rdlo_in(a2_wr[379]),  .coef_in(coef[236]), .rdup_out(a3_wr[315]), .rdlo_out(a3_wr[379]));
			radix2 #(.width(width)) rd_st2_316  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[316]), .rdlo_in(a2_wr[380]),  .coef_in(coef[240]), .rdup_out(a3_wr[316]), .rdlo_out(a3_wr[380]));
			radix2 #(.width(width)) rd_st2_317  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[317]), .rdlo_in(a2_wr[381]),  .coef_in(coef[244]), .rdup_out(a3_wr[317]), .rdlo_out(a3_wr[381]));
			radix2 #(.width(width)) rd_st2_318  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[318]), .rdlo_in(a2_wr[382]),  .coef_in(coef[248]), .rdup_out(a3_wr[318]), .rdlo_out(a3_wr[382]));
			radix2 #(.width(width)) rd_st2_319  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[319]), .rdlo_in(a2_wr[383]),  .coef_in(coef[252]), .rdup_out(a3_wr[319]), .rdlo_out(a3_wr[383]));
			radix2 #(.width(width)) rd_st2_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[384]), .rdlo_in(a2_wr[448]),  .coef_in(coef[0]), .rdup_out(a3_wr[384]), .rdlo_out(a3_wr[448]));
			radix2 #(.width(width)) rd_st2_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[385]), .rdlo_in(a2_wr[449]),  .coef_in(coef[4]), .rdup_out(a3_wr[385]), .rdlo_out(a3_wr[449]));
			radix2 #(.width(width)) rd_st2_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[386]), .rdlo_in(a2_wr[450]),  .coef_in(coef[8]), .rdup_out(a3_wr[386]), .rdlo_out(a3_wr[450]));
			radix2 #(.width(width)) rd_st2_387  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[387]), .rdlo_in(a2_wr[451]),  .coef_in(coef[12]), .rdup_out(a3_wr[387]), .rdlo_out(a3_wr[451]));
			radix2 #(.width(width)) rd_st2_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[388]), .rdlo_in(a2_wr[452]),  .coef_in(coef[16]), .rdup_out(a3_wr[388]), .rdlo_out(a3_wr[452]));
			radix2 #(.width(width)) rd_st2_389  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[389]), .rdlo_in(a2_wr[453]),  .coef_in(coef[20]), .rdup_out(a3_wr[389]), .rdlo_out(a3_wr[453]));
			radix2 #(.width(width)) rd_st2_390  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[390]), .rdlo_in(a2_wr[454]),  .coef_in(coef[24]), .rdup_out(a3_wr[390]), .rdlo_out(a3_wr[454]));
			radix2 #(.width(width)) rd_st2_391  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[391]), .rdlo_in(a2_wr[455]),  .coef_in(coef[28]), .rdup_out(a3_wr[391]), .rdlo_out(a3_wr[455]));
			radix2 #(.width(width)) rd_st2_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[392]), .rdlo_in(a2_wr[456]),  .coef_in(coef[32]), .rdup_out(a3_wr[392]), .rdlo_out(a3_wr[456]));
			radix2 #(.width(width)) rd_st2_393  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[393]), .rdlo_in(a2_wr[457]),  .coef_in(coef[36]), .rdup_out(a3_wr[393]), .rdlo_out(a3_wr[457]));
			radix2 #(.width(width)) rd_st2_394  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[394]), .rdlo_in(a2_wr[458]),  .coef_in(coef[40]), .rdup_out(a3_wr[394]), .rdlo_out(a3_wr[458]));
			radix2 #(.width(width)) rd_st2_395  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[395]), .rdlo_in(a2_wr[459]),  .coef_in(coef[44]), .rdup_out(a3_wr[395]), .rdlo_out(a3_wr[459]));
			radix2 #(.width(width)) rd_st2_396  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[396]), .rdlo_in(a2_wr[460]),  .coef_in(coef[48]), .rdup_out(a3_wr[396]), .rdlo_out(a3_wr[460]));
			radix2 #(.width(width)) rd_st2_397  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[397]), .rdlo_in(a2_wr[461]),  .coef_in(coef[52]), .rdup_out(a3_wr[397]), .rdlo_out(a3_wr[461]));
			radix2 #(.width(width)) rd_st2_398  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[398]), .rdlo_in(a2_wr[462]),  .coef_in(coef[56]), .rdup_out(a3_wr[398]), .rdlo_out(a3_wr[462]));
			radix2 #(.width(width)) rd_st2_399  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[399]), .rdlo_in(a2_wr[463]),  .coef_in(coef[60]), .rdup_out(a3_wr[399]), .rdlo_out(a3_wr[463]));
			radix2 #(.width(width)) rd_st2_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[400]), .rdlo_in(a2_wr[464]),  .coef_in(coef[64]), .rdup_out(a3_wr[400]), .rdlo_out(a3_wr[464]));
			radix2 #(.width(width)) rd_st2_401  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[401]), .rdlo_in(a2_wr[465]),  .coef_in(coef[68]), .rdup_out(a3_wr[401]), .rdlo_out(a3_wr[465]));
			radix2 #(.width(width)) rd_st2_402  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[402]), .rdlo_in(a2_wr[466]),  .coef_in(coef[72]), .rdup_out(a3_wr[402]), .rdlo_out(a3_wr[466]));
			radix2 #(.width(width)) rd_st2_403  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[403]), .rdlo_in(a2_wr[467]),  .coef_in(coef[76]), .rdup_out(a3_wr[403]), .rdlo_out(a3_wr[467]));
			radix2 #(.width(width)) rd_st2_404  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[404]), .rdlo_in(a2_wr[468]),  .coef_in(coef[80]), .rdup_out(a3_wr[404]), .rdlo_out(a3_wr[468]));
			radix2 #(.width(width)) rd_st2_405  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[405]), .rdlo_in(a2_wr[469]),  .coef_in(coef[84]), .rdup_out(a3_wr[405]), .rdlo_out(a3_wr[469]));
			radix2 #(.width(width)) rd_st2_406  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[406]), .rdlo_in(a2_wr[470]),  .coef_in(coef[88]), .rdup_out(a3_wr[406]), .rdlo_out(a3_wr[470]));
			radix2 #(.width(width)) rd_st2_407  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[407]), .rdlo_in(a2_wr[471]),  .coef_in(coef[92]), .rdup_out(a3_wr[407]), .rdlo_out(a3_wr[471]));
			radix2 #(.width(width)) rd_st2_408  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[408]), .rdlo_in(a2_wr[472]),  .coef_in(coef[96]), .rdup_out(a3_wr[408]), .rdlo_out(a3_wr[472]));
			radix2 #(.width(width)) rd_st2_409  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[409]), .rdlo_in(a2_wr[473]),  .coef_in(coef[100]), .rdup_out(a3_wr[409]), .rdlo_out(a3_wr[473]));
			radix2 #(.width(width)) rd_st2_410  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[410]), .rdlo_in(a2_wr[474]),  .coef_in(coef[104]), .rdup_out(a3_wr[410]), .rdlo_out(a3_wr[474]));
			radix2 #(.width(width)) rd_st2_411  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[411]), .rdlo_in(a2_wr[475]),  .coef_in(coef[108]), .rdup_out(a3_wr[411]), .rdlo_out(a3_wr[475]));
			radix2 #(.width(width)) rd_st2_412  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[412]), .rdlo_in(a2_wr[476]),  .coef_in(coef[112]), .rdup_out(a3_wr[412]), .rdlo_out(a3_wr[476]));
			radix2 #(.width(width)) rd_st2_413  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[413]), .rdlo_in(a2_wr[477]),  .coef_in(coef[116]), .rdup_out(a3_wr[413]), .rdlo_out(a3_wr[477]));
			radix2 #(.width(width)) rd_st2_414  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[414]), .rdlo_in(a2_wr[478]),  .coef_in(coef[120]), .rdup_out(a3_wr[414]), .rdlo_out(a3_wr[478]));
			radix2 #(.width(width)) rd_st2_415  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[415]), .rdlo_in(a2_wr[479]),  .coef_in(coef[124]), .rdup_out(a3_wr[415]), .rdlo_out(a3_wr[479]));
			radix2 #(.width(width)) rd_st2_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[416]), .rdlo_in(a2_wr[480]),  .coef_in(coef[128]), .rdup_out(a3_wr[416]), .rdlo_out(a3_wr[480]));
			radix2 #(.width(width)) rd_st2_417  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[417]), .rdlo_in(a2_wr[481]),  .coef_in(coef[132]), .rdup_out(a3_wr[417]), .rdlo_out(a3_wr[481]));
			radix2 #(.width(width)) rd_st2_418  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[418]), .rdlo_in(a2_wr[482]),  .coef_in(coef[136]), .rdup_out(a3_wr[418]), .rdlo_out(a3_wr[482]));
			radix2 #(.width(width)) rd_st2_419  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[419]), .rdlo_in(a2_wr[483]),  .coef_in(coef[140]), .rdup_out(a3_wr[419]), .rdlo_out(a3_wr[483]));
			radix2 #(.width(width)) rd_st2_420  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[420]), .rdlo_in(a2_wr[484]),  .coef_in(coef[144]), .rdup_out(a3_wr[420]), .rdlo_out(a3_wr[484]));
			radix2 #(.width(width)) rd_st2_421  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[421]), .rdlo_in(a2_wr[485]),  .coef_in(coef[148]), .rdup_out(a3_wr[421]), .rdlo_out(a3_wr[485]));
			radix2 #(.width(width)) rd_st2_422  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[422]), .rdlo_in(a2_wr[486]),  .coef_in(coef[152]), .rdup_out(a3_wr[422]), .rdlo_out(a3_wr[486]));
			radix2 #(.width(width)) rd_st2_423  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[423]), .rdlo_in(a2_wr[487]),  .coef_in(coef[156]), .rdup_out(a3_wr[423]), .rdlo_out(a3_wr[487]));
			radix2 #(.width(width)) rd_st2_424  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[424]), .rdlo_in(a2_wr[488]),  .coef_in(coef[160]), .rdup_out(a3_wr[424]), .rdlo_out(a3_wr[488]));
			radix2 #(.width(width)) rd_st2_425  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[425]), .rdlo_in(a2_wr[489]),  .coef_in(coef[164]), .rdup_out(a3_wr[425]), .rdlo_out(a3_wr[489]));
			radix2 #(.width(width)) rd_st2_426  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[426]), .rdlo_in(a2_wr[490]),  .coef_in(coef[168]), .rdup_out(a3_wr[426]), .rdlo_out(a3_wr[490]));
			radix2 #(.width(width)) rd_st2_427  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[427]), .rdlo_in(a2_wr[491]),  .coef_in(coef[172]), .rdup_out(a3_wr[427]), .rdlo_out(a3_wr[491]));
			radix2 #(.width(width)) rd_st2_428  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[428]), .rdlo_in(a2_wr[492]),  .coef_in(coef[176]), .rdup_out(a3_wr[428]), .rdlo_out(a3_wr[492]));
			radix2 #(.width(width)) rd_st2_429  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[429]), .rdlo_in(a2_wr[493]),  .coef_in(coef[180]), .rdup_out(a3_wr[429]), .rdlo_out(a3_wr[493]));
			radix2 #(.width(width)) rd_st2_430  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[430]), .rdlo_in(a2_wr[494]),  .coef_in(coef[184]), .rdup_out(a3_wr[430]), .rdlo_out(a3_wr[494]));
			radix2 #(.width(width)) rd_st2_431  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[431]), .rdlo_in(a2_wr[495]),  .coef_in(coef[188]), .rdup_out(a3_wr[431]), .rdlo_out(a3_wr[495]));
			radix2 #(.width(width)) rd_st2_432  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[432]), .rdlo_in(a2_wr[496]),  .coef_in(coef[192]), .rdup_out(a3_wr[432]), .rdlo_out(a3_wr[496]));
			radix2 #(.width(width)) rd_st2_433  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[433]), .rdlo_in(a2_wr[497]),  .coef_in(coef[196]), .rdup_out(a3_wr[433]), .rdlo_out(a3_wr[497]));
			radix2 #(.width(width)) rd_st2_434  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[434]), .rdlo_in(a2_wr[498]),  .coef_in(coef[200]), .rdup_out(a3_wr[434]), .rdlo_out(a3_wr[498]));
			radix2 #(.width(width)) rd_st2_435  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[435]), .rdlo_in(a2_wr[499]),  .coef_in(coef[204]), .rdup_out(a3_wr[435]), .rdlo_out(a3_wr[499]));
			radix2 #(.width(width)) rd_st2_436  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[436]), .rdlo_in(a2_wr[500]),  .coef_in(coef[208]), .rdup_out(a3_wr[436]), .rdlo_out(a3_wr[500]));
			radix2 #(.width(width)) rd_st2_437  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[437]), .rdlo_in(a2_wr[501]),  .coef_in(coef[212]), .rdup_out(a3_wr[437]), .rdlo_out(a3_wr[501]));
			radix2 #(.width(width)) rd_st2_438  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[438]), .rdlo_in(a2_wr[502]),  .coef_in(coef[216]), .rdup_out(a3_wr[438]), .rdlo_out(a3_wr[502]));
			radix2 #(.width(width)) rd_st2_439  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[439]), .rdlo_in(a2_wr[503]),  .coef_in(coef[220]), .rdup_out(a3_wr[439]), .rdlo_out(a3_wr[503]));
			radix2 #(.width(width)) rd_st2_440  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[440]), .rdlo_in(a2_wr[504]),  .coef_in(coef[224]), .rdup_out(a3_wr[440]), .rdlo_out(a3_wr[504]));
			radix2 #(.width(width)) rd_st2_441  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[441]), .rdlo_in(a2_wr[505]),  .coef_in(coef[228]), .rdup_out(a3_wr[441]), .rdlo_out(a3_wr[505]));
			radix2 #(.width(width)) rd_st2_442  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[442]), .rdlo_in(a2_wr[506]),  .coef_in(coef[232]), .rdup_out(a3_wr[442]), .rdlo_out(a3_wr[506]));
			radix2 #(.width(width)) rd_st2_443  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[443]), .rdlo_in(a2_wr[507]),  .coef_in(coef[236]), .rdup_out(a3_wr[443]), .rdlo_out(a3_wr[507]));
			radix2 #(.width(width)) rd_st2_444  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[444]), .rdlo_in(a2_wr[508]),  .coef_in(coef[240]), .rdup_out(a3_wr[444]), .rdlo_out(a3_wr[508]));
			radix2 #(.width(width)) rd_st2_445  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[445]), .rdlo_in(a2_wr[509]),  .coef_in(coef[244]), .rdup_out(a3_wr[445]), .rdlo_out(a3_wr[509]));
			radix2 #(.width(width)) rd_st2_446  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[446]), .rdlo_in(a2_wr[510]),  .coef_in(coef[248]), .rdup_out(a3_wr[446]), .rdlo_out(a3_wr[510]));
			radix2 #(.width(width)) rd_st2_447  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a2_wr[447]), .rdlo_in(a2_wr[511]),  .coef_in(coef[252]), .rdup_out(a3_wr[447]), .rdlo_out(a3_wr[511]));

		//--- radix stage 3
			radix2 #(.width(width)) rd_st3_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[0]), .rdlo_in(a3_wr[32]),  .coef_in(coef[0]), .rdup_out(a4_wr[0]), .rdlo_out(a4_wr[32]));
			radix2 #(.width(width)) rd_st3_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[1]), .rdlo_in(a3_wr[33]),  .coef_in(coef[8]), .rdup_out(a4_wr[1]), .rdlo_out(a4_wr[33]));
			radix2 #(.width(width)) rd_st3_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[2]), .rdlo_in(a3_wr[34]),  .coef_in(coef[16]), .rdup_out(a4_wr[2]), .rdlo_out(a4_wr[34]));
			radix2 #(.width(width)) rd_st3_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[3]), .rdlo_in(a3_wr[35]),  .coef_in(coef[24]), .rdup_out(a4_wr[3]), .rdlo_out(a4_wr[35]));
			radix2 #(.width(width)) rd_st3_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[4]), .rdlo_in(a3_wr[36]),  .coef_in(coef[32]), .rdup_out(a4_wr[4]), .rdlo_out(a4_wr[36]));
			radix2 #(.width(width)) rd_st3_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[5]), .rdlo_in(a3_wr[37]),  .coef_in(coef[40]), .rdup_out(a4_wr[5]), .rdlo_out(a4_wr[37]));
			radix2 #(.width(width)) rd_st3_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[6]), .rdlo_in(a3_wr[38]),  .coef_in(coef[48]), .rdup_out(a4_wr[6]), .rdlo_out(a4_wr[38]));
			radix2 #(.width(width)) rd_st3_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[7]), .rdlo_in(a3_wr[39]),  .coef_in(coef[56]), .rdup_out(a4_wr[7]), .rdlo_out(a4_wr[39]));
			radix2 #(.width(width)) rd_st3_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[8]), .rdlo_in(a3_wr[40]),  .coef_in(coef[64]), .rdup_out(a4_wr[8]), .rdlo_out(a4_wr[40]));
			radix2 #(.width(width)) rd_st3_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[9]), .rdlo_in(a3_wr[41]),  .coef_in(coef[72]), .rdup_out(a4_wr[9]), .rdlo_out(a4_wr[41]));
			radix2 #(.width(width)) rd_st3_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[10]), .rdlo_in(a3_wr[42]),  .coef_in(coef[80]), .rdup_out(a4_wr[10]), .rdlo_out(a4_wr[42]));
			radix2 #(.width(width)) rd_st3_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[11]), .rdlo_in(a3_wr[43]),  .coef_in(coef[88]), .rdup_out(a4_wr[11]), .rdlo_out(a4_wr[43]));
			radix2 #(.width(width)) rd_st3_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[12]), .rdlo_in(a3_wr[44]),  .coef_in(coef[96]), .rdup_out(a4_wr[12]), .rdlo_out(a4_wr[44]));
			radix2 #(.width(width)) rd_st3_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[13]), .rdlo_in(a3_wr[45]),  .coef_in(coef[104]), .rdup_out(a4_wr[13]), .rdlo_out(a4_wr[45]));
			radix2 #(.width(width)) rd_st3_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[14]), .rdlo_in(a3_wr[46]),  .coef_in(coef[112]), .rdup_out(a4_wr[14]), .rdlo_out(a4_wr[46]));
			radix2 #(.width(width)) rd_st3_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[15]), .rdlo_in(a3_wr[47]),  .coef_in(coef[120]), .rdup_out(a4_wr[15]), .rdlo_out(a4_wr[47]));
			radix2 #(.width(width)) rd_st3_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[16]), .rdlo_in(a3_wr[48]),  .coef_in(coef[128]), .rdup_out(a4_wr[16]), .rdlo_out(a4_wr[48]));
			radix2 #(.width(width)) rd_st3_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[17]), .rdlo_in(a3_wr[49]),  .coef_in(coef[136]), .rdup_out(a4_wr[17]), .rdlo_out(a4_wr[49]));
			radix2 #(.width(width)) rd_st3_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[18]), .rdlo_in(a3_wr[50]),  .coef_in(coef[144]), .rdup_out(a4_wr[18]), .rdlo_out(a4_wr[50]));
			radix2 #(.width(width)) rd_st3_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[19]), .rdlo_in(a3_wr[51]),  .coef_in(coef[152]), .rdup_out(a4_wr[19]), .rdlo_out(a4_wr[51]));
			radix2 #(.width(width)) rd_st3_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[20]), .rdlo_in(a3_wr[52]),  .coef_in(coef[160]), .rdup_out(a4_wr[20]), .rdlo_out(a4_wr[52]));
			radix2 #(.width(width)) rd_st3_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[21]), .rdlo_in(a3_wr[53]),  .coef_in(coef[168]), .rdup_out(a4_wr[21]), .rdlo_out(a4_wr[53]));
			radix2 #(.width(width)) rd_st3_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[22]), .rdlo_in(a3_wr[54]),  .coef_in(coef[176]), .rdup_out(a4_wr[22]), .rdlo_out(a4_wr[54]));
			radix2 #(.width(width)) rd_st3_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[23]), .rdlo_in(a3_wr[55]),  .coef_in(coef[184]), .rdup_out(a4_wr[23]), .rdlo_out(a4_wr[55]));
			radix2 #(.width(width)) rd_st3_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[24]), .rdlo_in(a3_wr[56]),  .coef_in(coef[192]), .rdup_out(a4_wr[24]), .rdlo_out(a4_wr[56]));
			radix2 #(.width(width)) rd_st3_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[25]), .rdlo_in(a3_wr[57]),  .coef_in(coef[200]), .rdup_out(a4_wr[25]), .rdlo_out(a4_wr[57]));
			radix2 #(.width(width)) rd_st3_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[26]), .rdlo_in(a3_wr[58]),  .coef_in(coef[208]), .rdup_out(a4_wr[26]), .rdlo_out(a4_wr[58]));
			radix2 #(.width(width)) rd_st3_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[27]), .rdlo_in(a3_wr[59]),  .coef_in(coef[216]), .rdup_out(a4_wr[27]), .rdlo_out(a4_wr[59]));
			radix2 #(.width(width)) rd_st3_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[28]), .rdlo_in(a3_wr[60]),  .coef_in(coef[224]), .rdup_out(a4_wr[28]), .rdlo_out(a4_wr[60]));
			radix2 #(.width(width)) rd_st3_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[29]), .rdlo_in(a3_wr[61]),  .coef_in(coef[232]), .rdup_out(a4_wr[29]), .rdlo_out(a4_wr[61]));
			radix2 #(.width(width)) rd_st3_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[30]), .rdlo_in(a3_wr[62]),  .coef_in(coef[240]), .rdup_out(a4_wr[30]), .rdlo_out(a4_wr[62]));
			radix2 #(.width(width)) rd_st3_31  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[31]), .rdlo_in(a3_wr[63]),  .coef_in(coef[248]), .rdup_out(a4_wr[31]), .rdlo_out(a4_wr[63]));
			radix2 #(.width(width)) rd_st3_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[64]), .rdlo_in(a3_wr[96]),  .coef_in(coef[0]), .rdup_out(a4_wr[64]), .rdlo_out(a4_wr[96]));
			radix2 #(.width(width)) rd_st3_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[65]), .rdlo_in(a3_wr[97]),  .coef_in(coef[8]), .rdup_out(a4_wr[65]), .rdlo_out(a4_wr[97]));
			radix2 #(.width(width)) rd_st3_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[66]), .rdlo_in(a3_wr[98]),  .coef_in(coef[16]), .rdup_out(a4_wr[66]), .rdlo_out(a4_wr[98]));
			radix2 #(.width(width)) rd_st3_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[67]), .rdlo_in(a3_wr[99]),  .coef_in(coef[24]), .rdup_out(a4_wr[67]), .rdlo_out(a4_wr[99]));
			radix2 #(.width(width)) rd_st3_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[68]), .rdlo_in(a3_wr[100]),  .coef_in(coef[32]), .rdup_out(a4_wr[68]), .rdlo_out(a4_wr[100]));
			radix2 #(.width(width)) rd_st3_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[69]), .rdlo_in(a3_wr[101]),  .coef_in(coef[40]), .rdup_out(a4_wr[69]), .rdlo_out(a4_wr[101]));
			radix2 #(.width(width)) rd_st3_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[70]), .rdlo_in(a3_wr[102]),  .coef_in(coef[48]), .rdup_out(a4_wr[70]), .rdlo_out(a4_wr[102]));
			radix2 #(.width(width)) rd_st3_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[71]), .rdlo_in(a3_wr[103]),  .coef_in(coef[56]), .rdup_out(a4_wr[71]), .rdlo_out(a4_wr[103]));
			radix2 #(.width(width)) rd_st3_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[72]), .rdlo_in(a3_wr[104]),  .coef_in(coef[64]), .rdup_out(a4_wr[72]), .rdlo_out(a4_wr[104]));
			radix2 #(.width(width)) rd_st3_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[73]), .rdlo_in(a3_wr[105]),  .coef_in(coef[72]), .rdup_out(a4_wr[73]), .rdlo_out(a4_wr[105]));
			radix2 #(.width(width)) rd_st3_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[74]), .rdlo_in(a3_wr[106]),  .coef_in(coef[80]), .rdup_out(a4_wr[74]), .rdlo_out(a4_wr[106]));
			radix2 #(.width(width)) rd_st3_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[75]), .rdlo_in(a3_wr[107]),  .coef_in(coef[88]), .rdup_out(a4_wr[75]), .rdlo_out(a4_wr[107]));
			radix2 #(.width(width)) rd_st3_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[76]), .rdlo_in(a3_wr[108]),  .coef_in(coef[96]), .rdup_out(a4_wr[76]), .rdlo_out(a4_wr[108]));
			radix2 #(.width(width)) rd_st3_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[77]), .rdlo_in(a3_wr[109]),  .coef_in(coef[104]), .rdup_out(a4_wr[77]), .rdlo_out(a4_wr[109]));
			radix2 #(.width(width)) rd_st3_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[78]), .rdlo_in(a3_wr[110]),  .coef_in(coef[112]), .rdup_out(a4_wr[78]), .rdlo_out(a4_wr[110]));
			radix2 #(.width(width)) rd_st3_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[79]), .rdlo_in(a3_wr[111]),  .coef_in(coef[120]), .rdup_out(a4_wr[79]), .rdlo_out(a4_wr[111]));
			radix2 #(.width(width)) rd_st3_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[80]), .rdlo_in(a3_wr[112]),  .coef_in(coef[128]), .rdup_out(a4_wr[80]), .rdlo_out(a4_wr[112]));
			radix2 #(.width(width)) rd_st3_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[81]), .rdlo_in(a3_wr[113]),  .coef_in(coef[136]), .rdup_out(a4_wr[81]), .rdlo_out(a4_wr[113]));
			radix2 #(.width(width)) rd_st3_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[82]), .rdlo_in(a3_wr[114]),  .coef_in(coef[144]), .rdup_out(a4_wr[82]), .rdlo_out(a4_wr[114]));
			radix2 #(.width(width)) rd_st3_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[83]), .rdlo_in(a3_wr[115]),  .coef_in(coef[152]), .rdup_out(a4_wr[83]), .rdlo_out(a4_wr[115]));
			radix2 #(.width(width)) rd_st3_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[84]), .rdlo_in(a3_wr[116]),  .coef_in(coef[160]), .rdup_out(a4_wr[84]), .rdlo_out(a4_wr[116]));
			radix2 #(.width(width)) rd_st3_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[85]), .rdlo_in(a3_wr[117]),  .coef_in(coef[168]), .rdup_out(a4_wr[85]), .rdlo_out(a4_wr[117]));
			radix2 #(.width(width)) rd_st3_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[86]), .rdlo_in(a3_wr[118]),  .coef_in(coef[176]), .rdup_out(a4_wr[86]), .rdlo_out(a4_wr[118]));
			radix2 #(.width(width)) rd_st3_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[87]), .rdlo_in(a3_wr[119]),  .coef_in(coef[184]), .rdup_out(a4_wr[87]), .rdlo_out(a4_wr[119]));
			radix2 #(.width(width)) rd_st3_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[88]), .rdlo_in(a3_wr[120]),  .coef_in(coef[192]), .rdup_out(a4_wr[88]), .rdlo_out(a4_wr[120]));
			radix2 #(.width(width)) rd_st3_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[89]), .rdlo_in(a3_wr[121]),  .coef_in(coef[200]), .rdup_out(a4_wr[89]), .rdlo_out(a4_wr[121]));
			radix2 #(.width(width)) rd_st3_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[90]), .rdlo_in(a3_wr[122]),  .coef_in(coef[208]), .rdup_out(a4_wr[90]), .rdlo_out(a4_wr[122]));
			radix2 #(.width(width)) rd_st3_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[91]), .rdlo_in(a3_wr[123]),  .coef_in(coef[216]), .rdup_out(a4_wr[91]), .rdlo_out(a4_wr[123]));
			radix2 #(.width(width)) rd_st3_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[92]), .rdlo_in(a3_wr[124]),  .coef_in(coef[224]), .rdup_out(a4_wr[92]), .rdlo_out(a4_wr[124]));
			radix2 #(.width(width)) rd_st3_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[93]), .rdlo_in(a3_wr[125]),  .coef_in(coef[232]), .rdup_out(a4_wr[93]), .rdlo_out(a4_wr[125]));
			radix2 #(.width(width)) rd_st3_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[94]), .rdlo_in(a3_wr[126]),  .coef_in(coef[240]), .rdup_out(a4_wr[94]), .rdlo_out(a4_wr[126]));
			radix2 #(.width(width)) rd_st3_95  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[95]), .rdlo_in(a3_wr[127]),  .coef_in(coef[248]), .rdup_out(a4_wr[95]), .rdlo_out(a4_wr[127]));
			radix2 #(.width(width)) rd_st3_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[128]), .rdlo_in(a3_wr[160]),  .coef_in(coef[0]), .rdup_out(a4_wr[128]), .rdlo_out(a4_wr[160]));
			radix2 #(.width(width)) rd_st3_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[129]), .rdlo_in(a3_wr[161]),  .coef_in(coef[8]), .rdup_out(a4_wr[129]), .rdlo_out(a4_wr[161]));
			radix2 #(.width(width)) rd_st3_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[130]), .rdlo_in(a3_wr[162]),  .coef_in(coef[16]), .rdup_out(a4_wr[130]), .rdlo_out(a4_wr[162]));
			radix2 #(.width(width)) rd_st3_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[131]), .rdlo_in(a3_wr[163]),  .coef_in(coef[24]), .rdup_out(a4_wr[131]), .rdlo_out(a4_wr[163]));
			radix2 #(.width(width)) rd_st3_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[132]), .rdlo_in(a3_wr[164]),  .coef_in(coef[32]), .rdup_out(a4_wr[132]), .rdlo_out(a4_wr[164]));
			radix2 #(.width(width)) rd_st3_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[133]), .rdlo_in(a3_wr[165]),  .coef_in(coef[40]), .rdup_out(a4_wr[133]), .rdlo_out(a4_wr[165]));
			radix2 #(.width(width)) rd_st3_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[134]), .rdlo_in(a3_wr[166]),  .coef_in(coef[48]), .rdup_out(a4_wr[134]), .rdlo_out(a4_wr[166]));
			radix2 #(.width(width)) rd_st3_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[135]), .rdlo_in(a3_wr[167]),  .coef_in(coef[56]), .rdup_out(a4_wr[135]), .rdlo_out(a4_wr[167]));
			radix2 #(.width(width)) rd_st3_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[136]), .rdlo_in(a3_wr[168]),  .coef_in(coef[64]), .rdup_out(a4_wr[136]), .rdlo_out(a4_wr[168]));
			radix2 #(.width(width)) rd_st3_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[137]), .rdlo_in(a3_wr[169]),  .coef_in(coef[72]), .rdup_out(a4_wr[137]), .rdlo_out(a4_wr[169]));
			radix2 #(.width(width)) rd_st3_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[138]), .rdlo_in(a3_wr[170]),  .coef_in(coef[80]), .rdup_out(a4_wr[138]), .rdlo_out(a4_wr[170]));
			radix2 #(.width(width)) rd_st3_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[139]), .rdlo_in(a3_wr[171]),  .coef_in(coef[88]), .rdup_out(a4_wr[139]), .rdlo_out(a4_wr[171]));
			radix2 #(.width(width)) rd_st3_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[140]), .rdlo_in(a3_wr[172]),  .coef_in(coef[96]), .rdup_out(a4_wr[140]), .rdlo_out(a4_wr[172]));
			radix2 #(.width(width)) rd_st3_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[141]), .rdlo_in(a3_wr[173]),  .coef_in(coef[104]), .rdup_out(a4_wr[141]), .rdlo_out(a4_wr[173]));
			radix2 #(.width(width)) rd_st3_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[142]), .rdlo_in(a3_wr[174]),  .coef_in(coef[112]), .rdup_out(a4_wr[142]), .rdlo_out(a4_wr[174]));
			radix2 #(.width(width)) rd_st3_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[143]), .rdlo_in(a3_wr[175]),  .coef_in(coef[120]), .rdup_out(a4_wr[143]), .rdlo_out(a4_wr[175]));
			radix2 #(.width(width)) rd_st3_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[144]), .rdlo_in(a3_wr[176]),  .coef_in(coef[128]), .rdup_out(a4_wr[144]), .rdlo_out(a4_wr[176]));
			radix2 #(.width(width)) rd_st3_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[145]), .rdlo_in(a3_wr[177]),  .coef_in(coef[136]), .rdup_out(a4_wr[145]), .rdlo_out(a4_wr[177]));
			radix2 #(.width(width)) rd_st3_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[146]), .rdlo_in(a3_wr[178]),  .coef_in(coef[144]), .rdup_out(a4_wr[146]), .rdlo_out(a4_wr[178]));
			radix2 #(.width(width)) rd_st3_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[147]), .rdlo_in(a3_wr[179]),  .coef_in(coef[152]), .rdup_out(a4_wr[147]), .rdlo_out(a4_wr[179]));
			radix2 #(.width(width)) rd_st3_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[148]), .rdlo_in(a3_wr[180]),  .coef_in(coef[160]), .rdup_out(a4_wr[148]), .rdlo_out(a4_wr[180]));
			radix2 #(.width(width)) rd_st3_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[149]), .rdlo_in(a3_wr[181]),  .coef_in(coef[168]), .rdup_out(a4_wr[149]), .rdlo_out(a4_wr[181]));
			radix2 #(.width(width)) rd_st3_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[150]), .rdlo_in(a3_wr[182]),  .coef_in(coef[176]), .rdup_out(a4_wr[150]), .rdlo_out(a4_wr[182]));
			radix2 #(.width(width)) rd_st3_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[151]), .rdlo_in(a3_wr[183]),  .coef_in(coef[184]), .rdup_out(a4_wr[151]), .rdlo_out(a4_wr[183]));
			radix2 #(.width(width)) rd_st3_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[152]), .rdlo_in(a3_wr[184]),  .coef_in(coef[192]), .rdup_out(a4_wr[152]), .rdlo_out(a4_wr[184]));
			radix2 #(.width(width)) rd_st3_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[153]), .rdlo_in(a3_wr[185]),  .coef_in(coef[200]), .rdup_out(a4_wr[153]), .rdlo_out(a4_wr[185]));
			radix2 #(.width(width)) rd_st3_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[154]), .rdlo_in(a3_wr[186]),  .coef_in(coef[208]), .rdup_out(a4_wr[154]), .rdlo_out(a4_wr[186]));
			radix2 #(.width(width)) rd_st3_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[155]), .rdlo_in(a3_wr[187]),  .coef_in(coef[216]), .rdup_out(a4_wr[155]), .rdlo_out(a4_wr[187]));
			radix2 #(.width(width)) rd_st3_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[156]), .rdlo_in(a3_wr[188]),  .coef_in(coef[224]), .rdup_out(a4_wr[156]), .rdlo_out(a4_wr[188]));
			radix2 #(.width(width)) rd_st3_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[157]), .rdlo_in(a3_wr[189]),  .coef_in(coef[232]), .rdup_out(a4_wr[157]), .rdlo_out(a4_wr[189]));
			radix2 #(.width(width)) rd_st3_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[158]), .rdlo_in(a3_wr[190]),  .coef_in(coef[240]), .rdup_out(a4_wr[158]), .rdlo_out(a4_wr[190]));
			radix2 #(.width(width)) rd_st3_159  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[159]), .rdlo_in(a3_wr[191]),  .coef_in(coef[248]), .rdup_out(a4_wr[159]), .rdlo_out(a4_wr[191]));
			radix2 #(.width(width)) rd_st3_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[192]), .rdlo_in(a3_wr[224]),  .coef_in(coef[0]), .rdup_out(a4_wr[192]), .rdlo_out(a4_wr[224]));
			radix2 #(.width(width)) rd_st3_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[193]), .rdlo_in(a3_wr[225]),  .coef_in(coef[8]), .rdup_out(a4_wr[193]), .rdlo_out(a4_wr[225]));
			radix2 #(.width(width)) rd_st3_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[194]), .rdlo_in(a3_wr[226]),  .coef_in(coef[16]), .rdup_out(a4_wr[194]), .rdlo_out(a4_wr[226]));
			radix2 #(.width(width)) rd_st3_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[195]), .rdlo_in(a3_wr[227]),  .coef_in(coef[24]), .rdup_out(a4_wr[195]), .rdlo_out(a4_wr[227]));
			radix2 #(.width(width)) rd_st3_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[196]), .rdlo_in(a3_wr[228]),  .coef_in(coef[32]), .rdup_out(a4_wr[196]), .rdlo_out(a4_wr[228]));
			radix2 #(.width(width)) rd_st3_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[197]), .rdlo_in(a3_wr[229]),  .coef_in(coef[40]), .rdup_out(a4_wr[197]), .rdlo_out(a4_wr[229]));
			radix2 #(.width(width)) rd_st3_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[198]), .rdlo_in(a3_wr[230]),  .coef_in(coef[48]), .rdup_out(a4_wr[198]), .rdlo_out(a4_wr[230]));
			radix2 #(.width(width)) rd_st3_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[199]), .rdlo_in(a3_wr[231]),  .coef_in(coef[56]), .rdup_out(a4_wr[199]), .rdlo_out(a4_wr[231]));
			radix2 #(.width(width)) rd_st3_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[200]), .rdlo_in(a3_wr[232]),  .coef_in(coef[64]), .rdup_out(a4_wr[200]), .rdlo_out(a4_wr[232]));
			radix2 #(.width(width)) rd_st3_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[201]), .rdlo_in(a3_wr[233]),  .coef_in(coef[72]), .rdup_out(a4_wr[201]), .rdlo_out(a4_wr[233]));
			radix2 #(.width(width)) rd_st3_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[202]), .rdlo_in(a3_wr[234]),  .coef_in(coef[80]), .rdup_out(a4_wr[202]), .rdlo_out(a4_wr[234]));
			radix2 #(.width(width)) rd_st3_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[203]), .rdlo_in(a3_wr[235]),  .coef_in(coef[88]), .rdup_out(a4_wr[203]), .rdlo_out(a4_wr[235]));
			radix2 #(.width(width)) rd_st3_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[204]), .rdlo_in(a3_wr[236]),  .coef_in(coef[96]), .rdup_out(a4_wr[204]), .rdlo_out(a4_wr[236]));
			radix2 #(.width(width)) rd_st3_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[205]), .rdlo_in(a3_wr[237]),  .coef_in(coef[104]), .rdup_out(a4_wr[205]), .rdlo_out(a4_wr[237]));
			radix2 #(.width(width)) rd_st3_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[206]), .rdlo_in(a3_wr[238]),  .coef_in(coef[112]), .rdup_out(a4_wr[206]), .rdlo_out(a4_wr[238]));
			radix2 #(.width(width)) rd_st3_207  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[207]), .rdlo_in(a3_wr[239]),  .coef_in(coef[120]), .rdup_out(a4_wr[207]), .rdlo_out(a4_wr[239]));
			radix2 #(.width(width)) rd_st3_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[208]), .rdlo_in(a3_wr[240]),  .coef_in(coef[128]), .rdup_out(a4_wr[208]), .rdlo_out(a4_wr[240]));
			radix2 #(.width(width)) rd_st3_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[209]), .rdlo_in(a3_wr[241]),  .coef_in(coef[136]), .rdup_out(a4_wr[209]), .rdlo_out(a4_wr[241]));
			radix2 #(.width(width)) rd_st3_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[210]), .rdlo_in(a3_wr[242]),  .coef_in(coef[144]), .rdup_out(a4_wr[210]), .rdlo_out(a4_wr[242]));
			radix2 #(.width(width)) rd_st3_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[211]), .rdlo_in(a3_wr[243]),  .coef_in(coef[152]), .rdup_out(a4_wr[211]), .rdlo_out(a4_wr[243]));
			radix2 #(.width(width)) rd_st3_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[212]), .rdlo_in(a3_wr[244]),  .coef_in(coef[160]), .rdup_out(a4_wr[212]), .rdlo_out(a4_wr[244]));
			radix2 #(.width(width)) rd_st3_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[213]), .rdlo_in(a3_wr[245]),  .coef_in(coef[168]), .rdup_out(a4_wr[213]), .rdlo_out(a4_wr[245]));
			radix2 #(.width(width)) rd_st3_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[214]), .rdlo_in(a3_wr[246]),  .coef_in(coef[176]), .rdup_out(a4_wr[214]), .rdlo_out(a4_wr[246]));
			radix2 #(.width(width)) rd_st3_215  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[215]), .rdlo_in(a3_wr[247]),  .coef_in(coef[184]), .rdup_out(a4_wr[215]), .rdlo_out(a4_wr[247]));
			radix2 #(.width(width)) rd_st3_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[216]), .rdlo_in(a3_wr[248]),  .coef_in(coef[192]), .rdup_out(a4_wr[216]), .rdlo_out(a4_wr[248]));
			radix2 #(.width(width)) rd_st3_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[217]), .rdlo_in(a3_wr[249]),  .coef_in(coef[200]), .rdup_out(a4_wr[217]), .rdlo_out(a4_wr[249]));
			radix2 #(.width(width)) rd_st3_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[218]), .rdlo_in(a3_wr[250]),  .coef_in(coef[208]), .rdup_out(a4_wr[218]), .rdlo_out(a4_wr[250]));
			radix2 #(.width(width)) rd_st3_219  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[219]), .rdlo_in(a3_wr[251]),  .coef_in(coef[216]), .rdup_out(a4_wr[219]), .rdlo_out(a4_wr[251]));
			radix2 #(.width(width)) rd_st3_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[220]), .rdlo_in(a3_wr[252]),  .coef_in(coef[224]), .rdup_out(a4_wr[220]), .rdlo_out(a4_wr[252]));
			radix2 #(.width(width)) rd_st3_221  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[221]), .rdlo_in(a3_wr[253]),  .coef_in(coef[232]), .rdup_out(a4_wr[221]), .rdlo_out(a4_wr[253]));
			radix2 #(.width(width)) rd_st3_222  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[222]), .rdlo_in(a3_wr[254]),  .coef_in(coef[240]), .rdup_out(a4_wr[222]), .rdlo_out(a4_wr[254]));
			radix2 #(.width(width)) rd_st3_223  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[223]), .rdlo_in(a3_wr[255]),  .coef_in(coef[248]), .rdup_out(a4_wr[223]), .rdlo_out(a4_wr[255]));
			radix2 #(.width(width)) rd_st3_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[256]), .rdlo_in(a3_wr[288]),  .coef_in(coef[0]), .rdup_out(a4_wr[256]), .rdlo_out(a4_wr[288]));
			radix2 #(.width(width)) rd_st3_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[257]), .rdlo_in(a3_wr[289]),  .coef_in(coef[8]), .rdup_out(a4_wr[257]), .rdlo_out(a4_wr[289]));
			radix2 #(.width(width)) rd_st3_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[258]), .rdlo_in(a3_wr[290]),  .coef_in(coef[16]), .rdup_out(a4_wr[258]), .rdlo_out(a4_wr[290]));
			radix2 #(.width(width)) rd_st3_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[259]), .rdlo_in(a3_wr[291]),  .coef_in(coef[24]), .rdup_out(a4_wr[259]), .rdlo_out(a4_wr[291]));
			radix2 #(.width(width)) rd_st3_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[260]), .rdlo_in(a3_wr[292]),  .coef_in(coef[32]), .rdup_out(a4_wr[260]), .rdlo_out(a4_wr[292]));
			radix2 #(.width(width)) rd_st3_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[261]), .rdlo_in(a3_wr[293]),  .coef_in(coef[40]), .rdup_out(a4_wr[261]), .rdlo_out(a4_wr[293]));
			radix2 #(.width(width)) rd_st3_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[262]), .rdlo_in(a3_wr[294]),  .coef_in(coef[48]), .rdup_out(a4_wr[262]), .rdlo_out(a4_wr[294]));
			radix2 #(.width(width)) rd_st3_263  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[263]), .rdlo_in(a3_wr[295]),  .coef_in(coef[56]), .rdup_out(a4_wr[263]), .rdlo_out(a4_wr[295]));
			radix2 #(.width(width)) rd_st3_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[264]), .rdlo_in(a3_wr[296]),  .coef_in(coef[64]), .rdup_out(a4_wr[264]), .rdlo_out(a4_wr[296]));
			radix2 #(.width(width)) rd_st3_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[265]), .rdlo_in(a3_wr[297]),  .coef_in(coef[72]), .rdup_out(a4_wr[265]), .rdlo_out(a4_wr[297]));
			radix2 #(.width(width)) rd_st3_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[266]), .rdlo_in(a3_wr[298]),  .coef_in(coef[80]), .rdup_out(a4_wr[266]), .rdlo_out(a4_wr[298]));
			radix2 #(.width(width)) rd_st3_267  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[267]), .rdlo_in(a3_wr[299]),  .coef_in(coef[88]), .rdup_out(a4_wr[267]), .rdlo_out(a4_wr[299]));
			radix2 #(.width(width)) rd_st3_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[268]), .rdlo_in(a3_wr[300]),  .coef_in(coef[96]), .rdup_out(a4_wr[268]), .rdlo_out(a4_wr[300]));
			radix2 #(.width(width)) rd_st3_269  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[269]), .rdlo_in(a3_wr[301]),  .coef_in(coef[104]), .rdup_out(a4_wr[269]), .rdlo_out(a4_wr[301]));
			radix2 #(.width(width)) rd_st3_270  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[270]), .rdlo_in(a3_wr[302]),  .coef_in(coef[112]), .rdup_out(a4_wr[270]), .rdlo_out(a4_wr[302]));
			radix2 #(.width(width)) rd_st3_271  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[271]), .rdlo_in(a3_wr[303]),  .coef_in(coef[120]), .rdup_out(a4_wr[271]), .rdlo_out(a4_wr[303]));
			radix2 #(.width(width)) rd_st3_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[272]), .rdlo_in(a3_wr[304]),  .coef_in(coef[128]), .rdup_out(a4_wr[272]), .rdlo_out(a4_wr[304]));
			radix2 #(.width(width)) rd_st3_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[273]), .rdlo_in(a3_wr[305]),  .coef_in(coef[136]), .rdup_out(a4_wr[273]), .rdlo_out(a4_wr[305]));
			radix2 #(.width(width)) rd_st3_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[274]), .rdlo_in(a3_wr[306]),  .coef_in(coef[144]), .rdup_out(a4_wr[274]), .rdlo_out(a4_wr[306]));
			radix2 #(.width(width)) rd_st3_275  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[275]), .rdlo_in(a3_wr[307]),  .coef_in(coef[152]), .rdup_out(a4_wr[275]), .rdlo_out(a4_wr[307]));
			radix2 #(.width(width)) rd_st3_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[276]), .rdlo_in(a3_wr[308]),  .coef_in(coef[160]), .rdup_out(a4_wr[276]), .rdlo_out(a4_wr[308]));
			radix2 #(.width(width)) rd_st3_277  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[277]), .rdlo_in(a3_wr[309]),  .coef_in(coef[168]), .rdup_out(a4_wr[277]), .rdlo_out(a4_wr[309]));
			radix2 #(.width(width)) rd_st3_278  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[278]), .rdlo_in(a3_wr[310]),  .coef_in(coef[176]), .rdup_out(a4_wr[278]), .rdlo_out(a4_wr[310]));
			radix2 #(.width(width)) rd_st3_279  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[279]), .rdlo_in(a3_wr[311]),  .coef_in(coef[184]), .rdup_out(a4_wr[279]), .rdlo_out(a4_wr[311]));
			radix2 #(.width(width)) rd_st3_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[280]), .rdlo_in(a3_wr[312]),  .coef_in(coef[192]), .rdup_out(a4_wr[280]), .rdlo_out(a4_wr[312]));
			radix2 #(.width(width)) rd_st3_281  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[281]), .rdlo_in(a3_wr[313]),  .coef_in(coef[200]), .rdup_out(a4_wr[281]), .rdlo_out(a4_wr[313]));
			radix2 #(.width(width)) rd_st3_282  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[282]), .rdlo_in(a3_wr[314]),  .coef_in(coef[208]), .rdup_out(a4_wr[282]), .rdlo_out(a4_wr[314]));
			radix2 #(.width(width)) rd_st3_283  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[283]), .rdlo_in(a3_wr[315]),  .coef_in(coef[216]), .rdup_out(a4_wr[283]), .rdlo_out(a4_wr[315]));
			radix2 #(.width(width)) rd_st3_284  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[284]), .rdlo_in(a3_wr[316]),  .coef_in(coef[224]), .rdup_out(a4_wr[284]), .rdlo_out(a4_wr[316]));
			radix2 #(.width(width)) rd_st3_285  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[285]), .rdlo_in(a3_wr[317]),  .coef_in(coef[232]), .rdup_out(a4_wr[285]), .rdlo_out(a4_wr[317]));
			radix2 #(.width(width)) rd_st3_286  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[286]), .rdlo_in(a3_wr[318]),  .coef_in(coef[240]), .rdup_out(a4_wr[286]), .rdlo_out(a4_wr[318]));
			radix2 #(.width(width)) rd_st3_287  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[287]), .rdlo_in(a3_wr[319]),  .coef_in(coef[248]), .rdup_out(a4_wr[287]), .rdlo_out(a4_wr[319]));
			radix2 #(.width(width)) rd_st3_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[320]), .rdlo_in(a3_wr[352]),  .coef_in(coef[0]), .rdup_out(a4_wr[320]), .rdlo_out(a4_wr[352]));
			radix2 #(.width(width)) rd_st3_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[321]), .rdlo_in(a3_wr[353]),  .coef_in(coef[8]), .rdup_out(a4_wr[321]), .rdlo_out(a4_wr[353]));
			radix2 #(.width(width)) rd_st3_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[322]), .rdlo_in(a3_wr[354]),  .coef_in(coef[16]), .rdup_out(a4_wr[322]), .rdlo_out(a4_wr[354]));
			radix2 #(.width(width)) rd_st3_323  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[323]), .rdlo_in(a3_wr[355]),  .coef_in(coef[24]), .rdup_out(a4_wr[323]), .rdlo_out(a4_wr[355]));
			radix2 #(.width(width)) rd_st3_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[324]), .rdlo_in(a3_wr[356]),  .coef_in(coef[32]), .rdup_out(a4_wr[324]), .rdlo_out(a4_wr[356]));
			radix2 #(.width(width)) rd_st3_325  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[325]), .rdlo_in(a3_wr[357]),  .coef_in(coef[40]), .rdup_out(a4_wr[325]), .rdlo_out(a4_wr[357]));
			radix2 #(.width(width)) rd_st3_326  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[326]), .rdlo_in(a3_wr[358]),  .coef_in(coef[48]), .rdup_out(a4_wr[326]), .rdlo_out(a4_wr[358]));
			radix2 #(.width(width)) rd_st3_327  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[327]), .rdlo_in(a3_wr[359]),  .coef_in(coef[56]), .rdup_out(a4_wr[327]), .rdlo_out(a4_wr[359]));
			radix2 #(.width(width)) rd_st3_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[328]), .rdlo_in(a3_wr[360]),  .coef_in(coef[64]), .rdup_out(a4_wr[328]), .rdlo_out(a4_wr[360]));
			radix2 #(.width(width)) rd_st3_329  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[329]), .rdlo_in(a3_wr[361]),  .coef_in(coef[72]), .rdup_out(a4_wr[329]), .rdlo_out(a4_wr[361]));
			radix2 #(.width(width)) rd_st3_330  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[330]), .rdlo_in(a3_wr[362]),  .coef_in(coef[80]), .rdup_out(a4_wr[330]), .rdlo_out(a4_wr[362]));
			radix2 #(.width(width)) rd_st3_331  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[331]), .rdlo_in(a3_wr[363]),  .coef_in(coef[88]), .rdup_out(a4_wr[331]), .rdlo_out(a4_wr[363]));
			radix2 #(.width(width)) rd_st3_332  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[332]), .rdlo_in(a3_wr[364]),  .coef_in(coef[96]), .rdup_out(a4_wr[332]), .rdlo_out(a4_wr[364]));
			radix2 #(.width(width)) rd_st3_333  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[333]), .rdlo_in(a3_wr[365]),  .coef_in(coef[104]), .rdup_out(a4_wr[333]), .rdlo_out(a4_wr[365]));
			radix2 #(.width(width)) rd_st3_334  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[334]), .rdlo_in(a3_wr[366]),  .coef_in(coef[112]), .rdup_out(a4_wr[334]), .rdlo_out(a4_wr[366]));
			radix2 #(.width(width)) rd_st3_335  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[335]), .rdlo_in(a3_wr[367]),  .coef_in(coef[120]), .rdup_out(a4_wr[335]), .rdlo_out(a4_wr[367]));
			radix2 #(.width(width)) rd_st3_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[336]), .rdlo_in(a3_wr[368]),  .coef_in(coef[128]), .rdup_out(a4_wr[336]), .rdlo_out(a4_wr[368]));
			radix2 #(.width(width)) rd_st3_337  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[337]), .rdlo_in(a3_wr[369]),  .coef_in(coef[136]), .rdup_out(a4_wr[337]), .rdlo_out(a4_wr[369]));
			radix2 #(.width(width)) rd_st3_338  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[338]), .rdlo_in(a3_wr[370]),  .coef_in(coef[144]), .rdup_out(a4_wr[338]), .rdlo_out(a4_wr[370]));
			radix2 #(.width(width)) rd_st3_339  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[339]), .rdlo_in(a3_wr[371]),  .coef_in(coef[152]), .rdup_out(a4_wr[339]), .rdlo_out(a4_wr[371]));
			radix2 #(.width(width)) rd_st3_340  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[340]), .rdlo_in(a3_wr[372]),  .coef_in(coef[160]), .rdup_out(a4_wr[340]), .rdlo_out(a4_wr[372]));
			radix2 #(.width(width)) rd_st3_341  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[341]), .rdlo_in(a3_wr[373]),  .coef_in(coef[168]), .rdup_out(a4_wr[341]), .rdlo_out(a4_wr[373]));
			radix2 #(.width(width)) rd_st3_342  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[342]), .rdlo_in(a3_wr[374]),  .coef_in(coef[176]), .rdup_out(a4_wr[342]), .rdlo_out(a4_wr[374]));
			radix2 #(.width(width)) rd_st3_343  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[343]), .rdlo_in(a3_wr[375]),  .coef_in(coef[184]), .rdup_out(a4_wr[343]), .rdlo_out(a4_wr[375]));
			radix2 #(.width(width)) rd_st3_344  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[344]), .rdlo_in(a3_wr[376]),  .coef_in(coef[192]), .rdup_out(a4_wr[344]), .rdlo_out(a4_wr[376]));
			radix2 #(.width(width)) rd_st3_345  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[345]), .rdlo_in(a3_wr[377]),  .coef_in(coef[200]), .rdup_out(a4_wr[345]), .rdlo_out(a4_wr[377]));
			radix2 #(.width(width)) rd_st3_346  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[346]), .rdlo_in(a3_wr[378]),  .coef_in(coef[208]), .rdup_out(a4_wr[346]), .rdlo_out(a4_wr[378]));
			radix2 #(.width(width)) rd_st3_347  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[347]), .rdlo_in(a3_wr[379]),  .coef_in(coef[216]), .rdup_out(a4_wr[347]), .rdlo_out(a4_wr[379]));
			radix2 #(.width(width)) rd_st3_348  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[348]), .rdlo_in(a3_wr[380]),  .coef_in(coef[224]), .rdup_out(a4_wr[348]), .rdlo_out(a4_wr[380]));
			radix2 #(.width(width)) rd_st3_349  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[349]), .rdlo_in(a3_wr[381]),  .coef_in(coef[232]), .rdup_out(a4_wr[349]), .rdlo_out(a4_wr[381]));
			radix2 #(.width(width)) rd_st3_350  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[350]), .rdlo_in(a3_wr[382]),  .coef_in(coef[240]), .rdup_out(a4_wr[350]), .rdlo_out(a4_wr[382]));
			radix2 #(.width(width)) rd_st3_351  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[351]), .rdlo_in(a3_wr[383]),  .coef_in(coef[248]), .rdup_out(a4_wr[351]), .rdlo_out(a4_wr[383]));
			radix2 #(.width(width)) rd_st3_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[384]), .rdlo_in(a3_wr[416]),  .coef_in(coef[0]), .rdup_out(a4_wr[384]), .rdlo_out(a4_wr[416]));
			radix2 #(.width(width)) rd_st3_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[385]), .rdlo_in(a3_wr[417]),  .coef_in(coef[8]), .rdup_out(a4_wr[385]), .rdlo_out(a4_wr[417]));
			radix2 #(.width(width)) rd_st3_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[386]), .rdlo_in(a3_wr[418]),  .coef_in(coef[16]), .rdup_out(a4_wr[386]), .rdlo_out(a4_wr[418]));
			radix2 #(.width(width)) rd_st3_387  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[387]), .rdlo_in(a3_wr[419]),  .coef_in(coef[24]), .rdup_out(a4_wr[387]), .rdlo_out(a4_wr[419]));
			radix2 #(.width(width)) rd_st3_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[388]), .rdlo_in(a3_wr[420]),  .coef_in(coef[32]), .rdup_out(a4_wr[388]), .rdlo_out(a4_wr[420]));
			radix2 #(.width(width)) rd_st3_389  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[389]), .rdlo_in(a3_wr[421]),  .coef_in(coef[40]), .rdup_out(a4_wr[389]), .rdlo_out(a4_wr[421]));
			radix2 #(.width(width)) rd_st3_390  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[390]), .rdlo_in(a3_wr[422]),  .coef_in(coef[48]), .rdup_out(a4_wr[390]), .rdlo_out(a4_wr[422]));
			radix2 #(.width(width)) rd_st3_391  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[391]), .rdlo_in(a3_wr[423]),  .coef_in(coef[56]), .rdup_out(a4_wr[391]), .rdlo_out(a4_wr[423]));
			radix2 #(.width(width)) rd_st3_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[392]), .rdlo_in(a3_wr[424]),  .coef_in(coef[64]), .rdup_out(a4_wr[392]), .rdlo_out(a4_wr[424]));
			radix2 #(.width(width)) rd_st3_393  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[393]), .rdlo_in(a3_wr[425]),  .coef_in(coef[72]), .rdup_out(a4_wr[393]), .rdlo_out(a4_wr[425]));
			radix2 #(.width(width)) rd_st3_394  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[394]), .rdlo_in(a3_wr[426]),  .coef_in(coef[80]), .rdup_out(a4_wr[394]), .rdlo_out(a4_wr[426]));
			radix2 #(.width(width)) rd_st3_395  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[395]), .rdlo_in(a3_wr[427]),  .coef_in(coef[88]), .rdup_out(a4_wr[395]), .rdlo_out(a4_wr[427]));
			radix2 #(.width(width)) rd_st3_396  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[396]), .rdlo_in(a3_wr[428]),  .coef_in(coef[96]), .rdup_out(a4_wr[396]), .rdlo_out(a4_wr[428]));
			radix2 #(.width(width)) rd_st3_397  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[397]), .rdlo_in(a3_wr[429]),  .coef_in(coef[104]), .rdup_out(a4_wr[397]), .rdlo_out(a4_wr[429]));
			radix2 #(.width(width)) rd_st3_398  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[398]), .rdlo_in(a3_wr[430]),  .coef_in(coef[112]), .rdup_out(a4_wr[398]), .rdlo_out(a4_wr[430]));
			radix2 #(.width(width)) rd_st3_399  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[399]), .rdlo_in(a3_wr[431]),  .coef_in(coef[120]), .rdup_out(a4_wr[399]), .rdlo_out(a4_wr[431]));
			radix2 #(.width(width)) rd_st3_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[400]), .rdlo_in(a3_wr[432]),  .coef_in(coef[128]), .rdup_out(a4_wr[400]), .rdlo_out(a4_wr[432]));
			radix2 #(.width(width)) rd_st3_401  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[401]), .rdlo_in(a3_wr[433]),  .coef_in(coef[136]), .rdup_out(a4_wr[401]), .rdlo_out(a4_wr[433]));
			radix2 #(.width(width)) rd_st3_402  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[402]), .rdlo_in(a3_wr[434]),  .coef_in(coef[144]), .rdup_out(a4_wr[402]), .rdlo_out(a4_wr[434]));
			radix2 #(.width(width)) rd_st3_403  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[403]), .rdlo_in(a3_wr[435]),  .coef_in(coef[152]), .rdup_out(a4_wr[403]), .rdlo_out(a4_wr[435]));
			radix2 #(.width(width)) rd_st3_404  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[404]), .rdlo_in(a3_wr[436]),  .coef_in(coef[160]), .rdup_out(a4_wr[404]), .rdlo_out(a4_wr[436]));
			radix2 #(.width(width)) rd_st3_405  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[405]), .rdlo_in(a3_wr[437]),  .coef_in(coef[168]), .rdup_out(a4_wr[405]), .rdlo_out(a4_wr[437]));
			radix2 #(.width(width)) rd_st3_406  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[406]), .rdlo_in(a3_wr[438]),  .coef_in(coef[176]), .rdup_out(a4_wr[406]), .rdlo_out(a4_wr[438]));
			radix2 #(.width(width)) rd_st3_407  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[407]), .rdlo_in(a3_wr[439]),  .coef_in(coef[184]), .rdup_out(a4_wr[407]), .rdlo_out(a4_wr[439]));
			radix2 #(.width(width)) rd_st3_408  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[408]), .rdlo_in(a3_wr[440]),  .coef_in(coef[192]), .rdup_out(a4_wr[408]), .rdlo_out(a4_wr[440]));
			radix2 #(.width(width)) rd_st3_409  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[409]), .rdlo_in(a3_wr[441]),  .coef_in(coef[200]), .rdup_out(a4_wr[409]), .rdlo_out(a4_wr[441]));
			radix2 #(.width(width)) rd_st3_410  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[410]), .rdlo_in(a3_wr[442]),  .coef_in(coef[208]), .rdup_out(a4_wr[410]), .rdlo_out(a4_wr[442]));
			radix2 #(.width(width)) rd_st3_411  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[411]), .rdlo_in(a3_wr[443]),  .coef_in(coef[216]), .rdup_out(a4_wr[411]), .rdlo_out(a4_wr[443]));
			radix2 #(.width(width)) rd_st3_412  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[412]), .rdlo_in(a3_wr[444]),  .coef_in(coef[224]), .rdup_out(a4_wr[412]), .rdlo_out(a4_wr[444]));
			radix2 #(.width(width)) rd_st3_413  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[413]), .rdlo_in(a3_wr[445]),  .coef_in(coef[232]), .rdup_out(a4_wr[413]), .rdlo_out(a4_wr[445]));
			radix2 #(.width(width)) rd_st3_414  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[414]), .rdlo_in(a3_wr[446]),  .coef_in(coef[240]), .rdup_out(a4_wr[414]), .rdlo_out(a4_wr[446]));
			radix2 #(.width(width)) rd_st3_415  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[415]), .rdlo_in(a3_wr[447]),  .coef_in(coef[248]), .rdup_out(a4_wr[415]), .rdlo_out(a4_wr[447]));
			radix2 #(.width(width)) rd_st3_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[448]), .rdlo_in(a3_wr[480]),  .coef_in(coef[0]), .rdup_out(a4_wr[448]), .rdlo_out(a4_wr[480]));
			radix2 #(.width(width)) rd_st3_449  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[449]), .rdlo_in(a3_wr[481]),  .coef_in(coef[8]), .rdup_out(a4_wr[449]), .rdlo_out(a4_wr[481]));
			radix2 #(.width(width)) rd_st3_450  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[450]), .rdlo_in(a3_wr[482]),  .coef_in(coef[16]), .rdup_out(a4_wr[450]), .rdlo_out(a4_wr[482]));
			radix2 #(.width(width)) rd_st3_451  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[451]), .rdlo_in(a3_wr[483]),  .coef_in(coef[24]), .rdup_out(a4_wr[451]), .rdlo_out(a4_wr[483]));
			radix2 #(.width(width)) rd_st3_452  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[452]), .rdlo_in(a3_wr[484]),  .coef_in(coef[32]), .rdup_out(a4_wr[452]), .rdlo_out(a4_wr[484]));
			radix2 #(.width(width)) rd_st3_453  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[453]), .rdlo_in(a3_wr[485]),  .coef_in(coef[40]), .rdup_out(a4_wr[453]), .rdlo_out(a4_wr[485]));
			radix2 #(.width(width)) rd_st3_454  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[454]), .rdlo_in(a3_wr[486]),  .coef_in(coef[48]), .rdup_out(a4_wr[454]), .rdlo_out(a4_wr[486]));
			radix2 #(.width(width)) rd_st3_455  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[455]), .rdlo_in(a3_wr[487]),  .coef_in(coef[56]), .rdup_out(a4_wr[455]), .rdlo_out(a4_wr[487]));
			radix2 #(.width(width)) rd_st3_456  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[456]), .rdlo_in(a3_wr[488]),  .coef_in(coef[64]), .rdup_out(a4_wr[456]), .rdlo_out(a4_wr[488]));
			radix2 #(.width(width)) rd_st3_457  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[457]), .rdlo_in(a3_wr[489]),  .coef_in(coef[72]), .rdup_out(a4_wr[457]), .rdlo_out(a4_wr[489]));
			radix2 #(.width(width)) rd_st3_458  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[458]), .rdlo_in(a3_wr[490]),  .coef_in(coef[80]), .rdup_out(a4_wr[458]), .rdlo_out(a4_wr[490]));
			radix2 #(.width(width)) rd_st3_459  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[459]), .rdlo_in(a3_wr[491]),  .coef_in(coef[88]), .rdup_out(a4_wr[459]), .rdlo_out(a4_wr[491]));
			radix2 #(.width(width)) rd_st3_460  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[460]), .rdlo_in(a3_wr[492]),  .coef_in(coef[96]), .rdup_out(a4_wr[460]), .rdlo_out(a4_wr[492]));
			radix2 #(.width(width)) rd_st3_461  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[461]), .rdlo_in(a3_wr[493]),  .coef_in(coef[104]), .rdup_out(a4_wr[461]), .rdlo_out(a4_wr[493]));
			radix2 #(.width(width)) rd_st3_462  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[462]), .rdlo_in(a3_wr[494]),  .coef_in(coef[112]), .rdup_out(a4_wr[462]), .rdlo_out(a4_wr[494]));
			radix2 #(.width(width)) rd_st3_463  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[463]), .rdlo_in(a3_wr[495]),  .coef_in(coef[120]), .rdup_out(a4_wr[463]), .rdlo_out(a4_wr[495]));
			radix2 #(.width(width)) rd_st3_464  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[464]), .rdlo_in(a3_wr[496]),  .coef_in(coef[128]), .rdup_out(a4_wr[464]), .rdlo_out(a4_wr[496]));
			radix2 #(.width(width)) rd_st3_465  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[465]), .rdlo_in(a3_wr[497]),  .coef_in(coef[136]), .rdup_out(a4_wr[465]), .rdlo_out(a4_wr[497]));
			radix2 #(.width(width)) rd_st3_466  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[466]), .rdlo_in(a3_wr[498]),  .coef_in(coef[144]), .rdup_out(a4_wr[466]), .rdlo_out(a4_wr[498]));
			radix2 #(.width(width)) rd_st3_467  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[467]), .rdlo_in(a3_wr[499]),  .coef_in(coef[152]), .rdup_out(a4_wr[467]), .rdlo_out(a4_wr[499]));
			radix2 #(.width(width)) rd_st3_468  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[468]), .rdlo_in(a3_wr[500]),  .coef_in(coef[160]), .rdup_out(a4_wr[468]), .rdlo_out(a4_wr[500]));
			radix2 #(.width(width)) rd_st3_469  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[469]), .rdlo_in(a3_wr[501]),  .coef_in(coef[168]), .rdup_out(a4_wr[469]), .rdlo_out(a4_wr[501]));
			radix2 #(.width(width)) rd_st3_470  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[470]), .rdlo_in(a3_wr[502]),  .coef_in(coef[176]), .rdup_out(a4_wr[470]), .rdlo_out(a4_wr[502]));
			radix2 #(.width(width)) rd_st3_471  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[471]), .rdlo_in(a3_wr[503]),  .coef_in(coef[184]), .rdup_out(a4_wr[471]), .rdlo_out(a4_wr[503]));
			radix2 #(.width(width)) rd_st3_472  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[472]), .rdlo_in(a3_wr[504]),  .coef_in(coef[192]), .rdup_out(a4_wr[472]), .rdlo_out(a4_wr[504]));
			radix2 #(.width(width)) rd_st3_473  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[473]), .rdlo_in(a3_wr[505]),  .coef_in(coef[200]), .rdup_out(a4_wr[473]), .rdlo_out(a4_wr[505]));
			radix2 #(.width(width)) rd_st3_474  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[474]), .rdlo_in(a3_wr[506]),  .coef_in(coef[208]), .rdup_out(a4_wr[474]), .rdlo_out(a4_wr[506]));
			radix2 #(.width(width)) rd_st3_475  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[475]), .rdlo_in(a3_wr[507]),  .coef_in(coef[216]), .rdup_out(a4_wr[475]), .rdlo_out(a4_wr[507]));
			radix2 #(.width(width)) rd_st3_476  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[476]), .rdlo_in(a3_wr[508]),  .coef_in(coef[224]), .rdup_out(a4_wr[476]), .rdlo_out(a4_wr[508]));
			radix2 #(.width(width)) rd_st3_477  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[477]), .rdlo_in(a3_wr[509]),  .coef_in(coef[232]), .rdup_out(a4_wr[477]), .rdlo_out(a4_wr[509]));
			radix2 #(.width(width)) rd_st3_478  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[478]), .rdlo_in(a3_wr[510]),  .coef_in(coef[240]), .rdup_out(a4_wr[478]), .rdlo_out(a4_wr[510]));
			radix2 #(.width(width)) rd_st3_479  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a3_wr[479]), .rdlo_in(a3_wr[511]),  .coef_in(coef[248]), .rdup_out(a4_wr[479]), .rdlo_out(a4_wr[511]));

		//--- radix stage 4
			radix2 #(.width(width)) rd_st4_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[0]), .rdlo_in(a4_wr[16]),  .coef_in(coef[0]), .rdup_out(a5_wr[0]), .rdlo_out(a5_wr[16]));
			radix2 #(.width(width)) rd_st4_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[1]), .rdlo_in(a4_wr[17]),  .coef_in(coef[16]), .rdup_out(a5_wr[1]), .rdlo_out(a5_wr[17]));
			radix2 #(.width(width)) rd_st4_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[2]), .rdlo_in(a4_wr[18]),  .coef_in(coef[32]), .rdup_out(a5_wr[2]), .rdlo_out(a5_wr[18]));
			radix2 #(.width(width)) rd_st4_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[3]), .rdlo_in(a4_wr[19]),  .coef_in(coef[48]), .rdup_out(a5_wr[3]), .rdlo_out(a5_wr[19]));
			radix2 #(.width(width)) rd_st4_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[4]), .rdlo_in(a4_wr[20]),  .coef_in(coef[64]), .rdup_out(a5_wr[4]), .rdlo_out(a5_wr[20]));
			radix2 #(.width(width)) rd_st4_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[5]), .rdlo_in(a4_wr[21]),  .coef_in(coef[80]), .rdup_out(a5_wr[5]), .rdlo_out(a5_wr[21]));
			radix2 #(.width(width)) rd_st4_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[6]), .rdlo_in(a4_wr[22]),  .coef_in(coef[96]), .rdup_out(a5_wr[6]), .rdlo_out(a5_wr[22]));
			radix2 #(.width(width)) rd_st4_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[7]), .rdlo_in(a4_wr[23]),  .coef_in(coef[112]), .rdup_out(a5_wr[7]), .rdlo_out(a5_wr[23]));
			radix2 #(.width(width)) rd_st4_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[8]), .rdlo_in(a4_wr[24]),  .coef_in(coef[128]), .rdup_out(a5_wr[8]), .rdlo_out(a5_wr[24]));
			radix2 #(.width(width)) rd_st4_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[9]), .rdlo_in(a4_wr[25]),  .coef_in(coef[144]), .rdup_out(a5_wr[9]), .rdlo_out(a5_wr[25]));
			radix2 #(.width(width)) rd_st4_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[10]), .rdlo_in(a4_wr[26]),  .coef_in(coef[160]), .rdup_out(a5_wr[10]), .rdlo_out(a5_wr[26]));
			radix2 #(.width(width)) rd_st4_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[11]), .rdlo_in(a4_wr[27]),  .coef_in(coef[176]), .rdup_out(a5_wr[11]), .rdlo_out(a5_wr[27]));
			radix2 #(.width(width)) rd_st4_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[12]), .rdlo_in(a4_wr[28]),  .coef_in(coef[192]), .rdup_out(a5_wr[12]), .rdlo_out(a5_wr[28]));
			radix2 #(.width(width)) rd_st4_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[13]), .rdlo_in(a4_wr[29]),  .coef_in(coef[208]), .rdup_out(a5_wr[13]), .rdlo_out(a5_wr[29]));
			radix2 #(.width(width)) rd_st4_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[14]), .rdlo_in(a4_wr[30]),  .coef_in(coef[224]), .rdup_out(a5_wr[14]), .rdlo_out(a5_wr[30]));
			radix2 #(.width(width)) rd_st4_15  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[15]), .rdlo_in(a4_wr[31]),  .coef_in(coef[240]), .rdup_out(a5_wr[15]), .rdlo_out(a5_wr[31]));
			radix2 #(.width(width)) rd_st4_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[32]), .rdlo_in(a4_wr[48]),  .coef_in(coef[0]), .rdup_out(a5_wr[32]), .rdlo_out(a5_wr[48]));
			radix2 #(.width(width)) rd_st4_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[33]), .rdlo_in(a4_wr[49]),  .coef_in(coef[16]), .rdup_out(a5_wr[33]), .rdlo_out(a5_wr[49]));
			radix2 #(.width(width)) rd_st4_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[34]), .rdlo_in(a4_wr[50]),  .coef_in(coef[32]), .rdup_out(a5_wr[34]), .rdlo_out(a5_wr[50]));
			radix2 #(.width(width)) rd_st4_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[35]), .rdlo_in(a4_wr[51]),  .coef_in(coef[48]), .rdup_out(a5_wr[35]), .rdlo_out(a5_wr[51]));
			radix2 #(.width(width)) rd_st4_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[36]), .rdlo_in(a4_wr[52]),  .coef_in(coef[64]), .rdup_out(a5_wr[36]), .rdlo_out(a5_wr[52]));
			radix2 #(.width(width)) rd_st4_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[37]), .rdlo_in(a4_wr[53]),  .coef_in(coef[80]), .rdup_out(a5_wr[37]), .rdlo_out(a5_wr[53]));
			radix2 #(.width(width)) rd_st4_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[38]), .rdlo_in(a4_wr[54]),  .coef_in(coef[96]), .rdup_out(a5_wr[38]), .rdlo_out(a5_wr[54]));
			radix2 #(.width(width)) rd_st4_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[39]), .rdlo_in(a4_wr[55]),  .coef_in(coef[112]), .rdup_out(a5_wr[39]), .rdlo_out(a5_wr[55]));
			radix2 #(.width(width)) rd_st4_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[40]), .rdlo_in(a4_wr[56]),  .coef_in(coef[128]), .rdup_out(a5_wr[40]), .rdlo_out(a5_wr[56]));
			radix2 #(.width(width)) rd_st4_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[41]), .rdlo_in(a4_wr[57]),  .coef_in(coef[144]), .rdup_out(a5_wr[41]), .rdlo_out(a5_wr[57]));
			radix2 #(.width(width)) rd_st4_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[42]), .rdlo_in(a4_wr[58]),  .coef_in(coef[160]), .rdup_out(a5_wr[42]), .rdlo_out(a5_wr[58]));
			radix2 #(.width(width)) rd_st4_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[43]), .rdlo_in(a4_wr[59]),  .coef_in(coef[176]), .rdup_out(a5_wr[43]), .rdlo_out(a5_wr[59]));
			radix2 #(.width(width)) rd_st4_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[44]), .rdlo_in(a4_wr[60]),  .coef_in(coef[192]), .rdup_out(a5_wr[44]), .rdlo_out(a5_wr[60]));
			radix2 #(.width(width)) rd_st4_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[45]), .rdlo_in(a4_wr[61]),  .coef_in(coef[208]), .rdup_out(a5_wr[45]), .rdlo_out(a5_wr[61]));
			radix2 #(.width(width)) rd_st4_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[46]), .rdlo_in(a4_wr[62]),  .coef_in(coef[224]), .rdup_out(a5_wr[46]), .rdlo_out(a5_wr[62]));
			radix2 #(.width(width)) rd_st4_47  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[47]), .rdlo_in(a4_wr[63]),  .coef_in(coef[240]), .rdup_out(a5_wr[47]), .rdlo_out(a5_wr[63]));
			radix2 #(.width(width)) rd_st4_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[64]), .rdlo_in(a4_wr[80]),  .coef_in(coef[0]), .rdup_out(a5_wr[64]), .rdlo_out(a5_wr[80]));
			radix2 #(.width(width)) rd_st4_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[65]), .rdlo_in(a4_wr[81]),  .coef_in(coef[16]), .rdup_out(a5_wr[65]), .rdlo_out(a5_wr[81]));
			radix2 #(.width(width)) rd_st4_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[66]), .rdlo_in(a4_wr[82]),  .coef_in(coef[32]), .rdup_out(a5_wr[66]), .rdlo_out(a5_wr[82]));
			radix2 #(.width(width)) rd_st4_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[67]), .rdlo_in(a4_wr[83]),  .coef_in(coef[48]), .rdup_out(a5_wr[67]), .rdlo_out(a5_wr[83]));
			radix2 #(.width(width)) rd_st4_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[68]), .rdlo_in(a4_wr[84]),  .coef_in(coef[64]), .rdup_out(a5_wr[68]), .rdlo_out(a5_wr[84]));
			radix2 #(.width(width)) rd_st4_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[69]), .rdlo_in(a4_wr[85]),  .coef_in(coef[80]), .rdup_out(a5_wr[69]), .rdlo_out(a5_wr[85]));
			radix2 #(.width(width)) rd_st4_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[70]), .rdlo_in(a4_wr[86]),  .coef_in(coef[96]), .rdup_out(a5_wr[70]), .rdlo_out(a5_wr[86]));
			radix2 #(.width(width)) rd_st4_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[71]), .rdlo_in(a4_wr[87]),  .coef_in(coef[112]), .rdup_out(a5_wr[71]), .rdlo_out(a5_wr[87]));
			radix2 #(.width(width)) rd_st4_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[72]), .rdlo_in(a4_wr[88]),  .coef_in(coef[128]), .rdup_out(a5_wr[72]), .rdlo_out(a5_wr[88]));
			radix2 #(.width(width)) rd_st4_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[73]), .rdlo_in(a4_wr[89]),  .coef_in(coef[144]), .rdup_out(a5_wr[73]), .rdlo_out(a5_wr[89]));
			radix2 #(.width(width)) rd_st4_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[74]), .rdlo_in(a4_wr[90]),  .coef_in(coef[160]), .rdup_out(a5_wr[74]), .rdlo_out(a5_wr[90]));
			radix2 #(.width(width)) rd_st4_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[75]), .rdlo_in(a4_wr[91]),  .coef_in(coef[176]), .rdup_out(a5_wr[75]), .rdlo_out(a5_wr[91]));
			radix2 #(.width(width)) rd_st4_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[76]), .rdlo_in(a4_wr[92]),  .coef_in(coef[192]), .rdup_out(a5_wr[76]), .rdlo_out(a5_wr[92]));
			radix2 #(.width(width)) rd_st4_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[77]), .rdlo_in(a4_wr[93]),  .coef_in(coef[208]), .rdup_out(a5_wr[77]), .rdlo_out(a5_wr[93]));
			radix2 #(.width(width)) rd_st4_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[78]), .rdlo_in(a4_wr[94]),  .coef_in(coef[224]), .rdup_out(a5_wr[78]), .rdlo_out(a5_wr[94]));
			radix2 #(.width(width)) rd_st4_79  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[79]), .rdlo_in(a4_wr[95]),  .coef_in(coef[240]), .rdup_out(a5_wr[79]), .rdlo_out(a5_wr[95]));
			radix2 #(.width(width)) rd_st4_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[96]), .rdlo_in(a4_wr[112]),  .coef_in(coef[0]), .rdup_out(a5_wr[96]), .rdlo_out(a5_wr[112]));
			radix2 #(.width(width)) rd_st4_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[97]), .rdlo_in(a4_wr[113]),  .coef_in(coef[16]), .rdup_out(a5_wr[97]), .rdlo_out(a5_wr[113]));
			radix2 #(.width(width)) rd_st4_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[98]), .rdlo_in(a4_wr[114]),  .coef_in(coef[32]), .rdup_out(a5_wr[98]), .rdlo_out(a5_wr[114]));
			radix2 #(.width(width)) rd_st4_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[99]), .rdlo_in(a4_wr[115]),  .coef_in(coef[48]), .rdup_out(a5_wr[99]), .rdlo_out(a5_wr[115]));
			radix2 #(.width(width)) rd_st4_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[100]), .rdlo_in(a4_wr[116]),  .coef_in(coef[64]), .rdup_out(a5_wr[100]), .rdlo_out(a5_wr[116]));
			radix2 #(.width(width)) rd_st4_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[101]), .rdlo_in(a4_wr[117]),  .coef_in(coef[80]), .rdup_out(a5_wr[101]), .rdlo_out(a5_wr[117]));
			radix2 #(.width(width)) rd_st4_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[102]), .rdlo_in(a4_wr[118]),  .coef_in(coef[96]), .rdup_out(a5_wr[102]), .rdlo_out(a5_wr[118]));
			radix2 #(.width(width)) rd_st4_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[103]), .rdlo_in(a4_wr[119]),  .coef_in(coef[112]), .rdup_out(a5_wr[103]), .rdlo_out(a5_wr[119]));
			radix2 #(.width(width)) rd_st4_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[104]), .rdlo_in(a4_wr[120]),  .coef_in(coef[128]), .rdup_out(a5_wr[104]), .rdlo_out(a5_wr[120]));
			radix2 #(.width(width)) rd_st4_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[105]), .rdlo_in(a4_wr[121]),  .coef_in(coef[144]), .rdup_out(a5_wr[105]), .rdlo_out(a5_wr[121]));
			radix2 #(.width(width)) rd_st4_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[106]), .rdlo_in(a4_wr[122]),  .coef_in(coef[160]), .rdup_out(a5_wr[106]), .rdlo_out(a5_wr[122]));
			radix2 #(.width(width)) rd_st4_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[107]), .rdlo_in(a4_wr[123]),  .coef_in(coef[176]), .rdup_out(a5_wr[107]), .rdlo_out(a5_wr[123]));
			radix2 #(.width(width)) rd_st4_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[108]), .rdlo_in(a4_wr[124]),  .coef_in(coef[192]), .rdup_out(a5_wr[108]), .rdlo_out(a5_wr[124]));
			radix2 #(.width(width)) rd_st4_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[109]), .rdlo_in(a4_wr[125]),  .coef_in(coef[208]), .rdup_out(a5_wr[109]), .rdlo_out(a5_wr[125]));
			radix2 #(.width(width)) rd_st4_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[110]), .rdlo_in(a4_wr[126]),  .coef_in(coef[224]), .rdup_out(a5_wr[110]), .rdlo_out(a5_wr[126]));
			radix2 #(.width(width)) rd_st4_111  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[111]), .rdlo_in(a4_wr[127]),  .coef_in(coef[240]), .rdup_out(a5_wr[111]), .rdlo_out(a5_wr[127]));
			radix2 #(.width(width)) rd_st4_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[128]), .rdlo_in(a4_wr[144]),  .coef_in(coef[0]), .rdup_out(a5_wr[128]), .rdlo_out(a5_wr[144]));
			radix2 #(.width(width)) rd_st4_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[129]), .rdlo_in(a4_wr[145]),  .coef_in(coef[16]), .rdup_out(a5_wr[129]), .rdlo_out(a5_wr[145]));
			radix2 #(.width(width)) rd_st4_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[130]), .rdlo_in(a4_wr[146]),  .coef_in(coef[32]), .rdup_out(a5_wr[130]), .rdlo_out(a5_wr[146]));
			radix2 #(.width(width)) rd_st4_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[131]), .rdlo_in(a4_wr[147]),  .coef_in(coef[48]), .rdup_out(a5_wr[131]), .rdlo_out(a5_wr[147]));
			radix2 #(.width(width)) rd_st4_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[132]), .rdlo_in(a4_wr[148]),  .coef_in(coef[64]), .rdup_out(a5_wr[132]), .rdlo_out(a5_wr[148]));
			radix2 #(.width(width)) rd_st4_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[133]), .rdlo_in(a4_wr[149]),  .coef_in(coef[80]), .rdup_out(a5_wr[133]), .rdlo_out(a5_wr[149]));
			radix2 #(.width(width)) rd_st4_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[134]), .rdlo_in(a4_wr[150]),  .coef_in(coef[96]), .rdup_out(a5_wr[134]), .rdlo_out(a5_wr[150]));
			radix2 #(.width(width)) rd_st4_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[135]), .rdlo_in(a4_wr[151]),  .coef_in(coef[112]), .rdup_out(a5_wr[135]), .rdlo_out(a5_wr[151]));
			radix2 #(.width(width)) rd_st4_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[136]), .rdlo_in(a4_wr[152]),  .coef_in(coef[128]), .rdup_out(a5_wr[136]), .rdlo_out(a5_wr[152]));
			radix2 #(.width(width)) rd_st4_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[137]), .rdlo_in(a4_wr[153]),  .coef_in(coef[144]), .rdup_out(a5_wr[137]), .rdlo_out(a5_wr[153]));
			radix2 #(.width(width)) rd_st4_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[138]), .rdlo_in(a4_wr[154]),  .coef_in(coef[160]), .rdup_out(a5_wr[138]), .rdlo_out(a5_wr[154]));
			radix2 #(.width(width)) rd_st4_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[139]), .rdlo_in(a4_wr[155]),  .coef_in(coef[176]), .rdup_out(a5_wr[139]), .rdlo_out(a5_wr[155]));
			radix2 #(.width(width)) rd_st4_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[140]), .rdlo_in(a4_wr[156]),  .coef_in(coef[192]), .rdup_out(a5_wr[140]), .rdlo_out(a5_wr[156]));
			radix2 #(.width(width)) rd_st4_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[141]), .rdlo_in(a4_wr[157]),  .coef_in(coef[208]), .rdup_out(a5_wr[141]), .rdlo_out(a5_wr[157]));
			radix2 #(.width(width)) rd_st4_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[142]), .rdlo_in(a4_wr[158]),  .coef_in(coef[224]), .rdup_out(a5_wr[142]), .rdlo_out(a5_wr[158]));
			radix2 #(.width(width)) rd_st4_143  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[143]), .rdlo_in(a4_wr[159]),  .coef_in(coef[240]), .rdup_out(a5_wr[143]), .rdlo_out(a5_wr[159]));
			radix2 #(.width(width)) rd_st4_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[160]), .rdlo_in(a4_wr[176]),  .coef_in(coef[0]), .rdup_out(a5_wr[160]), .rdlo_out(a5_wr[176]));
			radix2 #(.width(width)) rd_st4_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[161]), .rdlo_in(a4_wr[177]),  .coef_in(coef[16]), .rdup_out(a5_wr[161]), .rdlo_out(a5_wr[177]));
			radix2 #(.width(width)) rd_st4_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[162]), .rdlo_in(a4_wr[178]),  .coef_in(coef[32]), .rdup_out(a5_wr[162]), .rdlo_out(a5_wr[178]));
			radix2 #(.width(width)) rd_st4_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[163]), .rdlo_in(a4_wr[179]),  .coef_in(coef[48]), .rdup_out(a5_wr[163]), .rdlo_out(a5_wr[179]));
			radix2 #(.width(width)) rd_st4_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[164]), .rdlo_in(a4_wr[180]),  .coef_in(coef[64]), .rdup_out(a5_wr[164]), .rdlo_out(a5_wr[180]));
			radix2 #(.width(width)) rd_st4_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[165]), .rdlo_in(a4_wr[181]),  .coef_in(coef[80]), .rdup_out(a5_wr[165]), .rdlo_out(a5_wr[181]));
			radix2 #(.width(width)) rd_st4_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[166]), .rdlo_in(a4_wr[182]),  .coef_in(coef[96]), .rdup_out(a5_wr[166]), .rdlo_out(a5_wr[182]));
			radix2 #(.width(width)) rd_st4_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[167]), .rdlo_in(a4_wr[183]),  .coef_in(coef[112]), .rdup_out(a5_wr[167]), .rdlo_out(a5_wr[183]));
			radix2 #(.width(width)) rd_st4_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[168]), .rdlo_in(a4_wr[184]),  .coef_in(coef[128]), .rdup_out(a5_wr[168]), .rdlo_out(a5_wr[184]));
			radix2 #(.width(width)) rd_st4_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[169]), .rdlo_in(a4_wr[185]),  .coef_in(coef[144]), .rdup_out(a5_wr[169]), .rdlo_out(a5_wr[185]));
			radix2 #(.width(width)) rd_st4_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[170]), .rdlo_in(a4_wr[186]),  .coef_in(coef[160]), .rdup_out(a5_wr[170]), .rdlo_out(a5_wr[186]));
			radix2 #(.width(width)) rd_st4_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[171]), .rdlo_in(a4_wr[187]),  .coef_in(coef[176]), .rdup_out(a5_wr[171]), .rdlo_out(a5_wr[187]));
			radix2 #(.width(width)) rd_st4_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[172]), .rdlo_in(a4_wr[188]),  .coef_in(coef[192]), .rdup_out(a5_wr[172]), .rdlo_out(a5_wr[188]));
			radix2 #(.width(width)) rd_st4_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[173]), .rdlo_in(a4_wr[189]),  .coef_in(coef[208]), .rdup_out(a5_wr[173]), .rdlo_out(a5_wr[189]));
			radix2 #(.width(width)) rd_st4_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[174]), .rdlo_in(a4_wr[190]),  .coef_in(coef[224]), .rdup_out(a5_wr[174]), .rdlo_out(a5_wr[190]));
			radix2 #(.width(width)) rd_st4_175  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[175]), .rdlo_in(a4_wr[191]),  .coef_in(coef[240]), .rdup_out(a5_wr[175]), .rdlo_out(a5_wr[191]));
			radix2 #(.width(width)) rd_st4_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[192]), .rdlo_in(a4_wr[208]),  .coef_in(coef[0]), .rdup_out(a5_wr[192]), .rdlo_out(a5_wr[208]));
			radix2 #(.width(width)) rd_st4_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[193]), .rdlo_in(a4_wr[209]),  .coef_in(coef[16]), .rdup_out(a5_wr[193]), .rdlo_out(a5_wr[209]));
			radix2 #(.width(width)) rd_st4_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[194]), .rdlo_in(a4_wr[210]),  .coef_in(coef[32]), .rdup_out(a5_wr[194]), .rdlo_out(a5_wr[210]));
			radix2 #(.width(width)) rd_st4_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[195]), .rdlo_in(a4_wr[211]),  .coef_in(coef[48]), .rdup_out(a5_wr[195]), .rdlo_out(a5_wr[211]));
			radix2 #(.width(width)) rd_st4_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[196]), .rdlo_in(a4_wr[212]),  .coef_in(coef[64]), .rdup_out(a5_wr[196]), .rdlo_out(a5_wr[212]));
			radix2 #(.width(width)) rd_st4_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[197]), .rdlo_in(a4_wr[213]),  .coef_in(coef[80]), .rdup_out(a5_wr[197]), .rdlo_out(a5_wr[213]));
			radix2 #(.width(width)) rd_st4_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[198]), .rdlo_in(a4_wr[214]),  .coef_in(coef[96]), .rdup_out(a5_wr[198]), .rdlo_out(a5_wr[214]));
			radix2 #(.width(width)) rd_st4_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[199]), .rdlo_in(a4_wr[215]),  .coef_in(coef[112]), .rdup_out(a5_wr[199]), .rdlo_out(a5_wr[215]));
			radix2 #(.width(width)) rd_st4_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[200]), .rdlo_in(a4_wr[216]),  .coef_in(coef[128]), .rdup_out(a5_wr[200]), .rdlo_out(a5_wr[216]));
			radix2 #(.width(width)) rd_st4_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[201]), .rdlo_in(a4_wr[217]),  .coef_in(coef[144]), .rdup_out(a5_wr[201]), .rdlo_out(a5_wr[217]));
			radix2 #(.width(width)) rd_st4_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[202]), .rdlo_in(a4_wr[218]),  .coef_in(coef[160]), .rdup_out(a5_wr[202]), .rdlo_out(a5_wr[218]));
			radix2 #(.width(width)) rd_st4_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[203]), .rdlo_in(a4_wr[219]),  .coef_in(coef[176]), .rdup_out(a5_wr[203]), .rdlo_out(a5_wr[219]));
			radix2 #(.width(width)) rd_st4_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[204]), .rdlo_in(a4_wr[220]),  .coef_in(coef[192]), .rdup_out(a5_wr[204]), .rdlo_out(a5_wr[220]));
			radix2 #(.width(width)) rd_st4_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[205]), .rdlo_in(a4_wr[221]),  .coef_in(coef[208]), .rdup_out(a5_wr[205]), .rdlo_out(a5_wr[221]));
			radix2 #(.width(width)) rd_st4_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[206]), .rdlo_in(a4_wr[222]),  .coef_in(coef[224]), .rdup_out(a5_wr[206]), .rdlo_out(a5_wr[222]));
			radix2 #(.width(width)) rd_st4_207  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[207]), .rdlo_in(a4_wr[223]),  .coef_in(coef[240]), .rdup_out(a5_wr[207]), .rdlo_out(a5_wr[223]));
			radix2 #(.width(width)) rd_st4_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[224]), .rdlo_in(a4_wr[240]),  .coef_in(coef[0]), .rdup_out(a5_wr[224]), .rdlo_out(a5_wr[240]));
			radix2 #(.width(width)) rd_st4_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[225]), .rdlo_in(a4_wr[241]),  .coef_in(coef[16]), .rdup_out(a5_wr[225]), .rdlo_out(a5_wr[241]));
			radix2 #(.width(width)) rd_st4_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[226]), .rdlo_in(a4_wr[242]),  .coef_in(coef[32]), .rdup_out(a5_wr[226]), .rdlo_out(a5_wr[242]));
			radix2 #(.width(width)) rd_st4_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[227]), .rdlo_in(a4_wr[243]),  .coef_in(coef[48]), .rdup_out(a5_wr[227]), .rdlo_out(a5_wr[243]));
			radix2 #(.width(width)) rd_st4_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[228]), .rdlo_in(a4_wr[244]),  .coef_in(coef[64]), .rdup_out(a5_wr[228]), .rdlo_out(a5_wr[244]));
			radix2 #(.width(width)) rd_st4_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[229]), .rdlo_in(a4_wr[245]),  .coef_in(coef[80]), .rdup_out(a5_wr[229]), .rdlo_out(a5_wr[245]));
			radix2 #(.width(width)) rd_st4_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[230]), .rdlo_in(a4_wr[246]),  .coef_in(coef[96]), .rdup_out(a5_wr[230]), .rdlo_out(a5_wr[246]));
			radix2 #(.width(width)) rd_st4_231  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[231]), .rdlo_in(a4_wr[247]),  .coef_in(coef[112]), .rdup_out(a5_wr[231]), .rdlo_out(a5_wr[247]));
			radix2 #(.width(width)) rd_st4_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[232]), .rdlo_in(a4_wr[248]),  .coef_in(coef[128]), .rdup_out(a5_wr[232]), .rdlo_out(a5_wr[248]));
			radix2 #(.width(width)) rd_st4_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[233]), .rdlo_in(a4_wr[249]),  .coef_in(coef[144]), .rdup_out(a5_wr[233]), .rdlo_out(a5_wr[249]));
			radix2 #(.width(width)) rd_st4_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[234]), .rdlo_in(a4_wr[250]),  .coef_in(coef[160]), .rdup_out(a5_wr[234]), .rdlo_out(a5_wr[250]));
			radix2 #(.width(width)) rd_st4_235  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[235]), .rdlo_in(a4_wr[251]),  .coef_in(coef[176]), .rdup_out(a5_wr[235]), .rdlo_out(a5_wr[251]));
			radix2 #(.width(width)) rd_st4_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[236]), .rdlo_in(a4_wr[252]),  .coef_in(coef[192]), .rdup_out(a5_wr[236]), .rdlo_out(a5_wr[252]));
			radix2 #(.width(width)) rd_st4_237  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[237]), .rdlo_in(a4_wr[253]),  .coef_in(coef[208]), .rdup_out(a5_wr[237]), .rdlo_out(a5_wr[253]));
			radix2 #(.width(width)) rd_st4_238  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[238]), .rdlo_in(a4_wr[254]),  .coef_in(coef[224]), .rdup_out(a5_wr[238]), .rdlo_out(a5_wr[254]));
			radix2 #(.width(width)) rd_st4_239  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[239]), .rdlo_in(a4_wr[255]),  .coef_in(coef[240]), .rdup_out(a5_wr[239]), .rdlo_out(a5_wr[255]));
			radix2 #(.width(width)) rd_st4_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[256]), .rdlo_in(a4_wr[272]),  .coef_in(coef[0]), .rdup_out(a5_wr[256]), .rdlo_out(a5_wr[272]));
			radix2 #(.width(width)) rd_st4_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[257]), .rdlo_in(a4_wr[273]),  .coef_in(coef[16]), .rdup_out(a5_wr[257]), .rdlo_out(a5_wr[273]));
			radix2 #(.width(width)) rd_st4_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[258]), .rdlo_in(a4_wr[274]),  .coef_in(coef[32]), .rdup_out(a5_wr[258]), .rdlo_out(a5_wr[274]));
			radix2 #(.width(width)) rd_st4_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[259]), .rdlo_in(a4_wr[275]),  .coef_in(coef[48]), .rdup_out(a5_wr[259]), .rdlo_out(a5_wr[275]));
			radix2 #(.width(width)) rd_st4_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[260]), .rdlo_in(a4_wr[276]),  .coef_in(coef[64]), .rdup_out(a5_wr[260]), .rdlo_out(a5_wr[276]));
			radix2 #(.width(width)) rd_st4_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[261]), .rdlo_in(a4_wr[277]),  .coef_in(coef[80]), .rdup_out(a5_wr[261]), .rdlo_out(a5_wr[277]));
			radix2 #(.width(width)) rd_st4_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[262]), .rdlo_in(a4_wr[278]),  .coef_in(coef[96]), .rdup_out(a5_wr[262]), .rdlo_out(a5_wr[278]));
			radix2 #(.width(width)) rd_st4_263  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[263]), .rdlo_in(a4_wr[279]),  .coef_in(coef[112]), .rdup_out(a5_wr[263]), .rdlo_out(a5_wr[279]));
			radix2 #(.width(width)) rd_st4_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[264]), .rdlo_in(a4_wr[280]),  .coef_in(coef[128]), .rdup_out(a5_wr[264]), .rdlo_out(a5_wr[280]));
			radix2 #(.width(width)) rd_st4_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[265]), .rdlo_in(a4_wr[281]),  .coef_in(coef[144]), .rdup_out(a5_wr[265]), .rdlo_out(a5_wr[281]));
			radix2 #(.width(width)) rd_st4_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[266]), .rdlo_in(a4_wr[282]),  .coef_in(coef[160]), .rdup_out(a5_wr[266]), .rdlo_out(a5_wr[282]));
			radix2 #(.width(width)) rd_st4_267  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[267]), .rdlo_in(a4_wr[283]),  .coef_in(coef[176]), .rdup_out(a5_wr[267]), .rdlo_out(a5_wr[283]));
			radix2 #(.width(width)) rd_st4_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[268]), .rdlo_in(a4_wr[284]),  .coef_in(coef[192]), .rdup_out(a5_wr[268]), .rdlo_out(a5_wr[284]));
			radix2 #(.width(width)) rd_st4_269  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[269]), .rdlo_in(a4_wr[285]),  .coef_in(coef[208]), .rdup_out(a5_wr[269]), .rdlo_out(a5_wr[285]));
			radix2 #(.width(width)) rd_st4_270  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[270]), .rdlo_in(a4_wr[286]),  .coef_in(coef[224]), .rdup_out(a5_wr[270]), .rdlo_out(a5_wr[286]));
			radix2 #(.width(width)) rd_st4_271  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[271]), .rdlo_in(a4_wr[287]),  .coef_in(coef[240]), .rdup_out(a5_wr[271]), .rdlo_out(a5_wr[287]));
			radix2 #(.width(width)) rd_st4_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[288]), .rdlo_in(a4_wr[304]),  .coef_in(coef[0]), .rdup_out(a5_wr[288]), .rdlo_out(a5_wr[304]));
			radix2 #(.width(width)) rd_st4_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[289]), .rdlo_in(a4_wr[305]),  .coef_in(coef[16]), .rdup_out(a5_wr[289]), .rdlo_out(a5_wr[305]));
			radix2 #(.width(width)) rd_st4_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[290]), .rdlo_in(a4_wr[306]),  .coef_in(coef[32]), .rdup_out(a5_wr[290]), .rdlo_out(a5_wr[306]));
			radix2 #(.width(width)) rd_st4_291  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[291]), .rdlo_in(a4_wr[307]),  .coef_in(coef[48]), .rdup_out(a5_wr[291]), .rdlo_out(a5_wr[307]));
			radix2 #(.width(width)) rd_st4_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[292]), .rdlo_in(a4_wr[308]),  .coef_in(coef[64]), .rdup_out(a5_wr[292]), .rdlo_out(a5_wr[308]));
			radix2 #(.width(width)) rd_st4_293  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[293]), .rdlo_in(a4_wr[309]),  .coef_in(coef[80]), .rdup_out(a5_wr[293]), .rdlo_out(a5_wr[309]));
			radix2 #(.width(width)) rd_st4_294  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[294]), .rdlo_in(a4_wr[310]),  .coef_in(coef[96]), .rdup_out(a5_wr[294]), .rdlo_out(a5_wr[310]));
			radix2 #(.width(width)) rd_st4_295  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[295]), .rdlo_in(a4_wr[311]),  .coef_in(coef[112]), .rdup_out(a5_wr[295]), .rdlo_out(a5_wr[311]));
			radix2 #(.width(width)) rd_st4_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[296]), .rdlo_in(a4_wr[312]),  .coef_in(coef[128]), .rdup_out(a5_wr[296]), .rdlo_out(a5_wr[312]));
			radix2 #(.width(width)) rd_st4_297  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[297]), .rdlo_in(a4_wr[313]),  .coef_in(coef[144]), .rdup_out(a5_wr[297]), .rdlo_out(a5_wr[313]));
			radix2 #(.width(width)) rd_st4_298  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[298]), .rdlo_in(a4_wr[314]),  .coef_in(coef[160]), .rdup_out(a5_wr[298]), .rdlo_out(a5_wr[314]));
			radix2 #(.width(width)) rd_st4_299  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[299]), .rdlo_in(a4_wr[315]),  .coef_in(coef[176]), .rdup_out(a5_wr[299]), .rdlo_out(a5_wr[315]));
			radix2 #(.width(width)) rd_st4_300  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[300]), .rdlo_in(a4_wr[316]),  .coef_in(coef[192]), .rdup_out(a5_wr[300]), .rdlo_out(a5_wr[316]));
			radix2 #(.width(width)) rd_st4_301  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[301]), .rdlo_in(a4_wr[317]),  .coef_in(coef[208]), .rdup_out(a5_wr[301]), .rdlo_out(a5_wr[317]));
			radix2 #(.width(width)) rd_st4_302  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[302]), .rdlo_in(a4_wr[318]),  .coef_in(coef[224]), .rdup_out(a5_wr[302]), .rdlo_out(a5_wr[318]));
			radix2 #(.width(width)) rd_st4_303  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[303]), .rdlo_in(a4_wr[319]),  .coef_in(coef[240]), .rdup_out(a5_wr[303]), .rdlo_out(a5_wr[319]));
			radix2 #(.width(width)) rd_st4_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[320]), .rdlo_in(a4_wr[336]),  .coef_in(coef[0]), .rdup_out(a5_wr[320]), .rdlo_out(a5_wr[336]));
			radix2 #(.width(width)) rd_st4_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[321]), .rdlo_in(a4_wr[337]),  .coef_in(coef[16]), .rdup_out(a5_wr[321]), .rdlo_out(a5_wr[337]));
			radix2 #(.width(width)) rd_st4_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[322]), .rdlo_in(a4_wr[338]),  .coef_in(coef[32]), .rdup_out(a5_wr[322]), .rdlo_out(a5_wr[338]));
			radix2 #(.width(width)) rd_st4_323  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[323]), .rdlo_in(a4_wr[339]),  .coef_in(coef[48]), .rdup_out(a5_wr[323]), .rdlo_out(a5_wr[339]));
			radix2 #(.width(width)) rd_st4_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[324]), .rdlo_in(a4_wr[340]),  .coef_in(coef[64]), .rdup_out(a5_wr[324]), .rdlo_out(a5_wr[340]));
			radix2 #(.width(width)) rd_st4_325  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[325]), .rdlo_in(a4_wr[341]),  .coef_in(coef[80]), .rdup_out(a5_wr[325]), .rdlo_out(a5_wr[341]));
			radix2 #(.width(width)) rd_st4_326  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[326]), .rdlo_in(a4_wr[342]),  .coef_in(coef[96]), .rdup_out(a5_wr[326]), .rdlo_out(a5_wr[342]));
			radix2 #(.width(width)) rd_st4_327  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[327]), .rdlo_in(a4_wr[343]),  .coef_in(coef[112]), .rdup_out(a5_wr[327]), .rdlo_out(a5_wr[343]));
			radix2 #(.width(width)) rd_st4_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[328]), .rdlo_in(a4_wr[344]),  .coef_in(coef[128]), .rdup_out(a5_wr[328]), .rdlo_out(a5_wr[344]));
			radix2 #(.width(width)) rd_st4_329  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[329]), .rdlo_in(a4_wr[345]),  .coef_in(coef[144]), .rdup_out(a5_wr[329]), .rdlo_out(a5_wr[345]));
			radix2 #(.width(width)) rd_st4_330  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[330]), .rdlo_in(a4_wr[346]),  .coef_in(coef[160]), .rdup_out(a5_wr[330]), .rdlo_out(a5_wr[346]));
			radix2 #(.width(width)) rd_st4_331  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[331]), .rdlo_in(a4_wr[347]),  .coef_in(coef[176]), .rdup_out(a5_wr[331]), .rdlo_out(a5_wr[347]));
			radix2 #(.width(width)) rd_st4_332  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[332]), .rdlo_in(a4_wr[348]),  .coef_in(coef[192]), .rdup_out(a5_wr[332]), .rdlo_out(a5_wr[348]));
			radix2 #(.width(width)) rd_st4_333  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[333]), .rdlo_in(a4_wr[349]),  .coef_in(coef[208]), .rdup_out(a5_wr[333]), .rdlo_out(a5_wr[349]));
			radix2 #(.width(width)) rd_st4_334  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[334]), .rdlo_in(a4_wr[350]),  .coef_in(coef[224]), .rdup_out(a5_wr[334]), .rdlo_out(a5_wr[350]));
			radix2 #(.width(width)) rd_st4_335  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[335]), .rdlo_in(a4_wr[351]),  .coef_in(coef[240]), .rdup_out(a5_wr[335]), .rdlo_out(a5_wr[351]));
			radix2 #(.width(width)) rd_st4_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[352]), .rdlo_in(a4_wr[368]),  .coef_in(coef[0]), .rdup_out(a5_wr[352]), .rdlo_out(a5_wr[368]));
			radix2 #(.width(width)) rd_st4_353  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[353]), .rdlo_in(a4_wr[369]),  .coef_in(coef[16]), .rdup_out(a5_wr[353]), .rdlo_out(a5_wr[369]));
			radix2 #(.width(width)) rd_st4_354  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[354]), .rdlo_in(a4_wr[370]),  .coef_in(coef[32]), .rdup_out(a5_wr[354]), .rdlo_out(a5_wr[370]));
			radix2 #(.width(width)) rd_st4_355  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[355]), .rdlo_in(a4_wr[371]),  .coef_in(coef[48]), .rdup_out(a5_wr[355]), .rdlo_out(a5_wr[371]));
			radix2 #(.width(width)) rd_st4_356  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[356]), .rdlo_in(a4_wr[372]),  .coef_in(coef[64]), .rdup_out(a5_wr[356]), .rdlo_out(a5_wr[372]));
			radix2 #(.width(width)) rd_st4_357  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[357]), .rdlo_in(a4_wr[373]),  .coef_in(coef[80]), .rdup_out(a5_wr[357]), .rdlo_out(a5_wr[373]));
			radix2 #(.width(width)) rd_st4_358  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[358]), .rdlo_in(a4_wr[374]),  .coef_in(coef[96]), .rdup_out(a5_wr[358]), .rdlo_out(a5_wr[374]));
			radix2 #(.width(width)) rd_st4_359  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[359]), .rdlo_in(a4_wr[375]),  .coef_in(coef[112]), .rdup_out(a5_wr[359]), .rdlo_out(a5_wr[375]));
			radix2 #(.width(width)) rd_st4_360  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[360]), .rdlo_in(a4_wr[376]),  .coef_in(coef[128]), .rdup_out(a5_wr[360]), .rdlo_out(a5_wr[376]));
			radix2 #(.width(width)) rd_st4_361  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[361]), .rdlo_in(a4_wr[377]),  .coef_in(coef[144]), .rdup_out(a5_wr[361]), .rdlo_out(a5_wr[377]));
			radix2 #(.width(width)) rd_st4_362  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[362]), .rdlo_in(a4_wr[378]),  .coef_in(coef[160]), .rdup_out(a5_wr[362]), .rdlo_out(a5_wr[378]));
			radix2 #(.width(width)) rd_st4_363  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[363]), .rdlo_in(a4_wr[379]),  .coef_in(coef[176]), .rdup_out(a5_wr[363]), .rdlo_out(a5_wr[379]));
			radix2 #(.width(width)) rd_st4_364  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[364]), .rdlo_in(a4_wr[380]),  .coef_in(coef[192]), .rdup_out(a5_wr[364]), .rdlo_out(a5_wr[380]));
			radix2 #(.width(width)) rd_st4_365  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[365]), .rdlo_in(a4_wr[381]),  .coef_in(coef[208]), .rdup_out(a5_wr[365]), .rdlo_out(a5_wr[381]));
			radix2 #(.width(width)) rd_st4_366  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[366]), .rdlo_in(a4_wr[382]),  .coef_in(coef[224]), .rdup_out(a5_wr[366]), .rdlo_out(a5_wr[382]));
			radix2 #(.width(width)) rd_st4_367  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[367]), .rdlo_in(a4_wr[383]),  .coef_in(coef[240]), .rdup_out(a5_wr[367]), .rdlo_out(a5_wr[383]));
			radix2 #(.width(width)) rd_st4_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[384]), .rdlo_in(a4_wr[400]),  .coef_in(coef[0]), .rdup_out(a5_wr[384]), .rdlo_out(a5_wr[400]));
			radix2 #(.width(width)) rd_st4_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[385]), .rdlo_in(a4_wr[401]),  .coef_in(coef[16]), .rdup_out(a5_wr[385]), .rdlo_out(a5_wr[401]));
			radix2 #(.width(width)) rd_st4_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[386]), .rdlo_in(a4_wr[402]),  .coef_in(coef[32]), .rdup_out(a5_wr[386]), .rdlo_out(a5_wr[402]));
			radix2 #(.width(width)) rd_st4_387  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[387]), .rdlo_in(a4_wr[403]),  .coef_in(coef[48]), .rdup_out(a5_wr[387]), .rdlo_out(a5_wr[403]));
			radix2 #(.width(width)) rd_st4_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[388]), .rdlo_in(a4_wr[404]),  .coef_in(coef[64]), .rdup_out(a5_wr[388]), .rdlo_out(a5_wr[404]));
			radix2 #(.width(width)) rd_st4_389  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[389]), .rdlo_in(a4_wr[405]),  .coef_in(coef[80]), .rdup_out(a5_wr[389]), .rdlo_out(a5_wr[405]));
			radix2 #(.width(width)) rd_st4_390  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[390]), .rdlo_in(a4_wr[406]),  .coef_in(coef[96]), .rdup_out(a5_wr[390]), .rdlo_out(a5_wr[406]));
			radix2 #(.width(width)) rd_st4_391  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[391]), .rdlo_in(a4_wr[407]),  .coef_in(coef[112]), .rdup_out(a5_wr[391]), .rdlo_out(a5_wr[407]));
			radix2 #(.width(width)) rd_st4_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[392]), .rdlo_in(a4_wr[408]),  .coef_in(coef[128]), .rdup_out(a5_wr[392]), .rdlo_out(a5_wr[408]));
			radix2 #(.width(width)) rd_st4_393  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[393]), .rdlo_in(a4_wr[409]),  .coef_in(coef[144]), .rdup_out(a5_wr[393]), .rdlo_out(a5_wr[409]));
			radix2 #(.width(width)) rd_st4_394  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[394]), .rdlo_in(a4_wr[410]),  .coef_in(coef[160]), .rdup_out(a5_wr[394]), .rdlo_out(a5_wr[410]));
			radix2 #(.width(width)) rd_st4_395  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[395]), .rdlo_in(a4_wr[411]),  .coef_in(coef[176]), .rdup_out(a5_wr[395]), .rdlo_out(a5_wr[411]));
			radix2 #(.width(width)) rd_st4_396  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[396]), .rdlo_in(a4_wr[412]),  .coef_in(coef[192]), .rdup_out(a5_wr[396]), .rdlo_out(a5_wr[412]));
			radix2 #(.width(width)) rd_st4_397  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[397]), .rdlo_in(a4_wr[413]),  .coef_in(coef[208]), .rdup_out(a5_wr[397]), .rdlo_out(a5_wr[413]));
			radix2 #(.width(width)) rd_st4_398  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[398]), .rdlo_in(a4_wr[414]),  .coef_in(coef[224]), .rdup_out(a5_wr[398]), .rdlo_out(a5_wr[414]));
			radix2 #(.width(width)) rd_st4_399  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[399]), .rdlo_in(a4_wr[415]),  .coef_in(coef[240]), .rdup_out(a5_wr[399]), .rdlo_out(a5_wr[415]));
			radix2 #(.width(width)) rd_st4_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[416]), .rdlo_in(a4_wr[432]),  .coef_in(coef[0]), .rdup_out(a5_wr[416]), .rdlo_out(a5_wr[432]));
			radix2 #(.width(width)) rd_st4_417  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[417]), .rdlo_in(a4_wr[433]),  .coef_in(coef[16]), .rdup_out(a5_wr[417]), .rdlo_out(a5_wr[433]));
			radix2 #(.width(width)) rd_st4_418  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[418]), .rdlo_in(a4_wr[434]),  .coef_in(coef[32]), .rdup_out(a5_wr[418]), .rdlo_out(a5_wr[434]));
			radix2 #(.width(width)) rd_st4_419  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[419]), .rdlo_in(a4_wr[435]),  .coef_in(coef[48]), .rdup_out(a5_wr[419]), .rdlo_out(a5_wr[435]));
			radix2 #(.width(width)) rd_st4_420  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[420]), .rdlo_in(a4_wr[436]),  .coef_in(coef[64]), .rdup_out(a5_wr[420]), .rdlo_out(a5_wr[436]));
			radix2 #(.width(width)) rd_st4_421  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[421]), .rdlo_in(a4_wr[437]),  .coef_in(coef[80]), .rdup_out(a5_wr[421]), .rdlo_out(a5_wr[437]));
			radix2 #(.width(width)) rd_st4_422  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[422]), .rdlo_in(a4_wr[438]),  .coef_in(coef[96]), .rdup_out(a5_wr[422]), .rdlo_out(a5_wr[438]));
			radix2 #(.width(width)) rd_st4_423  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[423]), .rdlo_in(a4_wr[439]),  .coef_in(coef[112]), .rdup_out(a5_wr[423]), .rdlo_out(a5_wr[439]));
			radix2 #(.width(width)) rd_st4_424  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[424]), .rdlo_in(a4_wr[440]),  .coef_in(coef[128]), .rdup_out(a5_wr[424]), .rdlo_out(a5_wr[440]));
			radix2 #(.width(width)) rd_st4_425  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[425]), .rdlo_in(a4_wr[441]),  .coef_in(coef[144]), .rdup_out(a5_wr[425]), .rdlo_out(a5_wr[441]));
			radix2 #(.width(width)) rd_st4_426  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[426]), .rdlo_in(a4_wr[442]),  .coef_in(coef[160]), .rdup_out(a5_wr[426]), .rdlo_out(a5_wr[442]));
			radix2 #(.width(width)) rd_st4_427  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[427]), .rdlo_in(a4_wr[443]),  .coef_in(coef[176]), .rdup_out(a5_wr[427]), .rdlo_out(a5_wr[443]));
			radix2 #(.width(width)) rd_st4_428  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[428]), .rdlo_in(a4_wr[444]),  .coef_in(coef[192]), .rdup_out(a5_wr[428]), .rdlo_out(a5_wr[444]));
			radix2 #(.width(width)) rd_st4_429  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[429]), .rdlo_in(a4_wr[445]),  .coef_in(coef[208]), .rdup_out(a5_wr[429]), .rdlo_out(a5_wr[445]));
			radix2 #(.width(width)) rd_st4_430  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[430]), .rdlo_in(a4_wr[446]),  .coef_in(coef[224]), .rdup_out(a5_wr[430]), .rdlo_out(a5_wr[446]));
			radix2 #(.width(width)) rd_st4_431  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[431]), .rdlo_in(a4_wr[447]),  .coef_in(coef[240]), .rdup_out(a5_wr[431]), .rdlo_out(a5_wr[447]));
			radix2 #(.width(width)) rd_st4_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[448]), .rdlo_in(a4_wr[464]),  .coef_in(coef[0]), .rdup_out(a5_wr[448]), .rdlo_out(a5_wr[464]));
			radix2 #(.width(width)) rd_st4_449  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[449]), .rdlo_in(a4_wr[465]),  .coef_in(coef[16]), .rdup_out(a5_wr[449]), .rdlo_out(a5_wr[465]));
			radix2 #(.width(width)) rd_st4_450  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[450]), .rdlo_in(a4_wr[466]),  .coef_in(coef[32]), .rdup_out(a5_wr[450]), .rdlo_out(a5_wr[466]));
			radix2 #(.width(width)) rd_st4_451  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[451]), .rdlo_in(a4_wr[467]),  .coef_in(coef[48]), .rdup_out(a5_wr[451]), .rdlo_out(a5_wr[467]));
			radix2 #(.width(width)) rd_st4_452  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[452]), .rdlo_in(a4_wr[468]),  .coef_in(coef[64]), .rdup_out(a5_wr[452]), .rdlo_out(a5_wr[468]));
			radix2 #(.width(width)) rd_st4_453  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[453]), .rdlo_in(a4_wr[469]),  .coef_in(coef[80]), .rdup_out(a5_wr[453]), .rdlo_out(a5_wr[469]));
			radix2 #(.width(width)) rd_st4_454  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[454]), .rdlo_in(a4_wr[470]),  .coef_in(coef[96]), .rdup_out(a5_wr[454]), .rdlo_out(a5_wr[470]));
			radix2 #(.width(width)) rd_st4_455  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[455]), .rdlo_in(a4_wr[471]),  .coef_in(coef[112]), .rdup_out(a5_wr[455]), .rdlo_out(a5_wr[471]));
			radix2 #(.width(width)) rd_st4_456  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[456]), .rdlo_in(a4_wr[472]),  .coef_in(coef[128]), .rdup_out(a5_wr[456]), .rdlo_out(a5_wr[472]));
			radix2 #(.width(width)) rd_st4_457  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[457]), .rdlo_in(a4_wr[473]),  .coef_in(coef[144]), .rdup_out(a5_wr[457]), .rdlo_out(a5_wr[473]));
			radix2 #(.width(width)) rd_st4_458  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[458]), .rdlo_in(a4_wr[474]),  .coef_in(coef[160]), .rdup_out(a5_wr[458]), .rdlo_out(a5_wr[474]));
			radix2 #(.width(width)) rd_st4_459  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[459]), .rdlo_in(a4_wr[475]),  .coef_in(coef[176]), .rdup_out(a5_wr[459]), .rdlo_out(a5_wr[475]));
			radix2 #(.width(width)) rd_st4_460  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[460]), .rdlo_in(a4_wr[476]),  .coef_in(coef[192]), .rdup_out(a5_wr[460]), .rdlo_out(a5_wr[476]));
			radix2 #(.width(width)) rd_st4_461  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[461]), .rdlo_in(a4_wr[477]),  .coef_in(coef[208]), .rdup_out(a5_wr[461]), .rdlo_out(a5_wr[477]));
			radix2 #(.width(width)) rd_st4_462  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[462]), .rdlo_in(a4_wr[478]),  .coef_in(coef[224]), .rdup_out(a5_wr[462]), .rdlo_out(a5_wr[478]));
			radix2 #(.width(width)) rd_st4_463  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[463]), .rdlo_in(a4_wr[479]),  .coef_in(coef[240]), .rdup_out(a5_wr[463]), .rdlo_out(a5_wr[479]));
			radix2 #(.width(width)) rd_st4_480  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[480]), .rdlo_in(a4_wr[496]),  .coef_in(coef[0]), .rdup_out(a5_wr[480]), .rdlo_out(a5_wr[496]));
			radix2 #(.width(width)) rd_st4_481  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[481]), .rdlo_in(a4_wr[497]),  .coef_in(coef[16]), .rdup_out(a5_wr[481]), .rdlo_out(a5_wr[497]));
			radix2 #(.width(width)) rd_st4_482  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[482]), .rdlo_in(a4_wr[498]),  .coef_in(coef[32]), .rdup_out(a5_wr[482]), .rdlo_out(a5_wr[498]));
			radix2 #(.width(width)) rd_st4_483  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[483]), .rdlo_in(a4_wr[499]),  .coef_in(coef[48]), .rdup_out(a5_wr[483]), .rdlo_out(a5_wr[499]));
			radix2 #(.width(width)) rd_st4_484  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[484]), .rdlo_in(a4_wr[500]),  .coef_in(coef[64]), .rdup_out(a5_wr[484]), .rdlo_out(a5_wr[500]));
			radix2 #(.width(width)) rd_st4_485  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[485]), .rdlo_in(a4_wr[501]),  .coef_in(coef[80]), .rdup_out(a5_wr[485]), .rdlo_out(a5_wr[501]));
			radix2 #(.width(width)) rd_st4_486  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[486]), .rdlo_in(a4_wr[502]),  .coef_in(coef[96]), .rdup_out(a5_wr[486]), .rdlo_out(a5_wr[502]));
			radix2 #(.width(width)) rd_st4_487  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[487]), .rdlo_in(a4_wr[503]),  .coef_in(coef[112]), .rdup_out(a5_wr[487]), .rdlo_out(a5_wr[503]));
			radix2 #(.width(width)) rd_st4_488  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[488]), .rdlo_in(a4_wr[504]),  .coef_in(coef[128]), .rdup_out(a5_wr[488]), .rdlo_out(a5_wr[504]));
			radix2 #(.width(width)) rd_st4_489  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[489]), .rdlo_in(a4_wr[505]),  .coef_in(coef[144]), .rdup_out(a5_wr[489]), .rdlo_out(a5_wr[505]));
			radix2 #(.width(width)) rd_st4_490  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[490]), .rdlo_in(a4_wr[506]),  .coef_in(coef[160]), .rdup_out(a5_wr[490]), .rdlo_out(a5_wr[506]));
			radix2 #(.width(width)) rd_st4_491  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[491]), .rdlo_in(a4_wr[507]),  .coef_in(coef[176]), .rdup_out(a5_wr[491]), .rdlo_out(a5_wr[507]));
			radix2 #(.width(width)) rd_st4_492  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[492]), .rdlo_in(a4_wr[508]),  .coef_in(coef[192]), .rdup_out(a5_wr[492]), .rdlo_out(a5_wr[508]));
			radix2 #(.width(width)) rd_st4_493  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[493]), .rdlo_in(a4_wr[509]),  .coef_in(coef[208]), .rdup_out(a5_wr[493]), .rdlo_out(a5_wr[509]));
			radix2 #(.width(width)) rd_st4_494  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[494]), .rdlo_in(a4_wr[510]),  .coef_in(coef[224]), .rdup_out(a5_wr[494]), .rdlo_out(a5_wr[510]));
			radix2 #(.width(width)) rd_st4_495  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a4_wr[495]), .rdlo_in(a4_wr[511]),  .coef_in(coef[240]), .rdup_out(a5_wr[495]), .rdlo_out(a5_wr[511]));

		//--- radix stage 5
			radix2 #(.width(width)) rd_st5_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[0]), .rdlo_in(a5_wr[8]),  .coef_in(coef[0]), .rdup_out(a6_wr[0]), .rdlo_out(a6_wr[8]));
			radix2 #(.width(width)) rd_st5_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[1]), .rdlo_in(a5_wr[9]),  .coef_in(coef[32]), .rdup_out(a6_wr[1]), .rdlo_out(a6_wr[9]));
			radix2 #(.width(width)) rd_st5_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[2]), .rdlo_in(a5_wr[10]),  .coef_in(coef[64]), .rdup_out(a6_wr[2]), .rdlo_out(a6_wr[10]));
			radix2 #(.width(width)) rd_st5_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[3]), .rdlo_in(a5_wr[11]),  .coef_in(coef[96]), .rdup_out(a6_wr[3]), .rdlo_out(a6_wr[11]));
			radix2 #(.width(width)) rd_st5_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[4]), .rdlo_in(a5_wr[12]),  .coef_in(coef[128]), .rdup_out(a6_wr[4]), .rdlo_out(a6_wr[12]));
			radix2 #(.width(width)) rd_st5_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[5]), .rdlo_in(a5_wr[13]),  .coef_in(coef[160]), .rdup_out(a6_wr[5]), .rdlo_out(a6_wr[13]));
			radix2 #(.width(width)) rd_st5_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[6]), .rdlo_in(a5_wr[14]),  .coef_in(coef[192]), .rdup_out(a6_wr[6]), .rdlo_out(a6_wr[14]));
			radix2 #(.width(width)) rd_st5_7   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[7]), .rdlo_in(a5_wr[15]),  .coef_in(coef[224]), .rdup_out(a6_wr[7]), .rdlo_out(a6_wr[15]));
			radix2 #(.width(width)) rd_st5_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[16]), .rdlo_in(a5_wr[24]),  .coef_in(coef[0]), .rdup_out(a6_wr[16]), .rdlo_out(a6_wr[24]));
			radix2 #(.width(width)) rd_st5_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[17]), .rdlo_in(a5_wr[25]),  .coef_in(coef[32]), .rdup_out(a6_wr[17]), .rdlo_out(a6_wr[25]));
			radix2 #(.width(width)) rd_st5_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[18]), .rdlo_in(a5_wr[26]),  .coef_in(coef[64]), .rdup_out(a6_wr[18]), .rdlo_out(a6_wr[26]));
			radix2 #(.width(width)) rd_st5_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[19]), .rdlo_in(a5_wr[27]),  .coef_in(coef[96]), .rdup_out(a6_wr[19]), .rdlo_out(a6_wr[27]));
			radix2 #(.width(width)) rd_st5_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[20]), .rdlo_in(a5_wr[28]),  .coef_in(coef[128]), .rdup_out(a6_wr[20]), .rdlo_out(a6_wr[28]));
			radix2 #(.width(width)) rd_st5_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[21]), .rdlo_in(a5_wr[29]),  .coef_in(coef[160]), .rdup_out(a6_wr[21]), .rdlo_out(a6_wr[29]));
			radix2 #(.width(width)) rd_st5_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[22]), .rdlo_in(a5_wr[30]),  .coef_in(coef[192]), .rdup_out(a6_wr[22]), .rdlo_out(a6_wr[30]));
			radix2 #(.width(width)) rd_st5_23  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[23]), .rdlo_in(a5_wr[31]),  .coef_in(coef[224]), .rdup_out(a6_wr[23]), .rdlo_out(a6_wr[31]));
			radix2 #(.width(width)) rd_st5_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[32]), .rdlo_in(a5_wr[40]),  .coef_in(coef[0]), .rdup_out(a6_wr[32]), .rdlo_out(a6_wr[40]));
			radix2 #(.width(width)) rd_st5_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[33]), .rdlo_in(a5_wr[41]),  .coef_in(coef[32]), .rdup_out(a6_wr[33]), .rdlo_out(a6_wr[41]));
			radix2 #(.width(width)) rd_st5_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[34]), .rdlo_in(a5_wr[42]),  .coef_in(coef[64]), .rdup_out(a6_wr[34]), .rdlo_out(a6_wr[42]));
			radix2 #(.width(width)) rd_st5_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[35]), .rdlo_in(a5_wr[43]),  .coef_in(coef[96]), .rdup_out(a6_wr[35]), .rdlo_out(a6_wr[43]));
			radix2 #(.width(width)) rd_st5_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[36]), .rdlo_in(a5_wr[44]),  .coef_in(coef[128]), .rdup_out(a6_wr[36]), .rdlo_out(a6_wr[44]));
			radix2 #(.width(width)) rd_st5_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[37]), .rdlo_in(a5_wr[45]),  .coef_in(coef[160]), .rdup_out(a6_wr[37]), .rdlo_out(a6_wr[45]));
			radix2 #(.width(width)) rd_st5_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[38]), .rdlo_in(a5_wr[46]),  .coef_in(coef[192]), .rdup_out(a6_wr[38]), .rdlo_out(a6_wr[46]));
			radix2 #(.width(width)) rd_st5_39  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[39]), .rdlo_in(a5_wr[47]),  .coef_in(coef[224]), .rdup_out(a6_wr[39]), .rdlo_out(a6_wr[47]));
			radix2 #(.width(width)) rd_st5_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[48]), .rdlo_in(a5_wr[56]),  .coef_in(coef[0]), .rdup_out(a6_wr[48]), .rdlo_out(a6_wr[56]));
			radix2 #(.width(width)) rd_st5_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[49]), .rdlo_in(a5_wr[57]),  .coef_in(coef[32]), .rdup_out(a6_wr[49]), .rdlo_out(a6_wr[57]));
			radix2 #(.width(width)) rd_st5_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[50]), .rdlo_in(a5_wr[58]),  .coef_in(coef[64]), .rdup_out(a6_wr[50]), .rdlo_out(a6_wr[58]));
			radix2 #(.width(width)) rd_st5_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[51]), .rdlo_in(a5_wr[59]),  .coef_in(coef[96]), .rdup_out(a6_wr[51]), .rdlo_out(a6_wr[59]));
			radix2 #(.width(width)) rd_st5_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[52]), .rdlo_in(a5_wr[60]),  .coef_in(coef[128]), .rdup_out(a6_wr[52]), .rdlo_out(a6_wr[60]));
			radix2 #(.width(width)) rd_st5_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[53]), .rdlo_in(a5_wr[61]),  .coef_in(coef[160]), .rdup_out(a6_wr[53]), .rdlo_out(a6_wr[61]));
			radix2 #(.width(width)) rd_st5_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[54]), .rdlo_in(a5_wr[62]),  .coef_in(coef[192]), .rdup_out(a6_wr[54]), .rdlo_out(a6_wr[62]));
			radix2 #(.width(width)) rd_st5_55  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[55]), .rdlo_in(a5_wr[63]),  .coef_in(coef[224]), .rdup_out(a6_wr[55]), .rdlo_out(a6_wr[63]));
			radix2 #(.width(width)) rd_st5_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[64]), .rdlo_in(a5_wr[72]),  .coef_in(coef[0]), .rdup_out(a6_wr[64]), .rdlo_out(a6_wr[72]));
			radix2 #(.width(width)) rd_st5_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[65]), .rdlo_in(a5_wr[73]),  .coef_in(coef[32]), .rdup_out(a6_wr[65]), .rdlo_out(a6_wr[73]));
			radix2 #(.width(width)) rd_st5_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[66]), .rdlo_in(a5_wr[74]),  .coef_in(coef[64]), .rdup_out(a6_wr[66]), .rdlo_out(a6_wr[74]));
			radix2 #(.width(width)) rd_st5_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[67]), .rdlo_in(a5_wr[75]),  .coef_in(coef[96]), .rdup_out(a6_wr[67]), .rdlo_out(a6_wr[75]));
			radix2 #(.width(width)) rd_st5_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[68]), .rdlo_in(a5_wr[76]),  .coef_in(coef[128]), .rdup_out(a6_wr[68]), .rdlo_out(a6_wr[76]));
			radix2 #(.width(width)) rd_st5_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[69]), .rdlo_in(a5_wr[77]),  .coef_in(coef[160]), .rdup_out(a6_wr[69]), .rdlo_out(a6_wr[77]));
			radix2 #(.width(width)) rd_st5_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[70]), .rdlo_in(a5_wr[78]),  .coef_in(coef[192]), .rdup_out(a6_wr[70]), .rdlo_out(a6_wr[78]));
			radix2 #(.width(width)) rd_st5_71  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[71]), .rdlo_in(a5_wr[79]),  .coef_in(coef[224]), .rdup_out(a6_wr[71]), .rdlo_out(a6_wr[79]));
			radix2 #(.width(width)) rd_st5_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[80]), .rdlo_in(a5_wr[88]),  .coef_in(coef[0]), .rdup_out(a6_wr[80]), .rdlo_out(a6_wr[88]));
			radix2 #(.width(width)) rd_st5_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[81]), .rdlo_in(a5_wr[89]),  .coef_in(coef[32]), .rdup_out(a6_wr[81]), .rdlo_out(a6_wr[89]));
			radix2 #(.width(width)) rd_st5_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[82]), .rdlo_in(a5_wr[90]),  .coef_in(coef[64]), .rdup_out(a6_wr[82]), .rdlo_out(a6_wr[90]));
			radix2 #(.width(width)) rd_st5_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[83]), .rdlo_in(a5_wr[91]),  .coef_in(coef[96]), .rdup_out(a6_wr[83]), .rdlo_out(a6_wr[91]));
			radix2 #(.width(width)) rd_st5_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[84]), .rdlo_in(a5_wr[92]),  .coef_in(coef[128]), .rdup_out(a6_wr[84]), .rdlo_out(a6_wr[92]));
			radix2 #(.width(width)) rd_st5_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[85]), .rdlo_in(a5_wr[93]),  .coef_in(coef[160]), .rdup_out(a6_wr[85]), .rdlo_out(a6_wr[93]));
			radix2 #(.width(width)) rd_st5_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[86]), .rdlo_in(a5_wr[94]),  .coef_in(coef[192]), .rdup_out(a6_wr[86]), .rdlo_out(a6_wr[94]));
			radix2 #(.width(width)) rd_st5_87  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[87]), .rdlo_in(a5_wr[95]),  .coef_in(coef[224]), .rdup_out(a6_wr[87]), .rdlo_out(a6_wr[95]));
			radix2 #(.width(width)) rd_st5_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[96]), .rdlo_in(a5_wr[104]),  .coef_in(coef[0]), .rdup_out(a6_wr[96]), .rdlo_out(a6_wr[104]));
			radix2 #(.width(width)) rd_st5_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[97]), .rdlo_in(a5_wr[105]),  .coef_in(coef[32]), .rdup_out(a6_wr[97]), .rdlo_out(a6_wr[105]));
			radix2 #(.width(width)) rd_st5_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[98]), .rdlo_in(a5_wr[106]),  .coef_in(coef[64]), .rdup_out(a6_wr[98]), .rdlo_out(a6_wr[106]));
			radix2 #(.width(width)) rd_st5_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[99]), .rdlo_in(a5_wr[107]),  .coef_in(coef[96]), .rdup_out(a6_wr[99]), .rdlo_out(a6_wr[107]));
			radix2 #(.width(width)) rd_st5_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[100]), .rdlo_in(a5_wr[108]),  .coef_in(coef[128]), .rdup_out(a6_wr[100]), .rdlo_out(a6_wr[108]));
			radix2 #(.width(width)) rd_st5_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[101]), .rdlo_in(a5_wr[109]),  .coef_in(coef[160]), .rdup_out(a6_wr[101]), .rdlo_out(a6_wr[109]));
			radix2 #(.width(width)) rd_st5_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[102]), .rdlo_in(a5_wr[110]),  .coef_in(coef[192]), .rdup_out(a6_wr[102]), .rdlo_out(a6_wr[110]));
			radix2 #(.width(width)) rd_st5_103  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[103]), .rdlo_in(a5_wr[111]),  .coef_in(coef[224]), .rdup_out(a6_wr[103]), .rdlo_out(a6_wr[111]));
			radix2 #(.width(width)) rd_st5_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[112]), .rdlo_in(a5_wr[120]),  .coef_in(coef[0]), .rdup_out(a6_wr[112]), .rdlo_out(a6_wr[120]));
			radix2 #(.width(width)) rd_st5_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[113]), .rdlo_in(a5_wr[121]),  .coef_in(coef[32]), .rdup_out(a6_wr[113]), .rdlo_out(a6_wr[121]));
			radix2 #(.width(width)) rd_st5_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[114]), .rdlo_in(a5_wr[122]),  .coef_in(coef[64]), .rdup_out(a6_wr[114]), .rdlo_out(a6_wr[122]));
			radix2 #(.width(width)) rd_st5_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[115]), .rdlo_in(a5_wr[123]),  .coef_in(coef[96]), .rdup_out(a6_wr[115]), .rdlo_out(a6_wr[123]));
			radix2 #(.width(width)) rd_st5_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[116]), .rdlo_in(a5_wr[124]),  .coef_in(coef[128]), .rdup_out(a6_wr[116]), .rdlo_out(a6_wr[124]));
			radix2 #(.width(width)) rd_st5_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[117]), .rdlo_in(a5_wr[125]),  .coef_in(coef[160]), .rdup_out(a6_wr[117]), .rdlo_out(a6_wr[125]));
			radix2 #(.width(width)) rd_st5_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[118]), .rdlo_in(a5_wr[126]),  .coef_in(coef[192]), .rdup_out(a6_wr[118]), .rdlo_out(a6_wr[126]));
			radix2 #(.width(width)) rd_st5_119  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[119]), .rdlo_in(a5_wr[127]),  .coef_in(coef[224]), .rdup_out(a6_wr[119]), .rdlo_out(a6_wr[127]));
			radix2 #(.width(width)) rd_st5_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[128]), .rdlo_in(a5_wr[136]),  .coef_in(coef[0]), .rdup_out(a6_wr[128]), .rdlo_out(a6_wr[136]));
			radix2 #(.width(width)) rd_st5_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[129]), .rdlo_in(a5_wr[137]),  .coef_in(coef[32]), .rdup_out(a6_wr[129]), .rdlo_out(a6_wr[137]));
			radix2 #(.width(width)) rd_st5_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[130]), .rdlo_in(a5_wr[138]),  .coef_in(coef[64]), .rdup_out(a6_wr[130]), .rdlo_out(a6_wr[138]));
			radix2 #(.width(width)) rd_st5_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[131]), .rdlo_in(a5_wr[139]),  .coef_in(coef[96]), .rdup_out(a6_wr[131]), .rdlo_out(a6_wr[139]));
			radix2 #(.width(width)) rd_st5_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[132]), .rdlo_in(a5_wr[140]),  .coef_in(coef[128]), .rdup_out(a6_wr[132]), .rdlo_out(a6_wr[140]));
			radix2 #(.width(width)) rd_st5_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[133]), .rdlo_in(a5_wr[141]),  .coef_in(coef[160]), .rdup_out(a6_wr[133]), .rdlo_out(a6_wr[141]));
			radix2 #(.width(width)) rd_st5_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[134]), .rdlo_in(a5_wr[142]),  .coef_in(coef[192]), .rdup_out(a6_wr[134]), .rdlo_out(a6_wr[142]));
			radix2 #(.width(width)) rd_st5_135  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[135]), .rdlo_in(a5_wr[143]),  .coef_in(coef[224]), .rdup_out(a6_wr[135]), .rdlo_out(a6_wr[143]));
			radix2 #(.width(width)) rd_st5_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[144]), .rdlo_in(a5_wr[152]),  .coef_in(coef[0]), .rdup_out(a6_wr[144]), .rdlo_out(a6_wr[152]));
			radix2 #(.width(width)) rd_st5_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[145]), .rdlo_in(a5_wr[153]),  .coef_in(coef[32]), .rdup_out(a6_wr[145]), .rdlo_out(a6_wr[153]));
			radix2 #(.width(width)) rd_st5_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[146]), .rdlo_in(a5_wr[154]),  .coef_in(coef[64]), .rdup_out(a6_wr[146]), .rdlo_out(a6_wr[154]));
			radix2 #(.width(width)) rd_st5_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[147]), .rdlo_in(a5_wr[155]),  .coef_in(coef[96]), .rdup_out(a6_wr[147]), .rdlo_out(a6_wr[155]));
			radix2 #(.width(width)) rd_st5_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[148]), .rdlo_in(a5_wr[156]),  .coef_in(coef[128]), .rdup_out(a6_wr[148]), .rdlo_out(a6_wr[156]));
			radix2 #(.width(width)) rd_st5_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[149]), .rdlo_in(a5_wr[157]),  .coef_in(coef[160]), .rdup_out(a6_wr[149]), .rdlo_out(a6_wr[157]));
			radix2 #(.width(width)) rd_st5_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[150]), .rdlo_in(a5_wr[158]),  .coef_in(coef[192]), .rdup_out(a6_wr[150]), .rdlo_out(a6_wr[158]));
			radix2 #(.width(width)) rd_st5_151  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[151]), .rdlo_in(a5_wr[159]),  .coef_in(coef[224]), .rdup_out(a6_wr[151]), .rdlo_out(a6_wr[159]));
			radix2 #(.width(width)) rd_st5_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[160]), .rdlo_in(a5_wr[168]),  .coef_in(coef[0]), .rdup_out(a6_wr[160]), .rdlo_out(a6_wr[168]));
			radix2 #(.width(width)) rd_st5_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[161]), .rdlo_in(a5_wr[169]),  .coef_in(coef[32]), .rdup_out(a6_wr[161]), .rdlo_out(a6_wr[169]));
			radix2 #(.width(width)) rd_st5_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[162]), .rdlo_in(a5_wr[170]),  .coef_in(coef[64]), .rdup_out(a6_wr[162]), .rdlo_out(a6_wr[170]));
			radix2 #(.width(width)) rd_st5_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[163]), .rdlo_in(a5_wr[171]),  .coef_in(coef[96]), .rdup_out(a6_wr[163]), .rdlo_out(a6_wr[171]));
			radix2 #(.width(width)) rd_st5_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[164]), .rdlo_in(a5_wr[172]),  .coef_in(coef[128]), .rdup_out(a6_wr[164]), .rdlo_out(a6_wr[172]));
			radix2 #(.width(width)) rd_st5_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[165]), .rdlo_in(a5_wr[173]),  .coef_in(coef[160]), .rdup_out(a6_wr[165]), .rdlo_out(a6_wr[173]));
			radix2 #(.width(width)) rd_st5_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[166]), .rdlo_in(a5_wr[174]),  .coef_in(coef[192]), .rdup_out(a6_wr[166]), .rdlo_out(a6_wr[174]));
			radix2 #(.width(width)) rd_st5_167  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[167]), .rdlo_in(a5_wr[175]),  .coef_in(coef[224]), .rdup_out(a6_wr[167]), .rdlo_out(a6_wr[175]));
			radix2 #(.width(width)) rd_st5_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[176]), .rdlo_in(a5_wr[184]),  .coef_in(coef[0]), .rdup_out(a6_wr[176]), .rdlo_out(a6_wr[184]));
			radix2 #(.width(width)) rd_st5_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[177]), .rdlo_in(a5_wr[185]),  .coef_in(coef[32]), .rdup_out(a6_wr[177]), .rdlo_out(a6_wr[185]));
			radix2 #(.width(width)) rd_st5_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[178]), .rdlo_in(a5_wr[186]),  .coef_in(coef[64]), .rdup_out(a6_wr[178]), .rdlo_out(a6_wr[186]));
			radix2 #(.width(width)) rd_st5_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[179]), .rdlo_in(a5_wr[187]),  .coef_in(coef[96]), .rdup_out(a6_wr[179]), .rdlo_out(a6_wr[187]));
			radix2 #(.width(width)) rd_st5_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[180]), .rdlo_in(a5_wr[188]),  .coef_in(coef[128]), .rdup_out(a6_wr[180]), .rdlo_out(a6_wr[188]));
			radix2 #(.width(width)) rd_st5_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[181]), .rdlo_in(a5_wr[189]),  .coef_in(coef[160]), .rdup_out(a6_wr[181]), .rdlo_out(a6_wr[189]));
			radix2 #(.width(width)) rd_st5_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[182]), .rdlo_in(a5_wr[190]),  .coef_in(coef[192]), .rdup_out(a6_wr[182]), .rdlo_out(a6_wr[190]));
			radix2 #(.width(width)) rd_st5_183  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[183]), .rdlo_in(a5_wr[191]),  .coef_in(coef[224]), .rdup_out(a6_wr[183]), .rdlo_out(a6_wr[191]));
			radix2 #(.width(width)) rd_st5_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[192]), .rdlo_in(a5_wr[200]),  .coef_in(coef[0]), .rdup_out(a6_wr[192]), .rdlo_out(a6_wr[200]));
			radix2 #(.width(width)) rd_st5_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[193]), .rdlo_in(a5_wr[201]),  .coef_in(coef[32]), .rdup_out(a6_wr[193]), .rdlo_out(a6_wr[201]));
			radix2 #(.width(width)) rd_st5_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[194]), .rdlo_in(a5_wr[202]),  .coef_in(coef[64]), .rdup_out(a6_wr[194]), .rdlo_out(a6_wr[202]));
			radix2 #(.width(width)) rd_st5_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[195]), .rdlo_in(a5_wr[203]),  .coef_in(coef[96]), .rdup_out(a6_wr[195]), .rdlo_out(a6_wr[203]));
			radix2 #(.width(width)) rd_st5_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[196]), .rdlo_in(a5_wr[204]),  .coef_in(coef[128]), .rdup_out(a6_wr[196]), .rdlo_out(a6_wr[204]));
			radix2 #(.width(width)) rd_st5_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[197]), .rdlo_in(a5_wr[205]),  .coef_in(coef[160]), .rdup_out(a6_wr[197]), .rdlo_out(a6_wr[205]));
			radix2 #(.width(width)) rd_st5_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[198]), .rdlo_in(a5_wr[206]),  .coef_in(coef[192]), .rdup_out(a6_wr[198]), .rdlo_out(a6_wr[206]));
			radix2 #(.width(width)) rd_st5_199  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[199]), .rdlo_in(a5_wr[207]),  .coef_in(coef[224]), .rdup_out(a6_wr[199]), .rdlo_out(a6_wr[207]));
			radix2 #(.width(width)) rd_st5_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[208]), .rdlo_in(a5_wr[216]),  .coef_in(coef[0]), .rdup_out(a6_wr[208]), .rdlo_out(a6_wr[216]));
			radix2 #(.width(width)) rd_st5_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[209]), .rdlo_in(a5_wr[217]),  .coef_in(coef[32]), .rdup_out(a6_wr[209]), .rdlo_out(a6_wr[217]));
			radix2 #(.width(width)) rd_st5_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[210]), .rdlo_in(a5_wr[218]),  .coef_in(coef[64]), .rdup_out(a6_wr[210]), .rdlo_out(a6_wr[218]));
			radix2 #(.width(width)) rd_st5_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[211]), .rdlo_in(a5_wr[219]),  .coef_in(coef[96]), .rdup_out(a6_wr[211]), .rdlo_out(a6_wr[219]));
			radix2 #(.width(width)) rd_st5_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[212]), .rdlo_in(a5_wr[220]),  .coef_in(coef[128]), .rdup_out(a6_wr[212]), .rdlo_out(a6_wr[220]));
			radix2 #(.width(width)) rd_st5_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[213]), .rdlo_in(a5_wr[221]),  .coef_in(coef[160]), .rdup_out(a6_wr[213]), .rdlo_out(a6_wr[221]));
			radix2 #(.width(width)) rd_st5_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[214]), .rdlo_in(a5_wr[222]),  .coef_in(coef[192]), .rdup_out(a6_wr[214]), .rdlo_out(a6_wr[222]));
			radix2 #(.width(width)) rd_st5_215  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[215]), .rdlo_in(a5_wr[223]),  .coef_in(coef[224]), .rdup_out(a6_wr[215]), .rdlo_out(a6_wr[223]));
			radix2 #(.width(width)) rd_st5_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[224]), .rdlo_in(a5_wr[232]),  .coef_in(coef[0]), .rdup_out(a6_wr[224]), .rdlo_out(a6_wr[232]));
			radix2 #(.width(width)) rd_st5_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[225]), .rdlo_in(a5_wr[233]),  .coef_in(coef[32]), .rdup_out(a6_wr[225]), .rdlo_out(a6_wr[233]));
			radix2 #(.width(width)) rd_st5_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[226]), .rdlo_in(a5_wr[234]),  .coef_in(coef[64]), .rdup_out(a6_wr[226]), .rdlo_out(a6_wr[234]));
			radix2 #(.width(width)) rd_st5_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[227]), .rdlo_in(a5_wr[235]),  .coef_in(coef[96]), .rdup_out(a6_wr[227]), .rdlo_out(a6_wr[235]));
			radix2 #(.width(width)) rd_st5_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[228]), .rdlo_in(a5_wr[236]),  .coef_in(coef[128]), .rdup_out(a6_wr[228]), .rdlo_out(a6_wr[236]));
			radix2 #(.width(width)) rd_st5_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[229]), .rdlo_in(a5_wr[237]),  .coef_in(coef[160]), .rdup_out(a6_wr[229]), .rdlo_out(a6_wr[237]));
			radix2 #(.width(width)) rd_st5_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[230]), .rdlo_in(a5_wr[238]),  .coef_in(coef[192]), .rdup_out(a6_wr[230]), .rdlo_out(a6_wr[238]));
			radix2 #(.width(width)) rd_st5_231  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[231]), .rdlo_in(a5_wr[239]),  .coef_in(coef[224]), .rdup_out(a6_wr[231]), .rdlo_out(a6_wr[239]));
			radix2 #(.width(width)) rd_st5_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[240]), .rdlo_in(a5_wr[248]),  .coef_in(coef[0]), .rdup_out(a6_wr[240]), .rdlo_out(a6_wr[248]));
			radix2 #(.width(width)) rd_st5_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[241]), .rdlo_in(a5_wr[249]),  .coef_in(coef[32]), .rdup_out(a6_wr[241]), .rdlo_out(a6_wr[249]));
			radix2 #(.width(width)) rd_st5_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[242]), .rdlo_in(a5_wr[250]),  .coef_in(coef[64]), .rdup_out(a6_wr[242]), .rdlo_out(a6_wr[250]));
			radix2 #(.width(width)) rd_st5_243  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[243]), .rdlo_in(a5_wr[251]),  .coef_in(coef[96]), .rdup_out(a6_wr[243]), .rdlo_out(a6_wr[251]));
			radix2 #(.width(width)) rd_st5_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[244]), .rdlo_in(a5_wr[252]),  .coef_in(coef[128]), .rdup_out(a6_wr[244]), .rdlo_out(a6_wr[252]));
			radix2 #(.width(width)) rd_st5_245  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[245]), .rdlo_in(a5_wr[253]),  .coef_in(coef[160]), .rdup_out(a6_wr[245]), .rdlo_out(a6_wr[253]));
			radix2 #(.width(width)) rd_st5_246  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[246]), .rdlo_in(a5_wr[254]),  .coef_in(coef[192]), .rdup_out(a6_wr[246]), .rdlo_out(a6_wr[254]));
			radix2 #(.width(width)) rd_st5_247  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[247]), .rdlo_in(a5_wr[255]),  .coef_in(coef[224]), .rdup_out(a6_wr[247]), .rdlo_out(a6_wr[255]));
			radix2 #(.width(width)) rd_st5_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[256]), .rdlo_in(a5_wr[264]),  .coef_in(coef[0]), .rdup_out(a6_wr[256]), .rdlo_out(a6_wr[264]));
			radix2 #(.width(width)) rd_st5_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[257]), .rdlo_in(a5_wr[265]),  .coef_in(coef[32]), .rdup_out(a6_wr[257]), .rdlo_out(a6_wr[265]));
			radix2 #(.width(width)) rd_st5_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[258]), .rdlo_in(a5_wr[266]),  .coef_in(coef[64]), .rdup_out(a6_wr[258]), .rdlo_out(a6_wr[266]));
			radix2 #(.width(width)) rd_st5_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[259]), .rdlo_in(a5_wr[267]),  .coef_in(coef[96]), .rdup_out(a6_wr[259]), .rdlo_out(a6_wr[267]));
			radix2 #(.width(width)) rd_st5_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[260]), .rdlo_in(a5_wr[268]),  .coef_in(coef[128]), .rdup_out(a6_wr[260]), .rdlo_out(a6_wr[268]));
			radix2 #(.width(width)) rd_st5_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[261]), .rdlo_in(a5_wr[269]),  .coef_in(coef[160]), .rdup_out(a6_wr[261]), .rdlo_out(a6_wr[269]));
			radix2 #(.width(width)) rd_st5_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[262]), .rdlo_in(a5_wr[270]),  .coef_in(coef[192]), .rdup_out(a6_wr[262]), .rdlo_out(a6_wr[270]));
			radix2 #(.width(width)) rd_st5_263  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[263]), .rdlo_in(a5_wr[271]),  .coef_in(coef[224]), .rdup_out(a6_wr[263]), .rdlo_out(a6_wr[271]));
			radix2 #(.width(width)) rd_st5_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[272]), .rdlo_in(a5_wr[280]),  .coef_in(coef[0]), .rdup_out(a6_wr[272]), .rdlo_out(a6_wr[280]));
			radix2 #(.width(width)) rd_st5_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[273]), .rdlo_in(a5_wr[281]),  .coef_in(coef[32]), .rdup_out(a6_wr[273]), .rdlo_out(a6_wr[281]));
			radix2 #(.width(width)) rd_st5_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[274]), .rdlo_in(a5_wr[282]),  .coef_in(coef[64]), .rdup_out(a6_wr[274]), .rdlo_out(a6_wr[282]));
			radix2 #(.width(width)) rd_st5_275  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[275]), .rdlo_in(a5_wr[283]),  .coef_in(coef[96]), .rdup_out(a6_wr[275]), .rdlo_out(a6_wr[283]));
			radix2 #(.width(width)) rd_st5_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[276]), .rdlo_in(a5_wr[284]),  .coef_in(coef[128]), .rdup_out(a6_wr[276]), .rdlo_out(a6_wr[284]));
			radix2 #(.width(width)) rd_st5_277  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[277]), .rdlo_in(a5_wr[285]),  .coef_in(coef[160]), .rdup_out(a6_wr[277]), .rdlo_out(a6_wr[285]));
			radix2 #(.width(width)) rd_st5_278  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[278]), .rdlo_in(a5_wr[286]),  .coef_in(coef[192]), .rdup_out(a6_wr[278]), .rdlo_out(a6_wr[286]));
			radix2 #(.width(width)) rd_st5_279  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[279]), .rdlo_in(a5_wr[287]),  .coef_in(coef[224]), .rdup_out(a6_wr[279]), .rdlo_out(a6_wr[287]));
			radix2 #(.width(width)) rd_st5_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[288]), .rdlo_in(a5_wr[296]),  .coef_in(coef[0]), .rdup_out(a6_wr[288]), .rdlo_out(a6_wr[296]));
			radix2 #(.width(width)) rd_st5_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[289]), .rdlo_in(a5_wr[297]),  .coef_in(coef[32]), .rdup_out(a6_wr[289]), .rdlo_out(a6_wr[297]));
			radix2 #(.width(width)) rd_st5_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[290]), .rdlo_in(a5_wr[298]),  .coef_in(coef[64]), .rdup_out(a6_wr[290]), .rdlo_out(a6_wr[298]));
			radix2 #(.width(width)) rd_st5_291  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[291]), .rdlo_in(a5_wr[299]),  .coef_in(coef[96]), .rdup_out(a6_wr[291]), .rdlo_out(a6_wr[299]));
			radix2 #(.width(width)) rd_st5_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[292]), .rdlo_in(a5_wr[300]),  .coef_in(coef[128]), .rdup_out(a6_wr[292]), .rdlo_out(a6_wr[300]));
			radix2 #(.width(width)) rd_st5_293  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[293]), .rdlo_in(a5_wr[301]),  .coef_in(coef[160]), .rdup_out(a6_wr[293]), .rdlo_out(a6_wr[301]));
			radix2 #(.width(width)) rd_st5_294  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[294]), .rdlo_in(a5_wr[302]),  .coef_in(coef[192]), .rdup_out(a6_wr[294]), .rdlo_out(a6_wr[302]));
			radix2 #(.width(width)) rd_st5_295  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[295]), .rdlo_in(a5_wr[303]),  .coef_in(coef[224]), .rdup_out(a6_wr[295]), .rdlo_out(a6_wr[303]));
			radix2 #(.width(width)) rd_st5_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[304]), .rdlo_in(a5_wr[312]),  .coef_in(coef[0]), .rdup_out(a6_wr[304]), .rdlo_out(a6_wr[312]));
			radix2 #(.width(width)) rd_st5_305  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[305]), .rdlo_in(a5_wr[313]),  .coef_in(coef[32]), .rdup_out(a6_wr[305]), .rdlo_out(a6_wr[313]));
			radix2 #(.width(width)) rd_st5_306  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[306]), .rdlo_in(a5_wr[314]),  .coef_in(coef[64]), .rdup_out(a6_wr[306]), .rdlo_out(a6_wr[314]));
			radix2 #(.width(width)) rd_st5_307  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[307]), .rdlo_in(a5_wr[315]),  .coef_in(coef[96]), .rdup_out(a6_wr[307]), .rdlo_out(a6_wr[315]));
			radix2 #(.width(width)) rd_st5_308  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[308]), .rdlo_in(a5_wr[316]),  .coef_in(coef[128]), .rdup_out(a6_wr[308]), .rdlo_out(a6_wr[316]));
			radix2 #(.width(width)) rd_st5_309  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[309]), .rdlo_in(a5_wr[317]),  .coef_in(coef[160]), .rdup_out(a6_wr[309]), .rdlo_out(a6_wr[317]));
			radix2 #(.width(width)) rd_st5_310  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[310]), .rdlo_in(a5_wr[318]),  .coef_in(coef[192]), .rdup_out(a6_wr[310]), .rdlo_out(a6_wr[318]));
			radix2 #(.width(width)) rd_st5_311  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[311]), .rdlo_in(a5_wr[319]),  .coef_in(coef[224]), .rdup_out(a6_wr[311]), .rdlo_out(a6_wr[319]));
			radix2 #(.width(width)) rd_st5_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[320]), .rdlo_in(a5_wr[328]),  .coef_in(coef[0]), .rdup_out(a6_wr[320]), .rdlo_out(a6_wr[328]));
			radix2 #(.width(width)) rd_st5_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[321]), .rdlo_in(a5_wr[329]),  .coef_in(coef[32]), .rdup_out(a6_wr[321]), .rdlo_out(a6_wr[329]));
			radix2 #(.width(width)) rd_st5_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[322]), .rdlo_in(a5_wr[330]),  .coef_in(coef[64]), .rdup_out(a6_wr[322]), .rdlo_out(a6_wr[330]));
			radix2 #(.width(width)) rd_st5_323  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[323]), .rdlo_in(a5_wr[331]),  .coef_in(coef[96]), .rdup_out(a6_wr[323]), .rdlo_out(a6_wr[331]));
			radix2 #(.width(width)) rd_st5_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[324]), .rdlo_in(a5_wr[332]),  .coef_in(coef[128]), .rdup_out(a6_wr[324]), .rdlo_out(a6_wr[332]));
			radix2 #(.width(width)) rd_st5_325  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[325]), .rdlo_in(a5_wr[333]),  .coef_in(coef[160]), .rdup_out(a6_wr[325]), .rdlo_out(a6_wr[333]));
			radix2 #(.width(width)) rd_st5_326  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[326]), .rdlo_in(a5_wr[334]),  .coef_in(coef[192]), .rdup_out(a6_wr[326]), .rdlo_out(a6_wr[334]));
			radix2 #(.width(width)) rd_st5_327  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[327]), .rdlo_in(a5_wr[335]),  .coef_in(coef[224]), .rdup_out(a6_wr[327]), .rdlo_out(a6_wr[335]));
			radix2 #(.width(width)) rd_st5_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[336]), .rdlo_in(a5_wr[344]),  .coef_in(coef[0]), .rdup_out(a6_wr[336]), .rdlo_out(a6_wr[344]));
			radix2 #(.width(width)) rd_st5_337  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[337]), .rdlo_in(a5_wr[345]),  .coef_in(coef[32]), .rdup_out(a6_wr[337]), .rdlo_out(a6_wr[345]));
			radix2 #(.width(width)) rd_st5_338  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[338]), .rdlo_in(a5_wr[346]),  .coef_in(coef[64]), .rdup_out(a6_wr[338]), .rdlo_out(a6_wr[346]));
			radix2 #(.width(width)) rd_st5_339  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[339]), .rdlo_in(a5_wr[347]),  .coef_in(coef[96]), .rdup_out(a6_wr[339]), .rdlo_out(a6_wr[347]));
			radix2 #(.width(width)) rd_st5_340  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[340]), .rdlo_in(a5_wr[348]),  .coef_in(coef[128]), .rdup_out(a6_wr[340]), .rdlo_out(a6_wr[348]));
			radix2 #(.width(width)) rd_st5_341  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[341]), .rdlo_in(a5_wr[349]),  .coef_in(coef[160]), .rdup_out(a6_wr[341]), .rdlo_out(a6_wr[349]));
			radix2 #(.width(width)) rd_st5_342  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[342]), .rdlo_in(a5_wr[350]),  .coef_in(coef[192]), .rdup_out(a6_wr[342]), .rdlo_out(a6_wr[350]));
			radix2 #(.width(width)) rd_st5_343  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[343]), .rdlo_in(a5_wr[351]),  .coef_in(coef[224]), .rdup_out(a6_wr[343]), .rdlo_out(a6_wr[351]));
			radix2 #(.width(width)) rd_st5_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[352]), .rdlo_in(a5_wr[360]),  .coef_in(coef[0]), .rdup_out(a6_wr[352]), .rdlo_out(a6_wr[360]));
			radix2 #(.width(width)) rd_st5_353  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[353]), .rdlo_in(a5_wr[361]),  .coef_in(coef[32]), .rdup_out(a6_wr[353]), .rdlo_out(a6_wr[361]));
			radix2 #(.width(width)) rd_st5_354  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[354]), .rdlo_in(a5_wr[362]),  .coef_in(coef[64]), .rdup_out(a6_wr[354]), .rdlo_out(a6_wr[362]));
			radix2 #(.width(width)) rd_st5_355  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[355]), .rdlo_in(a5_wr[363]),  .coef_in(coef[96]), .rdup_out(a6_wr[355]), .rdlo_out(a6_wr[363]));
			radix2 #(.width(width)) rd_st5_356  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[356]), .rdlo_in(a5_wr[364]),  .coef_in(coef[128]), .rdup_out(a6_wr[356]), .rdlo_out(a6_wr[364]));
			radix2 #(.width(width)) rd_st5_357  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[357]), .rdlo_in(a5_wr[365]),  .coef_in(coef[160]), .rdup_out(a6_wr[357]), .rdlo_out(a6_wr[365]));
			radix2 #(.width(width)) rd_st5_358  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[358]), .rdlo_in(a5_wr[366]),  .coef_in(coef[192]), .rdup_out(a6_wr[358]), .rdlo_out(a6_wr[366]));
			radix2 #(.width(width)) rd_st5_359  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[359]), .rdlo_in(a5_wr[367]),  .coef_in(coef[224]), .rdup_out(a6_wr[359]), .rdlo_out(a6_wr[367]));
			radix2 #(.width(width)) rd_st5_368  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[368]), .rdlo_in(a5_wr[376]),  .coef_in(coef[0]), .rdup_out(a6_wr[368]), .rdlo_out(a6_wr[376]));
			radix2 #(.width(width)) rd_st5_369  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[369]), .rdlo_in(a5_wr[377]),  .coef_in(coef[32]), .rdup_out(a6_wr[369]), .rdlo_out(a6_wr[377]));
			radix2 #(.width(width)) rd_st5_370  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[370]), .rdlo_in(a5_wr[378]),  .coef_in(coef[64]), .rdup_out(a6_wr[370]), .rdlo_out(a6_wr[378]));
			radix2 #(.width(width)) rd_st5_371  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[371]), .rdlo_in(a5_wr[379]),  .coef_in(coef[96]), .rdup_out(a6_wr[371]), .rdlo_out(a6_wr[379]));
			radix2 #(.width(width)) rd_st5_372  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[372]), .rdlo_in(a5_wr[380]),  .coef_in(coef[128]), .rdup_out(a6_wr[372]), .rdlo_out(a6_wr[380]));
			radix2 #(.width(width)) rd_st5_373  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[373]), .rdlo_in(a5_wr[381]),  .coef_in(coef[160]), .rdup_out(a6_wr[373]), .rdlo_out(a6_wr[381]));
			radix2 #(.width(width)) rd_st5_374  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[374]), .rdlo_in(a5_wr[382]),  .coef_in(coef[192]), .rdup_out(a6_wr[374]), .rdlo_out(a6_wr[382]));
			radix2 #(.width(width)) rd_st5_375  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[375]), .rdlo_in(a5_wr[383]),  .coef_in(coef[224]), .rdup_out(a6_wr[375]), .rdlo_out(a6_wr[383]));
			radix2 #(.width(width)) rd_st5_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[384]), .rdlo_in(a5_wr[392]),  .coef_in(coef[0]), .rdup_out(a6_wr[384]), .rdlo_out(a6_wr[392]));
			radix2 #(.width(width)) rd_st5_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[385]), .rdlo_in(a5_wr[393]),  .coef_in(coef[32]), .rdup_out(a6_wr[385]), .rdlo_out(a6_wr[393]));
			radix2 #(.width(width)) rd_st5_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[386]), .rdlo_in(a5_wr[394]),  .coef_in(coef[64]), .rdup_out(a6_wr[386]), .rdlo_out(a6_wr[394]));
			radix2 #(.width(width)) rd_st5_387  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[387]), .rdlo_in(a5_wr[395]),  .coef_in(coef[96]), .rdup_out(a6_wr[387]), .rdlo_out(a6_wr[395]));
			radix2 #(.width(width)) rd_st5_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[388]), .rdlo_in(a5_wr[396]),  .coef_in(coef[128]), .rdup_out(a6_wr[388]), .rdlo_out(a6_wr[396]));
			radix2 #(.width(width)) rd_st5_389  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[389]), .rdlo_in(a5_wr[397]),  .coef_in(coef[160]), .rdup_out(a6_wr[389]), .rdlo_out(a6_wr[397]));
			radix2 #(.width(width)) rd_st5_390  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[390]), .rdlo_in(a5_wr[398]),  .coef_in(coef[192]), .rdup_out(a6_wr[390]), .rdlo_out(a6_wr[398]));
			radix2 #(.width(width)) rd_st5_391  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[391]), .rdlo_in(a5_wr[399]),  .coef_in(coef[224]), .rdup_out(a6_wr[391]), .rdlo_out(a6_wr[399]));
			radix2 #(.width(width)) rd_st5_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[400]), .rdlo_in(a5_wr[408]),  .coef_in(coef[0]), .rdup_out(a6_wr[400]), .rdlo_out(a6_wr[408]));
			radix2 #(.width(width)) rd_st5_401  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[401]), .rdlo_in(a5_wr[409]),  .coef_in(coef[32]), .rdup_out(a6_wr[401]), .rdlo_out(a6_wr[409]));
			radix2 #(.width(width)) rd_st5_402  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[402]), .rdlo_in(a5_wr[410]),  .coef_in(coef[64]), .rdup_out(a6_wr[402]), .rdlo_out(a6_wr[410]));
			radix2 #(.width(width)) rd_st5_403  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[403]), .rdlo_in(a5_wr[411]),  .coef_in(coef[96]), .rdup_out(a6_wr[403]), .rdlo_out(a6_wr[411]));
			radix2 #(.width(width)) rd_st5_404  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[404]), .rdlo_in(a5_wr[412]),  .coef_in(coef[128]), .rdup_out(a6_wr[404]), .rdlo_out(a6_wr[412]));
			radix2 #(.width(width)) rd_st5_405  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[405]), .rdlo_in(a5_wr[413]),  .coef_in(coef[160]), .rdup_out(a6_wr[405]), .rdlo_out(a6_wr[413]));
			radix2 #(.width(width)) rd_st5_406  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[406]), .rdlo_in(a5_wr[414]),  .coef_in(coef[192]), .rdup_out(a6_wr[406]), .rdlo_out(a6_wr[414]));
			radix2 #(.width(width)) rd_st5_407  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[407]), .rdlo_in(a5_wr[415]),  .coef_in(coef[224]), .rdup_out(a6_wr[407]), .rdlo_out(a6_wr[415]));
			radix2 #(.width(width)) rd_st5_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[416]), .rdlo_in(a5_wr[424]),  .coef_in(coef[0]), .rdup_out(a6_wr[416]), .rdlo_out(a6_wr[424]));
			radix2 #(.width(width)) rd_st5_417  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[417]), .rdlo_in(a5_wr[425]),  .coef_in(coef[32]), .rdup_out(a6_wr[417]), .rdlo_out(a6_wr[425]));
			radix2 #(.width(width)) rd_st5_418  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[418]), .rdlo_in(a5_wr[426]),  .coef_in(coef[64]), .rdup_out(a6_wr[418]), .rdlo_out(a6_wr[426]));
			radix2 #(.width(width)) rd_st5_419  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[419]), .rdlo_in(a5_wr[427]),  .coef_in(coef[96]), .rdup_out(a6_wr[419]), .rdlo_out(a6_wr[427]));
			radix2 #(.width(width)) rd_st5_420  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[420]), .rdlo_in(a5_wr[428]),  .coef_in(coef[128]), .rdup_out(a6_wr[420]), .rdlo_out(a6_wr[428]));
			radix2 #(.width(width)) rd_st5_421  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[421]), .rdlo_in(a5_wr[429]),  .coef_in(coef[160]), .rdup_out(a6_wr[421]), .rdlo_out(a6_wr[429]));
			radix2 #(.width(width)) rd_st5_422  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[422]), .rdlo_in(a5_wr[430]),  .coef_in(coef[192]), .rdup_out(a6_wr[422]), .rdlo_out(a6_wr[430]));
			radix2 #(.width(width)) rd_st5_423  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[423]), .rdlo_in(a5_wr[431]),  .coef_in(coef[224]), .rdup_out(a6_wr[423]), .rdlo_out(a6_wr[431]));
			radix2 #(.width(width)) rd_st5_432  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[432]), .rdlo_in(a5_wr[440]),  .coef_in(coef[0]), .rdup_out(a6_wr[432]), .rdlo_out(a6_wr[440]));
			radix2 #(.width(width)) rd_st5_433  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[433]), .rdlo_in(a5_wr[441]),  .coef_in(coef[32]), .rdup_out(a6_wr[433]), .rdlo_out(a6_wr[441]));
			radix2 #(.width(width)) rd_st5_434  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[434]), .rdlo_in(a5_wr[442]),  .coef_in(coef[64]), .rdup_out(a6_wr[434]), .rdlo_out(a6_wr[442]));
			radix2 #(.width(width)) rd_st5_435  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[435]), .rdlo_in(a5_wr[443]),  .coef_in(coef[96]), .rdup_out(a6_wr[435]), .rdlo_out(a6_wr[443]));
			radix2 #(.width(width)) rd_st5_436  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[436]), .rdlo_in(a5_wr[444]),  .coef_in(coef[128]), .rdup_out(a6_wr[436]), .rdlo_out(a6_wr[444]));
			radix2 #(.width(width)) rd_st5_437  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[437]), .rdlo_in(a5_wr[445]),  .coef_in(coef[160]), .rdup_out(a6_wr[437]), .rdlo_out(a6_wr[445]));
			radix2 #(.width(width)) rd_st5_438  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[438]), .rdlo_in(a5_wr[446]),  .coef_in(coef[192]), .rdup_out(a6_wr[438]), .rdlo_out(a6_wr[446]));
			radix2 #(.width(width)) rd_st5_439  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[439]), .rdlo_in(a5_wr[447]),  .coef_in(coef[224]), .rdup_out(a6_wr[439]), .rdlo_out(a6_wr[447]));
			radix2 #(.width(width)) rd_st5_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[448]), .rdlo_in(a5_wr[456]),  .coef_in(coef[0]), .rdup_out(a6_wr[448]), .rdlo_out(a6_wr[456]));
			radix2 #(.width(width)) rd_st5_449  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[449]), .rdlo_in(a5_wr[457]),  .coef_in(coef[32]), .rdup_out(a6_wr[449]), .rdlo_out(a6_wr[457]));
			radix2 #(.width(width)) rd_st5_450  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[450]), .rdlo_in(a5_wr[458]),  .coef_in(coef[64]), .rdup_out(a6_wr[450]), .rdlo_out(a6_wr[458]));
			radix2 #(.width(width)) rd_st5_451  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[451]), .rdlo_in(a5_wr[459]),  .coef_in(coef[96]), .rdup_out(a6_wr[451]), .rdlo_out(a6_wr[459]));
			radix2 #(.width(width)) rd_st5_452  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[452]), .rdlo_in(a5_wr[460]),  .coef_in(coef[128]), .rdup_out(a6_wr[452]), .rdlo_out(a6_wr[460]));
			radix2 #(.width(width)) rd_st5_453  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[453]), .rdlo_in(a5_wr[461]),  .coef_in(coef[160]), .rdup_out(a6_wr[453]), .rdlo_out(a6_wr[461]));
			radix2 #(.width(width)) rd_st5_454  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[454]), .rdlo_in(a5_wr[462]),  .coef_in(coef[192]), .rdup_out(a6_wr[454]), .rdlo_out(a6_wr[462]));
			radix2 #(.width(width)) rd_st5_455  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[455]), .rdlo_in(a5_wr[463]),  .coef_in(coef[224]), .rdup_out(a6_wr[455]), .rdlo_out(a6_wr[463]));
			radix2 #(.width(width)) rd_st5_464  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[464]), .rdlo_in(a5_wr[472]),  .coef_in(coef[0]), .rdup_out(a6_wr[464]), .rdlo_out(a6_wr[472]));
			radix2 #(.width(width)) rd_st5_465  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[465]), .rdlo_in(a5_wr[473]),  .coef_in(coef[32]), .rdup_out(a6_wr[465]), .rdlo_out(a6_wr[473]));
			radix2 #(.width(width)) rd_st5_466  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[466]), .rdlo_in(a5_wr[474]),  .coef_in(coef[64]), .rdup_out(a6_wr[466]), .rdlo_out(a6_wr[474]));
			radix2 #(.width(width)) rd_st5_467  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[467]), .rdlo_in(a5_wr[475]),  .coef_in(coef[96]), .rdup_out(a6_wr[467]), .rdlo_out(a6_wr[475]));
			radix2 #(.width(width)) rd_st5_468  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[468]), .rdlo_in(a5_wr[476]),  .coef_in(coef[128]), .rdup_out(a6_wr[468]), .rdlo_out(a6_wr[476]));
			radix2 #(.width(width)) rd_st5_469  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[469]), .rdlo_in(a5_wr[477]),  .coef_in(coef[160]), .rdup_out(a6_wr[469]), .rdlo_out(a6_wr[477]));
			radix2 #(.width(width)) rd_st5_470  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[470]), .rdlo_in(a5_wr[478]),  .coef_in(coef[192]), .rdup_out(a6_wr[470]), .rdlo_out(a6_wr[478]));
			radix2 #(.width(width)) rd_st5_471  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[471]), .rdlo_in(a5_wr[479]),  .coef_in(coef[224]), .rdup_out(a6_wr[471]), .rdlo_out(a6_wr[479]));
			radix2 #(.width(width)) rd_st5_480  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[480]), .rdlo_in(a5_wr[488]),  .coef_in(coef[0]), .rdup_out(a6_wr[480]), .rdlo_out(a6_wr[488]));
			radix2 #(.width(width)) rd_st5_481  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[481]), .rdlo_in(a5_wr[489]),  .coef_in(coef[32]), .rdup_out(a6_wr[481]), .rdlo_out(a6_wr[489]));
			radix2 #(.width(width)) rd_st5_482  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[482]), .rdlo_in(a5_wr[490]),  .coef_in(coef[64]), .rdup_out(a6_wr[482]), .rdlo_out(a6_wr[490]));
			radix2 #(.width(width)) rd_st5_483  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[483]), .rdlo_in(a5_wr[491]),  .coef_in(coef[96]), .rdup_out(a6_wr[483]), .rdlo_out(a6_wr[491]));
			radix2 #(.width(width)) rd_st5_484  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[484]), .rdlo_in(a5_wr[492]),  .coef_in(coef[128]), .rdup_out(a6_wr[484]), .rdlo_out(a6_wr[492]));
			radix2 #(.width(width)) rd_st5_485  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[485]), .rdlo_in(a5_wr[493]),  .coef_in(coef[160]), .rdup_out(a6_wr[485]), .rdlo_out(a6_wr[493]));
			radix2 #(.width(width)) rd_st5_486  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[486]), .rdlo_in(a5_wr[494]),  .coef_in(coef[192]), .rdup_out(a6_wr[486]), .rdlo_out(a6_wr[494]));
			radix2 #(.width(width)) rd_st5_487  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[487]), .rdlo_in(a5_wr[495]),  .coef_in(coef[224]), .rdup_out(a6_wr[487]), .rdlo_out(a6_wr[495]));
			radix2 #(.width(width)) rd_st5_496  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[496]), .rdlo_in(a5_wr[504]),  .coef_in(coef[0]), .rdup_out(a6_wr[496]), .rdlo_out(a6_wr[504]));
			radix2 #(.width(width)) rd_st5_497  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[497]), .rdlo_in(a5_wr[505]),  .coef_in(coef[32]), .rdup_out(a6_wr[497]), .rdlo_out(a6_wr[505]));
			radix2 #(.width(width)) rd_st5_498  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[498]), .rdlo_in(a5_wr[506]),  .coef_in(coef[64]), .rdup_out(a6_wr[498]), .rdlo_out(a6_wr[506]));
			radix2 #(.width(width)) rd_st5_499  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[499]), .rdlo_in(a5_wr[507]),  .coef_in(coef[96]), .rdup_out(a6_wr[499]), .rdlo_out(a6_wr[507]));
			radix2 #(.width(width)) rd_st5_500  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[500]), .rdlo_in(a5_wr[508]),  .coef_in(coef[128]), .rdup_out(a6_wr[500]), .rdlo_out(a6_wr[508]));
			radix2 #(.width(width)) rd_st5_501  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[501]), .rdlo_in(a5_wr[509]),  .coef_in(coef[160]), .rdup_out(a6_wr[501]), .rdlo_out(a6_wr[509]));
			radix2 #(.width(width)) rd_st5_502  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[502]), .rdlo_in(a5_wr[510]),  .coef_in(coef[192]), .rdup_out(a6_wr[502]), .rdlo_out(a6_wr[510]));
			radix2 #(.width(width)) rd_st5_503  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a5_wr[503]), .rdlo_in(a5_wr[511]),  .coef_in(coef[224]), .rdup_out(a6_wr[503]), .rdlo_out(a6_wr[511]));

		//--- radix stage 6
			radix2 #(.width(width)) rd_st6_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[0]), .rdlo_in(a6_wr[4]),  .coef_in(coef[0]), .rdup_out(a7_wr[0]), .rdlo_out(a7_wr[4]));
			radix2 #(.width(width)) rd_st6_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[1]), .rdlo_in(a6_wr[5]),  .coef_in(coef[64]), .rdup_out(a7_wr[1]), .rdlo_out(a7_wr[5]));
			radix2 #(.width(width)) rd_st6_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[2]), .rdlo_in(a6_wr[6]),  .coef_in(coef[128]), .rdup_out(a7_wr[2]), .rdlo_out(a7_wr[6]));
			radix2 #(.width(width)) rd_st6_3   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[3]), .rdlo_in(a6_wr[7]),  .coef_in(coef[192]), .rdup_out(a7_wr[3]), .rdlo_out(a7_wr[7]));
			radix2 #(.width(width)) rd_st6_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[8]), .rdlo_in(a6_wr[12]),  .coef_in(coef[0]), .rdup_out(a7_wr[8]), .rdlo_out(a7_wr[12]));
			radix2 #(.width(width)) rd_st6_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[9]), .rdlo_in(a6_wr[13]),  .coef_in(coef[64]), .rdup_out(a7_wr[9]), .rdlo_out(a7_wr[13]));
			radix2 #(.width(width)) rd_st6_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[10]), .rdlo_in(a6_wr[14]),  .coef_in(coef[128]), .rdup_out(a7_wr[10]), .rdlo_out(a7_wr[14]));
			radix2 #(.width(width)) rd_st6_11  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[11]), .rdlo_in(a6_wr[15]),  .coef_in(coef[192]), .rdup_out(a7_wr[11]), .rdlo_out(a7_wr[15]));
			radix2 #(.width(width)) rd_st6_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[16]), .rdlo_in(a6_wr[20]),  .coef_in(coef[0]), .rdup_out(a7_wr[16]), .rdlo_out(a7_wr[20]));
			radix2 #(.width(width)) rd_st6_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[17]), .rdlo_in(a6_wr[21]),  .coef_in(coef[64]), .rdup_out(a7_wr[17]), .rdlo_out(a7_wr[21]));
			radix2 #(.width(width)) rd_st6_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[18]), .rdlo_in(a6_wr[22]),  .coef_in(coef[128]), .rdup_out(a7_wr[18]), .rdlo_out(a7_wr[22]));
			radix2 #(.width(width)) rd_st6_19  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[19]), .rdlo_in(a6_wr[23]),  .coef_in(coef[192]), .rdup_out(a7_wr[19]), .rdlo_out(a7_wr[23]));
			radix2 #(.width(width)) rd_st6_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[24]), .rdlo_in(a6_wr[28]),  .coef_in(coef[0]), .rdup_out(a7_wr[24]), .rdlo_out(a7_wr[28]));
			radix2 #(.width(width)) rd_st6_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[25]), .rdlo_in(a6_wr[29]),  .coef_in(coef[64]), .rdup_out(a7_wr[25]), .rdlo_out(a7_wr[29]));
			radix2 #(.width(width)) rd_st6_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[26]), .rdlo_in(a6_wr[30]),  .coef_in(coef[128]), .rdup_out(a7_wr[26]), .rdlo_out(a7_wr[30]));
			radix2 #(.width(width)) rd_st6_27  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[27]), .rdlo_in(a6_wr[31]),  .coef_in(coef[192]), .rdup_out(a7_wr[27]), .rdlo_out(a7_wr[31]));
			radix2 #(.width(width)) rd_st6_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[32]), .rdlo_in(a6_wr[36]),  .coef_in(coef[0]), .rdup_out(a7_wr[32]), .rdlo_out(a7_wr[36]));
			radix2 #(.width(width)) rd_st6_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[33]), .rdlo_in(a6_wr[37]),  .coef_in(coef[64]), .rdup_out(a7_wr[33]), .rdlo_out(a7_wr[37]));
			radix2 #(.width(width)) rd_st6_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[34]), .rdlo_in(a6_wr[38]),  .coef_in(coef[128]), .rdup_out(a7_wr[34]), .rdlo_out(a7_wr[38]));
			radix2 #(.width(width)) rd_st6_35  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[35]), .rdlo_in(a6_wr[39]),  .coef_in(coef[192]), .rdup_out(a7_wr[35]), .rdlo_out(a7_wr[39]));
			radix2 #(.width(width)) rd_st6_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[40]), .rdlo_in(a6_wr[44]),  .coef_in(coef[0]), .rdup_out(a7_wr[40]), .rdlo_out(a7_wr[44]));
			radix2 #(.width(width)) rd_st6_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[41]), .rdlo_in(a6_wr[45]),  .coef_in(coef[64]), .rdup_out(a7_wr[41]), .rdlo_out(a7_wr[45]));
			radix2 #(.width(width)) rd_st6_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[42]), .rdlo_in(a6_wr[46]),  .coef_in(coef[128]), .rdup_out(a7_wr[42]), .rdlo_out(a7_wr[46]));
			radix2 #(.width(width)) rd_st6_43  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[43]), .rdlo_in(a6_wr[47]),  .coef_in(coef[192]), .rdup_out(a7_wr[43]), .rdlo_out(a7_wr[47]));
			radix2 #(.width(width)) rd_st6_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[48]), .rdlo_in(a6_wr[52]),  .coef_in(coef[0]), .rdup_out(a7_wr[48]), .rdlo_out(a7_wr[52]));
			radix2 #(.width(width)) rd_st6_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[49]), .rdlo_in(a6_wr[53]),  .coef_in(coef[64]), .rdup_out(a7_wr[49]), .rdlo_out(a7_wr[53]));
			radix2 #(.width(width)) rd_st6_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[50]), .rdlo_in(a6_wr[54]),  .coef_in(coef[128]), .rdup_out(a7_wr[50]), .rdlo_out(a7_wr[54]));
			radix2 #(.width(width)) rd_st6_51  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[51]), .rdlo_in(a6_wr[55]),  .coef_in(coef[192]), .rdup_out(a7_wr[51]), .rdlo_out(a7_wr[55]));
			radix2 #(.width(width)) rd_st6_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[56]), .rdlo_in(a6_wr[60]),  .coef_in(coef[0]), .rdup_out(a7_wr[56]), .rdlo_out(a7_wr[60]));
			radix2 #(.width(width)) rd_st6_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[57]), .rdlo_in(a6_wr[61]),  .coef_in(coef[64]), .rdup_out(a7_wr[57]), .rdlo_out(a7_wr[61]));
			radix2 #(.width(width)) rd_st6_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[58]), .rdlo_in(a6_wr[62]),  .coef_in(coef[128]), .rdup_out(a7_wr[58]), .rdlo_out(a7_wr[62]));
			radix2 #(.width(width)) rd_st6_59  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[59]), .rdlo_in(a6_wr[63]),  .coef_in(coef[192]), .rdup_out(a7_wr[59]), .rdlo_out(a7_wr[63]));
			radix2 #(.width(width)) rd_st6_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[64]), .rdlo_in(a6_wr[68]),  .coef_in(coef[0]), .rdup_out(a7_wr[64]), .rdlo_out(a7_wr[68]));
			radix2 #(.width(width)) rd_st6_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[65]), .rdlo_in(a6_wr[69]),  .coef_in(coef[64]), .rdup_out(a7_wr[65]), .rdlo_out(a7_wr[69]));
			radix2 #(.width(width)) rd_st6_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[66]), .rdlo_in(a6_wr[70]),  .coef_in(coef[128]), .rdup_out(a7_wr[66]), .rdlo_out(a7_wr[70]));
			radix2 #(.width(width)) rd_st6_67  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[67]), .rdlo_in(a6_wr[71]),  .coef_in(coef[192]), .rdup_out(a7_wr[67]), .rdlo_out(a7_wr[71]));
			radix2 #(.width(width)) rd_st6_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[72]), .rdlo_in(a6_wr[76]),  .coef_in(coef[0]), .rdup_out(a7_wr[72]), .rdlo_out(a7_wr[76]));
			radix2 #(.width(width)) rd_st6_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[73]), .rdlo_in(a6_wr[77]),  .coef_in(coef[64]), .rdup_out(a7_wr[73]), .rdlo_out(a7_wr[77]));
			radix2 #(.width(width)) rd_st6_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[74]), .rdlo_in(a6_wr[78]),  .coef_in(coef[128]), .rdup_out(a7_wr[74]), .rdlo_out(a7_wr[78]));
			radix2 #(.width(width)) rd_st6_75  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[75]), .rdlo_in(a6_wr[79]),  .coef_in(coef[192]), .rdup_out(a7_wr[75]), .rdlo_out(a7_wr[79]));
			radix2 #(.width(width)) rd_st6_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[80]), .rdlo_in(a6_wr[84]),  .coef_in(coef[0]), .rdup_out(a7_wr[80]), .rdlo_out(a7_wr[84]));
			radix2 #(.width(width)) rd_st6_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[81]), .rdlo_in(a6_wr[85]),  .coef_in(coef[64]), .rdup_out(a7_wr[81]), .rdlo_out(a7_wr[85]));
			radix2 #(.width(width)) rd_st6_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[82]), .rdlo_in(a6_wr[86]),  .coef_in(coef[128]), .rdup_out(a7_wr[82]), .rdlo_out(a7_wr[86]));
			radix2 #(.width(width)) rd_st6_83  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[83]), .rdlo_in(a6_wr[87]),  .coef_in(coef[192]), .rdup_out(a7_wr[83]), .rdlo_out(a7_wr[87]));
			radix2 #(.width(width)) rd_st6_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[88]), .rdlo_in(a6_wr[92]),  .coef_in(coef[0]), .rdup_out(a7_wr[88]), .rdlo_out(a7_wr[92]));
			radix2 #(.width(width)) rd_st6_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[89]), .rdlo_in(a6_wr[93]),  .coef_in(coef[64]), .rdup_out(a7_wr[89]), .rdlo_out(a7_wr[93]));
			radix2 #(.width(width)) rd_st6_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[90]), .rdlo_in(a6_wr[94]),  .coef_in(coef[128]), .rdup_out(a7_wr[90]), .rdlo_out(a7_wr[94]));
			radix2 #(.width(width)) rd_st6_91  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[91]), .rdlo_in(a6_wr[95]),  .coef_in(coef[192]), .rdup_out(a7_wr[91]), .rdlo_out(a7_wr[95]));
			radix2 #(.width(width)) rd_st6_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[96]), .rdlo_in(a6_wr[100]),  .coef_in(coef[0]), .rdup_out(a7_wr[96]), .rdlo_out(a7_wr[100]));
			radix2 #(.width(width)) rd_st6_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[97]), .rdlo_in(a6_wr[101]),  .coef_in(coef[64]), .rdup_out(a7_wr[97]), .rdlo_out(a7_wr[101]));
			radix2 #(.width(width)) rd_st6_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[98]), .rdlo_in(a6_wr[102]),  .coef_in(coef[128]), .rdup_out(a7_wr[98]), .rdlo_out(a7_wr[102]));
			radix2 #(.width(width)) rd_st6_99  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[99]), .rdlo_in(a6_wr[103]),  .coef_in(coef[192]), .rdup_out(a7_wr[99]), .rdlo_out(a7_wr[103]));
			radix2 #(.width(width)) rd_st6_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[104]), .rdlo_in(a6_wr[108]),  .coef_in(coef[0]), .rdup_out(a7_wr[104]), .rdlo_out(a7_wr[108]));
			radix2 #(.width(width)) rd_st6_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[105]), .rdlo_in(a6_wr[109]),  .coef_in(coef[64]), .rdup_out(a7_wr[105]), .rdlo_out(a7_wr[109]));
			radix2 #(.width(width)) rd_st6_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[106]), .rdlo_in(a6_wr[110]),  .coef_in(coef[128]), .rdup_out(a7_wr[106]), .rdlo_out(a7_wr[110]));
			radix2 #(.width(width)) rd_st6_107  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[107]), .rdlo_in(a6_wr[111]),  .coef_in(coef[192]), .rdup_out(a7_wr[107]), .rdlo_out(a7_wr[111]));
			radix2 #(.width(width)) rd_st6_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[112]), .rdlo_in(a6_wr[116]),  .coef_in(coef[0]), .rdup_out(a7_wr[112]), .rdlo_out(a7_wr[116]));
			radix2 #(.width(width)) rd_st6_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[113]), .rdlo_in(a6_wr[117]),  .coef_in(coef[64]), .rdup_out(a7_wr[113]), .rdlo_out(a7_wr[117]));
			radix2 #(.width(width)) rd_st6_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[114]), .rdlo_in(a6_wr[118]),  .coef_in(coef[128]), .rdup_out(a7_wr[114]), .rdlo_out(a7_wr[118]));
			radix2 #(.width(width)) rd_st6_115  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[115]), .rdlo_in(a6_wr[119]),  .coef_in(coef[192]), .rdup_out(a7_wr[115]), .rdlo_out(a7_wr[119]));
			radix2 #(.width(width)) rd_st6_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[120]), .rdlo_in(a6_wr[124]),  .coef_in(coef[0]), .rdup_out(a7_wr[120]), .rdlo_out(a7_wr[124]));
			radix2 #(.width(width)) rd_st6_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[121]), .rdlo_in(a6_wr[125]),  .coef_in(coef[64]), .rdup_out(a7_wr[121]), .rdlo_out(a7_wr[125]));
			radix2 #(.width(width)) rd_st6_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[122]), .rdlo_in(a6_wr[126]),  .coef_in(coef[128]), .rdup_out(a7_wr[122]), .rdlo_out(a7_wr[126]));
			radix2 #(.width(width)) rd_st6_123  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[123]), .rdlo_in(a6_wr[127]),  .coef_in(coef[192]), .rdup_out(a7_wr[123]), .rdlo_out(a7_wr[127]));
			radix2 #(.width(width)) rd_st6_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[128]), .rdlo_in(a6_wr[132]),  .coef_in(coef[0]), .rdup_out(a7_wr[128]), .rdlo_out(a7_wr[132]));
			radix2 #(.width(width)) rd_st6_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[129]), .rdlo_in(a6_wr[133]),  .coef_in(coef[64]), .rdup_out(a7_wr[129]), .rdlo_out(a7_wr[133]));
			radix2 #(.width(width)) rd_st6_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[130]), .rdlo_in(a6_wr[134]),  .coef_in(coef[128]), .rdup_out(a7_wr[130]), .rdlo_out(a7_wr[134]));
			radix2 #(.width(width)) rd_st6_131  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[131]), .rdlo_in(a6_wr[135]),  .coef_in(coef[192]), .rdup_out(a7_wr[131]), .rdlo_out(a7_wr[135]));
			radix2 #(.width(width)) rd_st6_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[136]), .rdlo_in(a6_wr[140]),  .coef_in(coef[0]), .rdup_out(a7_wr[136]), .rdlo_out(a7_wr[140]));
			radix2 #(.width(width)) rd_st6_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[137]), .rdlo_in(a6_wr[141]),  .coef_in(coef[64]), .rdup_out(a7_wr[137]), .rdlo_out(a7_wr[141]));
			radix2 #(.width(width)) rd_st6_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[138]), .rdlo_in(a6_wr[142]),  .coef_in(coef[128]), .rdup_out(a7_wr[138]), .rdlo_out(a7_wr[142]));
			radix2 #(.width(width)) rd_st6_139  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[139]), .rdlo_in(a6_wr[143]),  .coef_in(coef[192]), .rdup_out(a7_wr[139]), .rdlo_out(a7_wr[143]));
			radix2 #(.width(width)) rd_st6_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[144]), .rdlo_in(a6_wr[148]),  .coef_in(coef[0]), .rdup_out(a7_wr[144]), .rdlo_out(a7_wr[148]));
			radix2 #(.width(width)) rd_st6_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[145]), .rdlo_in(a6_wr[149]),  .coef_in(coef[64]), .rdup_out(a7_wr[145]), .rdlo_out(a7_wr[149]));
			radix2 #(.width(width)) rd_st6_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[146]), .rdlo_in(a6_wr[150]),  .coef_in(coef[128]), .rdup_out(a7_wr[146]), .rdlo_out(a7_wr[150]));
			radix2 #(.width(width)) rd_st6_147  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[147]), .rdlo_in(a6_wr[151]),  .coef_in(coef[192]), .rdup_out(a7_wr[147]), .rdlo_out(a7_wr[151]));
			radix2 #(.width(width)) rd_st6_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[152]), .rdlo_in(a6_wr[156]),  .coef_in(coef[0]), .rdup_out(a7_wr[152]), .rdlo_out(a7_wr[156]));
			radix2 #(.width(width)) rd_st6_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[153]), .rdlo_in(a6_wr[157]),  .coef_in(coef[64]), .rdup_out(a7_wr[153]), .rdlo_out(a7_wr[157]));
			radix2 #(.width(width)) rd_st6_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[154]), .rdlo_in(a6_wr[158]),  .coef_in(coef[128]), .rdup_out(a7_wr[154]), .rdlo_out(a7_wr[158]));
			radix2 #(.width(width)) rd_st6_155  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[155]), .rdlo_in(a6_wr[159]),  .coef_in(coef[192]), .rdup_out(a7_wr[155]), .rdlo_out(a7_wr[159]));
			radix2 #(.width(width)) rd_st6_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[160]), .rdlo_in(a6_wr[164]),  .coef_in(coef[0]), .rdup_out(a7_wr[160]), .rdlo_out(a7_wr[164]));
			radix2 #(.width(width)) rd_st6_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[161]), .rdlo_in(a6_wr[165]),  .coef_in(coef[64]), .rdup_out(a7_wr[161]), .rdlo_out(a7_wr[165]));
			radix2 #(.width(width)) rd_st6_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[162]), .rdlo_in(a6_wr[166]),  .coef_in(coef[128]), .rdup_out(a7_wr[162]), .rdlo_out(a7_wr[166]));
			radix2 #(.width(width)) rd_st6_163  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[163]), .rdlo_in(a6_wr[167]),  .coef_in(coef[192]), .rdup_out(a7_wr[163]), .rdlo_out(a7_wr[167]));
			radix2 #(.width(width)) rd_st6_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[168]), .rdlo_in(a6_wr[172]),  .coef_in(coef[0]), .rdup_out(a7_wr[168]), .rdlo_out(a7_wr[172]));
			radix2 #(.width(width)) rd_st6_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[169]), .rdlo_in(a6_wr[173]),  .coef_in(coef[64]), .rdup_out(a7_wr[169]), .rdlo_out(a7_wr[173]));
			radix2 #(.width(width)) rd_st6_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[170]), .rdlo_in(a6_wr[174]),  .coef_in(coef[128]), .rdup_out(a7_wr[170]), .rdlo_out(a7_wr[174]));
			radix2 #(.width(width)) rd_st6_171  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[171]), .rdlo_in(a6_wr[175]),  .coef_in(coef[192]), .rdup_out(a7_wr[171]), .rdlo_out(a7_wr[175]));
			radix2 #(.width(width)) rd_st6_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[176]), .rdlo_in(a6_wr[180]),  .coef_in(coef[0]), .rdup_out(a7_wr[176]), .rdlo_out(a7_wr[180]));
			radix2 #(.width(width)) rd_st6_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[177]), .rdlo_in(a6_wr[181]),  .coef_in(coef[64]), .rdup_out(a7_wr[177]), .rdlo_out(a7_wr[181]));
			radix2 #(.width(width)) rd_st6_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[178]), .rdlo_in(a6_wr[182]),  .coef_in(coef[128]), .rdup_out(a7_wr[178]), .rdlo_out(a7_wr[182]));
			radix2 #(.width(width)) rd_st6_179  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[179]), .rdlo_in(a6_wr[183]),  .coef_in(coef[192]), .rdup_out(a7_wr[179]), .rdlo_out(a7_wr[183]));
			radix2 #(.width(width)) rd_st6_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[184]), .rdlo_in(a6_wr[188]),  .coef_in(coef[0]), .rdup_out(a7_wr[184]), .rdlo_out(a7_wr[188]));
			radix2 #(.width(width)) rd_st6_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[185]), .rdlo_in(a6_wr[189]),  .coef_in(coef[64]), .rdup_out(a7_wr[185]), .rdlo_out(a7_wr[189]));
			radix2 #(.width(width)) rd_st6_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[186]), .rdlo_in(a6_wr[190]),  .coef_in(coef[128]), .rdup_out(a7_wr[186]), .rdlo_out(a7_wr[190]));
			radix2 #(.width(width)) rd_st6_187  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[187]), .rdlo_in(a6_wr[191]),  .coef_in(coef[192]), .rdup_out(a7_wr[187]), .rdlo_out(a7_wr[191]));
			radix2 #(.width(width)) rd_st6_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[192]), .rdlo_in(a6_wr[196]),  .coef_in(coef[0]), .rdup_out(a7_wr[192]), .rdlo_out(a7_wr[196]));
			radix2 #(.width(width)) rd_st6_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[193]), .rdlo_in(a6_wr[197]),  .coef_in(coef[64]), .rdup_out(a7_wr[193]), .rdlo_out(a7_wr[197]));
			radix2 #(.width(width)) rd_st6_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[194]), .rdlo_in(a6_wr[198]),  .coef_in(coef[128]), .rdup_out(a7_wr[194]), .rdlo_out(a7_wr[198]));
			radix2 #(.width(width)) rd_st6_195  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[195]), .rdlo_in(a6_wr[199]),  .coef_in(coef[192]), .rdup_out(a7_wr[195]), .rdlo_out(a7_wr[199]));
			radix2 #(.width(width)) rd_st6_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[200]), .rdlo_in(a6_wr[204]),  .coef_in(coef[0]), .rdup_out(a7_wr[200]), .rdlo_out(a7_wr[204]));
			radix2 #(.width(width)) rd_st6_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[201]), .rdlo_in(a6_wr[205]),  .coef_in(coef[64]), .rdup_out(a7_wr[201]), .rdlo_out(a7_wr[205]));
			radix2 #(.width(width)) rd_st6_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[202]), .rdlo_in(a6_wr[206]),  .coef_in(coef[128]), .rdup_out(a7_wr[202]), .rdlo_out(a7_wr[206]));
			radix2 #(.width(width)) rd_st6_203  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[203]), .rdlo_in(a6_wr[207]),  .coef_in(coef[192]), .rdup_out(a7_wr[203]), .rdlo_out(a7_wr[207]));
			radix2 #(.width(width)) rd_st6_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[208]), .rdlo_in(a6_wr[212]),  .coef_in(coef[0]), .rdup_out(a7_wr[208]), .rdlo_out(a7_wr[212]));
			radix2 #(.width(width)) rd_st6_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[209]), .rdlo_in(a6_wr[213]),  .coef_in(coef[64]), .rdup_out(a7_wr[209]), .rdlo_out(a7_wr[213]));
			radix2 #(.width(width)) rd_st6_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[210]), .rdlo_in(a6_wr[214]),  .coef_in(coef[128]), .rdup_out(a7_wr[210]), .rdlo_out(a7_wr[214]));
			radix2 #(.width(width)) rd_st6_211  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[211]), .rdlo_in(a6_wr[215]),  .coef_in(coef[192]), .rdup_out(a7_wr[211]), .rdlo_out(a7_wr[215]));
			radix2 #(.width(width)) rd_st6_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[216]), .rdlo_in(a6_wr[220]),  .coef_in(coef[0]), .rdup_out(a7_wr[216]), .rdlo_out(a7_wr[220]));
			radix2 #(.width(width)) rd_st6_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[217]), .rdlo_in(a6_wr[221]),  .coef_in(coef[64]), .rdup_out(a7_wr[217]), .rdlo_out(a7_wr[221]));
			radix2 #(.width(width)) rd_st6_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[218]), .rdlo_in(a6_wr[222]),  .coef_in(coef[128]), .rdup_out(a7_wr[218]), .rdlo_out(a7_wr[222]));
			radix2 #(.width(width)) rd_st6_219  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[219]), .rdlo_in(a6_wr[223]),  .coef_in(coef[192]), .rdup_out(a7_wr[219]), .rdlo_out(a7_wr[223]));
			radix2 #(.width(width)) rd_st6_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[224]), .rdlo_in(a6_wr[228]),  .coef_in(coef[0]), .rdup_out(a7_wr[224]), .rdlo_out(a7_wr[228]));
			radix2 #(.width(width)) rd_st6_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[225]), .rdlo_in(a6_wr[229]),  .coef_in(coef[64]), .rdup_out(a7_wr[225]), .rdlo_out(a7_wr[229]));
			radix2 #(.width(width)) rd_st6_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[226]), .rdlo_in(a6_wr[230]),  .coef_in(coef[128]), .rdup_out(a7_wr[226]), .rdlo_out(a7_wr[230]));
			radix2 #(.width(width)) rd_st6_227  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[227]), .rdlo_in(a6_wr[231]),  .coef_in(coef[192]), .rdup_out(a7_wr[227]), .rdlo_out(a7_wr[231]));
			radix2 #(.width(width)) rd_st6_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[232]), .rdlo_in(a6_wr[236]),  .coef_in(coef[0]), .rdup_out(a7_wr[232]), .rdlo_out(a7_wr[236]));
			radix2 #(.width(width)) rd_st6_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[233]), .rdlo_in(a6_wr[237]),  .coef_in(coef[64]), .rdup_out(a7_wr[233]), .rdlo_out(a7_wr[237]));
			radix2 #(.width(width)) rd_st6_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[234]), .rdlo_in(a6_wr[238]),  .coef_in(coef[128]), .rdup_out(a7_wr[234]), .rdlo_out(a7_wr[238]));
			radix2 #(.width(width)) rd_st6_235  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[235]), .rdlo_in(a6_wr[239]),  .coef_in(coef[192]), .rdup_out(a7_wr[235]), .rdlo_out(a7_wr[239]));
			radix2 #(.width(width)) rd_st6_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[240]), .rdlo_in(a6_wr[244]),  .coef_in(coef[0]), .rdup_out(a7_wr[240]), .rdlo_out(a7_wr[244]));
			radix2 #(.width(width)) rd_st6_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[241]), .rdlo_in(a6_wr[245]),  .coef_in(coef[64]), .rdup_out(a7_wr[241]), .rdlo_out(a7_wr[245]));
			radix2 #(.width(width)) rd_st6_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[242]), .rdlo_in(a6_wr[246]),  .coef_in(coef[128]), .rdup_out(a7_wr[242]), .rdlo_out(a7_wr[246]));
			radix2 #(.width(width)) rd_st6_243  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[243]), .rdlo_in(a6_wr[247]),  .coef_in(coef[192]), .rdup_out(a7_wr[243]), .rdlo_out(a7_wr[247]));
			radix2 #(.width(width)) rd_st6_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[248]), .rdlo_in(a6_wr[252]),  .coef_in(coef[0]), .rdup_out(a7_wr[248]), .rdlo_out(a7_wr[252]));
			radix2 #(.width(width)) rd_st6_249  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[249]), .rdlo_in(a6_wr[253]),  .coef_in(coef[64]), .rdup_out(a7_wr[249]), .rdlo_out(a7_wr[253]));
			radix2 #(.width(width)) rd_st6_250  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[250]), .rdlo_in(a6_wr[254]),  .coef_in(coef[128]), .rdup_out(a7_wr[250]), .rdlo_out(a7_wr[254]));
			radix2 #(.width(width)) rd_st6_251  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[251]), .rdlo_in(a6_wr[255]),  .coef_in(coef[192]), .rdup_out(a7_wr[251]), .rdlo_out(a7_wr[255]));
			radix2 #(.width(width)) rd_st6_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[256]), .rdlo_in(a6_wr[260]),  .coef_in(coef[0]), .rdup_out(a7_wr[256]), .rdlo_out(a7_wr[260]));
			radix2 #(.width(width)) rd_st6_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[257]), .rdlo_in(a6_wr[261]),  .coef_in(coef[64]), .rdup_out(a7_wr[257]), .rdlo_out(a7_wr[261]));
			radix2 #(.width(width)) rd_st6_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[258]), .rdlo_in(a6_wr[262]),  .coef_in(coef[128]), .rdup_out(a7_wr[258]), .rdlo_out(a7_wr[262]));
			radix2 #(.width(width)) rd_st6_259  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[259]), .rdlo_in(a6_wr[263]),  .coef_in(coef[192]), .rdup_out(a7_wr[259]), .rdlo_out(a7_wr[263]));
			radix2 #(.width(width)) rd_st6_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[264]), .rdlo_in(a6_wr[268]),  .coef_in(coef[0]), .rdup_out(a7_wr[264]), .rdlo_out(a7_wr[268]));
			radix2 #(.width(width)) rd_st6_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[265]), .rdlo_in(a6_wr[269]),  .coef_in(coef[64]), .rdup_out(a7_wr[265]), .rdlo_out(a7_wr[269]));
			radix2 #(.width(width)) rd_st6_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[266]), .rdlo_in(a6_wr[270]),  .coef_in(coef[128]), .rdup_out(a7_wr[266]), .rdlo_out(a7_wr[270]));
			radix2 #(.width(width)) rd_st6_267  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[267]), .rdlo_in(a6_wr[271]),  .coef_in(coef[192]), .rdup_out(a7_wr[267]), .rdlo_out(a7_wr[271]));
			radix2 #(.width(width)) rd_st6_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[272]), .rdlo_in(a6_wr[276]),  .coef_in(coef[0]), .rdup_out(a7_wr[272]), .rdlo_out(a7_wr[276]));
			radix2 #(.width(width)) rd_st6_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[273]), .rdlo_in(a6_wr[277]),  .coef_in(coef[64]), .rdup_out(a7_wr[273]), .rdlo_out(a7_wr[277]));
			radix2 #(.width(width)) rd_st6_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[274]), .rdlo_in(a6_wr[278]),  .coef_in(coef[128]), .rdup_out(a7_wr[274]), .rdlo_out(a7_wr[278]));
			radix2 #(.width(width)) rd_st6_275  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[275]), .rdlo_in(a6_wr[279]),  .coef_in(coef[192]), .rdup_out(a7_wr[275]), .rdlo_out(a7_wr[279]));
			radix2 #(.width(width)) rd_st6_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[280]), .rdlo_in(a6_wr[284]),  .coef_in(coef[0]), .rdup_out(a7_wr[280]), .rdlo_out(a7_wr[284]));
			radix2 #(.width(width)) rd_st6_281  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[281]), .rdlo_in(a6_wr[285]),  .coef_in(coef[64]), .rdup_out(a7_wr[281]), .rdlo_out(a7_wr[285]));
			radix2 #(.width(width)) rd_st6_282  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[282]), .rdlo_in(a6_wr[286]),  .coef_in(coef[128]), .rdup_out(a7_wr[282]), .rdlo_out(a7_wr[286]));
			radix2 #(.width(width)) rd_st6_283  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[283]), .rdlo_in(a6_wr[287]),  .coef_in(coef[192]), .rdup_out(a7_wr[283]), .rdlo_out(a7_wr[287]));
			radix2 #(.width(width)) rd_st6_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[288]), .rdlo_in(a6_wr[292]),  .coef_in(coef[0]), .rdup_out(a7_wr[288]), .rdlo_out(a7_wr[292]));
			radix2 #(.width(width)) rd_st6_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[289]), .rdlo_in(a6_wr[293]),  .coef_in(coef[64]), .rdup_out(a7_wr[289]), .rdlo_out(a7_wr[293]));
			radix2 #(.width(width)) rd_st6_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[290]), .rdlo_in(a6_wr[294]),  .coef_in(coef[128]), .rdup_out(a7_wr[290]), .rdlo_out(a7_wr[294]));
			radix2 #(.width(width)) rd_st6_291  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[291]), .rdlo_in(a6_wr[295]),  .coef_in(coef[192]), .rdup_out(a7_wr[291]), .rdlo_out(a7_wr[295]));
			radix2 #(.width(width)) rd_st6_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[296]), .rdlo_in(a6_wr[300]),  .coef_in(coef[0]), .rdup_out(a7_wr[296]), .rdlo_out(a7_wr[300]));
			radix2 #(.width(width)) rd_st6_297  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[297]), .rdlo_in(a6_wr[301]),  .coef_in(coef[64]), .rdup_out(a7_wr[297]), .rdlo_out(a7_wr[301]));
			radix2 #(.width(width)) rd_st6_298  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[298]), .rdlo_in(a6_wr[302]),  .coef_in(coef[128]), .rdup_out(a7_wr[298]), .rdlo_out(a7_wr[302]));
			radix2 #(.width(width)) rd_st6_299  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[299]), .rdlo_in(a6_wr[303]),  .coef_in(coef[192]), .rdup_out(a7_wr[299]), .rdlo_out(a7_wr[303]));
			radix2 #(.width(width)) rd_st6_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[304]), .rdlo_in(a6_wr[308]),  .coef_in(coef[0]), .rdup_out(a7_wr[304]), .rdlo_out(a7_wr[308]));
			radix2 #(.width(width)) rd_st6_305  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[305]), .rdlo_in(a6_wr[309]),  .coef_in(coef[64]), .rdup_out(a7_wr[305]), .rdlo_out(a7_wr[309]));
			radix2 #(.width(width)) rd_st6_306  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[306]), .rdlo_in(a6_wr[310]),  .coef_in(coef[128]), .rdup_out(a7_wr[306]), .rdlo_out(a7_wr[310]));
			radix2 #(.width(width)) rd_st6_307  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[307]), .rdlo_in(a6_wr[311]),  .coef_in(coef[192]), .rdup_out(a7_wr[307]), .rdlo_out(a7_wr[311]));
			radix2 #(.width(width)) rd_st6_312  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[312]), .rdlo_in(a6_wr[316]),  .coef_in(coef[0]), .rdup_out(a7_wr[312]), .rdlo_out(a7_wr[316]));
			radix2 #(.width(width)) rd_st6_313  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[313]), .rdlo_in(a6_wr[317]),  .coef_in(coef[64]), .rdup_out(a7_wr[313]), .rdlo_out(a7_wr[317]));
			radix2 #(.width(width)) rd_st6_314  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[314]), .rdlo_in(a6_wr[318]),  .coef_in(coef[128]), .rdup_out(a7_wr[314]), .rdlo_out(a7_wr[318]));
			radix2 #(.width(width)) rd_st6_315  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[315]), .rdlo_in(a6_wr[319]),  .coef_in(coef[192]), .rdup_out(a7_wr[315]), .rdlo_out(a7_wr[319]));
			radix2 #(.width(width)) rd_st6_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[320]), .rdlo_in(a6_wr[324]),  .coef_in(coef[0]), .rdup_out(a7_wr[320]), .rdlo_out(a7_wr[324]));
			radix2 #(.width(width)) rd_st6_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[321]), .rdlo_in(a6_wr[325]),  .coef_in(coef[64]), .rdup_out(a7_wr[321]), .rdlo_out(a7_wr[325]));
			radix2 #(.width(width)) rd_st6_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[322]), .rdlo_in(a6_wr[326]),  .coef_in(coef[128]), .rdup_out(a7_wr[322]), .rdlo_out(a7_wr[326]));
			radix2 #(.width(width)) rd_st6_323  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[323]), .rdlo_in(a6_wr[327]),  .coef_in(coef[192]), .rdup_out(a7_wr[323]), .rdlo_out(a7_wr[327]));
			radix2 #(.width(width)) rd_st6_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[328]), .rdlo_in(a6_wr[332]),  .coef_in(coef[0]), .rdup_out(a7_wr[328]), .rdlo_out(a7_wr[332]));
			radix2 #(.width(width)) rd_st6_329  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[329]), .rdlo_in(a6_wr[333]),  .coef_in(coef[64]), .rdup_out(a7_wr[329]), .rdlo_out(a7_wr[333]));
			radix2 #(.width(width)) rd_st6_330  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[330]), .rdlo_in(a6_wr[334]),  .coef_in(coef[128]), .rdup_out(a7_wr[330]), .rdlo_out(a7_wr[334]));
			radix2 #(.width(width)) rd_st6_331  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[331]), .rdlo_in(a6_wr[335]),  .coef_in(coef[192]), .rdup_out(a7_wr[331]), .rdlo_out(a7_wr[335]));
			radix2 #(.width(width)) rd_st6_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[336]), .rdlo_in(a6_wr[340]),  .coef_in(coef[0]), .rdup_out(a7_wr[336]), .rdlo_out(a7_wr[340]));
			radix2 #(.width(width)) rd_st6_337  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[337]), .rdlo_in(a6_wr[341]),  .coef_in(coef[64]), .rdup_out(a7_wr[337]), .rdlo_out(a7_wr[341]));
			radix2 #(.width(width)) rd_st6_338  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[338]), .rdlo_in(a6_wr[342]),  .coef_in(coef[128]), .rdup_out(a7_wr[338]), .rdlo_out(a7_wr[342]));
			radix2 #(.width(width)) rd_st6_339  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[339]), .rdlo_in(a6_wr[343]),  .coef_in(coef[192]), .rdup_out(a7_wr[339]), .rdlo_out(a7_wr[343]));
			radix2 #(.width(width)) rd_st6_344  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[344]), .rdlo_in(a6_wr[348]),  .coef_in(coef[0]), .rdup_out(a7_wr[344]), .rdlo_out(a7_wr[348]));
			radix2 #(.width(width)) rd_st6_345  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[345]), .rdlo_in(a6_wr[349]),  .coef_in(coef[64]), .rdup_out(a7_wr[345]), .rdlo_out(a7_wr[349]));
			radix2 #(.width(width)) rd_st6_346  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[346]), .rdlo_in(a6_wr[350]),  .coef_in(coef[128]), .rdup_out(a7_wr[346]), .rdlo_out(a7_wr[350]));
			radix2 #(.width(width)) rd_st6_347  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[347]), .rdlo_in(a6_wr[351]),  .coef_in(coef[192]), .rdup_out(a7_wr[347]), .rdlo_out(a7_wr[351]));
			radix2 #(.width(width)) rd_st6_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[352]), .rdlo_in(a6_wr[356]),  .coef_in(coef[0]), .rdup_out(a7_wr[352]), .rdlo_out(a7_wr[356]));
			radix2 #(.width(width)) rd_st6_353  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[353]), .rdlo_in(a6_wr[357]),  .coef_in(coef[64]), .rdup_out(a7_wr[353]), .rdlo_out(a7_wr[357]));
			radix2 #(.width(width)) rd_st6_354  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[354]), .rdlo_in(a6_wr[358]),  .coef_in(coef[128]), .rdup_out(a7_wr[354]), .rdlo_out(a7_wr[358]));
			radix2 #(.width(width)) rd_st6_355  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[355]), .rdlo_in(a6_wr[359]),  .coef_in(coef[192]), .rdup_out(a7_wr[355]), .rdlo_out(a7_wr[359]));
			radix2 #(.width(width)) rd_st6_360  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[360]), .rdlo_in(a6_wr[364]),  .coef_in(coef[0]), .rdup_out(a7_wr[360]), .rdlo_out(a7_wr[364]));
			radix2 #(.width(width)) rd_st6_361  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[361]), .rdlo_in(a6_wr[365]),  .coef_in(coef[64]), .rdup_out(a7_wr[361]), .rdlo_out(a7_wr[365]));
			radix2 #(.width(width)) rd_st6_362  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[362]), .rdlo_in(a6_wr[366]),  .coef_in(coef[128]), .rdup_out(a7_wr[362]), .rdlo_out(a7_wr[366]));
			radix2 #(.width(width)) rd_st6_363  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[363]), .rdlo_in(a6_wr[367]),  .coef_in(coef[192]), .rdup_out(a7_wr[363]), .rdlo_out(a7_wr[367]));
			radix2 #(.width(width)) rd_st6_368  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[368]), .rdlo_in(a6_wr[372]),  .coef_in(coef[0]), .rdup_out(a7_wr[368]), .rdlo_out(a7_wr[372]));
			radix2 #(.width(width)) rd_st6_369  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[369]), .rdlo_in(a6_wr[373]),  .coef_in(coef[64]), .rdup_out(a7_wr[369]), .rdlo_out(a7_wr[373]));
			radix2 #(.width(width)) rd_st6_370  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[370]), .rdlo_in(a6_wr[374]),  .coef_in(coef[128]), .rdup_out(a7_wr[370]), .rdlo_out(a7_wr[374]));
			radix2 #(.width(width)) rd_st6_371  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[371]), .rdlo_in(a6_wr[375]),  .coef_in(coef[192]), .rdup_out(a7_wr[371]), .rdlo_out(a7_wr[375]));
			radix2 #(.width(width)) rd_st6_376  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[376]), .rdlo_in(a6_wr[380]),  .coef_in(coef[0]), .rdup_out(a7_wr[376]), .rdlo_out(a7_wr[380]));
			radix2 #(.width(width)) rd_st6_377  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[377]), .rdlo_in(a6_wr[381]),  .coef_in(coef[64]), .rdup_out(a7_wr[377]), .rdlo_out(a7_wr[381]));
			radix2 #(.width(width)) rd_st6_378  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[378]), .rdlo_in(a6_wr[382]),  .coef_in(coef[128]), .rdup_out(a7_wr[378]), .rdlo_out(a7_wr[382]));
			radix2 #(.width(width)) rd_st6_379  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[379]), .rdlo_in(a6_wr[383]),  .coef_in(coef[192]), .rdup_out(a7_wr[379]), .rdlo_out(a7_wr[383]));
			radix2 #(.width(width)) rd_st6_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[384]), .rdlo_in(a6_wr[388]),  .coef_in(coef[0]), .rdup_out(a7_wr[384]), .rdlo_out(a7_wr[388]));
			radix2 #(.width(width)) rd_st6_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[385]), .rdlo_in(a6_wr[389]),  .coef_in(coef[64]), .rdup_out(a7_wr[385]), .rdlo_out(a7_wr[389]));
			radix2 #(.width(width)) rd_st6_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[386]), .rdlo_in(a6_wr[390]),  .coef_in(coef[128]), .rdup_out(a7_wr[386]), .rdlo_out(a7_wr[390]));
			radix2 #(.width(width)) rd_st6_387  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[387]), .rdlo_in(a6_wr[391]),  .coef_in(coef[192]), .rdup_out(a7_wr[387]), .rdlo_out(a7_wr[391]));
			radix2 #(.width(width)) rd_st6_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[392]), .rdlo_in(a6_wr[396]),  .coef_in(coef[0]), .rdup_out(a7_wr[392]), .rdlo_out(a7_wr[396]));
			radix2 #(.width(width)) rd_st6_393  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[393]), .rdlo_in(a6_wr[397]),  .coef_in(coef[64]), .rdup_out(a7_wr[393]), .rdlo_out(a7_wr[397]));
			radix2 #(.width(width)) rd_st6_394  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[394]), .rdlo_in(a6_wr[398]),  .coef_in(coef[128]), .rdup_out(a7_wr[394]), .rdlo_out(a7_wr[398]));
			radix2 #(.width(width)) rd_st6_395  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[395]), .rdlo_in(a6_wr[399]),  .coef_in(coef[192]), .rdup_out(a7_wr[395]), .rdlo_out(a7_wr[399]));
			radix2 #(.width(width)) rd_st6_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[400]), .rdlo_in(a6_wr[404]),  .coef_in(coef[0]), .rdup_out(a7_wr[400]), .rdlo_out(a7_wr[404]));
			radix2 #(.width(width)) rd_st6_401  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[401]), .rdlo_in(a6_wr[405]),  .coef_in(coef[64]), .rdup_out(a7_wr[401]), .rdlo_out(a7_wr[405]));
			radix2 #(.width(width)) rd_st6_402  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[402]), .rdlo_in(a6_wr[406]),  .coef_in(coef[128]), .rdup_out(a7_wr[402]), .rdlo_out(a7_wr[406]));
			radix2 #(.width(width)) rd_st6_403  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[403]), .rdlo_in(a6_wr[407]),  .coef_in(coef[192]), .rdup_out(a7_wr[403]), .rdlo_out(a7_wr[407]));
			radix2 #(.width(width)) rd_st6_408  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[408]), .rdlo_in(a6_wr[412]),  .coef_in(coef[0]), .rdup_out(a7_wr[408]), .rdlo_out(a7_wr[412]));
			radix2 #(.width(width)) rd_st6_409  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[409]), .rdlo_in(a6_wr[413]),  .coef_in(coef[64]), .rdup_out(a7_wr[409]), .rdlo_out(a7_wr[413]));
			radix2 #(.width(width)) rd_st6_410  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[410]), .rdlo_in(a6_wr[414]),  .coef_in(coef[128]), .rdup_out(a7_wr[410]), .rdlo_out(a7_wr[414]));
			radix2 #(.width(width)) rd_st6_411  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[411]), .rdlo_in(a6_wr[415]),  .coef_in(coef[192]), .rdup_out(a7_wr[411]), .rdlo_out(a7_wr[415]));
			radix2 #(.width(width)) rd_st6_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[416]), .rdlo_in(a6_wr[420]),  .coef_in(coef[0]), .rdup_out(a7_wr[416]), .rdlo_out(a7_wr[420]));
			radix2 #(.width(width)) rd_st6_417  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[417]), .rdlo_in(a6_wr[421]),  .coef_in(coef[64]), .rdup_out(a7_wr[417]), .rdlo_out(a7_wr[421]));
			radix2 #(.width(width)) rd_st6_418  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[418]), .rdlo_in(a6_wr[422]),  .coef_in(coef[128]), .rdup_out(a7_wr[418]), .rdlo_out(a7_wr[422]));
			radix2 #(.width(width)) rd_st6_419  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[419]), .rdlo_in(a6_wr[423]),  .coef_in(coef[192]), .rdup_out(a7_wr[419]), .rdlo_out(a7_wr[423]));
			radix2 #(.width(width)) rd_st6_424  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[424]), .rdlo_in(a6_wr[428]),  .coef_in(coef[0]), .rdup_out(a7_wr[424]), .rdlo_out(a7_wr[428]));
			radix2 #(.width(width)) rd_st6_425  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[425]), .rdlo_in(a6_wr[429]),  .coef_in(coef[64]), .rdup_out(a7_wr[425]), .rdlo_out(a7_wr[429]));
			radix2 #(.width(width)) rd_st6_426  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[426]), .rdlo_in(a6_wr[430]),  .coef_in(coef[128]), .rdup_out(a7_wr[426]), .rdlo_out(a7_wr[430]));
			radix2 #(.width(width)) rd_st6_427  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[427]), .rdlo_in(a6_wr[431]),  .coef_in(coef[192]), .rdup_out(a7_wr[427]), .rdlo_out(a7_wr[431]));
			radix2 #(.width(width)) rd_st6_432  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[432]), .rdlo_in(a6_wr[436]),  .coef_in(coef[0]), .rdup_out(a7_wr[432]), .rdlo_out(a7_wr[436]));
			radix2 #(.width(width)) rd_st6_433  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[433]), .rdlo_in(a6_wr[437]),  .coef_in(coef[64]), .rdup_out(a7_wr[433]), .rdlo_out(a7_wr[437]));
			radix2 #(.width(width)) rd_st6_434  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[434]), .rdlo_in(a6_wr[438]),  .coef_in(coef[128]), .rdup_out(a7_wr[434]), .rdlo_out(a7_wr[438]));
			radix2 #(.width(width)) rd_st6_435  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[435]), .rdlo_in(a6_wr[439]),  .coef_in(coef[192]), .rdup_out(a7_wr[435]), .rdlo_out(a7_wr[439]));
			radix2 #(.width(width)) rd_st6_440  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[440]), .rdlo_in(a6_wr[444]),  .coef_in(coef[0]), .rdup_out(a7_wr[440]), .rdlo_out(a7_wr[444]));
			radix2 #(.width(width)) rd_st6_441  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[441]), .rdlo_in(a6_wr[445]),  .coef_in(coef[64]), .rdup_out(a7_wr[441]), .rdlo_out(a7_wr[445]));
			radix2 #(.width(width)) rd_st6_442  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[442]), .rdlo_in(a6_wr[446]),  .coef_in(coef[128]), .rdup_out(a7_wr[442]), .rdlo_out(a7_wr[446]));
			radix2 #(.width(width)) rd_st6_443  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[443]), .rdlo_in(a6_wr[447]),  .coef_in(coef[192]), .rdup_out(a7_wr[443]), .rdlo_out(a7_wr[447]));
			radix2 #(.width(width)) rd_st6_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[448]), .rdlo_in(a6_wr[452]),  .coef_in(coef[0]), .rdup_out(a7_wr[448]), .rdlo_out(a7_wr[452]));
			radix2 #(.width(width)) rd_st6_449  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[449]), .rdlo_in(a6_wr[453]),  .coef_in(coef[64]), .rdup_out(a7_wr[449]), .rdlo_out(a7_wr[453]));
			radix2 #(.width(width)) rd_st6_450  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[450]), .rdlo_in(a6_wr[454]),  .coef_in(coef[128]), .rdup_out(a7_wr[450]), .rdlo_out(a7_wr[454]));
			radix2 #(.width(width)) rd_st6_451  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[451]), .rdlo_in(a6_wr[455]),  .coef_in(coef[192]), .rdup_out(a7_wr[451]), .rdlo_out(a7_wr[455]));
			radix2 #(.width(width)) rd_st6_456  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[456]), .rdlo_in(a6_wr[460]),  .coef_in(coef[0]), .rdup_out(a7_wr[456]), .rdlo_out(a7_wr[460]));
			radix2 #(.width(width)) rd_st6_457  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[457]), .rdlo_in(a6_wr[461]),  .coef_in(coef[64]), .rdup_out(a7_wr[457]), .rdlo_out(a7_wr[461]));
			radix2 #(.width(width)) rd_st6_458  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[458]), .rdlo_in(a6_wr[462]),  .coef_in(coef[128]), .rdup_out(a7_wr[458]), .rdlo_out(a7_wr[462]));
			radix2 #(.width(width)) rd_st6_459  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[459]), .rdlo_in(a6_wr[463]),  .coef_in(coef[192]), .rdup_out(a7_wr[459]), .rdlo_out(a7_wr[463]));
			radix2 #(.width(width)) rd_st6_464  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[464]), .rdlo_in(a6_wr[468]),  .coef_in(coef[0]), .rdup_out(a7_wr[464]), .rdlo_out(a7_wr[468]));
			radix2 #(.width(width)) rd_st6_465  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[465]), .rdlo_in(a6_wr[469]),  .coef_in(coef[64]), .rdup_out(a7_wr[465]), .rdlo_out(a7_wr[469]));
			radix2 #(.width(width)) rd_st6_466  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[466]), .rdlo_in(a6_wr[470]),  .coef_in(coef[128]), .rdup_out(a7_wr[466]), .rdlo_out(a7_wr[470]));
			radix2 #(.width(width)) rd_st6_467  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[467]), .rdlo_in(a6_wr[471]),  .coef_in(coef[192]), .rdup_out(a7_wr[467]), .rdlo_out(a7_wr[471]));
			radix2 #(.width(width)) rd_st6_472  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[472]), .rdlo_in(a6_wr[476]),  .coef_in(coef[0]), .rdup_out(a7_wr[472]), .rdlo_out(a7_wr[476]));
			radix2 #(.width(width)) rd_st6_473  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[473]), .rdlo_in(a6_wr[477]),  .coef_in(coef[64]), .rdup_out(a7_wr[473]), .rdlo_out(a7_wr[477]));
			radix2 #(.width(width)) rd_st6_474  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[474]), .rdlo_in(a6_wr[478]),  .coef_in(coef[128]), .rdup_out(a7_wr[474]), .rdlo_out(a7_wr[478]));
			radix2 #(.width(width)) rd_st6_475  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[475]), .rdlo_in(a6_wr[479]),  .coef_in(coef[192]), .rdup_out(a7_wr[475]), .rdlo_out(a7_wr[479]));
			radix2 #(.width(width)) rd_st6_480  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[480]), .rdlo_in(a6_wr[484]),  .coef_in(coef[0]), .rdup_out(a7_wr[480]), .rdlo_out(a7_wr[484]));
			radix2 #(.width(width)) rd_st6_481  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[481]), .rdlo_in(a6_wr[485]),  .coef_in(coef[64]), .rdup_out(a7_wr[481]), .rdlo_out(a7_wr[485]));
			radix2 #(.width(width)) rd_st6_482  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[482]), .rdlo_in(a6_wr[486]),  .coef_in(coef[128]), .rdup_out(a7_wr[482]), .rdlo_out(a7_wr[486]));
			radix2 #(.width(width)) rd_st6_483  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[483]), .rdlo_in(a6_wr[487]),  .coef_in(coef[192]), .rdup_out(a7_wr[483]), .rdlo_out(a7_wr[487]));
			radix2 #(.width(width)) rd_st6_488  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[488]), .rdlo_in(a6_wr[492]),  .coef_in(coef[0]), .rdup_out(a7_wr[488]), .rdlo_out(a7_wr[492]));
			radix2 #(.width(width)) rd_st6_489  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[489]), .rdlo_in(a6_wr[493]),  .coef_in(coef[64]), .rdup_out(a7_wr[489]), .rdlo_out(a7_wr[493]));
			radix2 #(.width(width)) rd_st6_490  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[490]), .rdlo_in(a6_wr[494]),  .coef_in(coef[128]), .rdup_out(a7_wr[490]), .rdlo_out(a7_wr[494]));
			radix2 #(.width(width)) rd_st6_491  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[491]), .rdlo_in(a6_wr[495]),  .coef_in(coef[192]), .rdup_out(a7_wr[491]), .rdlo_out(a7_wr[495]));
			radix2 #(.width(width)) rd_st6_496  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[496]), .rdlo_in(a6_wr[500]),  .coef_in(coef[0]), .rdup_out(a7_wr[496]), .rdlo_out(a7_wr[500]));
			radix2 #(.width(width)) rd_st6_497  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[497]), .rdlo_in(a6_wr[501]),  .coef_in(coef[64]), .rdup_out(a7_wr[497]), .rdlo_out(a7_wr[501]));
			radix2 #(.width(width)) rd_st6_498  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[498]), .rdlo_in(a6_wr[502]),  .coef_in(coef[128]), .rdup_out(a7_wr[498]), .rdlo_out(a7_wr[502]));
			radix2 #(.width(width)) rd_st6_499  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[499]), .rdlo_in(a6_wr[503]),  .coef_in(coef[192]), .rdup_out(a7_wr[499]), .rdlo_out(a7_wr[503]));
			radix2 #(.width(width)) rd_st6_504  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[504]), .rdlo_in(a6_wr[508]),  .coef_in(coef[0]), .rdup_out(a7_wr[504]), .rdlo_out(a7_wr[508]));
			radix2 #(.width(width)) rd_st6_505  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[505]), .rdlo_in(a6_wr[509]),  .coef_in(coef[64]), .rdup_out(a7_wr[505]), .rdlo_out(a7_wr[509]));
			radix2 #(.width(width)) rd_st6_506  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[506]), .rdlo_in(a6_wr[510]),  .coef_in(coef[128]), .rdup_out(a7_wr[506]), .rdlo_out(a7_wr[510]));
			radix2 #(.width(width)) rd_st6_507  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a6_wr[507]), .rdlo_in(a6_wr[511]),  .coef_in(coef[192]), .rdup_out(a7_wr[507]), .rdlo_out(a7_wr[511]));

		//--- radix stage 7
			radix2 #(.width(width)) rd_st7_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[0]), .rdlo_in(a7_wr[2]),  .coef_in(coef[0]), .rdup_out(a8_wr[0]), .rdlo_out(a8_wr[2]));
			radix2 #(.width(width)) rd_st7_1   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[1]), .rdlo_in(a7_wr[3]),  .coef_in(coef[128]), .rdup_out(a8_wr[1]), .rdlo_out(a8_wr[3]));
			radix2 #(.width(width)) rd_st7_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[4]), .rdlo_in(a7_wr[6]),  .coef_in(coef[0]), .rdup_out(a8_wr[4]), .rdlo_out(a8_wr[6]));
			radix2 #(.width(width)) rd_st7_5   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[5]), .rdlo_in(a7_wr[7]),  .coef_in(coef[128]), .rdup_out(a8_wr[5]), .rdlo_out(a8_wr[7]));
			radix2 #(.width(width)) rd_st7_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[8]), .rdlo_in(a7_wr[10]),  .coef_in(coef[0]), .rdup_out(a8_wr[8]), .rdlo_out(a8_wr[10]));
			radix2 #(.width(width)) rd_st7_9   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[9]), .rdlo_in(a7_wr[11]),  .coef_in(coef[128]), .rdup_out(a8_wr[9]), .rdlo_out(a8_wr[11]));
			radix2 #(.width(width)) rd_st7_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[12]), .rdlo_in(a7_wr[14]),  .coef_in(coef[0]), .rdup_out(a8_wr[12]), .rdlo_out(a8_wr[14]));
			radix2 #(.width(width)) rd_st7_13  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[13]), .rdlo_in(a7_wr[15]),  .coef_in(coef[128]), .rdup_out(a8_wr[13]), .rdlo_out(a8_wr[15]));
			radix2 #(.width(width)) rd_st7_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[16]), .rdlo_in(a7_wr[18]),  .coef_in(coef[0]), .rdup_out(a8_wr[16]), .rdlo_out(a8_wr[18]));
			radix2 #(.width(width)) rd_st7_17  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[17]), .rdlo_in(a7_wr[19]),  .coef_in(coef[128]), .rdup_out(a8_wr[17]), .rdlo_out(a8_wr[19]));
			radix2 #(.width(width)) rd_st7_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[20]), .rdlo_in(a7_wr[22]),  .coef_in(coef[0]), .rdup_out(a8_wr[20]), .rdlo_out(a8_wr[22]));
			radix2 #(.width(width)) rd_st7_21  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[21]), .rdlo_in(a7_wr[23]),  .coef_in(coef[128]), .rdup_out(a8_wr[21]), .rdlo_out(a8_wr[23]));
			radix2 #(.width(width)) rd_st7_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[24]), .rdlo_in(a7_wr[26]),  .coef_in(coef[0]), .rdup_out(a8_wr[24]), .rdlo_out(a8_wr[26]));
			radix2 #(.width(width)) rd_st7_25  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[25]), .rdlo_in(a7_wr[27]),  .coef_in(coef[128]), .rdup_out(a8_wr[25]), .rdlo_out(a8_wr[27]));
			radix2 #(.width(width)) rd_st7_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[28]), .rdlo_in(a7_wr[30]),  .coef_in(coef[0]), .rdup_out(a8_wr[28]), .rdlo_out(a8_wr[30]));
			radix2 #(.width(width)) rd_st7_29  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[29]), .rdlo_in(a7_wr[31]),  .coef_in(coef[128]), .rdup_out(a8_wr[29]), .rdlo_out(a8_wr[31]));
			radix2 #(.width(width)) rd_st7_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[32]), .rdlo_in(a7_wr[34]),  .coef_in(coef[0]), .rdup_out(a8_wr[32]), .rdlo_out(a8_wr[34]));
			radix2 #(.width(width)) rd_st7_33  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[33]), .rdlo_in(a7_wr[35]),  .coef_in(coef[128]), .rdup_out(a8_wr[33]), .rdlo_out(a8_wr[35]));
			radix2 #(.width(width)) rd_st7_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[36]), .rdlo_in(a7_wr[38]),  .coef_in(coef[0]), .rdup_out(a8_wr[36]), .rdlo_out(a8_wr[38]));
			radix2 #(.width(width)) rd_st7_37  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[37]), .rdlo_in(a7_wr[39]),  .coef_in(coef[128]), .rdup_out(a8_wr[37]), .rdlo_out(a8_wr[39]));
			radix2 #(.width(width)) rd_st7_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[40]), .rdlo_in(a7_wr[42]),  .coef_in(coef[0]), .rdup_out(a8_wr[40]), .rdlo_out(a8_wr[42]));
			radix2 #(.width(width)) rd_st7_41  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[41]), .rdlo_in(a7_wr[43]),  .coef_in(coef[128]), .rdup_out(a8_wr[41]), .rdlo_out(a8_wr[43]));
			radix2 #(.width(width)) rd_st7_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[44]), .rdlo_in(a7_wr[46]),  .coef_in(coef[0]), .rdup_out(a8_wr[44]), .rdlo_out(a8_wr[46]));
			radix2 #(.width(width)) rd_st7_45  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[45]), .rdlo_in(a7_wr[47]),  .coef_in(coef[128]), .rdup_out(a8_wr[45]), .rdlo_out(a8_wr[47]));
			radix2 #(.width(width)) rd_st7_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[48]), .rdlo_in(a7_wr[50]),  .coef_in(coef[0]), .rdup_out(a8_wr[48]), .rdlo_out(a8_wr[50]));
			radix2 #(.width(width)) rd_st7_49  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[49]), .rdlo_in(a7_wr[51]),  .coef_in(coef[128]), .rdup_out(a8_wr[49]), .rdlo_out(a8_wr[51]));
			radix2 #(.width(width)) rd_st7_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[52]), .rdlo_in(a7_wr[54]),  .coef_in(coef[0]), .rdup_out(a8_wr[52]), .rdlo_out(a8_wr[54]));
			radix2 #(.width(width)) rd_st7_53  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[53]), .rdlo_in(a7_wr[55]),  .coef_in(coef[128]), .rdup_out(a8_wr[53]), .rdlo_out(a8_wr[55]));
			radix2 #(.width(width)) rd_st7_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[56]), .rdlo_in(a7_wr[58]),  .coef_in(coef[0]), .rdup_out(a8_wr[56]), .rdlo_out(a8_wr[58]));
			radix2 #(.width(width)) rd_st7_57  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[57]), .rdlo_in(a7_wr[59]),  .coef_in(coef[128]), .rdup_out(a8_wr[57]), .rdlo_out(a8_wr[59]));
			radix2 #(.width(width)) rd_st7_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[60]), .rdlo_in(a7_wr[62]),  .coef_in(coef[0]), .rdup_out(a8_wr[60]), .rdlo_out(a8_wr[62]));
			radix2 #(.width(width)) rd_st7_61  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[61]), .rdlo_in(a7_wr[63]),  .coef_in(coef[128]), .rdup_out(a8_wr[61]), .rdlo_out(a8_wr[63]));
			radix2 #(.width(width)) rd_st7_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[64]), .rdlo_in(a7_wr[66]),  .coef_in(coef[0]), .rdup_out(a8_wr[64]), .rdlo_out(a8_wr[66]));
			radix2 #(.width(width)) rd_st7_65  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[65]), .rdlo_in(a7_wr[67]),  .coef_in(coef[128]), .rdup_out(a8_wr[65]), .rdlo_out(a8_wr[67]));
			radix2 #(.width(width)) rd_st7_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[68]), .rdlo_in(a7_wr[70]),  .coef_in(coef[0]), .rdup_out(a8_wr[68]), .rdlo_out(a8_wr[70]));
			radix2 #(.width(width)) rd_st7_69  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[69]), .rdlo_in(a7_wr[71]),  .coef_in(coef[128]), .rdup_out(a8_wr[69]), .rdlo_out(a8_wr[71]));
			radix2 #(.width(width)) rd_st7_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[72]), .rdlo_in(a7_wr[74]),  .coef_in(coef[0]), .rdup_out(a8_wr[72]), .rdlo_out(a8_wr[74]));
			radix2 #(.width(width)) rd_st7_73  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[73]), .rdlo_in(a7_wr[75]),  .coef_in(coef[128]), .rdup_out(a8_wr[73]), .rdlo_out(a8_wr[75]));
			radix2 #(.width(width)) rd_st7_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[76]), .rdlo_in(a7_wr[78]),  .coef_in(coef[0]), .rdup_out(a8_wr[76]), .rdlo_out(a8_wr[78]));
			radix2 #(.width(width)) rd_st7_77  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[77]), .rdlo_in(a7_wr[79]),  .coef_in(coef[128]), .rdup_out(a8_wr[77]), .rdlo_out(a8_wr[79]));
			radix2 #(.width(width)) rd_st7_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[80]), .rdlo_in(a7_wr[82]),  .coef_in(coef[0]), .rdup_out(a8_wr[80]), .rdlo_out(a8_wr[82]));
			radix2 #(.width(width)) rd_st7_81  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[81]), .rdlo_in(a7_wr[83]),  .coef_in(coef[128]), .rdup_out(a8_wr[81]), .rdlo_out(a8_wr[83]));
			radix2 #(.width(width)) rd_st7_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[84]), .rdlo_in(a7_wr[86]),  .coef_in(coef[0]), .rdup_out(a8_wr[84]), .rdlo_out(a8_wr[86]));
			radix2 #(.width(width)) rd_st7_85  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[85]), .rdlo_in(a7_wr[87]),  .coef_in(coef[128]), .rdup_out(a8_wr[85]), .rdlo_out(a8_wr[87]));
			radix2 #(.width(width)) rd_st7_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[88]), .rdlo_in(a7_wr[90]),  .coef_in(coef[0]), .rdup_out(a8_wr[88]), .rdlo_out(a8_wr[90]));
			radix2 #(.width(width)) rd_st7_89  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[89]), .rdlo_in(a7_wr[91]),  .coef_in(coef[128]), .rdup_out(a8_wr[89]), .rdlo_out(a8_wr[91]));
			radix2 #(.width(width)) rd_st7_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[92]), .rdlo_in(a7_wr[94]),  .coef_in(coef[0]), .rdup_out(a8_wr[92]), .rdlo_out(a8_wr[94]));
			radix2 #(.width(width)) rd_st7_93  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[93]), .rdlo_in(a7_wr[95]),  .coef_in(coef[128]), .rdup_out(a8_wr[93]), .rdlo_out(a8_wr[95]));
			radix2 #(.width(width)) rd_st7_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[96]), .rdlo_in(a7_wr[98]),  .coef_in(coef[0]), .rdup_out(a8_wr[96]), .rdlo_out(a8_wr[98]));
			radix2 #(.width(width)) rd_st7_97  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[97]), .rdlo_in(a7_wr[99]),  .coef_in(coef[128]), .rdup_out(a8_wr[97]), .rdlo_out(a8_wr[99]));
			radix2 #(.width(width)) rd_st7_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[100]), .rdlo_in(a7_wr[102]),  .coef_in(coef[0]), .rdup_out(a8_wr[100]), .rdlo_out(a8_wr[102]));
			radix2 #(.width(width)) rd_st7_101  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[101]), .rdlo_in(a7_wr[103]),  .coef_in(coef[128]), .rdup_out(a8_wr[101]), .rdlo_out(a8_wr[103]));
			radix2 #(.width(width)) rd_st7_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[104]), .rdlo_in(a7_wr[106]),  .coef_in(coef[0]), .rdup_out(a8_wr[104]), .rdlo_out(a8_wr[106]));
			radix2 #(.width(width)) rd_st7_105  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[105]), .rdlo_in(a7_wr[107]),  .coef_in(coef[128]), .rdup_out(a8_wr[105]), .rdlo_out(a8_wr[107]));
			radix2 #(.width(width)) rd_st7_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[108]), .rdlo_in(a7_wr[110]),  .coef_in(coef[0]), .rdup_out(a8_wr[108]), .rdlo_out(a8_wr[110]));
			radix2 #(.width(width)) rd_st7_109  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[109]), .rdlo_in(a7_wr[111]),  .coef_in(coef[128]), .rdup_out(a8_wr[109]), .rdlo_out(a8_wr[111]));
			radix2 #(.width(width)) rd_st7_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[112]), .rdlo_in(a7_wr[114]),  .coef_in(coef[0]), .rdup_out(a8_wr[112]), .rdlo_out(a8_wr[114]));
			radix2 #(.width(width)) rd_st7_113  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[113]), .rdlo_in(a7_wr[115]),  .coef_in(coef[128]), .rdup_out(a8_wr[113]), .rdlo_out(a8_wr[115]));
			radix2 #(.width(width)) rd_st7_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[116]), .rdlo_in(a7_wr[118]),  .coef_in(coef[0]), .rdup_out(a8_wr[116]), .rdlo_out(a8_wr[118]));
			radix2 #(.width(width)) rd_st7_117  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[117]), .rdlo_in(a7_wr[119]),  .coef_in(coef[128]), .rdup_out(a8_wr[117]), .rdlo_out(a8_wr[119]));
			radix2 #(.width(width)) rd_st7_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[120]), .rdlo_in(a7_wr[122]),  .coef_in(coef[0]), .rdup_out(a8_wr[120]), .rdlo_out(a8_wr[122]));
			radix2 #(.width(width)) rd_st7_121  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[121]), .rdlo_in(a7_wr[123]),  .coef_in(coef[128]), .rdup_out(a8_wr[121]), .rdlo_out(a8_wr[123]));
			radix2 #(.width(width)) rd_st7_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[124]), .rdlo_in(a7_wr[126]),  .coef_in(coef[0]), .rdup_out(a8_wr[124]), .rdlo_out(a8_wr[126]));
			radix2 #(.width(width)) rd_st7_125  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[125]), .rdlo_in(a7_wr[127]),  .coef_in(coef[128]), .rdup_out(a8_wr[125]), .rdlo_out(a8_wr[127]));
			radix2 #(.width(width)) rd_st7_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[128]), .rdlo_in(a7_wr[130]),  .coef_in(coef[0]), .rdup_out(a8_wr[128]), .rdlo_out(a8_wr[130]));
			radix2 #(.width(width)) rd_st7_129  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[129]), .rdlo_in(a7_wr[131]),  .coef_in(coef[128]), .rdup_out(a8_wr[129]), .rdlo_out(a8_wr[131]));
			radix2 #(.width(width)) rd_st7_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[132]), .rdlo_in(a7_wr[134]),  .coef_in(coef[0]), .rdup_out(a8_wr[132]), .rdlo_out(a8_wr[134]));
			radix2 #(.width(width)) rd_st7_133  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[133]), .rdlo_in(a7_wr[135]),  .coef_in(coef[128]), .rdup_out(a8_wr[133]), .rdlo_out(a8_wr[135]));
			radix2 #(.width(width)) rd_st7_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[136]), .rdlo_in(a7_wr[138]),  .coef_in(coef[0]), .rdup_out(a8_wr[136]), .rdlo_out(a8_wr[138]));
			radix2 #(.width(width)) rd_st7_137  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[137]), .rdlo_in(a7_wr[139]),  .coef_in(coef[128]), .rdup_out(a8_wr[137]), .rdlo_out(a8_wr[139]));
			radix2 #(.width(width)) rd_st7_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[140]), .rdlo_in(a7_wr[142]),  .coef_in(coef[0]), .rdup_out(a8_wr[140]), .rdlo_out(a8_wr[142]));
			radix2 #(.width(width)) rd_st7_141  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[141]), .rdlo_in(a7_wr[143]),  .coef_in(coef[128]), .rdup_out(a8_wr[141]), .rdlo_out(a8_wr[143]));
			radix2 #(.width(width)) rd_st7_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[144]), .rdlo_in(a7_wr[146]),  .coef_in(coef[0]), .rdup_out(a8_wr[144]), .rdlo_out(a8_wr[146]));
			radix2 #(.width(width)) rd_st7_145  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[145]), .rdlo_in(a7_wr[147]),  .coef_in(coef[128]), .rdup_out(a8_wr[145]), .rdlo_out(a8_wr[147]));
			radix2 #(.width(width)) rd_st7_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[148]), .rdlo_in(a7_wr[150]),  .coef_in(coef[0]), .rdup_out(a8_wr[148]), .rdlo_out(a8_wr[150]));
			radix2 #(.width(width)) rd_st7_149  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[149]), .rdlo_in(a7_wr[151]),  .coef_in(coef[128]), .rdup_out(a8_wr[149]), .rdlo_out(a8_wr[151]));
			radix2 #(.width(width)) rd_st7_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[152]), .rdlo_in(a7_wr[154]),  .coef_in(coef[0]), .rdup_out(a8_wr[152]), .rdlo_out(a8_wr[154]));
			radix2 #(.width(width)) rd_st7_153  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[153]), .rdlo_in(a7_wr[155]),  .coef_in(coef[128]), .rdup_out(a8_wr[153]), .rdlo_out(a8_wr[155]));
			radix2 #(.width(width)) rd_st7_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[156]), .rdlo_in(a7_wr[158]),  .coef_in(coef[0]), .rdup_out(a8_wr[156]), .rdlo_out(a8_wr[158]));
			radix2 #(.width(width)) rd_st7_157  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[157]), .rdlo_in(a7_wr[159]),  .coef_in(coef[128]), .rdup_out(a8_wr[157]), .rdlo_out(a8_wr[159]));
			radix2 #(.width(width)) rd_st7_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[160]), .rdlo_in(a7_wr[162]),  .coef_in(coef[0]), .rdup_out(a8_wr[160]), .rdlo_out(a8_wr[162]));
			radix2 #(.width(width)) rd_st7_161  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[161]), .rdlo_in(a7_wr[163]),  .coef_in(coef[128]), .rdup_out(a8_wr[161]), .rdlo_out(a8_wr[163]));
			radix2 #(.width(width)) rd_st7_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[164]), .rdlo_in(a7_wr[166]),  .coef_in(coef[0]), .rdup_out(a8_wr[164]), .rdlo_out(a8_wr[166]));
			radix2 #(.width(width)) rd_st7_165  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[165]), .rdlo_in(a7_wr[167]),  .coef_in(coef[128]), .rdup_out(a8_wr[165]), .rdlo_out(a8_wr[167]));
			radix2 #(.width(width)) rd_st7_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[168]), .rdlo_in(a7_wr[170]),  .coef_in(coef[0]), .rdup_out(a8_wr[168]), .rdlo_out(a8_wr[170]));
			radix2 #(.width(width)) rd_st7_169  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[169]), .rdlo_in(a7_wr[171]),  .coef_in(coef[128]), .rdup_out(a8_wr[169]), .rdlo_out(a8_wr[171]));
			radix2 #(.width(width)) rd_st7_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[172]), .rdlo_in(a7_wr[174]),  .coef_in(coef[0]), .rdup_out(a8_wr[172]), .rdlo_out(a8_wr[174]));
			radix2 #(.width(width)) rd_st7_173  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[173]), .rdlo_in(a7_wr[175]),  .coef_in(coef[128]), .rdup_out(a8_wr[173]), .rdlo_out(a8_wr[175]));
			radix2 #(.width(width)) rd_st7_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[176]), .rdlo_in(a7_wr[178]),  .coef_in(coef[0]), .rdup_out(a8_wr[176]), .rdlo_out(a8_wr[178]));
			radix2 #(.width(width)) rd_st7_177  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[177]), .rdlo_in(a7_wr[179]),  .coef_in(coef[128]), .rdup_out(a8_wr[177]), .rdlo_out(a8_wr[179]));
			radix2 #(.width(width)) rd_st7_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[180]), .rdlo_in(a7_wr[182]),  .coef_in(coef[0]), .rdup_out(a8_wr[180]), .rdlo_out(a8_wr[182]));
			radix2 #(.width(width)) rd_st7_181  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[181]), .rdlo_in(a7_wr[183]),  .coef_in(coef[128]), .rdup_out(a8_wr[181]), .rdlo_out(a8_wr[183]));
			radix2 #(.width(width)) rd_st7_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[184]), .rdlo_in(a7_wr[186]),  .coef_in(coef[0]), .rdup_out(a8_wr[184]), .rdlo_out(a8_wr[186]));
			radix2 #(.width(width)) rd_st7_185  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[185]), .rdlo_in(a7_wr[187]),  .coef_in(coef[128]), .rdup_out(a8_wr[185]), .rdlo_out(a8_wr[187]));
			radix2 #(.width(width)) rd_st7_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[188]), .rdlo_in(a7_wr[190]),  .coef_in(coef[0]), .rdup_out(a8_wr[188]), .rdlo_out(a8_wr[190]));
			radix2 #(.width(width)) rd_st7_189  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[189]), .rdlo_in(a7_wr[191]),  .coef_in(coef[128]), .rdup_out(a8_wr[189]), .rdlo_out(a8_wr[191]));
			radix2 #(.width(width)) rd_st7_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[192]), .rdlo_in(a7_wr[194]),  .coef_in(coef[0]), .rdup_out(a8_wr[192]), .rdlo_out(a8_wr[194]));
			radix2 #(.width(width)) rd_st7_193  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[193]), .rdlo_in(a7_wr[195]),  .coef_in(coef[128]), .rdup_out(a8_wr[193]), .rdlo_out(a8_wr[195]));
			radix2 #(.width(width)) rd_st7_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[196]), .rdlo_in(a7_wr[198]),  .coef_in(coef[0]), .rdup_out(a8_wr[196]), .rdlo_out(a8_wr[198]));
			radix2 #(.width(width)) rd_st7_197  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[197]), .rdlo_in(a7_wr[199]),  .coef_in(coef[128]), .rdup_out(a8_wr[197]), .rdlo_out(a8_wr[199]));
			radix2 #(.width(width)) rd_st7_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[200]), .rdlo_in(a7_wr[202]),  .coef_in(coef[0]), .rdup_out(a8_wr[200]), .rdlo_out(a8_wr[202]));
			radix2 #(.width(width)) rd_st7_201  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[201]), .rdlo_in(a7_wr[203]),  .coef_in(coef[128]), .rdup_out(a8_wr[201]), .rdlo_out(a8_wr[203]));
			radix2 #(.width(width)) rd_st7_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[204]), .rdlo_in(a7_wr[206]),  .coef_in(coef[0]), .rdup_out(a8_wr[204]), .rdlo_out(a8_wr[206]));
			radix2 #(.width(width)) rd_st7_205  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[205]), .rdlo_in(a7_wr[207]),  .coef_in(coef[128]), .rdup_out(a8_wr[205]), .rdlo_out(a8_wr[207]));
			radix2 #(.width(width)) rd_st7_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[208]), .rdlo_in(a7_wr[210]),  .coef_in(coef[0]), .rdup_out(a8_wr[208]), .rdlo_out(a8_wr[210]));
			radix2 #(.width(width)) rd_st7_209  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[209]), .rdlo_in(a7_wr[211]),  .coef_in(coef[128]), .rdup_out(a8_wr[209]), .rdlo_out(a8_wr[211]));
			radix2 #(.width(width)) rd_st7_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[212]), .rdlo_in(a7_wr[214]),  .coef_in(coef[0]), .rdup_out(a8_wr[212]), .rdlo_out(a8_wr[214]));
			radix2 #(.width(width)) rd_st7_213  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[213]), .rdlo_in(a7_wr[215]),  .coef_in(coef[128]), .rdup_out(a8_wr[213]), .rdlo_out(a8_wr[215]));
			radix2 #(.width(width)) rd_st7_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[216]), .rdlo_in(a7_wr[218]),  .coef_in(coef[0]), .rdup_out(a8_wr[216]), .rdlo_out(a8_wr[218]));
			radix2 #(.width(width)) rd_st7_217  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[217]), .rdlo_in(a7_wr[219]),  .coef_in(coef[128]), .rdup_out(a8_wr[217]), .rdlo_out(a8_wr[219]));
			radix2 #(.width(width)) rd_st7_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[220]), .rdlo_in(a7_wr[222]),  .coef_in(coef[0]), .rdup_out(a8_wr[220]), .rdlo_out(a8_wr[222]));
			radix2 #(.width(width)) rd_st7_221  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[221]), .rdlo_in(a7_wr[223]),  .coef_in(coef[128]), .rdup_out(a8_wr[221]), .rdlo_out(a8_wr[223]));
			radix2 #(.width(width)) rd_st7_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[224]), .rdlo_in(a7_wr[226]),  .coef_in(coef[0]), .rdup_out(a8_wr[224]), .rdlo_out(a8_wr[226]));
			radix2 #(.width(width)) rd_st7_225  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[225]), .rdlo_in(a7_wr[227]),  .coef_in(coef[128]), .rdup_out(a8_wr[225]), .rdlo_out(a8_wr[227]));
			radix2 #(.width(width)) rd_st7_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[228]), .rdlo_in(a7_wr[230]),  .coef_in(coef[0]), .rdup_out(a8_wr[228]), .rdlo_out(a8_wr[230]));
			radix2 #(.width(width)) rd_st7_229  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[229]), .rdlo_in(a7_wr[231]),  .coef_in(coef[128]), .rdup_out(a8_wr[229]), .rdlo_out(a8_wr[231]));
			radix2 #(.width(width)) rd_st7_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[232]), .rdlo_in(a7_wr[234]),  .coef_in(coef[0]), .rdup_out(a8_wr[232]), .rdlo_out(a8_wr[234]));
			radix2 #(.width(width)) rd_st7_233  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[233]), .rdlo_in(a7_wr[235]),  .coef_in(coef[128]), .rdup_out(a8_wr[233]), .rdlo_out(a8_wr[235]));
			radix2 #(.width(width)) rd_st7_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[236]), .rdlo_in(a7_wr[238]),  .coef_in(coef[0]), .rdup_out(a8_wr[236]), .rdlo_out(a8_wr[238]));
			radix2 #(.width(width)) rd_st7_237  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[237]), .rdlo_in(a7_wr[239]),  .coef_in(coef[128]), .rdup_out(a8_wr[237]), .rdlo_out(a8_wr[239]));
			radix2 #(.width(width)) rd_st7_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[240]), .rdlo_in(a7_wr[242]),  .coef_in(coef[0]), .rdup_out(a8_wr[240]), .rdlo_out(a8_wr[242]));
			radix2 #(.width(width)) rd_st7_241  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[241]), .rdlo_in(a7_wr[243]),  .coef_in(coef[128]), .rdup_out(a8_wr[241]), .rdlo_out(a8_wr[243]));
			radix2 #(.width(width)) rd_st7_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[244]), .rdlo_in(a7_wr[246]),  .coef_in(coef[0]), .rdup_out(a8_wr[244]), .rdlo_out(a8_wr[246]));
			radix2 #(.width(width)) rd_st7_245  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[245]), .rdlo_in(a7_wr[247]),  .coef_in(coef[128]), .rdup_out(a8_wr[245]), .rdlo_out(a8_wr[247]));
			radix2 #(.width(width)) rd_st7_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[248]), .rdlo_in(a7_wr[250]),  .coef_in(coef[0]), .rdup_out(a8_wr[248]), .rdlo_out(a8_wr[250]));
			radix2 #(.width(width)) rd_st7_249  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[249]), .rdlo_in(a7_wr[251]),  .coef_in(coef[128]), .rdup_out(a8_wr[249]), .rdlo_out(a8_wr[251]));
			radix2 #(.width(width)) rd_st7_252  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[252]), .rdlo_in(a7_wr[254]),  .coef_in(coef[0]), .rdup_out(a8_wr[252]), .rdlo_out(a8_wr[254]));
			radix2 #(.width(width)) rd_st7_253  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[253]), .rdlo_in(a7_wr[255]),  .coef_in(coef[128]), .rdup_out(a8_wr[253]), .rdlo_out(a8_wr[255]));
			radix2 #(.width(width)) rd_st7_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[256]), .rdlo_in(a7_wr[258]),  .coef_in(coef[0]), .rdup_out(a8_wr[256]), .rdlo_out(a8_wr[258]));
			radix2 #(.width(width)) rd_st7_257  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[257]), .rdlo_in(a7_wr[259]),  .coef_in(coef[128]), .rdup_out(a8_wr[257]), .rdlo_out(a8_wr[259]));
			radix2 #(.width(width)) rd_st7_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[260]), .rdlo_in(a7_wr[262]),  .coef_in(coef[0]), .rdup_out(a8_wr[260]), .rdlo_out(a8_wr[262]));
			radix2 #(.width(width)) rd_st7_261  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[261]), .rdlo_in(a7_wr[263]),  .coef_in(coef[128]), .rdup_out(a8_wr[261]), .rdlo_out(a8_wr[263]));
			radix2 #(.width(width)) rd_st7_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[264]), .rdlo_in(a7_wr[266]),  .coef_in(coef[0]), .rdup_out(a8_wr[264]), .rdlo_out(a8_wr[266]));
			radix2 #(.width(width)) rd_st7_265  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[265]), .rdlo_in(a7_wr[267]),  .coef_in(coef[128]), .rdup_out(a8_wr[265]), .rdlo_out(a8_wr[267]));
			radix2 #(.width(width)) rd_st7_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[268]), .rdlo_in(a7_wr[270]),  .coef_in(coef[0]), .rdup_out(a8_wr[268]), .rdlo_out(a8_wr[270]));
			radix2 #(.width(width)) rd_st7_269  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[269]), .rdlo_in(a7_wr[271]),  .coef_in(coef[128]), .rdup_out(a8_wr[269]), .rdlo_out(a8_wr[271]));
			radix2 #(.width(width)) rd_st7_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[272]), .rdlo_in(a7_wr[274]),  .coef_in(coef[0]), .rdup_out(a8_wr[272]), .rdlo_out(a8_wr[274]));
			radix2 #(.width(width)) rd_st7_273  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[273]), .rdlo_in(a7_wr[275]),  .coef_in(coef[128]), .rdup_out(a8_wr[273]), .rdlo_out(a8_wr[275]));
			radix2 #(.width(width)) rd_st7_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[276]), .rdlo_in(a7_wr[278]),  .coef_in(coef[0]), .rdup_out(a8_wr[276]), .rdlo_out(a8_wr[278]));
			radix2 #(.width(width)) rd_st7_277  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[277]), .rdlo_in(a7_wr[279]),  .coef_in(coef[128]), .rdup_out(a8_wr[277]), .rdlo_out(a8_wr[279]));
			radix2 #(.width(width)) rd_st7_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[280]), .rdlo_in(a7_wr[282]),  .coef_in(coef[0]), .rdup_out(a8_wr[280]), .rdlo_out(a8_wr[282]));
			radix2 #(.width(width)) rd_st7_281  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[281]), .rdlo_in(a7_wr[283]),  .coef_in(coef[128]), .rdup_out(a8_wr[281]), .rdlo_out(a8_wr[283]));
			radix2 #(.width(width)) rd_st7_284  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[284]), .rdlo_in(a7_wr[286]),  .coef_in(coef[0]), .rdup_out(a8_wr[284]), .rdlo_out(a8_wr[286]));
			radix2 #(.width(width)) rd_st7_285  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[285]), .rdlo_in(a7_wr[287]),  .coef_in(coef[128]), .rdup_out(a8_wr[285]), .rdlo_out(a8_wr[287]));
			radix2 #(.width(width)) rd_st7_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[288]), .rdlo_in(a7_wr[290]),  .coef_in(coef[0]), .rdup_out(a8_wr[288]), .rdlo_out(a8_wr[290]));
			radix2 #(.width(width)) rd_st7_289  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[289]), .rdlo_in(a7_wr[291]),  .coef_in(coef[128]), .rdup_out(a8_wr[289]), .rdlo_out(a8_wr[291]));
			radix2 #(.width(width)) rd_st7_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[292]), .rdlo_in(a7_wr[294]),  .coef_in(coef[0]), .rdup_out(a8_wr[292]), .rdlo_out(a8_wr[294]));
			radix2 #(.width(width)) rd_st7_293  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[293]), .rdlo_in(a7_wr[295]),  .coef_in(coef[128]), .rdup_out(a8_wr[293]), .rdlo_out(a8_wr[295]));
			radix2 #(.width(width)) rd_st7_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[296]), .rdlo_in(a7_wr[298]),  .coef_in(coef[0]), .rdup_out(a8_wr[296]), .rdlo_out(a8_wr[298]));
			radix2 #(.width(width)) rd_st7_297  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[297]), .rdlo_in(a7_wr[299]),  .coef_in(coef[128]), .rdup_out(a8_wr[297]), .rdlo_out(a8_wr[299]));
			radix2 #(.width(width)) rd_st7_300  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[300]), .rdlo_in(a7_wr[302]),  .coef_in(coef[0]), .rdup_out(a8_wr[300]), .rdlo_out(a8_wr[302]));
			radix2 #(.width(width)) rd_st7_301  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[301]), .rdlo_in(a7_wr[303]),  .coef_in(coef[128]), .rdup_out(a8_wr[301]), .rdlo_out(a8_wr[303]));
			radix2 #(.width(width)) rd_st7_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[304]), .rdlo_in(a7_wr[306]),  .coef_in(coef[0]), .rdup_out(a8_wr[304]), .rdlo_out(a8_wr[306]));
			radix2 #(.width(width)) rd_st7_305  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[305]), .rdlo_in(a7_wr[307]),  .coef_in(coef[128]), .rdup_out(a8_wr[305]), .rdlo_out(a8_wr[307]));
			radix2 #(.width(width)) rd_st7_308  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[308]), .rdlo_in(a7_wr[310]),  .coef_in(coef[0]), .rdup_out(a8_wr[308]), .rdlo_out(a8_wr[310]));
			radix2 #(.width(width)) rd_st7_309  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[309]), .rdlo_in(a7_wr[311]),  .coef_in(coef[128]), .rdup_out(a8_wr[309]), .rdlo_out(a8_wr[311]));
			radix2 #(.width(width)) rd_st7_312  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[312]), .rdlo_in(a7_wr[314]),  .coef_in(coef[0]), .rdup_out(a8_wr[312]), .rdlo_out(a8_wr[314]));
			radix2 #(.width(width)) rd_st7_313  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[313]), .rdlo_in(a7_wr[315]),  .coef_in(coef[128]), .rdup_out(a8_wr[313]), .rdlo_out(a8_wr[315]));
			radix2 #(.width(width)) rd_st7_316  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[316]), .rdlo_in(a7_wr[318]),  .coef_in(coef[0]), .rdup_out(a8_wr[316]), .rdlo_out(a8_wr[318]));
			radix2 #(.width(width)) rd_st7_317  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[317]), .rdlo_in(a7_wr[319]),  .coef_in(coef[128]), .rdup_out(a8_wr[317]), .rdlo_out(a8_wr[319]));
			radix2 #(.width(width)) rd_st7_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[320]), .rdlo_in(a7_wr[322]),  .coef_in(coef[0]), .rdup_out(a8_wr[320]), .rdlo_out(a8_wr[322]));
			radix2 #(.width(width)) rd_st7_321  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[321]), .rdlo_in(a7_wr[323]),  .coef_in(coef[128]), .rdup_out(a8_wr[321]), .rdlo_out(a8_wr[323]));
			radix2 #(.width(width)) rd_st7_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[324]), .rdlo_in(a7_wr[326]),  .coef_in(coef[0]), .rdup_out(a8_wr[324]), .rdlo_out(a8_wr[326]));
			radix2 #(.width(width)) rd_st7_325  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[325]), .rdlo_in(a7_wr[327]),  .coef_in(coef[128]), .rdup_out(a8_wr[325]), .rdlo_out(a8_wr[327]));
			radix2 #(.width(width)) rd_st7_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[328]), .rdlo_in(a7_wr[330]),  .coef_in(coef[0]), .rdup_out(a8_wr[328]), .rdlo_out(a8_wr[330]));
			radix2 #(.width(width)) rd_st7_329  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[329]), .rdlo_in(a7_wr[331]),  .coef_in(coef[128]), .rdup_out(a8_wr[329]), .rdlo_out(a8_wr[331]));
			radix2 #(.width(width)) rd_st7_332  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[332]), .rdlo_in(a7_wr[334]),  .coef_in(coef[0]), .rdup_out(a8_wr[332]), .rdlo_out(a8_wr[334]));
			radix2 #(.width(width)) rd_st7_333  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[333]), .rdlo_in(a7_wr[335]),  .coef_in(coef[128]), .rdup_out(a8_wr[333]), .rdlo_out(a8_wr[335]));
			radix2 #(.width(width)) rd_st7_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[336]), .rdlo_in(a7_wr[338]),  .coef_in(coef[0]), .rdup_out(a8_wr[336]), .rdlo_out(a8_wr[338]));
			radix2 #(.width(width)) rd_st7_337  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[337]), .rdlo_in(a7_wr[339]),  .coef_in(coef[128]), .rdup_out(a8_wr[337]), .rdlo_out(a8_wr[339]));
			radix2 #(.width(width)) rd_st7_340  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[340]), .rdlo_in(a7_wr[342]),  .coef_in(coef[0]), .rdup_out(a8_wr[340]), .rdlo_out(a8_wr[342]));
			radix2 #(.width(width)) rd_st7_341  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[341]), .rdlo_in(a7_wr[343]),  .coef_in(coef[128]), .rdup_out(a8_wr[341]), .rdlo_out(a8_wr[343]));
			radix2 #(.width(width)) rd_st7_344  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[344]), .rdlo_in(a7_wr[346]),  .coef_in(coef[0]), .rdup_out(a8_wr[344]), .rdlo_out(a8_wr[346]));
			radix2 #(.width(width)) rd_st7_345  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[345]), .rdlo_in(a7_wr[347]),  .coef_in(coef[128]), .rdup_out(a8_wr[345]), .rdlo_out(a8_wr[347]));
			radix2 #(.width(width)) rd_st7_348  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[348]), .rdlo_in(a7_wr[350]),  .coef_in(coef[0]), .rdup_out(a8_wr[348]), .rdlo_out(a8_wr[350]));
			radix2 #(.width(width)) rd_st7_349  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[349]), .rdlo_in(a7_wr[351]),  .coef_in(coef[128]), .rdup_out(a8_wr[349]), .rdlo_out(a8_wr[351]));
			radix2 #(.width(width)) rd_st7_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[352]), .rdlo_in(a7_wr[354]),  .coef_in(coef[0]), .rdup_out(a8_wr[352]), .rdlo_out(a8_wr[354]));
			radix2 #(.width(width)) rd_st7_353  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[353]), .rdlo_in(a7_wr[355]),  .coef_in(coef[128]), .rdup_out(a8_wr[353]), .rdlo_out(a8_wr[355]));
			radix2 #(.width(width)) rd_st7_356  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[356]), .rdlo_in(a7_wr[358]),  .coef_in(coef[0]), .rdup_out(a8_wr[356]), .rdlo_out(a8_wr[358]));
			radix2 #(.width(width)) rd_st7_357  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[357]), .rdlo_in(a7_wr[359]),  .coef_in(coef[128]), .rdup_out(a8_wr[357]), .rdlo_out(a8_wr[359]));
			radix2 #(.width(width)) rd_st7_360  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[360]), .rdlo_in(a7_wr[362]),  .coef_in(coef[0]), .rdup_out(a8_wr[360]), .rdlo_out(a8_wr[362]));
			radix2 #(.width(width)) rd_st7_361  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[361]), .rdlo_in(a7_wr[363]),  .coef_in(coef[128]), .rdup_out(a8_wr[361]), .rdlo_out(a8_wr[363]));
			radix2 #(.width(width)) rd_st7_364  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[364]), .rdlo_in(a7_wr[366]),  .coef_in(coef[0]), .rdup_out(a8_wr[364]), .rdlo_out(a8_wr[366]));
			radix2 #(.width(width)) rd_st7_365  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[365]), .rdlo_in(a7_wr[367]),  .coef_in(coef[128]), .rdup_out(a8_wr[365]), .rdlo_out(a8_wr[367]));
			radix2 #(.width(width)) rd_st7_368  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[368]), .rdlo_in(a7_wr[370]),  .coef_in(coef[0]), .rdup_out(a8_wr[368]), .rdlo_out(a8_wr[370]));
			radix2 #(.width(width)) rd_st7_369  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[369]), .rdlo_in(a7_wr[371]),  .coef_in(coef[128]), .rdup_out(a8_wr[369]), .rdlo_out(a8_wr[371]));
			radix2 #(.width(width)) rd_st7_372  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[372]), .rdlo_in(a7_wr[374]),  .coef_in(coef[0]), .rdup_out(a8_wr[372]), .rdlo_out(a8_wr[374]));
			radix2 #(.width(width)) rd_st7_373  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[373]), .rdlo_in(a7_wr[375]),  .coef_in(coef[128]), .rdup_out(a8_wr[373]), .rdlo_out(a8_wr[375]));
			radix2 #(.width(width)) rd_st7_376  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[376]), .rdlo_in(a7_wr[378]),  .coef_in(coef[0]), .rdup_out(a8_wr[376]), .rdlo_out(a8_wr[378]));
			radix2 #(.width(width)) rd_st7_377  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[377]), .rdlo_in(a7_wr[379]),  .coef_in(coef[128]), .rdup_out(a8_wr[377]), .rdlo_out(a8_wr[379]));
			radix2 #(.width(width)) rd_st7_380  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[380]), .rdlo_in(a7_wr[382]),  .coef_in(coef[0]), .rdup_out(a8_wr[380]), .rdlo_out(a8_wr[382]));
			radix2 #(.width(width)) rd_st7_381  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[381]), .rdlo_in(a7_wr[383]),  .coef_in(coef[128]), .rdup_out(a8_wr[381]), .rdlo_out(a8_wr[383]));
			radix2 #(.width(width)) rd_st7_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[384]), .rdlo_in(a7_wr[386]),  .coef_in(coef[0]), .rdup_out(a8_wr[384]), .rdlo_out(a8_wr[386]));
			radix2 #(.width(width)) rd_st7_385  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[385]), .rdlo_in(a7_wr[387]),  .coef_in(coef[128]), .rdup_out(a8_wr[385]), .rdlo_out(a8_wr[387]));
			radix2 #(.width(width)) rd_st7_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[388]), .rdlo_in(a7_wr[390]),  .coef_in(coef[0]), .rdup_out(a8_wr[388]), .rdlo_out(a8_wr[390]));
			radix2 #(.width(width)) rd_st7_389  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[389]), .rdlo_in(a7_wr[391]),  .coef_in(coef[128]), .rdup_out(a8_wr[389]), .rdlo_out(a8_wr[391]));
			radix2 #(.width(width)) rd_st7_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[392]), .rdlo_in(a7_wr[394]),  .coef_in(coef[0]), .rdup_out(a8_wr[392]), .rdlo_out(a8_wr[394]));
			radix2 #(.width(width)) rd_st7_393  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[393]), .rdlo_in(a7_wr[395]),  .coef_in(coef[128]), .rdup_out(a8_wr[393]), .rdlo_out(a8_wr[395]));
			radix2 #(.width(width)) rd_st7_396  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[396]), .rdlo_in(a7_wr[398]),  .coef_in(coef[0]), .rdup_out(a8_wr[396]), .rdlo_out(a8_wr[398]));
			radix2 #(.width(width)) rd_st7_397  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[397]), .rdlo_in(a7_wr[399]),  .coef_in(coef[128]), .rdup_out(a8_wr[397]), .rdlo_out(a8_wr[399]));
			radix2 #(.width(width)) rd_st7_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[400]), .rdlo_in(a7_wr[402]),  .coef_in(coef[0]), .rdup_out(a8_wr[400]), .rdlo_out(a8_wr[402]));
			radix2 #(.width(width)) rd_st7_401  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[401]), .rdlo_in(a7_wr[403]),  .coef_in(coef[128]), .rdup_out(a8_wr[401]), .rdlo_out(a8_wr[403]));
			radix2 #(.width(width)) rd_st7_404  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[404]), .rdlo_in(a7_wr[406]),  .coef_in(coef[0]), .rdup_out(a8_wr[404]), .rdlo_out(a8_wr[406]));
			radix2 #(.width(width)) rd_st7_405  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[405]), .rdlo_in(a7_wr[407]),  .coef_in(coef[128]), .rdup_out(a8_wr[405]), .rdlo_out(a8_wr[407]));
			radix2 #(.width(width)) rd_st7_408  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[408]), .rdlo_in(a7_wr[410]),  .coef_in(coef[0]), .rdup_out(a8_wr[408]), .rdlo_out(a8_wr[410]));
			radix2 #(.width(width)) rd_st7_409  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[409]), .rdlo_in(a7_wr[411]),  .coef_in(coef[128]), .rdup_out(a8_wr[409]), .rdlo_out(a8_wr[411]));
			radix2 #(.width(width)) rd_st7_412  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[412]), .rdlo_in(a7_wr[414]),  .coef_in(coef[0]), .rdup_out(a8_wr[412]), .rdlo_out(a8_wr[414]));
			radix2 #(.width(width)) rd_st7_413  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[413]), .rdlo_in(a7_wr[415]),  .coef_in(coef[128]), .rdup_out(a8_wr[413]), .rdlo_out(a8_wr[415]));
			radix2 #(.width(width)) rd_st7_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[416]), .rdlo_in(a7_wr[418]),  .coef_in(coef[0]), .rdup_out(a8_wr[416]), .rdlo_out(a8_wr[418]));
			radix2 #(.width(width)) rd_st7_417  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[417]), .rdlo_in(a7_wr[419]),  .coef_in(coef[128]), .rdup_out(a8_wr[417]), .rdlo_out(a8_wr[419]));
			radix2 #(.width(width)) rd_st7_420  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[420]), .rdlo_in(a7_wr[422]),  .coef_in(coef[0]), .rdup_out(a8_wr[420]), .rdlo_out(a8_wr[422]));
			radix2 #(.width(width)) rd_st7_421  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[421]), .rdlo_in(a7_wr[423]),  .coef_in(coef[128]), .rdup_out(a8_wr[421]), .rdlo_out(a8_wr[423]));
			radix2 #(.width(width)) rd_st7_424  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[424]), .rdlo_in(a7_wr[426]),  .coef_in(coef[0]), .rdup_out(a8_wr[424]), .rdlo_out(a8_wr[426]));
			radix2 #(.width(width)) rd_st7_425  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[425]), .rdlo_in(a7_wr[427]),  .coef_in(coef[128]), .rdup_out(a8_wr[425]), .rdlo_out(a8_wr[427]));
			radix2 #(.width(width)) rd_st7_428  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[428]), .rdlo_in(a7_wr[430]),  .coef_in(coef[0]), .rdup_out(a8_wr[428]), .rdlo_out(a8_wr[430]));
			radix2 #(.width(width)) rd_st7_429  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[429]), .rdlo_in(a7_wr[431]),  .coef_in(coef[128]), .rdup_out(a8_wr[429]), .rdlo_out(a8_wr[431]));
			radix2 #(.width(width)) rd_st7_432  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[432]), .rdlo_in(a7_wr[434]),  .coef_in(coef[0]), .rdup_out(a8_wr[432]), .rdlo_out(a8_wr[434]));
			radix2 #(.width(width)) rd_st7_433  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[433]), .rdlo_in(a7_wr[435]),  .coef_in(coef[128]), .rdup_out(a8_wr[433]), .rdlo_out(a8_wr[435]));
			radix2 #(.width(width)) rd_st7_436  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[436]), .rdlo_in(a7_wr[438]),  .coef_in(coef[0]), .rdup_out(a8_wr[436]), .rdlo_out(a8_wr[438]));
			radix2 #(.width(width)) rd_st7_437  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[437]), .rdlo_in(a7_wr[439]),  .coef_in(coef[128]), .rdup_out(a8_wr[437]), .rdlo_out(a8_wr[439]));
			radix2 #(.width(width)) rd_st7_440  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[440]), .rdlo_in(a7_wr[442]),  .coef_in(coef[0]), .rdup_out(a8_wr[440]), .rdlo_out(a8_wr[442]));
			radix2 #(.width(width)) rd_st7_441  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[441]), .rdlo_in(a7_wr[443]),  .coef_in(coef[128]), .rdup_out(a8_wr[441]), .rdlo_out(a8_wr[443]));
			radix2 #(.width(width)) rd_st7_444  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[444]), .rdlo_in(a7_wr[446]),  .coef_in(coef[0]), .rdup_out(a8_wr[444]), .rdlo_out(a8_wr[446]));
			radix2 #(.width(width)) rd_st7_445  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[445]), .rdlo_in(a7_wr[447]),  .coef_in(coef[128]), .rdup_out(a8_wr[445]), .rdlo_out(a8_wr[447]));
			radix2 #(.width(width)) rd_st7_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[448]), .rdlo_in(a7_wr[450]),  .coef_in(coef[0]), .rdup_out(a8_wr[448]), .rdlo_out(a8_wr[450]));
			radix2 #(.width(width)) rd_st7_449  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[449]), .rdlo_in(a7_wr[451]),  .coef_in(coef[128]), .rdup_out(a8_wr[449]), .rdlo_out(a8_wr[451]));
			radix2 #(.width(width)) rd_st7_452  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[452]), .rdlo_in(a7_wr[454]),  .coef_in(coef[0]), .rdup_out(a8_wr[452]), .rdlo_out(a8_wr[454]));
			radix2 #(.width(width)) rd_st7_453  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[453]), .rdlo_in(a7_wr[455]),  .coef_in(coef[128]), .rdup_out(a8_wr[453]), .rdlo_out(a8_wr[455]));
			radix2 #(.width(width)) rd_st7_456  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[456]), .rdlo_in(a7_wr[458]),  .coef_in(coef[0]), .rdup_out(a8_wr[456]), .rdlo_out(a8_wr[458]));
			radix2 #(.width(width)) rd_st7_457  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[457]), .rdlo_in(a7_wr[459]),  .coef_in(coef[128]), .rdup_out(a8_wr[457]), .rdlo_out(a8_wr[459]));
			radix2 #(.width(width)) rd_st7_460  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[460]), .rdlo_in(a7_wr[462]),  .coef_in(coef[0]), .rdup_out(a8_wr[460]), .rdlo_out(a8_wr[462]));
			radix2 #(.width(width)) rd_st7_461  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[461]), .rdlo_in(a7_wr[463]),  .coef_in(coef[128]), .rdup_out(a8_wr[461]), .rdlo_out(a8_wr[463]));
			radix2 #(.width(width)) rd_st7_464  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[464]), .rdlo_in(a7_wr[466]),  .coef_in(coef[0]), .rdup_out(a8_wr[464]), .rdlo_out(a8_wr[466]));
			radix2 #(.width(width)) rd_st7_465  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[465]), .rdlo_in(a7_wr[467]),  .coef_in(coef[128]), .rdup_out(a8_wr[465]), .rdlo_out(a8_wr[467]));
			radix2 #(.width(width)) rd_st7_468  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[468]), .rdlo_in(a7_wr[470]),  .coef_in(coef[0]), .rdup_out(a8_wr[468]), .rdlo_out(a8_wr[470]));
			radix2 #(.width(width)) rd_st7_469  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[469]), .rdlo_in(a7_wr[471]),  .coef_in(coef[128]), .rdup_out(a8_wr[469]), .rdlo_out(a8_wr[471]));
			radix2 #(.width(width)) rd_st7_472  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[472]), .rdlo_in(a7_wr[474]),  .coef_in(coef[0]), .rdup_out(a8_wr[472]), .rdlo_out(a8_wr[474]));
			radix2 #(.width(width)) rd_st7_473  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[473]), .rdlo_in(a7_wr[475]),  .coef_in(coef[128]), .rdup_out(a8_wr[473]), .rdlo_out(a8_wr[475]));
			radix2 #(.width(width)) rd_st7_476  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[476]), .rdlo_in(a7_wr[478]),  .coef_in(coef[0]), .rdup_out(a8_wr[476]), .rdlo_out(a8_wr[478]));
			radix2 #(.width(width)) rd_st7_477  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[477]), .rdlo_in(a7_wr[479]),  .coef_in(coef[128]), .rdup_out(a8_wr[477]), .rdlo_out(a8_wr[479]));
			radix2 #(.width(width)) rd_st7_480  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[480]), .rdlo_in(a7_wr[482]),  .coef_in(coef[0]), .rdup_out(a8_wr[480]), .rdlo_out(a8_wr[482]));
			radix2 #(.width(width)) rd_st7_481  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[481]), .rdlo_in(a7_wr[483]),  .coef_in(coef[128]), .rdup_out(a8_wr[481]), .rdlo_out(a8_wr[483]));
			radix2 #(.width(width)) rd_st7_484  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[484]), .rdlo_in(a7_wr[486]),  .coef_in(coef[0]), .rdup_out(a8_wr[484]), .rdlo_out(a8_wr[486]));
			radix2 #(.width(width)) rd_st7_485  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[485]), .rdlo_in(a7_wr[487]),  .coef_in(coef[128]), .rdup_out(a8_wr[485]), .rdlo_out(a8_wr[487]));
			radix2 #(.width(width)) rd_st7_488  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[488]), .rdlo_in(a7_wr[490]),  .coef_in(coef[0]), .rdup_out(a8_wr[488]), .rdlo_out(a8_wr[490]));
			radix2 #(.width(width)) rd_st7_489  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[489]), .rdlo_in(a7_wr[491]),  .coef_in(coef[128]), .rdup_out(a8_wr[489]), .rdlo_out(a8_wr[491]));
			radix2 #(.width(width)) rd_st7_492  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[492]), .rdlo_in(a7_wr[494]),  .coef_in(coef[0]), .rdup_out(a8_wr[492]), .rdlo_out(a8_wr[494]));
			radix2 #(.width(width)) rd_st7_493  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[493]), .rdlo_in(a7_wr[495]),  .coef_in(coef[128]), .rdup_out(a8_wr[493]), .rdlo_out(a8_wr[495]));
			radix2 #(.width(width)) rd_st7_496  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[496]), .rdlo_in(a7_wr[498]),  .coef_in(coef[0]), .rdup_out(a8_wr[496]), .rdlo_out(a8_wr[498]));
			radix2 #(.width(width)) rd_st7_497  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[497]), .rdlo_in(a7_wr[499]),  .coef_in(coef[128]), .rdup_out(a8_wr[497]), .rdlo_out(a8_wr[499]));
			radix2 #(.width(width)) rd_st7_500  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[500]), .rdlo_in(a7_wr[502]),  .coef_in(coef[0]), .rdup_out(a8_wr[500]), .rdlo_out(a8_wr[502]));
			radix2 #(.width(width)) rd_st7_501  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[501]), .rdlo_in(a7_wr[503]),  .coef_in(coef[128]), .rdup_out(a8_wr[501]), .rdlo_out(a8_wr[503]));
			radix2 #(.width(width)) rd_st7_504  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[504]), .rdlo_in(a7_wr[506]),  .coef_in(coef[0]), .rdup_out(a8_wr[504]), .rdlo_out(a8_wr[506]));
			radix2 #(.width(width)) rd_st7_505  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[505]), .rdlo_in(a7_wr[507]),  .coef_in(coef[128]), .rdup_out(a8_wr[505]), .rdlo_out(a8_wr[507]));
			radix2 #(.width(width)) rd_st7_508  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[508]), .rdlo_in(a7_wr[510]),  .coef_in(coef[0]), .rdup_out(a8_wr[508]), .rdlo_out(a8_wr[510]));
			radix2 #(.width(width)) rd_st7_509  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a7_wr[509]), .rdlo_in(a7_wr[511]),  .coef_in(coef[128]), .rdup_out(a8_wr[509]), .rdlo_out(a8_wr[511]));

		//--- radix stage 8
			radix2 #(.width(width)) rd_st8_0   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[0]), .rdlo_in(a8_wr[1]),  .coef_in(coef[0]), .rdup_out(a9_wr[0]), .rdlo_out(a9_wr[1]));
			radix2 #(.width(width)) rd_st8_2   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[2]), .rdlo_in(a8_wr[3]),  .coef_in(coef[0]), .rdup_out(a9_wr[2]), .rdlo_out(a9_wr[3]));
			radix2 #(.width(width)) rd_st8_4   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[4]), .rdlo_in(a8_wr[5]),  .coef_in(coef[0]), .rdup_out(a9_wr[4]), .rdlo_out(a9_wr[5]));
			radix2 #(.width(width)) rd_st8_6   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[6]), .rdlo_in(a8_wr[7]),  .coef_in(coef[0]), .rdup_out(a9_wr[6]), .rdlo_out(a9_wr[7]));
			radix2 #(.width(width)) rd_st8_8   (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[8]), .rdlo_in(a8_wr[9]),  .coef_in(coef[0]), .rdup_out(a9_wr[8]), .rdlo_out(a9_wr[9]));
			radix2 #(.width(width)) rd_st8_10  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[10]), .rdlo_in(a8_wr[11]),  .coef_in(coef[0]), .rdup_out(a9_wr[10]), .rdlo_out(a9_wr[11]));
			radix2 #(.width(width)) rd_st8_12  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[12]), .rdlo_in(a8_wr[13]),  .coef_in(coef[0]), .rdup_out(a9_wr[12]), .rdlo_out(a9_wr[13]));
			radix2 #(.width(width)) rd_st8_14  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[14]), .rdlo_in(a8_wr[15]),  .coef_in(coef[0]), .rdup_out(a9_wr[14]), .rdlo_out(a9_wr[15]));
			radix2 #(.width(width)) rd_st8_16  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[16]), .rdlo_in(a8_wr[17]),  .coef_in(coef[0]), .rdup_out(a9_wr[16]), .rdlo_out(a9_wr[17]));
			radix2 #(.width(width)) rd_st8_18  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[18]), .rdlo_in(a8_wr[19]),  .coef_in(coef[0]), .rdup_out(a9_wr[18]), .rdlo_out(a9_wr[19]));
			radix2 #(.width(width)) rd_st8_20  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[20]), .rdlo_in(a8_wr[21]),  .coef_in(coef[0]), .rdup_out(a9_wr[20]), .rdlo_out(a9_wr[21]));
			radix2 #(.width(width)) rd_st8_22  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[22]), .rdlo_in(a8_wr[23]),  .coef_in(coef[0]), .rdup_out(a9_wr[22]), .rdlo_out(a9_wr[23]));
			radix2 #(.width(width)) rd_st8_24  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[24]), .rdlo_in(a8_wr[25]),  .coef_in(coef[0]), .rdup_out(a9_wr[24]), .rdlo_out(a9_wr[25]));
			radix2 #(.width(width)) rd_st8_26  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[26]), .rdlo_in(a8_wr[27]),  .coef_in(coef[0]), .rdup_out(a9_wr[26]), .rdlo_out(a9_wr[27]));
			radix2 #(.width(width)) rd_st8_28  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[28]), .rdlo_in(a8_wr[29]),  .coef_in(coef[0]), .rdup_out(a9_wr[28]), .rdlo_out(a9_wr[29]));
			radix2 #(.width(width)) rd_st8_30  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[30]), .rdlo_in(a8_wr[31]),  .coef_in(coef[0]), .rdup_out(a9_wr[30]), .rdlo_out(a9_wr[31]));
			radix2 #(.width(width)) rd_st8_32  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[32]), .rdlo_in(a8_wr[33]),  .coef_in(coef[0]), .rdup_out(a9_wr[32]), .rdlo_out(a9_wr[33]));
			radix2 #(.width(width)) rd_st8_34  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[34]), .rdlo_in(a8_wr[35]),  .coef_in(coef[0]), .rdup_out(a9_wr[34]), .rdlo_out(a9_wr[35]));
			radix2 #(.width(width)) rd_st8_36  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[36]), .rdlo_in(a8_wr[37]),  .coef_in(coef[0]), .rdup_out(a9_wr[36]), .rdlo_out(a9_wr[37]));
			radix2 #(.width(width)) rd_st8_38  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[38]), .rdlo_in(a8_wr[39]),  .coef_in(coef[0]), .rdup_out(a9_wr[38]), .rdlo_out(a9_wr[39]));
			radix2 #(.width(width)) rd_st8_40  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[40]), .rdlo_in(a8_wr[41]),  .coef_in(coef[0]), .rdup_out(a9_wr[40]), .rdlo_out(a9_wr[41]));
			radix2 #(.width(width)) rd_st8_42  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[42]), .rdlo_in(a8_wr[43]),  .coef_in(coef[0]), .rdup_out(a9_wr[42]), .rdlo_out(a9_wr[43]));
			radix2 #(.width(width)) rd_st8_44  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[44]), .rdlo_in(a8_wr[45]),  .coef_in(coef[0]), .rdup_out(a9_wr[44]), .rdlo_out(a9_wr[45]));
			radix2 #(.width(width)) rd_st8_46  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[46]), .rdlo_in(a8_wr[47]),  .coef_in(coef[0]), .rdup_out(a9_wr[46]), .rdlo_out(a9_wr[47]));
			radix2 #(.width(width)) rd_st8_48  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[48]), .rdlo_in(a8_wr[49]),  .coef_in(coef[0]), .rdup_out(a9_wr[48]), .rdlo_out(a9_wr[49]));
			radix2 #(.width(width)) rd_st8_50  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[50]), .rdlo_in(a8_wr[51]),  .coef_in(coef[0]), .rdup_out(a9_wr[50]), .rdlo_out(a9_wr[51]));
			radix2 #(.width(width)) rd_st8_52  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[52]), .rdlo_in(a8_wr[53]),  .coef_in(coef[0]), .rdup_out(a9_wr[52]), .rdlo_out(a9_wr[53]));
			radix2 #(.width(width)) rd_st8_54  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[54]), .rdlo_in(a8_wr[55]),  .coef_in(coef[0]), .rdup_out(a9_wr[54]), .rdlo_out(a9_wr[55]));
			radix2 #(.width(width)) rd_st8_56  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[56]), .rdlo_in(a8_wr[57]),  .coef_in(coef[0]), .rdup_out(a9_wr[56]), .rdlo_out(a9_wr[57]));
			radix2 #(.width(width)) rd_st8_58  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[58]), .rdlo_in(a8_wr[59]),  .coef_in(coef[0]), .rdup_out(a9_wr[58]), .rdlo_out(a9_wr[59]));
			radix2 #(.width(width)) rd_st8_60  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[60]), .rdlo_in(a8_wr[61]),  .coef_in(coef[0]), .rdup_out(a9_wr[60]), .rdlo_out(a9_wr[61]));
			radix2 #(.width(width)) rd_st8_62  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[62]), .rdlo_in(a8_wr[63]),  .coef_in(coef[0]), .rdup_out(a9_wr[62]), .rdlo_out(a9_wr[63]));
			radix2 #(.width(width)) rd_st8_64  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[64]), .rdlo_in(a8_wr[65]),  .coef_in(coef[0]), .rdup_out(a9_wr[64]), .rdlo_out(a9_wr[65]));
			radix2 #(.width(width)) rd_st8_66  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[66]), .rdlo_in(a8_wr[67]),  .coef_in(coef[0]), .rdup_out(a9_wr[66]), .rdlo_out(a9_wr[67]));
			radix2 #(.width(width)) rd_st8_68  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[68]), .rdlo_in(a8_wr[69]),  .coef_in(coef[0]), .rdup_out(a9_wr[68]), .rdlo_out(a9_wr[69]));
			radix2 #(.width(width)) rd_st8_70  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[70]), .rdlo_in(a8_wr[71]),  .coef_in(coef[0]), .rdup_out(a9_wr[70]), .rdlo_out(a9_wr[71]));
			radix2 #(.width(width)) rd_st8_72  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[72]), .rdlo_in(a8_wr[73]),  .coef_in(coef[0]), .rdup_out(a9_wr[72]), .rdlo_out(a9_wr[73]));
			radix2 #(.width(width)) rd_st8_74  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[74]), .rdlo_in(a8_wr[75]),  .coef_in(coef[0]), .rdup_out(a9_wr[74]), .rdlo_out(a9_wr[75]));
			radix2 #(.width(width)) rd_st8_76  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[76]), .rdlo_in(a8_wr[77]),  .coef_in(coef[0]), .rdup_out(a9_wr[76]), .rdlo_out(a9_wr[77]));
			radix2 #(.width(width)) rd_st8_78  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[78]), .rdlo_in(a8_wr[79]),  .coef_in(coef[0]), .rdup_out(a9_wr[78]), .rdlo_out(a9_wr[79]));
			radix2 #(.width(width)) rd_st8_80  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[80]), .rdlo_in(a8_wr[81]),  .coef_in(coef[0]), .rdup_out(a9_wr[80]), .rdlo_out(a9_wr[81]));
			radix2 #(.width(width)) rd_st8_82  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[82]), .rdlo_in(a8_wr[83]),  .coef_in(coef[0]), .rdup_out(a9_wr[82]), .rdlo_out(a9_wr[83]));
			radix2 #(.width(width)) rd_st8_84  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[84]), .rdlo_in(a8_wr[85]),  .coef_in(coef[0]), .rdup_out(a9_wr[84]), .rdlo_out(a9_wr[85]));
			radix2 #(.width(width)) rd_st8_86  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[86]), .rdlo_in(a8_wr[87]),  .coef_in(coef[0]), .rdup_out(a9_wr[86]), .rdlo_out(a9_wr[87]));
			radix2 #(.width(width)) rd_st8_88  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[88]), .rdlo_in(a8_wr[89]),  .coef_in(coef[0]), .rdup_out(a9_wr[88]), .rdlo_out(a9_wr[89]));
			radix2 #(.width(width)) rd_st8_90  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[90]), .rdlo_in(a8_wr[91]),  .coef_in(coef[0]), .rdup_out(a9_wr[90]), .rdlo_out(a9_wr[91]));
			radix2 #(.width(width)) rd_st8_92  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[92]), .rdlo_in(a8_wr[93]),  .coef_in(coef[0]), .rdup_out(a9_wr[92]), .rdlo_out(a9_wr[93]));
			radix2 #(.width(width)) rd_st8_94  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[94]), .rdlo_in(a8_wr[95]),  .coef_in(coef[0]), .rdup_out(a9_wr[94]), .rdlo_out(a9_wr[95]));
			radix2 #(.width(width)) rd_st8_96  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[96]), .rdlo_in(a8_wr[97]),  .coef_in(coef[0]), .rdup_out(a9_wr[96]), .rdlo_out(a9_wr[97]));
			radix2 #(.width(width)) rd_st8_98  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[98]), .rdlo_in(a8_wr[99]),  .coef_in(coef[0]), .rdup_out(a9_wr[98]), .rdlo_out(a9_wr[99]));
			radix2 #(.width(width)) rd_st8_100  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[100]), .rdlo_in(a8_wr[101]),  .coef_in(coef[0]), .rdup_out(a9_wr[100]), .rdlo_out(a9_wr[101]));
			radix2 #(.width(width)) rd_st8_102  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[102]), .rdlo_in(a8_wr[103]),  .coef_in(coef[0]), .rdup_out(a9_wr[102]), .rdlo_out(a9_wr[103]));
			radix2 #(.width(width)) rd_st8_104  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[104]), .rdlo_in(a8_wr[105]),  .coef_in(coef[0]), .rdup_out(a9_wr[104]), .rdlo_out(a9_wr[105]));
			radix2 #(.width(width)) rd_st8_106  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[106]), .rdlo_in(a8_wr[107]),  .coef_in(coef[0]), .rdup_out(a9_wr[106]), .rdlo_out(a9_wr[107]));
			radix2 #(.width(width)) rd_st8_108  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[108]), .rdlo_in(a8_wr[109]),  .coef_in(coef[0]), .rdup_out(a9_wr[108]), .rdlo_out(a9_wr[109]));
			radix2 #(.width(width)) rd_st8_110  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[110]), .rdlo_in(a8_wr[111]),  .coef_in(coef[0]), .rdup_out(a9_wr[110]), .rdlo_out(a9_wr[111]));
			radix2 #(.width(width)) rd_st8_112  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[112]), .rdlo_in(a8_wr[113]),  .coef_in(coef[0]), .rdup_out(a9_wr[112]), .rdlo_out(a9_wr[113]));
			radix2 #(.width(width)) rd_st8_114  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[114]), .rdlo_in(a8_wr[115]),  .coef_in(coef[0]), .rdup_out(a9_wr[114]), .rdlo_out(a9_wr[115]));
			radix2 #(.width(width)) rd_st8_116  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[116]), .rdlo_in(a8_wr[117]),  .coef_in(coef[0]), .rdup_out(a9_wr[116]), .rdlo_out(a9_wr[117]));
			radix2 #(.width(width)) rd_st8_118  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[118]), .rdlo_in(a8_wr[119]),  .coef_in(coef[0]), .rdup_out(a9_wr[118]), .rdlo_out(a9_wr[119]));
			radix2 #(.width(width)) rd_st8_120  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[120]), .rdlo_in(a8_wr[121]),  .coef_in(coef[0]), .rdup_out(a9_wr[120]), .rdlo_out(a9_wr[121]));
			radix2 #(.width(width)) rd_st8_122  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[122]), .rdlo_in(a8_wr[123]),  .coef_in(coef[0]), .rdup_out(a9_wr[122]), .rdlo_out(a9_wr[123]));
			radix2 #(.width(width)) rd_st8_124  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[124]), .rdlo_in(a8_wr[125]),  .coef_in(coef[0]), .rdup_out(a9_wr[124]), .rdlo_out(a9_wr[125]));
			radix2 #(.width(width)) rd_st8_126  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[126]), .rdlo_in(a8_wr[127]),  .coef_in(coef[0]), .rdup_out(a9_wr[126]), .rdlo_out(a9_wr[127]));
			radix2 #(.width(width)) rd_st8_128  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[128]), .rdlo_in(a8_wr[129]),  .coef_in(coef[0]), .rdup_out(a9_wr[128]), .rdlo_out(a9_wr[129]));
			radix2 #(.width(width)) rd_st8_130  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[130]), .rdlo_in(a8_wr[131]),  .coef_in(coef[0]), .rdup_out(a9_wr[130]), .rdlo_out(a9_wr[131]));
			radix2 #(.width(width)) rd_st8_132  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[132]), .rdlo_in(a8_wr[133]),  .coef_in(coef[0]), .rdup_out(a9_wr[132]), .rdlo_out(a9_wr[133]));
			radix2 #(.width(width)) rd_st8_134  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[134]), .rdlo_in(a8_wr[135]),  .coef_in(coef[0]), .rdup_out(a9_wr[134]), .rdlo_out(a9_wr[135]));
			radix2 #(.width(width)) rd_st8_136  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[136]), .rdlo_in(a8_wr[137]),  .coef_in(coef[0]), .rdup_out(a9_wr[136]), .rdlo_out(a9_wr[137]));
			radix2 #(.width(width)) rd_st8_138  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[138]), .rdlo_in(a8_wr[139]),  .coef_in(coef[0]), .rdup_out(a9_wr[138]), .rdlo_out(a9_wr[139]));
			radix2 #(.width(width)) rd_st8_140  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[140]), .rdlo_in(a8_wr[141]),  .coef_in(coef[0]), .rdup_out(a9_wr[140]), .rdlo_out(a9_wr[141]));
			radix2 #(.width(width)) rd_st8_142  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[142]), .rdlo_in(a8_wr[143]),  .coef_in(coef[0]), .rdup_out(a9_wr[142]), .rdlo_out(a9_wr[143]));
			radix2 #(.width(width)) rd_st8_144  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[144]), .rdlo_in(a8_wr[145]),  .coef_in(coef[0]), .rdup_out(a9_wr[144]), .rdlo_out(a9_wr[145]));
			radix2 #(.width(width)) rd_st8_146  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[146]), .rdlo_in(a8_wr[147]),  .coef_in(coef[0]), .rdup_out(a9_wr[146]), .rdlo_out(a9_wr[147]));
			radix2 #(.width(width)) rd_st8_148  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[148]), .rdlo_in(a8_wr[149]),  .coef_in(coef[0]), .rdup_out(a9_wr[148]), .rdlo_out(a9_wr[149]));
			radix2 #(.width(width)) rd_st8_150  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[150]), .rdlo_in(a8_wr[151]),  .coef_in(coef[0]), .rdup_out(a9_wr[150]), .rdlo_out(a9_wr[151]));
			radix2 #(.width(width)) rd_st8_152  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[152]), .rdlo_in(a8_wr[153]),  .coef_in(coef[0]), .rdup_out(a9_wr[152]), .rdlo_out(a9_wr[153]));
			radix2 #(.width(width)) rd_st8_154  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[154]), .rdlo_in(a8_wr[155]),  .coef_in(coef[0]), .rdup_out(a9_wr[154]), .rdlo_out(a9_wr[155]));
			radix2 #(.width(width)) rd_st8_156  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[156]), .rdlo_in(a8_wr[157]),  .coef_in(coef[0]), .rdup_out(a9_wr[156]), .rdlo_out(a9_wr[157]));
			radix2 #(.width(width)) rd_st8_158  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[158]), .rdlo_in(a8_wr[159]),  .coef_in(coef[0]), .rdup_out(a9_wr[158]), .rdlo_out(a9_wr[159]));
			radix2 #(.width(width)) rd_st8_160  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[160]), .rdlo_in(a8_wr[161]),  .coef_in(coef[0]), .rdup_out(a9_wr[160]), .rdlo_out(a9_wr[161]));
			radix2 #(.width(width)) rd_st8_162  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[162]), .rdlo_in(a8_wr[163]),  .coef_in(coef[0]), .rdup_out(a9_wr[162]), .rdlo_out(a9_wr[163]));
			radix2 #(.width(width)) rd_st8_164  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[164]), .rdlo_in(a8_wr[165]),  .coef_in(coef[0]), .rdup_out(a9_wr[164]), .rdlo_out(a9_wr[165]));
			radix2 #(.width(width)) rd_st8_166  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[166]), .rdlo_in(a8_wr[167]),  .coef_in(coef[0]), .rdup_out(a9_wr[166]), .rdlo_out(a9_wr[167]));
			radix2 #(.width(width)) rd_st8_168  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[168]), .rdlo_in(a8_wr[169]),  .coef_in(coef[0]), .rdup_out(a9_wr[168]), .rdlo_out(a9_wr[169]));
			radix2 #(.width(width)) rd_st8_170  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[170]), .rdlo_in(a8_wr[171]),  .coef_in(coef[0]), .rdup_out(a9_wr[170]), .rdlo_out(a9_wr[171]));
			radix2 #(.width(width)) rd_st8_172  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[172]), .rdlo_in(a8_wr[173]),  .coef_in(coef[0]), .rdup_out(a9_wr[172]), .rdlo_out(a9_wr[173]));
			radix2 #(.width(width)) rd_st8_174  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[174]), .rdlo_in(a8_wr[175]),  .coef_in(coef[0]), .rdup_out(a9_wr[174]), .rdlo_out(a9_wr[175]));
			radix2 #(.width(width)) rd_st8_176  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[176]), .rdlo_in(a8_wr[177]),  .coef_in(coef[0]), .rdup_out(a9_wr[176]), .rdlo_out(a9_wr[177]));
			radix2 #(.width(width)) rd_st8_178  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[178]), .rdlo_in(a8_wr[179]),  .coef_in(coef[0]), .rdup_out(a9_wr[178]), .rdlo_out(a9_wr[179]));
			radix2 #(.width(width)) rd_st8_180  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[180]), .rdlo_in(a8_wr[181]),  .coef_in(coef[0]), .rdup_out(a9_wr[180]), .rdlo_out(a9_wr[181]));
			radix2 #(.width(width)) rd_st8_182  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[182]), .rdlo_in(a8_wr[183]),  .coef_in(coef[0]), .rdup_out(a9_wr[182]), .rdlo_out(a9_wr[183]));
			radix2 #(.width(width)) rd_st8_184  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[184]), .rdlo_in(a8_wr[185]),  .coef_in(coef[0]), .rdup_out(a9_wr[184]), .rdlo_out(a9_wr[185]));
			radix2 #(.width(width)) rd_st8_186  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[186]), .rdlo_in(a8_wr[187]),  .coef_in(coef[0]), .rdup_out(a9_wr[186]), .rdlo_out(a9_wr[187]));
			radix2 #(.width(width)) rd_st8_188  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[188]), .rdlo_in(a8_wr[189]),  .coef_in(coef[0]), .rdup_out(a9_wr[188]), .rdlo_out(a9_wr[189]));
			radix2 #(.width(width)) rd_st8_190  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[190]), .rdlo_in(a8_wr[191]),  .coef_in(coef[0]), .rdup_out(a9_wr[190]), .rdlo_out(a9_wr[191]));
			radix2 #(.width(width)) rd_st8_192  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[192]), .rdlo_in(a8_wr[193]),  .coef_in(coef[0]), .rdup_out(a9_wr[192]), .rdlo_out(a9_wr[193]));
			radix2 #(.width(width)) rd_st8_194  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[194]), .rdlo_in(a8_wr[195]),  .coef_in(coef[0]), .rdup_out(a9_wr[194]), .rdlo_out(a9_wr[195]));
			radix2 #(.width(width)) rd_st8_196  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[196]), .rdlo_in(a8_wr[197]),  .coef_in(coef[0]), .rdup_out(a9_wr[196]), .rdlo_out(a9_wr[197]));
			radix2 #(.width(width)) rd_st8_198  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[198]), .rdlo_in(a8_wr[199]),  .coef_in(coef[0]), .rdup_out(a9_wr[198]), .rdlo_out(a9_wr[199]));
			radix2 #(.width(width)) rd_st8_200  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[200]), .rdlo_in(a8_wr[201]),  .coef_in(coef[0]), .rdup_out(a9_wr[200]), .rdlo_out(a9_wr[201]));
			radix2 #(.width(width)) rd_st8_202  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[202]), .rdlo_in(a8_wr[203]),  .coef_in(coef[0]), .rdup_out(a9_wr[202]), .rdlo_out(a9_wr[203]));
			radix2 #(.width(width)) rd_st8_204  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[204]), .rdlo_in(a8_wr[205]),  .coef_in(coef[0]), .rdup_out(a9_wr[204]), .rdlo_out(a9_wr[205]));
			radix2 #(.width(width)) rd_st8_206  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[206]), .rdlo_in(a8_wr[207]),  .coef_in(coef[0]), .rdup_out(a9_wr[206]), .rdlo_out(a9_wr[207]));
			radix2 #(.width(width)) rd_st8_208  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[208]), .rdlo_in(a8_wr[209]),  .coef_in(coef[0]), .rdup_out(a9_wr[208]), .rdlo_out(a9_wr[209]));
			radix2 #(.width(width)) rd_st8_210  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[210]), .rdlo_in(a8_wr[211]),  .coef_in(coef[0]), .rdup_out(a9_wr[210]), .rdlo_out(a9_wr[211]));
			radix2 #(.width(width)) rd_st8_212  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[212]), .rdlo_in(a8_wr[213]),  .coef_in(coef[0]), .rdup_out(a9_wr[212]), .rdlo_out(a9_wr[213]));
			radix2 #(.width(width)) rd_st8_214  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[214]), .rdlo_in(a8_wr[215]),  .coef_in(coef[0]), .rdup_out(a9_wr[214]), .rdlo_out(a9_wr[215]));
			radix2 #(.width(width)) rd_st8_216  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[216]), .rdlo_in(a8_wr[217]),  .coef_in(coef[0]), .rdup_out(a9_wr[216]), .rdlo_out(a9_wr[217]));
			radix2 #(.width(width)) rd_st8_218  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[218]), .rdlo_in(a8_wr[219]),  .coef_in(coef[0]), .rdup_out(a9_wr[218]), .rdlo_out(a9_wr[219]));
			radix2 #(.width(width)) rd_st8_220  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[220]), .rdlo_in(a8_wr[221]),  .coef_in(coef[0]), .rdup_out(a9_wr[220]), .rdlo_out(a9_wr[221]));
			radix2 #(.width(width)) rd_st8_222  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[222]), .rdlo_in(a8_wr[223]),  .coef_in(coef[0]), .rdup_out(a9_wr[222]), .rdlo_out(a9_wr[223]));
			radix2 #(.width(width)) rd_st8_224  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[224]), .rdlo_in(a8_wr[225]),  .coef_in(coef[0]), .rdup_out(a9_wr[224]), .rdlo_out(a9_wr[225]));
			radix2 #(.width(width)) rd_st8_226  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[226]), .rdlo_in(a8_wr[227]),  .coef_in(coef[0]), .rdup_out(a9_wr[226]), .rdlo_out(a9_wr[227]));
			radix2 #(.width(width)) rd_st8_228  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[228]), .rdlo_in(a8_wr[229]),  .coef_in(coef[0]), .rdup_out(a9_wr[228]), .rdlo_out(a9_wr[229]));
			radix2 #(.width(width)) rd_st8_230  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[230]), .rdlo_in(a8_wr[231]),  .coef_in(coef[0]), .rdup_out(a9_wr[230]), .rdlo_out(a9_wr[231]));
			radix2 #(.width(width)) rd_st8_232  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[232]), .rdlo_in(a8_wr[233]),  .coef_in(coef[0]), .rdup_out(a9_wr[232]), .rdlo_out(a9_wr[233]));
			radix2 #(.width(width)) rd_st8_234  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[234]), .rdlo_in(a8_wr[235]),  .coef_in(coef[0]), .rdup_out(a9_wr[234]), .rdlo_out(a9_wr[235]));
			radix2 #(.width(width)) rd_st8_236  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[236]), .rdlo_in(a8_wr[237]),  .coef_in(coef[0]), .rdup_out(a9_wr[236]), .rdlo_out(a9_wr[237]));
			radix2 #(.width(width)) rd_st8_238  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[238]), .rdlo_in(a8_wr[239]),  .coef_in(coef[0]), .rdup_out(a9_wr[238]), .rdlo_out(a9_wr[239]));
			radix2 #(.width(width)) rd_st8_240  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[240]), .rdlo_in(a8_wr[241]),  .coef_in(coef[0]), .rdup_out(a9_wr[240]), .rdlo_out(a9_wr[241]));
			radix2 #(.width(width)) rd_st8_242  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[242]), .rdlo_in(a8_wr[243]),  .coef_in(coef[0]), .rdup_out(a9_wr[242]), .rdlo_out(a9_wr[243]));
			radix2 #(.width(width)) rd_st8_244  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[244]), .rdlo_in(a8_wr[245]),  .coef_in(coef[0]), .rdup_out(a9_wr[244]), .rdlo_out(a9_wr[245]));
			radix2 #(.width(width)) rd_st8_246  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[246]), .rdlo_in(a8_wr[247]),  .coef_in(coef[0]), .rdup_out(a9_wr[246]), .rdlo_out(a9_wr[247]));
			radix2 #(.width(width)) rd_st8_248  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[248]), .rdlo_in(a8_wr[249]),  .coef_in(coef[0]), .rdup_out(a9_wr[248]), .rdlo_out(a9_wr[249]));
			radix2 #(.width(width)) rd_st8_250  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[250]), .rdlo_in(a8_wr[251]),  .coef_in(coef[0]), .rdup_out(a9_wr[250]), .rdlo_out(a9_wr[251]));
			radix2 #(.width(width)) rd_st8_252  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[252]), .rdlo_in(a8_wr[253]),  .coef_in(coef[0]), .rdup_out(a9_wr[252]), .rdlo_out(a9_wr[253]));
			radix2 #(.width(width)) rd_st8_254  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[254]), .rdlo_in(a8_wr[255]),  .coef_in(coef[0]), .rdup_out(a9_wr[254]), .rdlo_out(a9_wr[255]));
			radix2 #(.width(width)) rd_st8_256  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[256]), .rdlo_in(a8_wr[257]),  .coef_in(coef[0]), .rdup_out(a9_wr[256]), .rdlo_out(a9_wr[257]));
			radix2 #(.width(width)) rd_st8_258  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[258]), .rdlo_in(a8_wr[259]),  .coef_in(coef[0]), .rdup_out(a9_wr[258]), .rdlo_out(a9_wr[259]));
			radix2 #(.width(width)) rd_st8_260  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[260]), .rdlo_in(a8_wr[261]),  .coef_in(coef[0]), .rdup_out(a9_wr[260]), .rdlo_out(a9_wr[261]));
			radix2 #(.width(width)) rd_st8_262  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[262]), .rdlo_in(a8_wr[263]),  .coef_in(coef[0]), .rdup_out(a9_wr[262]), .rdlo_out(a9_wr[263]));
			radix2 #(.width(width)) rd_st8_264  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[264]), .rdlo_in(a8_wr[265]),  .coef_in(coef[0]), .rdup_out(a9_wr[264]), .rdlo_out(a9_wr[265]));
			radix2 #(.width(width)) rd_st8_266  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[266]), .rdlo_in(a8_wr[267]),  .coef_in(coef[0]), .rdup_out(a9_wr[266]), .rdlo_out(a9_wr[267]));
			radix2 #(.width(width)) rd_st8_268  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[268]), .rdlo_in(a8_wr[269]),  .coef_in(coef[0]), .rdup_out(a9_wr[268]), .rdlo_out(a9_wr[269]));
			radix2 #(.width(width)) rd_st8_270  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[270]), .rdlo_in(a8_wr[271]),  .coef_in(coef[0]), .rdup_out(a9_wr[270]), .rdlo_out(a9_wr[271]));
			radix2 #(.width(width)) rd_st8_272  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[272]), .rdlo_in(a8_wr[273]),  .coef_in(coef[0]), .rdup_out(a9_wr[272]), .rdlo_out(a9_wr[273]));
			radix2 #(.width(width)) rd_st8_274  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[274]), .rdlo_in(a8_wr[275]),  .coef_in(coef[0]), .rdup_out(a9_wr[274]), .rdlo_out(a9_wr[275]));
			radix2 #(.width(width)) rd_st8_276  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[276]), .rdlo_in(a8_wr[277]),  .coef_in(coef[0]), .rdup_out(a9_wr[276]), .rdlo_out(a9_wr[277]));
			radix2 #(.width(width)) rd_st8_278  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[278]), .rdlo_in(a8_wr[279]),  .coef_in(coef[0]), .rdup_out(a9_wr[278]), .rdlo_out(a9_wr[279]));
			radix2 #(.width(width)) rd_st8_280  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[280]), .rdlo_in(a8_wr[281]),  .coef_in(coef[0]), .rdup_out(a9_wr[280]), .rdlo_out(a9_wr[281]));
			radix2 #(.width(width)) rd_st8_282  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[282]), .rdlo_in(a8_wr[283]),  .coef_in(coef[0]), .rdup_out(a9_wr[282]), .rdlo_out(a9_wr[283]));
			radix2 #(.width(width)) rd_st8_284  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[284]), .rdlo_in(a8_wr[285]),  .coef_in(coef[0]), .rdup_out(a9_wr[284]), .rdlo_out(a9_wr[285]));
			radix2 #(.width(width)) rd_st8_286  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[286]), .rdlo_in(a8_wr[287]),  .coef_in(coef[0]), .rdup_out(a9_wr[286]), .rdlo_out(a9_wr[287]));
			radix2 #(.width(width)) rd_st8_288  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[288]), .rdlo_in(a8_wr[289]),  .coef_in(coef[0]), .rdup_out(a9_wr[288]), .rdlo_out(a9_wr[289]));
			radix2 #(.width(width)) rd_st8_290  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[290]), .rdlo_in(a8_wr[291]),  .coef_in(coef[0]), .rdup_out(a9_wr[290]), .rdlo_out(a9_wr[291]));
			radix2 #(.width(width)) rd_st8_292  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[292]), .rdlo_in(a8_wr[293]),  .coef_in(coef[0]), .rdup_out(a9_wr[292]), .rdlo_out(a9_wr[293]));
			radix2 #(.width(width)) rd_st8_294  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[294]), .rdlo_in(a8_wr[295]),  .coef_in(coef[0]), .rdup_out(a9_wr[294]), .rdlo_out(a9_wr[295]));
			radix2 #(.width(width)) rd_st8_296  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[296]), .rdlo_in(a8_wr[297]),  .coef_in(coef[0]), .rdup_out(a9_wr[296]), .rdlo_out(a9_wr[297]));
			radix2 #(.width(width)) rd_st8_298  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[298]), .rdlo_in(a8_wr[299]),  .coef_in(coef[0]), .rdup_out(a9_wr[298]), .rdlo_out(a9_wr[299]));
			radix2 #(.width(width)) rd_st8_300  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[300]), .rdlo_in(a8_wr[301]),  .coef_in(coef[0]), .rdup_out(a9_wr[300]), .rdlo_out(a9_wr[301]));
			radix2 #(.width(width)) rd_st8_302  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[302]), .rdlo_in(a8_wr[303]),  .coef_in(coef[0]), .rdup_out(a9_wr[302]), .rdlo_out(a9_wr[303]));
			radix2 #(.width(width)) rd_st8_304  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[304]), .rdlo_in(a8_wr[305]),  .coef_in(coef[0]), .rdup_out(a9_wr[304]), .rdlo_out(a9_wr[305]));
			radix2 #(.width(width)) rd_st8_306  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[306]), .rdlo_in(a8_wr[307]),  .coef_in(coef[0]), .rdup_out(a9_wr[306]), .rdlo_out(a9_wr[307]));
			radix2 #(.width(width)) rd_st8_308  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[308]), .rdlo_in(a8_wr[309]),  .coef_in(coef[0]), .rdup_out(a9_wr[308]), .rdlo_out(a9_wr[309]));
			radix2 #(.width(width)) rd_st8_310  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[310]), .rdlo_in(a8_wr[311]),  .coef_in(coef[0]), .rdup_out(a9_wr[310]), .rdlo_out(a9_wr[311]));
			radix2 #(.width(width)) rd_st8_312  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[312]), .rdlo_in(a8_wr[313]),  .coef_in(coef[0]), .rdup_out(a9_wr[312]), .rdlo_out(a9_wr[313]));
			radix2 #(.width(width)) rd_st8_314  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[314]), .rdlo_in(a8_wr[315]),  .coef_in(coef[0]), .rdup_out(a9_wr[314]), .rdlo_out(a9_wr[315]));
			radix2 #(.width(width)) rd_st8_316  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[316]), .rdlo_in(a8_wr[317]),  .coef_in(coef[0]), .rdup_out(a9_wr[316]), .rdlo_out(a9_wr[317]));
			radix2 #(.width(width)) rd_st8_318  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[318]), .rdlo_in(a8_wr[319]),  .coef_in(coef[0]), .rdup_out(a9_wr[318]), .rdlo_out(a9_wr[319]));
			radix2 #(.width(width)) rd_st8_320  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[320]), .rdlo_in(a8_wr[321]),  .coef_in(coef[0]), .rdup_out(a9_wr[320]), .rdlo_out(a9_wr[321]));
			radix2 #(.width(width)) rd_st8_322  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[322]), .rdlo_in(a8_wr[323]),  .coef_in(coef[0]), .rdup_out(a9_wr[322]), .rdlo_out(a9_wr[323]));
			radix2 #(.width(width)) rd_st8_324  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[324]), .rdlo_in(a8_wr[325]),  .coef_in(coef[0]), .rdup_out(a9_wr[324]), .rdlo_out(a9_wr[325]));
			radix2 #(.width(width)) rd_st8_326  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[326]), .rdlo_in(a8_wr[327]),  .coef_in(coef[0]), .rdup_out(a9_wr[326]), .rdlo_out(a9_wr[327]));
			radix2 #(.width(width)) rd_st8_328  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[328]), .rdlo_in(a8_wr[329]),  .coef_in(coef[0]), .rdup_out(a9_wr[328]), .rdlo_out(a9_wr[329]));
			radix2 #(.width(width)) rd_st8_330  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[330]), .rdlo_in(a8_wr[331]),  .coef_in(coef[0]), .rdup_out(a9_wr[330]), .rdlo_out(a9_wr[331]));
			radix2 #(.width(width)) rd_st8_332  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[332]), .rdlo_in(a8_wr[333]),  .coef_in(coef[0]), .rdup_out(a9_wr[332]), .rdlo_out(a9_wr[333]));
			radix2 #(.width(width)) rd_st8_334  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[334]), .rdlo_in(a8_wr[335]),  .coef_in(coef[0]), .rdup_out(a9_wr[334]), .rdlo_out(a9_wr[335]));
			radix2 #(.width(width)) rd_st8_336  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[336]), .rdlo_in(a8_wr[337]),  .coef_in(coef[0]), .rdup_out(a9_wr[336]), .rdlo_out(a9_wr[337]));
			radix2 #(.width(width)) rd_st8_338  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[338]), .rdlo_in(a8_wr[339]),  .coef_in(coef[0]), .rdup_out(a9_wr[338]), .rdlo_out(a9_wr[339]));
			radix2 #(.width(width)) rd_st8_340  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[340]), .rdlo_in(a8_wr[341]),  .coef_in(coef[0]), .rdup_out(a9_wr[340]), .rdlo_out(a9_wr[341]));
			radix2 #(.width(width)) rd_st8_342  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[342]), .rdlo_in(a8_wr[343]),  .coef_in(coef[0]), .rdup_out(a9_wr[342]), .rdlo_out(a9_wr[343]));
			radix2 #(.width(width)) rd_st8_344  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[344]), .rdlo_in(a8_wr[345]),  .coef_in(coef[0]), .rdup_out(a9_wr[344]), .rdlo_out(a9_wr[345]));
			radix2 #(.width(width)) rd_st8_346  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[346]), .rdlo_in(a8_wr[347]),  .coef_in(coef[0]), .rdup_out(a9_wr[346]), .rdlo_out(a9_wr[347]));
			radix2 #(.width(width)) rd_st8_348  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[348]), .rdlo_in(a8_wr[349]),  .coef_in(coef[0]), .rdup_out(a9_wr[348]), .rdlo_out(a9_wr[349]));
			radix2 #(.width(width)) rd_st8_350  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[350]), .rdlo_in(a8_wr[351]),  .coef_in(coef[0]), .rdup_out(a9_wr[350]), .rdlo_out(a9_wr[351]));
			radix2 #(.width(width)) rd_st8_352  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[352]), .rdlo_in(a8_wr[353]),  .coef_in(coef[0]), .rdup_out(a9_wr[352]), .rdlo_out(a9_wr[353]));
			radix2 #(.width(width)) rd_st8_354  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[354]), .rdlo_in(a8_wr[355]),  .coef_in(coef[0]), .rdup_out(a9_wr[354]), .rdlo_out(a9_wr[355]));
			radix2 #(.width(width)) rd_st8_356  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[356]), .rdlo_in(a8_wr[357]),  .coef_in(coef[0]), .rdup_out(a9_wr[356]), .rdlo_out(a9_wr[357]));
			radix2 #(.width(width)) rd_st8_358  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[358]), .rdlo_in(a8_wr[359]),  .coef_in(coef[0]), .rdup_out(a9_wr[358]), .rdlo_out(a9_wr[359]));
			radix2 #(.width(width)) rd_st8_360  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[360]), .rdlo_in(a8_wr[361]),  .coef_in(coef[0]), .rdup_out(a9_wr[360]), .rdlo_out(a9_wr[361]));
			radix2 #(.width(width)) rd_st8_362  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[362]), .rdlo_in(a8_wr[363]),  .coef_in(coef[0]), .rdup_out(a9_wr[362]), .rdlo_out(a9_wr[363]));
			radix2 #(.width(width)) rd_st8_364  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[364]), .rdlo_in(a8_wr[365]),  .coef_in(coef[0]), .rdup_out(a9_wr[364]), .rdlo_out(a9_wr[365]));
			radix2 #(.width(width)) rd_st8_366  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[366]), .rdlo_in(a8_wr[367]),  .coef_in(coef[0]), .rdup_out(a9_wr[366]), .rdlo_out(a9_wr[367]));
			radix2 #(.width(width)) rd_st8_368  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[368]), .rdlo_in(a8_wr[369]),  .coef_in(coef[0]), .rdup_out(a9_wr[368]), .rdlo_out(a9_wr[369]));
			radix2 #(.width(width)) rd_st8_370  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[370]), .rdlo_in(a8_wr[371]),  .coef_in(coef[0]), .rdup_out(a9_wr[370]), .rdlo_out(a9_wr[371]));
			radix2 #(.width(width)) rd_st8_372  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[372]), .rdlo_in(a8_wr[373]),  .coef_in(coef[0]), .rdup_out(a9_wr[372]), .rdlo_out(a9_wr[373]));
			radix2 #(.width(width)) rd_st8_374  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[374]), .rdlo_in(a8_wr[375]),  .coef_in(coef[0]), .rdup_out(a9_wr[374]), .rdlo_out(a9_wr[375]));
			radix2 #(.width(width)) rd_st8_376  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[376]), .rdlo_in(a8_wr[377]),  .coef_in(coef[0]), .rdup_out(a9_wr[376]), .rdlo_out(a9_wr[377]));
			radix2 #(.width(width)) rd_st8_378  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[378]), .rdlo_in(a8_wr[379]),  .coef_in(coef[0]), .rdup_out(a9_wr[378]), .rdlo_out(a9_wr[379]));
			radix2 #(.width(width)) rd_st8_380  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[380]), .rdlo_in(a8_wr[381]),  .coef_in(coef[0]), .rdup_out(a9_wr[380]), .rdlo_out(a9_wr[381]));
			radix2 #(.width(width)) rd_st8_382  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[382]), .rdlo_in(a8_wr[383]),  .coef_in(coef[0]), .rdup_out(a9_wr[382]), .rdlo_out(a9_wr[383]));
			radix2 #(.width(width)) rd_st8_384  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[384]), .rdlo_in(a8_wr[385]),  .coef_in(coef[0]), .rdup_out(a9_wr[384]), .rdlo_out(a9_wr[385]));
			radix2 #(.width(width)) rd_st8_386  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[386]), .rdlo_in(a8_wr[387]),  .coef_in(coef[0]), .rdup_out(a9_wr[386]), .rdlo_out(a9_wr[387]));
			radix2 #(.width(width)) rd_st8_388  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[388]), .rdlo_in(a8_wr[389]),  .coef_in(coef[0]), .rdup_out(a9_wr[388]), .rdlo_out(a9_wr[389]));
			radix2 #(.width(width)) rd_st8_390  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[390]), .rdlo_in(a8_wr[391]),  .coef_in(coef[0]), .rdup_out(a9_wr[390]), .rdlo_out(a9_wr[391]));
			radix2 #(.width(width)) rd_st8_392  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[392]), .rdlo_in(a8_wr[393]),  .coef_in(coef[0]), .rdup_out(a9_wr[392]), .rdlo_out(a9_wr[393]));
			radix2 #(.width(width)) rd_st8_394  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[394]), .rdlo_in(a8_wr[395]),  .coef_in(coef[0]), .rdup_out(a9_wr[394]), .rdlo_out(a9_wr[395]));
			radix2 #(.width(width)) rd_st8_396  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[396]), .rdlo_in(a8_wr[397]),  .coef_in(coef[0]), .rdup_out(a9_wr[396]), .rdlo_out(a9_wr[397]));
			radix2 #(.width(width)) rd_st8_398  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[398]), .rdlo_in(a8_wr[399]),  .coef_in(coef[0]), .rdup_out(a9_wr[398]), .rdlo_out(a9_wr[399]));
			radix2 #(.width(width)) rd_st8_400  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[400]), .rdlo_in(a8_wr[401]),  .coef_in(coef[0]), .rdup_out(a9_wr[400]), .rdlo_out(a9_wr[401]));
			radix2 #(.width(width)) rd_st8_402  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[402]), .rdlo_in(a8_wr[403]),  .coef_in(coef[0]), .rdup_out(a9_wr[402]), .rdlo_out(a9_wr[403]));
			radix2 #(.width(width)) rd_st8_404  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[404]), .rdlo_in(a8_wr[405]),  .coef_in(coef[0]), .rdup_out(a9_wr[404]), .rdlo_out(a9_wr[405]));
			radix2 #(.width(width)) rd_st8_406  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[406]), .rdlo_in(a8_wr[407]),  .coef_in(coef[0]), .rdup_out(a9_wr[406]), .rdlo_out(a9_wr[407]));
			radix2 #(.width(width)) rd_st8_408  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[408]), .rdlo_in(a8_wr[409]),  .coef_in(coef[0]), .rdup_out(a9_wr[408]), .rdlo_out(a9_wr[409]));
			radix2 #(.width(width)) rd_st8_410  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[410]), .rdlo_in(a8_wr[411]),  .coef_in(coef[0]), .rdup_out(a9_wr[410]), .rdlo_out(a9_wr[411]));
			radix2 #(.width(width)) rd_st8_412  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[412]), .rdlo_in(a8_wr[413]),  .coef_in(coef[0]), .rdup_out(a9_wr[412]), .rdlo_out(a9_wr[413]));
			radix2 #(.width(width)) rd_st8_414  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[414]), .rdlo_in(a8_wr[415]),  .coef_in(coef[0]), .rdup_out(a9_wr[414]), .rdlo_out(a9_wr[415]));
			radix2 #(.width(width)) rd_st8_416  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[416]), .rdlo_in(a8_wr[417]),  .coef_in(coef[0]), .rdup_out(a9_wr[416]), .rdlo_out(a9_wr[417]));
			radix2 #(.width(width)) rd_st8_418  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[418]), .rdlo_in(a8_wr[419]),  .coef_in(coef[0]), .rdup_out(a9_wr[418]), .rdlo_out(a9_wr[419]));
			radix2 #(.width(width)) rd_st8_420  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[420]), .rdlo_in(a8_wr[421]),  .coef_in(coef[0]), .rdup_out(a9_wr[420]), .rdlo_out(a9_wr[421]));
			radix2 #(.width(width)) rd_st8_422  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[422]), .rdlo_in(a8_wr[423]),  .coef_in(coef[0]), .rdup_out(a9_wr[422]), .rdlo_out(a9_wr[423]));
			radix2 #(.width(width)) rd_st8_424  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[424]), .rdlo_in(a8_wr[425]),  .coef_in(coef[0]), .rdup_out(a9_wr[424]), .rdlo_out(a9_wr[425]));
			radix2 #(.width(width)) rd_st8_426  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[426]), .rdlo_in(a8_wr[427]),  .coef_in(coef[0]), .rdup_out(a9_wr[426]), .rdlo_out(a9_wr[427]));
			radix2 #(.width(width)) rd_st8_428  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[428]), .rdlo_in(a8_wr[429]),  .coef_in(coef[0]), .rdup_out(a9_wr[428]), .rdlo_out(a9_wr[429]));
			radix2 #(.width(width)) rd_st8_430  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[430]), .rdlo_in(a8_wr[431]),  .coef_in(coef[0]), .rdup_out(a9_wr[430]), .rdlo_out(a9_wr[431]));
			radix2 #(.width(width)) rd_st8_432  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[432]), .rdlo_in(a8_wr[433]),  .coef_in(coef[0]), .rdup_out(a9_wr[432]), .rdlo_out(a9_wr[433]));
			radix2 #(.width(width)) rd_st8_434  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[434]), .rdlo_in(a8_wr[435]),  .coef_in(coef[0]), .rdup_out(a9_wr[434]), .rdlo_out(a9_wr[435]));
			radix2 #(.width(width)) rd_st8_436  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[436]), .rdlo_in(a8_wr[437]),  .coef_in(coef[0]), .rdup_out(a9_wr[436]), .rdlo_out(a9_wr[437]));
			radix2 #(.width(width)) rd_st8_438  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[438]), .rdlo_in(a8_wr[439]),  .coef_in(coef[0]), .rdup_out(a9_wr[438]), .rdlo_out(a9_wr[439]));
			radix2 #(.width(width)) rd_st8_440  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[440]), .rdlo_in(a8_wr[441]),  .coef_in(coef[0]), .rdup_out(a9_wr[440]), .rdlo_out(a9_wr[441]));
			radix2 #(.width(width)) rd_st8_442  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[442]), .rdlo_in(a8_wr[443]),  .coef_in(coef[0]), .rdup_out(a9_wr[442]), .rdlo_out(a9_wr[443]));
			radix2 #(.width(width)) rd_st8_444  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[444]), .rdlo_in(a8_wr[445]),  .coef_in(coef[0]), .rdup_out(a9_wr[444]), .rdlo_out(a9_wr[445]));
			radix2 #(.width(width)) rd_st8_446  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[446]), .rdlo_in(a8_wr[447]),  .coef_in(coef[0]), .rdup_out(a9_wr[446]), .rdlo_out(a9_wr[447]));
			radix2 #(.width(width)) rd_st8_448  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[448]), .rdlo_in(a8_wr[449]),  .coef_in(coef[0]), .rdup_out(a9_wr[448]), .rdlo_out(a9_wr[449]));
			radix2 #(.width(width)) rd_st8_450  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[450]), .rdlo_in(a8_wr[451]),  .coef_in(coef[0]), .rdup_out(a9_wr[450]), .rdlo_out(a9_wr[451]));
			radix2 #(.width(width)) rd_st8_452  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[452]), .rdlo_in(a8_wr[453]),  .coef_in(coef[0]), .rdup_out(a9_wr[452]), .rdlo_out(a9_wr[453]));
			radix2 #(.width(width)) rd_st8_454  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[454]), .rdlo_in(a8_wr[455]),  .coef_in(coef[0]), .rdup_out(a9_wr[454]), .rdlo_out(a9_wr[455]));
			radix2 #(.width(width)) rd_st8_456  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[456]), .rdlo_in(a8_wr[457]),  .coef_in(coef[0]), .rdup_out(a9_wr[456]), .rdlo_out(a9_wr[457]));
			radix2 #(.width(width)) rd_st8_458  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[458]), .rdlo_in(a8_wr[459]),  .coef_in(coef[0]), .rdup_out(a9_wr[458]), .rdlo_out(a9_wr[459]));
			radix2 #(.width(width)) rd_st8_460  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[460]), .rdlo_in(a8_wr[461]),  .coef_in(coef[0]), .rdup_out(a9_wr[460]), .rdlo_out(a9_wr[461]));
			radix2 #(.width(width)) rd_st8_462  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[462]), .rdlo_in(a8_wr[463]),  .coef_in(coef[0]), .rdup_out(a9_wr[462]), .rdlo_out(a9_wr[463]));
			radix2 #(.width(width)) rd_st8_464  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[464]), .rdlo_in(a8_wr[465]),  .coef_in(coef[0]), .rdup_out(a9_wr[464]), .rdlo_out(a9_wr[465]));
			radix2 #(.width(width)) rd_st8_466  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[466]), .rdlo_in(a8_wr[467]),  .coef_in(coef[0]), .rdup_out(a9_wr[466]), .rdlo_out(a9_wr[467]));
			radix2 #(.width(width)) rd_st8_468  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[468]), .rdlo_in(a8_wr[469]),  .coef_in(coef[0]), .rdup_out(a9_wr[468]), .rdlo_out(a9_wr[469]));
			radix2 #(.width(width)) rd_st8_470  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[470]), .rdlo_in(a8_wr[471]),  .coef_in(coef[0]), .rdup_out(a9_wr[470]), .rdlo_out(a9_wr[471]));
			radix2 #(.width(width)) rd_st8_472  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[472]), .rdlo_in(a8_wr[473]),  .coef_in(coef[0]), .rdup_out(a9_wr[472]), .rdlo_out(a9_wr[473]));
			radix2 #(.width(width)) rd_st8_474  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[474]), .rdlo_in(a8_wr[475]),  .coef_in(coef[0]), .rdup_out(a9_wr[474]), .rdlo_out(a9_wr[475]));
			radix2 #(.width(width)) rd_st8_476  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[476]), .rdlo_in(a8_wr[477]),  .coef_in(coef[0]), .rdup_out(a9_wr[476]), .rdlo_out(a9_wr[477]));
			radix2 #(.width(width)) rd_st8_478  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[478]), .rdlo_in(a8_wr[479]),  .coef_in(coef[0]), .rdup_out(a9_wr[478]), .rdlo_out(a9_wr[479]));
			radix2 #(.width(width)) rd_st8_480  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[480]), .rdlo_in(a8_wr[481]),  .coef_in(coef[0]), .rdup_out(a9_wr[480]), .rdlo_out(a9_wr[481]));
			radix2 #(.width(width)) rd_st8_482  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[482]), .rdlo_in(a8_wr[483]),  .coef_in(coef[0]), .rdup_out(a9_wr[482]), .rdlo_out(a9_wr[483]));
			radix2 #(.width(width)) rd_st8_484  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[484]), .rdlo_in(a8_wr[485]),  .coef_in(coef[0]), .rdup_out(a9_wr[484]), .rdlo_out(a9_wr[485]));
			radix2 #(.width(width)) rd_st8_486  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[486]), .rdlo_in(a8_wr[487]),  .coef_in(coef[0]), .rdup_out(a9_wr[486]), .rdlo_out(a9_wr[487]));
			radix2 #(.width(width)) rd_st8_488  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[488]), .rdlo_in(a8_wr[489]),  .coef_in(coef[0]), .rdup_out(a9_wr[488]), .rdlo_out(a9_wr[489]));
			radix2 #(.width(width)) rd_st8_490  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[490]), .rdlo_in(a8_wr[491]),  .coef_in(coef[0]), .rdup_out(a9_wr[490]), .rdlo_out(a9_wr[491]));
			radix2 #(.width(width)) rd_st8_492  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[492]), .rdlo_in(a8_wr[493]),  .coef_in(coef[0]), .rdup_out(a9_wr[492]), .rdlo_out(a9_wr[493]));
			radix2 #(.width(width)) rd_st8_494  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[494]), .rdlo_in(a8_wr[495]),  .coef_in(coef[0]), .rdup_out(a9_wr[494]), .rdlo_out(a9_wr[495]));
			radix2 #(.width(width)) rd_st8_496  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[496]), .rdlo_in(a8_wr[497]),  .coef_in(coef[0]), .rdup_out(a9_wr[496]), .rdlo_out(a9_wr[497]));
			radix2 #(.width(width)) rd_st8_498  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[498]), .rdlo_in(a8_wr[499]),  .coef_in(coef[0]), .rdup_out(a9_wr[498]), .rdlo_out(a9_wr[499]));
			radix2 #(.width(width)) rd_st8_500  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[500]), .rdlo_in(a8_wr[501]),  .coef_in(coef[0]), .rdup_out(a9_wr[500]), .rdlo_out(a9_wr[501]));
			radix2 #(.width(width)) rd_st8_502  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[502]), .rdlo_in(a8_wr[503]),  .coef_in(coef[0]), .rdup_out(a9_wr[502]), .rdlo_out(a9_wr[503]));
			radix2 #(.width(width)) rd_st8_504  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[504]), .rdlo_in(a8_wr[505]),  .coef_in(coef[0]), .rdup_out(a9_wr[504]), .rdlo_out(a9_wr[505]));
			radix2 #(.width(width)) rd_st8_506  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[506]), .rdlo_in(a8_wr[507]),  .coef_in(coef[0]), .rdup_out(a9_wr[506]), .rdlo_out(a9_wr[507]));
			radix2 #(.width(width)) rd_st8_508  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[508]), .rdlo_in(a8_wr[509]),  .coef_in(coef[0]), .rdup_out(a9_wr[508]), .rdlo_out(a9_wr[509]));
			radix2 #(.width(width)) rd_st8_510  (.clk(clk), .rst(rst),  .stall(comb_stall), .rdup_in(a8_wr[510]), .rdlo_in(a8_wr[511]),  .coef_in(coef[0]), .rdup_out(a9_wr[510]), .rdlo_out(a9_wr[511]));

		//--- output stage (bit reversal)
			assign x0_out       = a9_wr[0];                    
			assign x1_out       = a9_wr[256];                  
			assign x2_out       = a9_wr[128];                  
			assign x3_out       = a9_wr[384];                  
			assign x4_out       = a9_wr[64];                   
			assign x5_out       = a9_wr[320];                  
			assign x6_out       = a9_wr[192];                  
			assign x7_out       = a9_wr[448];                  
			assign x8_out       = a9_wr[32];                   
			assign x9_out       = a9_wr[288];                  
			assign x10_out      = a9_wr[160];                  
			assign x11_out      = a9_wr[416];                  
			assign x12_out      = a9_wr[96];                   
			assign x13_out      = a9_wr[352];                  
			assign x14_out      = a9_wr[224];                  
			assign x15_out      = a9_wr[480];                  
			assign x16_out      = a9_wr[16];                   
			assign x17_out      = a9_wr[272];                  
			assign x18_out      = a9_wr[144];                  
			assign x19_out      = a9_wr[400];                  
			assign x20_out      = a9_wr[80];                   
			assign x21_out      = a9_wr[336];                  
			assign x22_out      = a9_wr[208];                  
			assign x23_out      = a9_wr[464];                  
			assign x24_out      = a9_wr[48];                   
			assign x25_out      = a9_wr[304];                  
			assign x26_out      = a9_wr[176];                  
			assign x27_out      = a9_wr[432];                  
			assign x28_out      = a9_wr[112];                  
			assign x29_out      = a9_wr[368];                  
			assign x30_out      = a9_wr[240];                  
			assign x31_out      = a9_wr[496];                  
			assign x32_out      = a9_wr[8];                    
			assign x33_out      = a9_wr[264];                  
			assign x34_out      = a9_wr[136];                  
			assign x35_out      = a9_wr[392];                  
			assign x36_out      = a9_wr[72];                   
			assign x37_out      = a9_wr[328];                  
			assign x38_out      = a9_wr[200];                  
			assign x39_out      = a9_wr[456];                  
			assign x40_out      = a9_wr[40];                   
			assign x41_out      = a9_wr[296];                  
			assign x42_out      = a9_wr[168];                  
			assign x43_out      = a9_wr[424];                  
			assign x44_out      = a9_wr[104];                  
			assign x45_out      = a9_wr[360];                  
			assign x46_out      = a9_wr[232];                  
			assign x47_out      = a9_wr[488];                  
			assign x48_out      = a9_wr[24];                   
			assign x49_out      = a9_wr[280];                  
			assign x50_out      = a9_wr[152];                  
			assign x51_out      = a9_wr[408];                  
			assign x52_out      = a9_wr[88];                   
			assign x53_out      = a9_wr[344];                  
			assign x54_out      = a9_wr[216];                  
			assign x55_out      = a9_wr[472];                  
			assign x56_out      = a9_wr[56];                   
			assign x57_out      = a9_wr[312];                  
			assign x58_out      = a9_wr[184];                  
			assign x59_out      = a9_wr[440];                  
			assign x60_out      = a9_wr[120];                  
			assign x61_out      = a9_wr[376];                  
			assign x62_out      = a9_wr[248];                  
			assign x63_out      = a9_wr[504];                  
			assign x64_out      = a9_wr[4];                    
			assign x65_out      = a9_wr[260];                  
			assign x66_out      = a9_wr[132];                  
			assign x67_out      = a9_wr[388];                  
			assign x68_out      = a9_wr[68];                   
			assign x69_out      = a9_wr[324];                  
			assign x70_out      = a9_wr[196];                  
			assign x71_out      = a9_wr[452];                  
			assign x72_out      = a9_wr[36];                   
			assign x73_out      = a9_wr[292];                  
			assign x74_out      = a9_wr[164];                  
			assign x75_out      = a9_wr[420];                  
			assign x76_out      = a9_wr[100];                  
			assign x77_out      = a9_wr[356];                  
			assign x78_out      = a9_wr[228];                  
			assign x79_out      = a9_wr[484];                  
			assign x80_out      = a9_wr[20];                   
			assign x81_out      = a9_wr[276];                  
			assign x82_out      = a9_wr[148];                  
			assign x83_out      = a9_wr[404];                  
			assign x84_out      = a9_wr[84];                   
			assign x85_out      = a9_wr[340];                  
			assign x86_out      = a9_wr[212];                  
			assign x87_out      = a9_wr[468];                  
			assign x88_out      = a9_wr[52];                   
			assign x89_out      = a9_wr[308];                  
			assign x90_out      = a9_wr[180];                  
			assign x91_out      = a9_wr[436];                  
			assign x92_out      = a9_wr[116];                  
			assign x93_out      = a9_wr[372];                  
			assign x94_out      = a9_wr[244];                  
			assign x95_out      = a9_wr[500];                  
			assign x96_out      = a9_wr[12];                   
			assign x97_out      = a9_wr[268];                  
			assign x98_out      = a9_wr[140];                  
			assign x99_out      = a9_wr[396];                  
			assign x100_out     = a9_wr[76];                   
			assign x101_out     = a9_wr[332];                  
			assign x102_out     = a9_wr[204];                  
			assign x103_out     = a9_wr[460];                  
			assign x104_out     = a9_wr[44];                   
			assign x105_out     = a9_wr[300];                  
			assign x106_out     = a9_wr[172];                  
			assign x107_out     = a9_wr[428];                  
			assign x108_out     = a9_wr[108];                  
			assign x109_out     = a9_wr[364];                  
			assign x110_out     = a9_wr[236];                  
			assign x111_out     = a9_wr[492];                  
			assign x112_out     = a9_wr[28];                   
			assign x113_out     = a9_wr[284];                  
			assign x114_out     = a9_wr[156];                  
			assign x115_out     = a9_wr[412];                  
			assign x116_out     = a9_wr[92];                   
			assign x117_out     = a9_wr[348];                  
			assign x118_out     = a9_wr[220];                  
			assign x119_out     = a9_wr[476];                  
			assign x120_out     = a9_wr[60];                   
			assign x121_out     = a9_wr[316];                  
			assign x122_out     = a9_wr[188];                  
			assign x123_out     = a9_wr[444];                  
			assign x124_out     = a9_wr[124];                  
			assign x125_out     = a9_wr[380];                  
			assign x126_out     = a9_wr[252];                  
			assign x127_out     = a9_wr[508];                  
			assign x128_out     = a9_wr[2];                    
			assign x129_out     = a9_wr[258];                  
			assign x130_out     = a9_wr[130];                  
			assign x131_out     = a9_wr[386];                  
			assign x132_out     = a9_wr[66];                   
			assign x133_out     = a9_wr[322];                  
			assign x134_out     = a9_wr[194];                  
			assign x135_out     = a9_wr[450];                  
			assign x136_out     = a9_wr[34];                   
			assign x137_out     = a9_wr[290];                  
			assign x138_out     = a9_wr[162];                  
			assign x139_out     = a9_wr[418];                  
			assign x140_out     = a9_wr[98];                   
			assign x141_out     = a9_wr[354];                  
			assign x142_out     = a9_wr[226];                  
			assign x143_out     = a9_wr[482];                  
			assign x144_out     = a9_wr[18];                   
			assign x145_out     = a9_wr[274];                  
			assign x146_out     = a9_wr[146];                  
			assign x147_out     = a9_wr[402];                  
			assign x148_out     = a9_wr[82];                   
			assign x149_out     = a9_wr[338];                  
			assign x150_out     = a9_wr[210];                  
			assign x151_out     = a9_wr[466];                  
			assign x152_out     = a9_wr[50];                   
			assign x153_out     = a9_wr[306];                  
			assign x154_out     = a9_wr[178];                  
			assign x155_out     = a9_wr[434];                  
			assign x156_out     = a9_wr[114];                  
			assign x157_out     = a9_wr[370];                  
			assign x158_out     = a9_wr[242];                  
			assign x159_out     = a9_wr[498];                  
			assign x160_out     = a9_wr[10];                   
			assign x161_out     = a9_wr[266];                  
			assign x162_out     = a9_wr[138];                  
			assign x163_out     = a9_wr[394];                  
			assign x164_out     = a9_wr[74];                   
			assign x165_out     = a9_wr[330];                  
			assign x166_out     = a9_wr[202];                  
			assign x167_out     = a9_wr[458];                  
			assign x168_out     = a9_wr[42];                   
			assign x169_out     = a9_wr[298];                  
			assign x170_out     = a9_wr[170];                  
			assign x171_out     = a9_wr[426];                  
			assign x172_out     = a9_wr[106];                  
			assign x173_out     = a9_wr[362];                  
			assign x174_out     = a9_wr[234];                  
			assign x175_out     = a9_wr[490];                  
			assign x176_out     = a9_wr[26];                   
			assign x177_out     = a9_wr[282];                  
			assign x178_out     = a9_wr[154];                  
			assign x179_out     = a9_wr[410];                  
			assign x180_out     = a9_wr[90];                   
			assign x181_out     = a9_wr[346];                  
			assign x182_out     = a9_wr[218];                  
			assign x183_out     = a9_wr[474];                  
			assign x184_out     = a9_wr[58];                   
			assign x185_out     = a9_wr[314];                  
			assign x186_out     = a9_wr[186];                  
			assign x187_out     = a9_wr[442];                  
			assign x188_out     = a9_wr[122];                  
			assign x189_out     = a9_wr[378];                  
			assign x190_out     = a9_wr[250];                  
			assign x191_out     = a9_wr[506];                  
			assign x192_out     = a9_wr[6];                    
			assign x193_out     = a9_wr[262];                  
			assign x194_out     = a9_wr[134];                  
			assign x195_out     = a9_wr[390];                  
			assign x196_out     = a9_wr[70];                   
			assign x197_out     = a9_wr[326];                  
			assign x198_out     = a9_wr[198];                  
			assign x199_out     = a9_wr[454];                  
			assign x200_out     = a9_wr[38];                   
			assign x201_out     = a9_wr[294];                  
			assign x202_out     = a9_wr[166];                  
			assign x203_out     = a9_wr[422];                  
			assign x204_out     = a9_wr[102];                  
			assign x205_out     = a9_wr[358];                  
			assign x206_out     = a9_wr[230];                  
			assign x207_out     = a9_wr[486];                  
			assign x208_out     = a9_wr[22];                   
			assign x209_out     = a9_wr[278];                  
			assign x210_out     = a9_wr[150];                  
			assign x211_out     = a9_wr[406];                  
			assign x212_out     = a9_wr[86];                   
			assign x213_out     = a9_wr[342];                  
			assign x214_out     = a9_wr[214];                  
			assign x215_out     = a9_wr[470];                  
			assign x216_out     = a9_wr[54];                   
			assign x217_out     = a9_wr[310];                  
			assign x218_out     = a9_wr[182];                  
			assign x219_out     = a9_wr[438];                  
			assign x220_out     = a9_wr[118];                  
			assign x221_out     = a9_wr[374];                  
			assign x222_out     = a9_wr[246];                  
			assign x223_out     = a9_wr[502];                  
			assign x224_out     = a9_wr[14];                   
			assign x225_out     = a9_wr[270];                  
			assign x226_out     = a9_wr[142];                  
			assign x227_out     = a9_wr[398];                  
			assign x228_out     = a9_wr[78];                   
			assign x229_out     = a9_wr[334];                  
			assign x230_out     = a9_wr[206];                  
			assign x231_out     = a9_wr[462];                  
			assign x232_out     = a9_wr[46];                   
			assign x233_out     = a9_wr[302];                  
			assign x234_out     = a9_wr[174];                  
			assign x235_out     = a9_wr[430];                  
			assign x236_out     = a9_wr[110];                  
			assign x237_out     = a9_wr[366];                  
			assign x238_out     = a9_wr[238];                  
			assign x239_out     = a9_wr[494];                  
			assign x240_out     = a9_wr[30];                   
			assign x241_out     = a9_wr[286];                  
			assign x242_out     = a9_wr[158];                  
			assign x243_out     = a9_wr[414];                  
			assign x244_out     = a9_wr[94];                   
			assign x245_out     = a9_wr[350];                  
			assign x246_out     = a9_wr[222];                  
			assign x247_out     = a9_wr[478];                  
			assign x248_out     = a9_wr[62];                   
			assign x249_out     = a9_wr[318];                  
			assign x250_out     = a9_wr[190];                  
			assign x251_out     = a9_wr[446];                  
			assign x252_out     = a9_wr[126];                  
			assign x253_out     = a9_wr[382];                  
			assign x254_out     = a9_wr[254];                  
			assign x255_out     = a9_wr[510];                  
			assign x256_out     = a9_wr[1];                    
			assign x257_out     = a9_wr[257];                  
			assign x258_out     = a9_wr[129];                  
			assign x259_out     = a9_wr[385];                  
			assign x260_out     = a9_wr[65];                   
			assign x261_out     = a9_wr[321];                  
			assign x262_out     = a9_wr[193];                  
			assign x263_out     = a9_wr[449];                  
			assign x264_out     = a9_wr[33];                   
			assign x265_out     = a9_wr[289];                  
			assign x266_out     = a9_wr[161];                  
			assign x267_out     = a9_wr[417];                  
			assign x268_out     = a9_wr[97];                   
			assign x269_out     = a9_wr[353];                  
			assign x270_out     = a9_wr[225];                  
			assign x271_out     = a9_wr[481];                  
			assign x272_out     = a9_wr[17];                   
			assign x273_out     = a9_wr[273];                  
			assign x274_out     = a9_wr[145];                  
			assign x275_out     = a9_wr[401];                  
			assign x276_out     = a9_wr[81];                   
			assign x277_out     = a9_wr[337];                  
			assign x278_out     = a9_wr[209];                  
			assign x279_out     = a9_wr[465];                  
			assign x280_out     = a9_wr[49];                   
			assign x281_out     = a9_wr[305];                  
			assign x282_out     = a9_wr[177];                  
			assign x283_out     = a9_wr[433];                  
			assign x284_out     = a9_wr[113];                  
			assign x285_out     = a9_wr[369];                  
			assign x286_out     = a9_wr[241];                  
			assign x287_out     = a9_wr[497];                  
			assign x288_out     = a9_wr[9];                    
			assign x289_out     = a9_wr[265];                  
			assign x290_out     = a9_wr[137];                  
			assign x291_out     = a9_wr[393];                  
			assign x292_out     = a9_wr[73];                   
			assign x293_out     = a9_wr[329];                  
			assign x294_out     = a9_wr[201];                  
			assign x295_out     = a9_wr[457];                  
			assign x296_out     = a9_wr[41];                   
			assign x297_out     = a9_wr[297];                  
			assign x298_out     = a9_wr[169];                  
			assign x299_out     = a9_wr[425];                  
			assign x300_out     = a9_wr[105];                  
			assign x301_out     = a9_wr[361];                  
			assign x302_out     = a9_wr[233];                  
			assign x303_out     = a9_wr[489];                  
			assign x304_out     = a9_wr[25];                   
			assign x305_out     = a9_wr[281];                  
			assign x306_out     = a9_wr[153];                  
			assign x307_out     = a9_wr[409];                  
			assign x308_out     = a9_wr[89];                   
			assign x309_out     = a9_wr[345];                  
			assign x310_out     = a9_wr[217];                  
			assign x311_out     = a9_wr[473];                  
			assign x312_out     = a9_wr[57];                   
			assign x313_out     = a9_wr[313];                  
			assign x314_out     = a9_wr[185];                  
			assign x315_out     = a9_wr[441];                  
			assign x316_out     = a9_wr[121];                  
			assign x317_out     = a9_wr[377];                  
			assign x318_out     = a9_wr[249];                  
			assign x319_out     = a9_wr[505];                  
			assign x320_out     = a9_wr[5];                    
			assign x321_out     = a9_wr[261];                  
			assign x322_out     = a9_wr[133];                  
			assign x323_out     = a9_wr[389];                  
			assign x324_out     = a9_wr[69];                   
			assign x325_out     = a9_wr[325];                  
			assign x326_out     = a9_wr[197];                  
			assign x327_out     = a9_wr[453];                  
			assign x328_out     = a9_wr[37];                   
			assign x329_out     = a9_wr[293];                  
			assign x330_out     = a9_wr[165];                  
			assign x331_out     = a9_wr[421];                  
			assign x332_out     = a9_wr[101];                  
			assign x333_out     = a9_wr[357];                  
			assign x334_out     = a9_wr[229];                  
			assign x335_out     = a9_wr[485];                  
			assign x336_out     = a9_wr[21];                   
			assign x337_out     = a9_wr[277];                  
			assign x338_out     = a9_wr[149];                  
			assign x339_out     = a9_wr[405];                  
			assign x340_out     = a9_wr[85];                   
			assign x341_out     = a9_wr[341];                  
			assign x342_out     = a9_wr[213];                  
			assign x343_out     = a9_wr[469];                  
			assign x344_out     = a9_wr[53];                   
			assign x345_out     = a9_wr[309];                  
			assign x346_out     = a9_wr[181];                  
			assign x347_out     = a9_wr[437];                  
			assign x348_out     = a9_wr[117];                  
			assign x349_out     = a9_wr[373];                  
			assign x350_out     = a9_wr[245];                  
			assign x351_out     = a9_wr[501];                  
			assign x352_out     = a9_wr[13];                   
			assign x353_out     = a9_wr[269];                  
			assign x354_out     = a9_wr[141];                  
			assign x355_out     = a9_wr[397];                  
			assign x356_out     = a9_wr[77];                   
			assign x357_out     = a9_wr[333];                  
			assign x358_out     = a9_wr[205];                  
			assign x359_out     = a9_wr[461];                  
			assign x360_out     = a9_wr[45];                   
			assign x361_out     = a9_wr[301];                  
			assign x362_out     = a9_wr[173];                  
			assign x363_out     = a9_wr[429];                  
			assign x364_out     = a9_wr[109];                  
			assign x365_out     = a9_wr[365];                  
			assign x366_out     = a9_wr[237];                  
			assign x367_out     = a9_wr[493];                  
			assign x368_out     = a9_wr[29];                   
			assign x369_out     = a9_wr[285];                  
			assign x370_out     = a9_wr[157];                  
			assign x371_out     = a9_wr[413];                  
			assign x372_out     = a9_wr[93];                   
			assign x373_out     = a9_wr[349];                  
			assign x374_out     = a9_wr[221];                  
			assign x375_out     = a9_wr[477];                  
			assign x376_out     = a9_wr[61];                   
			assign x377_out     = a9_wr[317];                  
			assign x378_out     = a9_wr[189];                  
			assign x379_out     = a9_wr[445];                  
			assign x380_out     = a9_wr[125];                  
			assign x381_out     = a9_wr[381];                  
			assign x382_out     = a9_wr[253];                  
			assign x383_out     = a9_wr[509];                  
			assign x384_out     = a9_wr[3];                    
			assign x385_out     = a9_wr[259];                  
			assign x386_out     = a9_wr[131];                  
			assign x387_out     = a9_wr[387];                  
			assign x388_out     = a9_wr[67];                   
			assign x389_out     = a9_wr[323];                  
			assign x390_out     = a9_wr[195];                  
			assign x391_out     = a9_wr[451];                  
			assign x392_out     = a9_wr[35];                   
			assign x393_out     = a9_wr[291];                  
			assign x394_out     = a9_wr[163];                  
			assign x395_out     = a9_wr[419];                  
			assign x396_out     = a9_wr[99];                   
			assign x397_out     = a9_wr[355];                  
			assign x398_out     = a9_wr[227];                  
			assign x399_out     = a9_wr[483];                  
			assign x400_out     = a9_wr[19];                   
			assign x401_out     = a9_wr[275];                  
			assign x402_out     = a9_wr[147];                  
			assign x403_out     = a9_wr[403];                  
			assign x404_out     = a9_wr[83];                   
			assign x405_out     = a9_wr[339];                  
			assign x406_out     = a9_wr[211];                  
			assign x407_out     = a9_wr[467];                  
			assign x408_out     = a9_wr[51];                   
			assign x409_out     = a9_wr[307];                  
			assign x410_out     = a9_wr[179];                  
			assign x411_out     = a9_wr[435];                  
			assign x412_out     = a9_wr[115];                  
			assign x413_out     = a9_wr[371];                  
			assign x414_out     = a9_wr[243];                  
			assign x415_out     = a9_wr[499];                  
			assign x416_out     = a9_wr[11];                   
			assign x417_out     = a9_wr[267];                  
			assign x418_out     = a9_wr[139];                  
			assign x419_out     = a9_wr[395];                  
			assign x420_out     = a9_wr[75];                   
			assign x421_out     = a9_wr[331];                  
			assign x422_out     = a9_wr[203];                  
			assign x423_out     = a9_wr[459];                  
			assign x424_out     = a9_wr[43];                   
			assign x425_out     = a9_wr[299];                  
			assign x426_out     = a9_wr[171];                  
			assign x427_out     = a9_wr[427];                  
			assign x428_out     = a9_wr[107];                  
			assign x429_out     = a9_wr[363];                  
			assign x430_out     = a9_wr[235];                  
			assign x431_out     = a9_wr[491];                  
			assign x432_out     = a9_wr[27];                   
			assign x433_out     = a9_wr[283];                  
			assign x434_out     = a9_wr[155];                  
			assign x435_out     = a9_wr[411];                  
			assign x436_out     = a9_wr[91];                   
			assign x437_out     = a9_wr[347];                  
			assign x438_out     = a9_wr[219];                  
			assign x439_out     = a9_wr[475];                  
			assign x440_out     = a9_wr[59];                   
			assign x441_out     = a9_wr[315];                  
			assign x442_out     = a9_wr[187];                  
			assign x443_out     = a9_wr[443];                  
			assign x444_out     = a9_wr[123];                  
			assign x445_out     = a9_wr[379];                  
			assign x446_out     = a9_wr[251];                  
			assign x447_out     = a9_wr[507];                  
			assign x448_out     = a9_wr[7];                    
			assign x449_out     = a9_wr[263];                  
			assign x450_out     = a9_wr[135];                  
			assign x451_out     = a9_wr[391];                  
			assign x452_out     = a9_wr[71];                   
			assign x453_out     = a9_wr[327];                  
			assign x454_out     = a9_wr[199];                  
			assign x455_out     = a9_wr[455];                  
			assign x456_out     = a9_wr[39];                   
			assign x457_out     = a9_wr[295];                  
			assign x458_out     = a9_wr[167];                  
			assign x459_out     = a9_wr[423];                  
			assign x460_out     = a9_wr[103];                  
			assign x461_out     = a9_wr[359];                  
			assign x462_out     = a9_wr[231];                  
			assign x463_out     = a9_wr[487];                  
			assign x464_out     = a9_wr[23];                   
			assign x465_out     = a9_wr[279];                  
			assign x466_out     = a9_wr[151];                  
			assign x467_out     = a9_wr[407];                  
			assign x468_out     = a9_wr[87];                   
			assign x469_out     = a9_wr[343];                  
			assign x470_out     = a9_wr[215];                  
			assign x471_out     = a9_wr[471];                  
			assign x472_out     = a9_wr[55];                   
			assign x473_out     = a9_wr[311];                  
			assign x474_out     = a9_wr[183];                  
			assign x475_out     = a9_wr[439];                  
			assign x476_out     = a9_wr[119];                  
			assign x477_out     = a9_wr[375];                  
			assign x478_out     = a9_wr[247];                  
			assign x479_out     = a9_wr[503];                  
			assign x480_out     = a9_wr[15];                   
			assign x481_out     = a9_wr[271];                  
			assign x482_out     = a9_wr[143];                  
			assign x483_out     = a9_wr[399];                  
			assign x484_out     = a9_wr[79];                   
			assign x485_out     = a9_wr[335];                  
			assign x486_out     = a9_wr[207];                  
			assign x487_out     = a9_wr[463];                  
			assign x488_out     = a9_wr[47];                   
			assign x489_out     = a9_wr[303];                  
			assign x490_out     = a9_wr[175];                  
			assign x491_out     = a9_wr[431];                  
			assign x492_out     = a9_wr[111];                  
			assign x493_out     = a9_wr[367];                  
			assign x494_out     = a9_wr[239];                  
			assign x495_out     = a9_wr[495];                  
			assign x496_out     = a9_wr[31];                   
			assign x497_out     = a9_wr[287];                  
			assign x498_out     = a9_wr[159];                  
			assign x499_out     = a9_wr[415];                  
			assign x500_out     = a9_wr[95];                   
			assign x501_out     = a9_wr[351];                  
			assign x502_out     = a9_wr[223];                  
			assign x503_out     = a9_wr[479];                  
			assign x504_out     = a9_wr[63];                   
			assign x505_out     = a9_wr[319];                  
			assign x506_out     = a9_wr[191];                  
			assign x507_out     = a9_wr[447];                  
			assign x508_out     = a9_wr[127];                  
			assign x509_out     = a9_wr[383];                  
			assign x510_out     = a9_wr[255];                  
			assign x511_out     = a9_wr[511];                  


endmodule
