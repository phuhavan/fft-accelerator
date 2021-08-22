//==========================================================================
//
//
//==========================================================================
//`define debug_print_read     	1
//`define debug_print_write 	1

`include "macros.h"

module vcReadFile
#(
	parameter filename 	= "input.txt",			// input dt text file
	parameter size			= 4,					// fft size
	parameter hwidth     	= 12					// dt hwidth
)
(

	input 							clk, rst,

	output reg						stall,

      output signed [hwidth-1:0] 	dt0, dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12, dt13, dt14, dt15, 
									dt16, dt17, dt18, dt19, dt20, dt21, dt22, dt23, dt24, dt25, dt26, dt27, dt28, dt29, dt30, dt31, 
									dt32, dt33, dt34, dt35, dt36, dt37, dt38, dt39, dt40, dt41, dt42, dt43, dt44, dt45, dt46, dt47, 
									dt48, dt49, dt50, dt51, dt52, dt53, dt54, dt55, dt56, dt57, dt58, dt59, dt60, dt61, dt62, dt63, 
									dt64, dt65, dt66, dt67, dt68, dt69, dt70, dt71, dt72, dt73, dt74, dt75, dt76, dt77, dt78, dt79, 
									dt80, dt81, dt82, dt83, dt84, dt85, dt86, dt87, dt88, dt89, dt90, dt91, dt92, dt93, dt94, dt95, 
									dt96, dt97, dt98, dt99, dt100, dt101, dt102, dt103, dt104, dt105, dt106, dt107, dt108, dt109, dt110, dt111, 
									dt112, dt113, dt114, dt115, dt116, dt117, dt118, dt119, dt120, dt121, dt122, dt123, dt124, dt125, dt126, dt127, 
									dt128, dt129, dt130, dt131, dt132, dt133, dt134, dt135, dt136, dt137, dt138, dt139, dt140, dt141, dt142, dt143, 
									dt144, dt145, dt146, dt147, dt148, dt149, dt150, dt151, dt152, dt153, dt154, dt155, dt156, dt157, dt158, dt159, 
									dt160, dt161, dt162, dt163, dt164, dt165, dt166, dt167, dt168, dt169, dt170, dt171, dt172, dt173, dt174, dt175, 
									dt176, dt177, dt178, dt179, dt180, dt181, dt182, dt183, dt184, dt185, dt186, dt187, dt188, dt189, dt190, dt191, 
									dt192, dt193, dt194, dt195, dt196, dt197, dt198, dt199, dt200, dt201, dt202, dt203, dt204, dt205, dt206, dt207, 
									dt208, dt209, dt210, dt211, dt212, dt213, dt214, dt215, dt216, dt217, dt218, dt219, dt220, dt221, dt222, dt223, 
									dt224, dt225, dt226, dt227, dt228, dt229, dt230, dt231, dt232, dt233, dt234, dt235, dt236, dt237, dt238, dt239, 
									dt240, dt241, dt242, dt243, dt244, dt245, dt246, dt247, dt248, dt249, dt250, dt251, dt252, dt253, dt254, dt255, 
									dt256, dt257, dt258, dt259, dt260, dt261, dt262, dt263, dt264, dt265, dt266, dt267, dt268, dt269, dt270, dt271, 
									dt272, dt273, dt274, dt275, dt276, dt277, dt278, dt279, dt280, dt281, dt282, dt283, dt284, dt285, dt286, dt287, 
									dt288, dt289, dt290, dt291, dt292, dt293, dt294, dt295, dt296, dt297, dt298, dt299, dt300, dt301, dt302, dt303, 
									dt304, dt305, dt306, dt307, dt308, dt309, dt310, dt311, dt312, dt313, dt314, dt315, dt316, dt317, dt318, dt319, 
									dt320, dt321, dt322, dt323, dt324, dt325, dt326, dt327, dt328, dt329, dt330, dt331, dt332, dt333, dt334, dt335, 
									dt336, dt337, dt338, dt339, dt340, dt341, dt342, dt343, dt344, dt345, dt346, dt347, dt348, dt349, dt350, dt351, 
									dt352, dt353, dt354, dt355, dt356, dt357, dt358, dt359, dt360, dt361, dt362, dt363, dt364, dt365, dt366, dt367, 
									dt368, dt369, dt370, dt371, dt372, dt373, dt374, dt375, dt376, dt377, dt378, dt379, dt380, dt381, dt382, dt383, 
									dt384, dt385, dt386, dt387, dt388, dt389, dt390, dt391, dt392, dt393, dt394, dt395, dt396, dt397, dt398, dt399, 
									dt400, dt401, dt402, dt403, dt404, dt405, dt406, dt407, dt408, dt409, dt410, dt411, dt412, dt413, dt414, dt415, 
									dt416, dt417, dt418, dt419, dt420, dt421, dt422, dt423, dt424, dt425, dt426, dt427, dt428, dt429, dt430, dt431, 
									dt432, dt433, dt434, dt435, dt436, dt437, dt438, dt439, dt440, dt441, dt442, dt443, dt444, dt445, dt446, dt447, 
									dt448, dt449, dt450, dt451, dt452, dt453, dt454, dt455, dt456, dt457, dt458, dt459, dt460, dt461, dt462, dt463, 
									dt464, dt465, dt466, dt467, dt468, dt469, dt470, dt471, dt472, dt473, dt474, dt475, dt476, dt477, dt478, dt479, 
									dt480, dt481, dt482, dt483, dt484, dt485, dt486, dt487, dt488, dt489, dt490, dt491, dt492, dt493, dt494, dt495, 
									dt496, dt497, dt498, dt499, dt500, dt501, dt502, dt503, dt504, dt505, dt506, dt507, dt508, dt509, dt510, dt511, 
									dt512, dt513, dt514, dt515, dt516, dt517, dt518, dt519, dt520, dt521, dt522, dt523, dt524, dt525, dt526, dt527, 
									dt528, dt529, dt530, dt531, dt532, dt533, dt534, dt535, dt536, dt537, dt538, dt539, dt540, dt541, dt542, dt543, 
									dt544, dt545, dt546, dt547, dt548, dt549, dt550, dt551, dt552, dt553, dt554, dt555, dt556, dt557, dt558, dt559, 
									dt560, dt561, dt562, dt563, dt564, dt565, dt566, dt567, dt568, dt569, dt570, dt571, dt572, dt573, dt574, dt575, 
									dt576, dt577, dt578, dt579, dt580, dt581, dt582, dt583, dt584, dt585, dt586, dt587, dt588, dt589, dt590, dt591, 
									dt592, dt593, dt594, dt595, dt596, dt597, dt598, dt599, dt600, dt601, dt602, dt603, dt604, dt605, dt606, dt607, 
									dt608, dt609, dt610, dt611, dt612, dt613, dt614, dt615, dt616, dt617, dt618, dt619, dt620, dt621, dt622, dt623, 
									dt624, dt625, dt626, dt627, dt628, dt629, dt630, dt631, dt632, dt633, dt634, dt635, dt636, dt637, dt638, dt639, 
									dt640, dt641, dt642, dt643, dt644, dt645, dt646, dt647, dt648, dt649, dt650, dt651, dt652, dt653, dt654, dt655, 
									dt656, dt657, dt658, dt659, dt660, dt661, dt662, dt663, dt664, dt665, dt666, dt667, dt668, dt669, dt670, dt671, 
									dt672, dt673, dt674, dt675, dt676, dt677, dt678, dt679, dt680, dt681, dt682, dt683, dt684, dt685, dt686, dt687, 
									dt688, dt689, dt690, dt691, dt692, dt693, dt694, dt695, dt696, dt697, dt698, dt699, dt700, dt701, dt702, dt703, 
									dt704, dt705, dt706, dt707, dt708, dt709, dt710, dt711, dt712, dt713, dt714, dt715, dt716, dt717, dt718, dt719, 
									dt720, dt721, dt722, dt723, dt724, dt725, dt726, dt727, dt728, dt729, dt730, dt731, dt732, dt733, dt734, dt735, 
									dt736, dt737, dt738, dt739, dt740, dt741, dt742, dt743, dt744, dt745, dt746, dt747, dt748, dt749, dt750, dt751, 
									dt752, dt753, dt754, dt755, dt756, dt757, dt758, dt759, dt760, dt761, dt762, dt763, dt764, dt765, dt766, dt767, 
									dt768, dt769, dt770, dt771, dt772, dt773, dt774, dt775, dt776, dt777, dt778, dt779, dt780, dt781, dt782, dt783, 
									dt784, dt785, dt786, dt787, dt788, dt789, dt790, dt791, dt792, dt793, dt794, dt795, dt796, dt797, dt798, dt799, 
									dt800, dt801, dt802, dt803, dt804, dt805, dt806, dt807, dt808, dt809, dt810, dt811, dt812, dt813, dt814, dt815, 
									dt816, dt817, dt818, dt819, dt820, dt821, dt822, dt823, dt824, dt825, dt826, dt827, dt828, dt829, dt830, dt831, 
									dt832, dt833, dt834, dt835, dt836, dt837, dt838, dt839, dt840, dt841, dt842, dt843, dt844, dt845, dt846, dt847, 
									dt848, dt849, dt850, dt851, dt852, dt853, dt854, dt855, dt856, dt857, dt858, dt859, dt860, dt861, dt862, dt863, 
									dt864, dt865, dt866, dt867, dt868, dt869, dt870, dt871, dt872, dt873, dt874, dt875, dt876, dt877, dt878, dt879, 
									dt880, dt881, dt882, dt883, dt884, dt885, dt886, dt887, dt888, dt889, dt890, dt891, dt892, dt893, dt894, dt895, 
									dt896, dt897, dt898, dt899, dt900, dt901, dt902, dt903, dt904, dt905, dt906, dt907, dt908, dt909, dt910, dt911, 
									dt912, dt913, dt914, dt915, dt916, dt917, dt918, dt919, dt920, dt921, dt922, dt923, dt924, dt925, dt926, dt927, 
									dt928, dt929, dt930, dt931, dt932, dt933, dt934, dt935, dt936, dt937, dt938, dt939, dt940, dt941, dt942, dt943, 
									dt944, dt945, dt946, dt947, dt948, dt949, dt950, dt951, dt952, dt953, dt954, dt955, dt956, dt957, dt958, dt959, 
									dt960, dt961, dt962, dt963, dt964, dt965, dt966, dt967, dt968, dt969, dt970, dt971, dt972, dt973, dt974, dt975, 
									dt976, dt977, dt978, dt979, dt980, dt981, dt982, dt983, dt984, dt985, dt986, dt987, dt988, dt989, dt990, dt991, 
									dt992, dt993, dt994, dt995, dt996, dt997, dt998, dt999, dt1000, dt1001, dt1002, dt1003, dt1004, dt1005, dt1006, dt1007, 
									dt1008, dt1009, dt1010, dt1011, dt1012, dt1013, dt1014, dt1015, dt1016, dt1017, dt1018, dt1019, dt1020, dt1021, dt1022, dt1023
);

	integer               		fInput; // file handler
	integer               		fScan; 	// file handler
	integer 					line_cnt, temp, i;

	integer					fdt[1023:0];

	reg 	[262140:0] 	line;

// synopsys translate_off
 	initial begin : parameter_check
		fInput = $fopen(filename, "r");
		if (fInput == 0) begin
		    $display ("ERROR --- ReadFile handle was NULL");
		    $finish;
		end 
		else begin
		    $display ("INFOR --- File %s is opened", filename);
		    $display ("INFOR --- Skip two first comment lines");
		end

	end

	always @(posedge clk or posedge rst) 
	begin
		if (rst) 
		begin
			line_cnt   = 0;
			line  		<= 0;
			stall 	 	<= 1;
			for (i=0; i<1024; i = i+1)
				fdt[i] = 0;
		end
		else 
		begin
			if ($fgets(line, fInput)) 
			begin 
				line_cnt = line_cnt + 1;
				if (line_cnt > 2) 
				begin
					stall <= 0;
					fScan = $sscanf(line,
					     "%d  \
					       %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  \
						 %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d",
						 temp, 
						 fdt[0], fdt[1], fdt[2], fdt[3], fdt[4], fdt[5], fdt[6], fdt[7], 
						 fdt[8], fdt[9], fdt[10], fdt[11], fdt[12], fdt[13], fdt[14], fdt[15], 
						 fdt[16], fdt[17], fdt[18], fdt[19], fdt[20], fdt[21], fdt[22], fdt[23], 
						 fdt[24], fdt[25], fdt[26], fdt[27], fdt[28], fdt[29], fdt[30], fdt[31], 
						 fdt[32], fdt[33], fdt[34], fdt[35], fdt[36], fdt[37], fdt[38], fdt[39], 
						 fdt[40], fdt[41], fdt[42], fdt[43], fdt[44], fdt[45], fdt[46], fdt[47], 
						 fdt[48], fdt[49], fdt[50], fdt[51], fdt[52], fdt[53], fdt[54], fdt[55], 
						 fdt[56], fdt[57], fdt[58], fdt[59], fdt[60], fdt[61], fdt[62], fdt[63], 
						 fdt[64], fdt[65], fdt[66], fdt[67], fdt[68], fdt[69], fdt[70], fdt[71], 
						 fdt[72], fdt[73], fdt[74], fdt[75], fdt[76], fdt[77], fdt[78], fdt[79], 
						 fdt[80], fdt[81], fdt[82], fdt[83], fdt[84], fdt[85], fdt[86], fdt[87], 
						 fdt[88], fdt[89], fdt[90], fdt[91], fdt[92], fdt[93], fdt[94], fdt[95], 
						 fdt[96], fdt[97], fdt[98], fdt[99], fdt[100], fdt[101], fdt[102], fdt[103], 
						 fdt[104], fdt[105], fdt[106], fdt[107], fdt[108], fdt[109], fdt[110], fdt[111], 
						 fdt[112], fdt[113], fdt[114], fdt[115], fdt[116], fdt[117], fdt[118], fdt[119], 
						 fdt[120], fdt[121], fdt[122], fdt[123], fdt[124], fdt[125], fdt[126], fdt[127], 
						 fdt[128], fdt[129], fdt[130], fdt[131], fdt[132], fdt[133], fdt[134], fdt[135], 
						 fdt[136], fdt[137], fdt[138], fdt[139], fdt[140], fdt[141], fdt[142], fdt[143], 
						 fdt[144], fdt[145], fdt[146], fdt[147], fdt[148], fdt[149], fdt[150], fdt[151], 
						 fdt[152], fdt[153], fdt[154], fdt[155], fdt[156], fdt[157], fdt[158], fdt[159], 
						 fdt[160], fdt[161], fdt[162], fdt[163], fdt[164], fdt[165], fdt[166], fdt[167], 
						 fdt[168], fdt[169], fdt[170], fdt[171], fdt[172], fdt[173], fdt[174], fdt[175], 
						 fdt[176], fdt[177], fdt[178], fdt[179], fdt[180], fdt[181], fdt[182], fdt[183], 
						 fdt[184], fdt[185], fdt[186], fdt[187], fdt[188], fdt[189], fdt[190], fdt[191], 
						 fdt[192], fdt[193], fdt[194], fdt[195], fdt[196], fdt[197], fdt[198], fdt[199], 
						 fdt[200], fdt[201], fdt[202], fdt[203], fdt[204], fdt[205], fdt[206], fdt[207], 
						 fdt[208], fdt[209], fdt[210], fdt[211], fdt[212], fdt[213], fdt[214], fdt[215], 
						 fdt[216], fdt[217], fdt[218], fdt[219], fdt[220], fdt[221], fdt[222], fdt[223], 
						 fdt[224], fdt[225], fdt[226], fdt[227], fdt[228], fdt[229], fdt[230], fdt[231], 
						 fdt[232], fdt[233], fdt[234], fdt[235], fdt[236], fdt[237], fdt[238], fdt[239], 
						 fdt[240], fdt[241], fdt[242], fdt[243], fdt[244], fdt[245], fdt[246], fdt[247], 
						 fdt[248], fdt[249], fdt[250], fdt[251], fdt[252], fdt[253], fdt[254], fdt[255], 
						 fdt[256], fdt[257], fdt[258], fdt[259], fdt[260], fdt[261], fdt[262], fdt[263], 
						 fdt[264], fdt[265], fdt[266], fdt[267], fdt[268], fdt[269], fdt[270], fdt[271], 
						 fdt[272], fdt[273], fdt[274], fdt[275], fdt[276], fdt[277], fdt[278], fdt[279], 
						 fdt[280], fdt[281], fdt[282], fdt[283], fdt[284], fdt[285], fdt[286], fdt[287], 
						 fdt[288], fdt[289], fdt[290], fdt[291], fdt[292], fdt[293], fdt[294], fdt[295], 
						 fdt[296], fdt[297], fdt[298], fdt[299], fdt[300], fdt[301], fdt[302], fdt[303], 
						 fdt[304], fdt[305], fdt[306], fdt[307], fdt[308], fdt[309], fdt[310], fdt[311], 
						 fdt[312], fdt[313], fdt[314], fdt[315], fdt[316], fdt[317], fdt[318], fdt[319], 
						 fdt[320], fdt[321], fdt[322], fdt[323], fdt[324], fdt[325], fdt[326], fdt[327], 
						 fdt[328], fdt[329], fdt[330], fdt[331], fdt[332], fdt[333], fdt[334], fdt[335], 
						 fdt[336], fdt[337], fdt[338], fdt[339], fdt[340], fdt[341], fdt[342], fdt[343], 
						 fdt[344], fdt[345], fdt[346], fdt[347], fdt[348], fdt[349], fdt[350], fdt[351], 
						 fdt[352], fdt[353], fdt[354], fdt[355], fdt[356], fdt[357], fdt[358], fdt[359], 
						 fdt[360], fdt[361], fdt[362], fdt[363], fdt[364], fdt[365], fdt[366], fdt[367], 
						 fdt[368], fdt[369], fdt[370], fdt[371], fdt[372], fdt[373], fdt[374], fdt[375], 
						 fdt[376], fdt[377], fdt[378], fdt[379], fdt[380], fdt[381], fdt[382], fdt[383], 
						 fdt[384], fdt[385], fdt[386], fdt[387], fdt[388], fdt[389], fdt[390], fdt[391], 
						 fdt[392], fdt[393], fdt[394], fdt[395], fdt[396], fdt[397], fdt[398], fdt[399], 
						 fdt[400], fdt[401], fdt[402], fdt[403], fdt[404], fdt[405], fdt[406], fdt[407], 
						 fdt[408], fdt[409], fdt[410], fdt[411], fdt[412], fdt[413], fdt[414], fdt[415], 
						 fdt[416], fdt[417], fdt[418], fdt[419], fdt[420], fdt[421], fdt[422], fdt[423], 
						 fdt[424], fdt[425], fdt[426], fdt[427], fdt[428], fdt[429], fdt[430], fdt[431], 
						 fdt[432], fdt[433], fdt[434], fdt[435], fdt[436], fdt[437], fdt[438], fdt[439], 
						 fdt[440], fdt[441], fdt[442], fdt[443], fdt[444], fdt[445], fdt[446], fdt[447], 
						 fdt[448], fdt[449], fdt[450], fdt[451], fdt[452], fdt[453], fdt[454], fdt[455], 
						 fdt[456], fdt[457], fdt[458], fdt[459], fdt[460], fdt[461], fdt[462], fdt[463], 
						 fdt[464], fdt[465], fdt[466], fdt[467], fdt[468], fdt[469], fdt[470], fdt[471], 
						 fdt[472], fdt[473], fdt[474], fdt[475], fdt[476], fdt[477], fdt[478], fdt[479], 
						 fdt[480], fdt[481], fdt[482], fdt[483], fdt[484], fdt[485], fdt[486], fdt[487], 
						 fdt[488], fdt[489], fdt[490], fdt[491], fdt[492], fdt[493], fdt[494], fdt[495], 
						 fdt[496], fdt[497], fdt[498], fdt[499], fdt[500], fdt[501], fdt[502], fdt[503], 
						 fdt[504], fdt[505], fdt[506], fdt[507], fdt[508], fdt[509], fdt[510], fdt[511], 
						 fdt[512], fdt[513], fdt[514], fdt[515], fdt[516], fdt[517], fdt[518], fdt[519], 
						 fdt[520], fdt[521], fdt[522], fdt[523], fdt[524], fdt[525], fdt[526], fdt[527], 
						 fdt[528], fdt[529], fdt[530], fdt[531], fdt[532], fdt[533], fdt[534], fdt[535], 
						 fdt[536], fdt[537], fdt[538], fdt[539], fdt[540], fdt[541], fdt[542], fdt[543], 
						 fdt[544], fdt[545], fdt[546], fdt[547], fdt[548], fdt[549], fdt[550], fdt[551], 
						 fdt[552], fdt[553], fdt[554], fdt[555], fdt[556], fdt[557], fdt[558], fdt[559], 
						 fdt[560], fdt[561], fdt[562], fdt[563], fdt[564], fdt[565], fdt[566], fdt[567], 
						 fdt[568], fdt[569], fdt[570], fdt[571], fdt[572], fdt[573], fdt[574], fdt[575], 
						 fdt[576], fdt[577], fdt[578], fdt[579], fdt[580], fdt[581], fdt[582], fdt[583], 
						 fdt[584], fdt[585], fdt[586], fdt[587], fdt[588], fdt[589], fdt[590], fdt[591], 
						 fdt[592], fdt[593], fdt[594], fdt[595], fdt[596], fdt[597], fdt[598], fdt[599], 
						 fdt[600], fdt[601], fdt[602], fdt[603], fdt[604], fdt[605], fdt[606], fdt[607], 
						 fdt[608], fdt[609], fdt[610], fdt[611], fdt[612], fdt[613], fdt[614], fdt[615], 
						 fdt[616], fdt[617], fdt[618], fdt[619], fdt[620], fdt[621], fdt[622], fdt[623], 
						 fdt[624], fdt[625], fdt[626], fdt[627], fdt[628], fdt[629], fdt[630], fdt[631], 
						 fdt[632], fdt[633], fdt[634], fdt[635], fdt[636], fdt[637], fdt[638], fdt[639], 
						 fdt[640], fdt[641], fdt[642], fdt[643], fdt[644], fdt[645], fdt[646], fdt[647], 
						 fdt[648], fdt[649], fdt[650], fdt[651], fdt[652], fdt[653], fdt[654], fdt[655], 
						 fdt[656], fdt[657], fdt[658], fdt[659], fdt[660], fdt[661], fdt[662], fdt[663], 
						 fdt[664], fdt[665], fdt[666], fdt[667], fdt[668], fdt[669], fdt[670], fdt[671], 
						 fdt[672], fdt[673], fdt[674], fdt[675], fdt[676], fdt[677], fdt[678], fdt[679], 
						 fdt[680], fdt[681], fdt[682], fdt[683], fdt[684], fdt[685], fdt[686], fdt[687], 
						 fdt[688], fdt[689], fdt[690], fdt[691], fdt[692], fdt[693], fdt[694], fdt[695], 
						 fdt[696], fdt[697], fdt[698], fdt[699], fdt[700], fdt[701], fdt[702], fdt[703], 
						 fdt[704], fdt[705], fdt[706], fdt[707], fdt[708], fdt[709], fdt[710], fdt[711], 
						 fdt[712], fdt[713], fdt[714], fdt[715], fdt[716], fdt[717], fdt[718], fdt[719], 
						 fdt[720], fdt[721], fdt[722], fdt[723], fdt[724], fdt[725], fdt[726], fdt[727], 
						 fdt[728], fdt[729], fdt[730], fdt[731], fdt[732], fdt[733], fdt[734], fdt[735], 
						 fdt[736], fdt[737], fdt[738], fdt[739], fdt[740], fdt[741], fdt[742], fdt[743], 
						 fdt[744], fdt[745], fdt[746], fdt[747], fdt[748], fdt[749], fdt[750], fdt[751], 
						 fdt[752], fdt[753], fdt[754], fdt[755], fdt[756], fdt[757], fdt[758], fdt[759], 
						 fdt[760], fdt[761], fdt[762], fdt[763], fdt[764], fdt[765], fdt[766], fdt[767], 
						 fdt[768], fdt[769], fdt[770], fdt[771], fdt[772], fdt[773], fdt[774], fdt[775], 
						 fdt[776], fdt[777], fdt[778], fdt[779], fdt[780], fdt[781], fdt[782], fdt[783], 
						 fdt[784], fdt[785], fdt[786], fdt[787], fdt[788], fdt[789], fdt[790], fdt[791], 
						 fdt[792], fdt[793], fdt[794], fdt[795], fdt[796], fdt[797], fdt[798], fdt[799], 
						 fdt[800], fdt[801], fdt[802], fdt[803], fdt[804], fdt[805], fdt[806], fdt[807], 
						 fdt[808], fdt[809], fdt[810], fdt[811], fdt[812], fdt[813], fdt[814], fdt[815], 
						 fdt[816], fdt[817], fdt[818], fdt[819], fdt[820], fdt[821], fdt[822], fdt[823], 
						 fdt[824], fdt[825], fdt[826], fdt[827], fdt[828], fdt[829], fdt[830], fdt[831], 
						 fdt[832], fdt[833], fdt[834], fdt[835], fdt[836], fdt[837], fdt[838], fdt[839], 
						 fdt[840], fdt[841], fdt[842], fdt[843], fdt[844], fdt[845], fdt[846], fdt[847], 
						 fdt[848], fdt[849], fdt[850], fdt[851], fdt[852], fdt[853], fdt[854], fdt[855], 
						 fdt[856], fdt[857], fdt[858], fdt[859], fdt[860], fdt[861], fdt[862], fdt[863], 
						 fdt[864], fdt[865], fdt[866], fdt[867], fdt[868], fdt[869], fdt[870], fdt[871], 
						 fdt[872], fdt[873], fdt[874], fdt[875], fdt[876], fdt[877], fdt[878], fdt[879], 
						 fdt[880], fdt[881], fdt[882], fdt[883], fdt[884], fdt[885], fdt[886], fdt[887], 
						 fdt[888], fdt[889], fdt[890], fdt[891], fdt[892], fdt[893], fdt[894], fdt[895], 
						 fdt[896], fdt[897], fdt[898], fdt[899], fdt[900], fdt[901], fdt[902], fdt[903], 
						 fdt[904], fdt[905], fdt[906], fdt[907], fdt[908], fdt[909], fdt[910], fdt[911], 
						 fdt[912], fdt[913], fdt[914], fdt[915], fdt[916], fdt[917], fdt[918], fdt[919], 
						 fdt[920], fdt[921], fdt[922], fdt[923], fdt[924], fdt[925], fdt[926], fdt[927], 
						 fdt[928], fdt[929], fdt[930], fdt[931], fdt[932], fdt[933], fdt[934], fdt[935], 
						 fdt[936], fdt[937], fdt[938], fdt[939], fdt[940], fdt[941], fdt[942], fdt[943], 
						 fdt[944], fdt[945], fdt[946], fdt[947], fdt[948], fdt[949], fdt[950], fdt[951], 
						 fdt[952], fdt[953], fdt[954], fdt[955], fdt[956], fdt[957], fdt[958], fdt[959], 
						 fdt[960], fdt[961], fdt[962], fdt[963], fdt[964], fdt[965], fdt[966], fdt[967], 
						 fdt[968], fdt[969], fdt[970], fdt[971], fdt[972], fdt[973], fdt[974], fdt[975], 
						 fdt[976], fdt[977], fdt[978], fdt[979], fdt[980], fdt[981], fdt[982], fdt[983], 
						 fdt[984], fdt[985], fdt[986], fdt[987], fdt[988], fdt[989], fdt[990], fdt[991], 
						 fdt[992], fdt[993], fdt[994], fdt[995], fdt[996], fdt[997], fdt[998], fdt[999], 
						 fdt[1000], fdt[1001], fdt[1002], fdt[1003], fdt[1004], fdt[1005], fdt[1006], fdt[1007], 
						 fdt[1008], fdt[1009], fdt[1010], fdt[1011], fdt[1012], fdt[1013], fdt[1014], fdt[1015], 
						 fdt[1016], fdt[1017], fdt[1018], fdt[1019], fdt[1020], fdt[1021], fdt[1022], fdt[1023]);
			
					`ifdef debug_print_read
						$write("READ  Line %d:  ", line_cnt);
						for (i=0; i<size; i = i+1) begin
							$write("%d  ", fdt[i]);
						end
						$write("\n");
					`endif

					if ($feof(fInput)) begin
						$display  ("WARNS --- End of reading file %s", filename);
						//$fclose(fInput);
						//$finish;
					end
				end
			end 
			else 
			begin
				stall <= 1;
			end
		end
	end
	
	// output assignment
		assign dt0 = fdt[0]; assign dt1 = fdt[1]; assign dt2 = fdt[2]; assign dt3 = fdt[3]; 
		assign dt4 = fdt[4]; assign dt5 = fdt[5]; assign dt6 = fdt[6]; assign dt7 = fdt[7]; 
		assign dt8 = fdt[8]; assign dt9 = fdt[9]; assign dt10 = fdt[10]; assign dt11 = fdt[11]; 
		assign dt12 = fdt[12]; assign dt13 = fdt[13]; assign dt14 = fdt[14]; assign dt15 = fdt[15]; 
		assign dt16 = fdt[16]; assign dt17 = fdt[17]; assign dt18 = fdt[18]; assign dt19 = fdt[19]; 
		assign dt20 = fdt[20]; assign dt21 = fdt[21]; assign dt22 = fdt[22]; assign dt23 = fdt[23]; 
		assign dt24 = fdt[24]; assign dt25 = fdt[25]; assign dt26 = fdt[26]; assign dt27 = fdt[27]; 
		assign dt28 = fdt[28]; assign dt29 = fdt[29]; assign dt30 = fdt[30]; assign dt31 = fdt[31]; 
		assign dt32 = fdt[32]; assign dt33 = fdt[33]; assign dt34 = fdt[34]; assign dt35 = fdt[35]; 
		assign dt36 = fdt[36]; assign dt37 = fdt[37]; assign dt38 = fdt[38]; assign dt39 = fdt[39]; 
		assign dt40 = fdt[40]; assign dt41 = fdt[41]; assign dt42 = fdt[42]; assign dt43 = fdt[43]; 
		assign dt44 = fdt[44]; assign dt45 = fdt[45]; assign dt46 = fdt[46]; assign dt47 = fdt[47]; 
		assign dt48 = fdt[48]; assign dt49 = fdt[49]; assign dt50 = fdt[50]; assign dt51 = fdt[51]; 
		assign dt52 = fdt[52]; assign dt53 = fdt[53]; assign dt54 = fdt[54]; assign dt55 = fdt[55]; 
		assign dt56 = fdt[56]; assign dt57 = fdt[57]; assign dt58 = fdt[58]; assign dt59 = fdt[59]; 
		assign dt60 = fdt[60]; assign dt61 = fdt[61]; assign dt62 = fdt[62]; assign dt63 = fdt[63]; 
		assign dt64 = fdt[64]; assign dt65 = fdt[65]; assign dt66 = fdt[66]; assign dt67 = fdt[67]; 
		assign dt68 = fdt[68]; assign dt69 = fdt[69]; assign dt70 = fdt[70]; assign dt71 = fdt[71]; 
		assign dt72 = fdt[72]; assign dt73 = fdt[73]; assign dt74 = fdt[74]; assign dt75 = fdt[75]; 
		assign dt76 = fdt[76]; assign dt77 = fdt[77]; assign dt78 = fdt[78]; assign dt79 = fdt[79]; 
		assign dt80 = fdt[80]; assign dt81 = fdt[81]; assign dt82 = fdt[82]; assign dt83 = fdt[83]; 
		assign dt84 = fdt[84]; assign dt85 = fdt[85]; assign dt86 = fdt[86]; assign dt87 = fdt[87]; 
		assign dt88 = fdt[88]; assign dt89 = fdt[89]; assign dt90 = fdt[90]; assign dt91 = fdt[91]; 
		assign dt92 = fdt[92]; assign dt93 = fdt[93]; assign dt94 = fdt[94]; assign dt95 = fdt[95]; 
		assign dt96 = fdt[96]; assign dt97 = fdt[97]; assign dt98 = fdt[98]; assign dt99 = fdt[99]; 
		assign dt100 = fdt[100]; assign dt101 = fdt[101]; assign dt102 = fdt[102]; assign dt103 = fdt[103]; 
		assign dt104 = fdt[104]; assign dt105 = fdt[105]; assign dt106 = fdt[106]; assign dt107 = fdt[107]; 
		assign dt108 = fdt[108]; assign dt109 = fdt[109]; assign dt110 = fdt[110]; assign dt111 = fdt[111]; 
		assign dt112 = fdt[112]; assign dt113 = fdt[113]; assign dt114 = fdt[114]; assign dt115 = fdt[115]; 
		assign dt116 = fdt[116]; assign dt117 = fdt[117]; assign dt118 = fdt[118]; assign dt119 = fdt[119]; 
		assign dt120 = fdt[120]; assign dt121 = fdt[121]; assign dt122 = fdt[122]; assign dt123 = fdt[123]; 
		assign dt124 = fdt[124]; assign dt125 = fdt[125]; assign dt126 = fdt[126]; assign dt127 = fdt[127]; 
		assign dt128 = fdt[128]; assign dt129 = fdt[129]; assign dt130 = fdt[130]; assign dt131 = fdt[131]; 
		assign dt132 = fdt[132]; assign dt133 = fdt[133]; assign dt134 = fdt[134]; assign dt135 = fdt[135]; 
		assign dt136 = fdt[136]; assign dt137 = fdt[137]; assign dt138 = fdt[138]; assign dt139 = fdt[139]; 
		assign dt140 = fdt[140]; assign dt141 = fdt[141]; assign dt142 = fdt[142]; assign dt143 = fdt[143]; 
		assign dt144 = fdt[144]; assign dt145 = fdt[145]; assign dt146 = fdt[146]; assign dt147 = fdt[147]; 
		assign dt148 = fdt[148]; assign dt149 = fdt[149]; assign dt150 = fdt[150]; assign dt151 = fdt[151]; 
		assign dt152 = fdt[152]; assign dt153 = fdt[153]; assign dt154 = fdt[154]; assign dt155 = fdt[155]; 
		assign dt156 = fdt[156]; assign dt157 = fdt[157]; assign dt158 = fdt[158]; assign dt159 = fdt[159]; 
		assign dt160 = fdt[160]; assign dt161 = fdt[161]; assign dt162 = fdt[162]; assign dt163 = fdt[163]; 
		assign dt164 = fdt[164]; assign dt165 = fdt[165]; assign dt166 = fdt[166]; assign dt167 = fdt[167]; 
		assign dt168 = fdt[168]; assign dt169 = fdt[169]; assign dt170 = fdt[170]; assign dt171 = fdt[171]; 
		assign dt172 = fdt[172]; assign dt173 = fdt[173]; assign dt174 = fdt[174]; assign dt175 = fdt[175]; 
		assign dt176 = fdt[176]; assign dt177 = fdt[177]; assign dt178 = fdt[178]; assign dt179 = fdt[179]; 
		assign dt180 = fdt[180]; assign dt181 = fdt[181]; assign dt182 = fdt[182]; assign dt183 = fdt[183]; 
		assign dt184 = fdt[184]; assign dt185 = fdt[185]; assign dt186 = fdt[186]; assign dt187 = fdt[187]; 
		assign dt188 = fdt[188]; assign dt189 = fdt[189]; assign dt190 = fdt[190]; assign dt191 = fdt[191]; 
		assign dt192 = fdt[192]; assign dt193 = fdt[193]; assign dt194 = fdt[194]; assign dt195 = fdt[195]; 
		assign dt196 = fdt[196]; assign dt197 = fdt[197]; assign dt198 = fdt[198]; assign dt199 = fdt[199]; 
		assign dt200 = fdt[200]; assign dt201 = fdt[201]; assign dt202 = fdt[202]; assign dt203 = fdt[203]; 
		assign dt204 = fdt[204]; assign dt205 = fdt[205]; assign dt206 = fdt[206]; assign dt207 = fdt[207]; 
		assign dt208 = fdt[208]; assign dt209 = fdt[209]; assign dt210 = fdt[210]; assign dt211 = fdt[211]; 
		assign dt212 = fdt[212]; assign dt213 = fdt[213]; assign dt214 = fdt[214]; assign dt215 = fdt[215]; 
		assign dt216 = fdt[216]; assign dt217 = fdt[217]; assign dt218 = fdt[218]; assign dt219 = fdt[219]; 
		assign dt220 = fdt[220]; assign dt221 = fdt[221]; assign dt222 = fdt[222]; assign dt223 = fdt[223]; 
		assign dt224 = fdt[224]; assign dt225 = fdt[225]; assign dt226 = fdt[226]; assign dt227 = fdt[227]; 
		assign dt228 = fdt[228]; assign dt229 = fdt[229]; assign dt230 = fdt[230]; assign dt231 = fdt[231]; 
		assign dt232 = fdt[232]; assign dt233 = fdt[233]; assign dt234 = fdt[234]; assign dt235 = fdt[235]; 
		assign dt236 = fdt[236]; assign dt237 = fdt[237]; assign dt238 = fdt[238]; assign dt239 = fdt[239]; 
		assign dt240 = fdt[240]; assign dt241 = fdt[241]; assign dt242 = fdt[242]; assign dt243 = fdt[243]; 
		assign dt244 = fdt[244]; assign dt245 = fdt[245]; assign dt246 = fdt[246]; assign dt247 = fdt[247]; 
		assign dt248 = fdt[248]; assign dt249 = fdt[249]; assign dt250 = fdt[250]; assign dt251 = fdt[251]; 
		assign dt252 = fdt[252]; assign dt253 = fdt[253]; assign dt254 = fdt[254]; assign dt255 = fdt[255]; 
		assign dt256 = fdt[256]; assign dt257 = fdt[257]; assign dt258 = fdt[258]; assign dt259 = fdt[259]; 
		assign dt260 = fdt[260]; assign dt261 = fdt[261]; assign dt262 = fdt[262]; assign dt263 = fdt[263]; 
		assign dt264 = fdt[264]; assign dt265 = fdt[265]; assign dt266 = fdt[266]; assign dt267 = fdt[267]; 
		assign dt268 = fdt[268]; assign dt269 = fdt[269]; assign dt270 = fdt[270]; assign dt271 = fdt[271]; 
		assign dt272 = fdt[272]; assign dt273 = fdt[273]; assign dt274 = fdt[274]; assign dt275 = fdt[275]; 
		assign dt276 = fdt[276]; assign dt277 = fdt[277]; assign dt278 = fdt[278]; assign dt279 = fdt[279]; 
		assign dt280 = fdt[280]; assign dt281 = fdt[281]; assign dt282 = fdt[282]; assign dt283 = fdt[283]; 
		assign dt284 = fdt[284]; assign dt285 = fdt[285]; assign dt286 = fdt[286]; assign dt287 = fdt[287]; 
		assign dt288 = fdt[288]; assign dt289 = fdt[289]; assign dt290 = fdt[290]; assign dt291 = fdt[291]; 
		assign dt292 = fdt[292]; assign dt293 = fdt[293]; assign dt294 = fdt[294]; assign dt295 = fdt[295]; 
		assign dt296 = fdt[296]; assign dt297 = fdt[297]; assign dt298 = fdt[298]; assign dt299 = fdt[299]; 
		assign dt300 = fdt[300]; assign dt301 = fdt[301]; assign dt302 = fdt[302]; assign dt303 = fdt[303]; 
		assign dt304 = fdt[304]; assign dt305 = fdt[305]; assign dt306 = fdt[306]; assign dt307 = fdt[307]; 
		assign dt308 = fdt[308]; assign dt309 = fdt[309]; assign dt310 = fdt[310]; assign dt311 = fdt[311]; 
		assign dt312 = fdt[312]; assign dt313 = fdt[313]; assign dt314 = fdt[314]; assign dt315 = fdt[315]; 
		assign dt316 = fdt[316]; assign dt317 = fdt[317]; assign dt318 = fdt[318]; assign dt319 = fdt[319]; 
		assign dt320 = fdt[320]; assign dt321 = fdt[321]; assign dt322 = fdt[322]; assign dt323 = fdt[323]; 
		assign dt324 = fdt[324]; assign dt325 = fdt[325]; assign dt326 = fdt[326]; assign dt327 = fdt[327]; 
		assign dt328 = fdt[328]; assign dt329 = fdt[329]; assign dt330 = fdt[330]; assign dt331 = fdt[331]; 
		assign dt332 = fdt[332]; assign dt333 = fdt[333]; assign dt334 = fdt[334]; assign dt335 = fdt[335]; 
		assign dt336 = fdt[336]; assign dt337 = fdt[337]; assign dt338 = fdt[338]; assign dt339 = fdt[339]; 
		assign dt340 = fdt[340]; assign dt341 = fdt[341]; assign dt342 = fdt[342]; assign dt343 = fdt[343]; 
		assign dt344 = fdt[344]; assign dt345 = fdt[345]; assign dt346 = fdt[346]; assign dt347 = fdt[347]; 
		assign dt348 = fdt[348]; assign dt349 = fdt[349]; assign dt350 = fdt[350]; assign dt351 = fdt[351]; 
		assign dt352 = fdt[352]; assign dt353 = fdt[353]; assign dt354 = fdt[354]; assign dt355 = fdt[355]; 
		assign dt356 = fdt[356]; assign dt357 = fdt[357]; assign dt358 = fdt[358]; assign dt359 = fdt[359]; 
		assign dt360 = fdt[360]; assign dt361 = fdt[361]; assign dt362 = fdt[362]; assign dt363 = fdt[363]; 
		assign dt364 = fdt[364]; assign dt365 = fdt[365]; assign dt366 = fdt[366]; assign dt367 = fdt[367]; 
		assign dt368 = fdt[368]; assign dt369 = fdt[369]; assign dt370 = fdt[370]; assign dt371 = fdt[371]; 
		assign dt372 = fdt[372]; assign dt373 = fdt[373]; assign dt374 = fdt[374]; assign dt375 = fdt[375]; 
		assign dt376 = fdt[376]; assign dt377 = fdt[377]; assign dt378 = fdt[378]; assign dt379 = fdt[379]; 
		assign dt380 = fdt[380]; assign dt381 = fdt[381]; assign dt382 = fdt[382]; assign dt383 = fdt[383]; 
		assign dt384 = fdt[384]; assign dt385 = fdt[385]; assign dt386 = fdt[386]; assign dt387 = fdt[387]; 
		assign dt388 = fdt[388]; assign dt389 = fdt[389]; assign dt390 = fdt[390]; assign dt391 = fdt[391]; 
		assign dt392 = fdt[392]; assign dt393 = fdt[393]; assign dt394 = fdt[394]; assign dt395 = fdt[395]; 
		assign dt396 = fdt[396]; assign dt397 = fdt[397]; assign dt398 = fdt[398]; assign dt399 = fdt[399]; 
		assign dt400 = fdt[400]; assign dt401 = fdt[401]; assign dt402 = fdt[402]; assign dt403 = fdt[403]; 
		assign dt404 = fdt[404]; assign dt405 = fdt[405]; assign dt406 = fdt[406]; assign dt407 = fdt[407]; 
		assign dt408 = fdt[408]; assign dt409 = fdt[409]; assign dt410 = fdt[410]; assign dt411 = fdt[411]; 
		assign dt412 = fdt[412]; assign dt413 = fdt[413]; assign dt414 = fdt[414]; assign dt415 = fdt[415]; 
		assign dt416 = fdt[416]; assign dt417 = fdt[417]; assign dt418 = fdt[418]; assign dt419 = fdt[419]; 
		assign dt420 = fdt[420]; assign dt421 = fdt[421]; assign dt422 = fdt[422]; assign dt423 = fdt[423]; 
		assign dt424 = fdt[424]; assign dt425 = fdt[425]; assign dt426 = fdt[426]; assign dt427 = fdt[427]; 
		assign dt428 = fdt[428]; assign dt429 = fdt[429]; assign dt430 = fdt[430]; assign dt431 = fdt[431]; 
		assign dt432 = fdt[432]; assign dt433 = fdt[433]; assign dt434 = fdt[434]; assign dt435 = fdt[435]; 
		assign dt436 = fdt[436]; assign dt437 = fdt[437]; assign dt438 = fdt[438]; assign dt439 = fdt[439]; 
		assign dt440 = fdt[440]; assign dt441 = fdt[441]; assign dt442 = fdt[442]; assign dt443 = fdt[443]; 
		assign dt444 = fdt[444]; assign dt445 = fdt[445]; assign dt446 = fdt[446]; assign dt447 = fdt[447]; 
		assign dt448 = fdt[448]; assign dt449 = fdt[449]; assign dt450 = fdt[450]; assign dt451 = fdt[451]; 
		assign dt452 = fdt[452]; assign dt453 = fdt[453]; assign dt454 = fdt[454]; assign dt455 = fdt[455]; 
		assign dt456 = fdt[456]; assign dt457 = fdt[457]; assign dt458 = fdt[458]; assign dt459 = fdt[459]; 
		assign dt460 = fdt[460]; assign dt461 = fdt[461]; assign dt462 = fdt[462]; assign dt463 = fdt[463]; 
		assign dt464 = fdt[464]; assign dt465 = fdt[465]; assign dt466 = fdt[466]; assign dt467 = fdt[467]; 
		assign dt468 = fdt[468]; assign dt469 = fdt[469]; assign dt470 = fdt[470]; assign dt471 = fdt[471]; 
		assign dt472 = fdt[472]; assign dt473 = fdt[473]; assign dt474 = fdt[474]; assign dt475 = fdt[475]; 
		assign dt476 = fdt[476]; assign dt477 = fdt[477]; assign dt478 = fdt[478]; assign dt479 = fdt[479]; 
		assign dt480 = fdt[480]; assign dt481 = fdt[481]; assign dt482 = fdt[482]; assign dt483 = fdt[483]; 
		assign dt484 = fdt[484]; assign dt485 = fdt[485]; assign dt486 = fdt[486]; assign dt487 = fdt[487]; 
		assign dt488 = fdt[488]; assign dt489 = fdt[489]; assign dt490 = fdt[490]; assign dt491 = fdt[491]; 
		assign dt492 = fdt[492]; assign dt493 = fdt[493]; assign dt494 = fdt[494]; assign dt495 = fdt[495]; 
		assign dt496 = fdt[496]; assign dt497 = fdt[497]; assign dt498 = fdt[498]; assign dt499 = fdt[499]; 
		assign dt500 = fdt[500]; assign dt501 = fdt[501]; assign dt502 = fdt[502]; assign dt503 = fdt[503]; 
		assign dt504 = fdt[504]; assign dt505 = fdt[505]; assign dt506 = fdt[506]; assign dt507 = fdt[507]; 
		assign dt508 = fdt[508]; assign dt509 = fdt[509]; assign dt510 = fdt[510]; assign dt511 = fdt[511]; 
		assign dt512 = fdt[512]; assign dt513 = fdt[513]; assign dt514 = fdt[514]; assign dt515 = fdt[515]; 
		assign dt516 = fdt[516]; assign dt517 = fdt[517]; assign dt518 = fdt[518]; assign dt519 = fdt[519]; 
		assign dt520 = fdt[520]; assign dt521 = fdt[521]; assign dt522 = fdt[522]; assign dt523 = fdt[523]; 
		assign dt524 = fdt[524]; assign dt525 = fdt[525]; assign dt526 = fdt[526]; assign dt527 = fdt[527]; 
		assign dt528 = fdt[528]; assign dt529 = fdt[529]; assign dt530 = fdt[530]; assign dt531 = fdt[531]; 
		assign dt532 = fdt[532]; assign dt533 = fdt[533]; assign dt534 = fdt[534]; assign dt535 = fdt[535]; 
		assign dt536 = fdt[536]; assign dt537 = fdt[537]; assign dt538 = fdt[538]; assign dt539 = fdt[539]; 
		assign dt540 = fdt[540]; assign dt541 = fdt[541]; assign dt542 = fdt[542]; assign dt543 = fdt[543]; 
		assign dt544 = fdt[544]; assign dt545 = fdt[545]; assign dt546 = fdt[546]; assign dt547 = fdt[547]; 
		assign dt548 = fdt[548]; assign dt549 = fdt[549]; assign dt550 = fdt[550]; assign dt551 = fdt[551]; 
		assign dt552 = fdt[552]; assign dt553 = fdt[553]; assign dt554 = fdt[554]; assign dt555 = fdt[555]; 
		assign dt556 = fdt[556]; assign dt557 = fdt[557]; assign dt558 = fdt[558]; assign dt559 = fdt[559]; 
		assign dt560 = fdt[560]; assign dt561 = fdt[561]; assign dt562 = fdt[562]; assign dt563 = fdt[563]; 
		assign dt564 = fdt[564]; assign dt565 = fdt[565]; assign dt566 = fdt[566]; assign dt567 = fdt[567]; 
		assign dt568 = fdt[568]; assign dt569 = fdt[569]; assign dt570 = fdt[570]; assign dt571 = fdt[571]; 
		assign dt572 = fdt[572]; assign dt573 = fdt[573]; assign dt574 = fdt[574]; assign dt575 = fdt[575]; 
		assign dt576 = fdt[576]; assign dt577 = fdt[577]; assign dt578 = fdt[578]; assign dt579 = fdt[579]; 
		assign dt580 = fdt[580]; assign dt581 = fdt[581]; assign dt582 = fdt[582]; assign dt583 = fdt[583]; 
		assign dt584 = fdt[584]; assign dt585 = fdt[585]; assign dt586 = fdt[586]; assign dt587 = fdt[587]; 
		assign dt588 = fdt[588]; assign dt589 = fdt[589]; assign dt590 = fdt[590]; assign dt591 = fdt[591]; 
		assign dt592 = fdt[592]; assign dt593 = fdt[593]; assign dt594 = fdt[594]; assign dt595 = fdt[595]; 
		assign dt596 = fdt[596]; assign dt597 = fdt[597]; assign dt598 = fdt[598]; assign dt599 = fdt[599]; 
		assign dt600 = fdt[600]; assign dt601 = fdt[601]; assign dt602 = fdt[602]; assign dt603 = fdt[603]; 
		assign dt604 = fdt[604]; assign dt605 = fdt[605]; assign dt606 = fdt[606]; assign dt607 = fdt[607]; 
		assign dt608 = fdt[608]; assign dt609 = fdt[609]; assign dt610 = fdt[610]; assign dt611 = fdt[611]; 
		assign dt612 = fdt[612]; assign dt613 = fdt[613]; assign dt614 = fdt[614]; assign dt615 = fdt[615]; 
		assign dt616 = fdt[616]; assign dt617 = fdt[617]; assign dt618 = fdt[618]; assign dt619 = fdt[619]; 
		assign dt620 = fdt[620]; assign dt621 = fdt[621]; assign dt622 = fdt[622]; assign dt623 = fdt[623]; 
		assign dt624 = fdt[624]; assign dt625 = fdt[625]; assign dt626 = fdt[626]; assign dt627 = fdt[627]; 
		assign dt628 = fdt[628]; assign dt629 = fdt[629]; assign dt630 = fdt[630]; assign dt631 = fdt[631]; 
		assign dt632 = fdt[632]; assign dt633 = fdt[633]; assign dt634 = fdt[634]; assign dt635 = fdt[635]; 
		assign dt636 = fdt[636]; assign dt637 = fdt[637]; assign dt638 = fdt[638]; assign dt639 = fdt[639]; 
		assign dt640 = fdt[640]; assign dt641 = fdt[641]; assign dt642 = fdt[642]; assign dt643 = fdt[643]; 
		assign dt644 = fdt[644]; assign dt645 = fdt[645]; assign dt646 = fdt[646]; assign dt647 = fdt[647]; 
		assign dt648 = fdt[648]; assign dt649 = fdt[649]; assign dt650 = fdt[650]; assign dt651 = fdt[651]; 
		assign dt652 = fdt[652]; assign dt653 = fdt[653]; assign dt654 = fdt[654]; assign dt655 = fdt[655]; 
		assign dt656 = fdt[656]; assign dt657 = fdt[657]; assign dt658 = fdt[658]; assign dt659 = fdt[659]; 
		assign dt660 = fdt[660]; assign dt661 = fdt[661]; assign dt662 = fdt[662]; assign dt663 = fdt[663]; 
		assign dt664 = fdt[664]; assign dt665 = fdt[665]; assign dt666 = fdt[666]; assign dt667 = fdt[667]; 
		assign dt668 = fdt[668]; assign dt669 = fdt[669]; assign dt670 = fdt[670]; assign dt671 = fdt[671]; 
		assign dt672 = fdt[672]; assign dt673 = fdt[673]; assign dt674 = fdt[674]; assign dt675 = fdt[675]; 
		assign dt676 = fdt[676]; assign dt677 = fdt[677]; assign dt678 = fdt[678]; assign dt679 = fdt[679]; 
		assign dt680 = fdt[680]; assign dt681 = fdt[681]; assign dt682 = fdt[682]; assign dt683 = fdt[683]; 
		assign dt684 = fdt[684]; assign dt685 = fdt[685]; assign dt686 = fdt[686]; assign dt687 = fdt[687]; 
		assign dt688 = fdt[688]; assign dt689 = fdt[689]; assign dt690 = fdt[690]; assign dt691 = fdt[691]; 
		assign dt692 = fdt[692]; assign dt693 = fdt[693]; assign dt694 = fdt[694]; assign dt695 = fdt[695]; 
		assign dt696 = fdt[696]; assign dt697 = fdt[697]; assign dt698 = fdt[698]; assign dt699 = fdt[699]; 
		assign dt700 = fdt[700]; assign dt701 = fdt[701]; assign dt702 = fdt[702]; assign dt703 = fdt[703]; 
		assign dt704 = fdt[704]; assign dt705 = fdt[705]; assign dt706 = fdt[706]; assign dt707 = fdt[707]; 
		assign dt708 = fdt[708]; assign dt709 = fdt[709]; assign dt710 = fdt[710]; assign dt711 = fdt[711]; 
		assign dt712 = fdt[712]; assign dt713 = fdt[713]; assign dt714 = fdt[714]; assign dt715 = fdt[715]; 
		assign dt716 = fdt[716]; assign dt717 = fdt[717]; assign dt718 = fdt[718]; assign dt719 = fdt[719]; 
		assign dt720 = fdt[720]; assign dt721 = fdt[721]; assign dt722 = fdt[722]; assign dt723 = fdt[723]; 
		assign dt724 = fdt[724]; assign dt725 = fdt[725]; assign dt726 = fdt[726]; assign dt727 = fdt[727]; 
		assign dt728 = fdt[728]; assign dt729 = fdt[729]; assign dt730 = fdt[730]; assign dt731 = fdt[731]; 
		assign dt732 = fdt[732]; assign dt733 = fdt[733]; assign dt734 = fdt[734]; assign dt735 = fdt[735]; 
		assign dt736 = fdt[736]; assign dt737 = fdt[737]; assign dt738 = fdt[738]; assign dt739 = fdt[739]; 
		assign dt740 = fdt[740]; assign dt741 = fdt[741]; assign dt742 = fdt[742]; assign dt743 = fdt[743]; 
		assign dt744 = fdt[744]; assign dt745 = fdt[745]; assign dt746 = fdt[746]; assign dt747 = fdt[747]; 
		assign dt748 = fdt[748]; assign dt749 = fdt[749]; assign dt750 = fdt[750]; assign dt751 = fdt[751]; 
		assign dt752 = fdt[752]; assign dt753 = fdt[753]; assign dt754 = fdt[754]; assign dt755 = fdt[755]; 
		assign dt756 = fdt[756]; assign dt757 = fdt[757]; assign dt758 = fdt[758]; assign dt759 = fdt[759]; 
		assign dt760 = fdt[760]; assign dt761 = fdt[761]; assign dt762 = fdt[762]; assign dt763 = fdt[763]; 
		assign dt764 = fdt[764]; assign dt765 = fdt[765]; assign dt766 = fdt[766]; assign dt767 = fdt[767]; 
		assign dt768 = fdt[768]; assign dt769 = fdt[769]; assign dt770 = fdt[770]; assign dt771 = fdt[771]; 
		assign dt772 = fdt[772]; assign dt773 = fdt[773]; assign dt774 = fdt[774]; assign dt775 = fdt[775]; 
		assign dt776 = fdt[776]; assign dt777 = fdt[777]; assign dt778 = fdt[778]; assign dt779 = fdt[779]; 
		assign dt780 = fdt[780]; assign dt781 = fdt[781]; assign dt782 = fdt[782]; assign dt783 = fdt[783]; 
		assign dt784 = fdt[784]; assign dt785 = fdt[785]; assign dt786 = fdt[786]; assign dt787 = fdt[787]; 
		assign dt788 = fdt[788]; assign dt789 = fdt[789]; assign dt790 = fdt[790]; assign dt791 = fdt[791]; 
		assign dt792 = fdt[792]; assign dt793 = fdt[793]; assign dt794 = fdt[794]; assign dt795 = fdt[795]; 
		assign dt796 = fdt[796]; assign dt797 = fdt[797]; assign dt798 = fdt[798]; assign dt799 = fdt[799]; 
		assign dt800 = fdt[800]; assign dt801 = fdt[801]; assign dt802 = fdt[802]; assign dt803 = fdt[803]; 
		assign dt804 = fdt[804]; assign dt805 = fdt[805]; assign dt806 = fdt[806]; assign dt807 = fdt[807]; 
		assign dt808 = fdt[808]; assign dt809 = fdt[809]; assign dt810 = fdt[810]; assign dt811 = fdt[811]; 
		assign dt812 = fdt[812]; assign dt813 = fdt[813]; assign dt814 = fdt[814]; assign dt815 = fdt[815]; 
		assign dt816 = fdt[816]; assign dt817 = fdt[817]; assign dt818 = fdt[818]; assign dt819 = fdt[819]; 
		assign dt820 = fdt[820]; assign dt821 = fdt[821]; assign dt822 = fdt[822]; assign dt823 = fdt[823]; 
		assign dt824 = fdt[824]; assign dt825 = fdt[825]; assign dt826 = fdt[826]; assign dt827 = fdt[827]; 
		assign dt828 = fdt[828]; assign dt829 = fdt[829]; assign dt830 = fdt[830]; assign dt831 = fdt[831]; 
		assign dt832 = fdt[832]; assign dt833 = fdt[833]; assign dt834 = fdt[834]; assign dt835 = fdt[835]; 
		assign dt836 = fdt[836]; assign dt837 = fdt[837]; assign dt838 = fdt[838]; assign dt839 = fdt[839]; 
		assign dt840 = fdt[840]; assign dt841 = fdt[841]; assign dt842 = fdt[842]; assign dt843 = fdt[843]; 
		assign dt844 = fdt[844]; assign dt845 = fdt[845]; assign dt846 = fdt[846]; assign dt847 = fdt[847]; 
		assign dt848 = fdt[848]; assign dt849 = fdt[849]; assign dt850 = fdt[850]; assign dt851 = fdt[851]; 
		assign dt852 = fdt[852]; assign dt853 = fdt[853]; assign dt854 = fdt[854]; assign dt855 = fdt[855]; 
		assign dt856 = fdt[856]; assign dt857 = fdt[857]; assign dt858 = fdt[858]; assign dt859 = fdt[859]; 
		assign dt860 = fdt[860]; assign dt861 = fdt[861]; assign dt862 = fdt[862]; assign dt863 = fdt[863]; 
		assign dt864 = fdt[864]; assign dt865 = fdt[865]; assign dt866 = fdt[866]; assign dt867 = fdt[867]; 
		assign dt868 = fdt[868]; assign dt869 = fdt[869]; assign dt870 = fdt[870]; assign dt871 = fdt[871]; 
		assign dt872 = fdt[872]; assign dt873 = fdt[873]; assign dt874 = fdt[874]; assign dt875 = fdt[875]; 
		assign dt876 = fdt[876]; assign dt877 = fdt[877]; assign dt878 = fdt[878]; assign dt879 = fdt[879]; 
		assign dt880 = fdt[880]; assign dt881 = fdt[881]; assign dt882 = fdt[882]; assign dt883 = fdt[883]; 
		assign dt884 = fdt[884]; assign dt885 = fdt[885]; assign dt886 = fdt[886]; assign dt887 = fdt[887]; 
		assign dt888 = fdt[888]; assign dt889 = fdt[889]; assign dt890 = fdt[890]; assign dt891 = fdt[891]; 
		assign dt892 = fdt[892]; assign dt893 = fdt[893]; assign dt894 = fdt[894]; assign dt895 = fdt[895]; 
		assign dt896 = fdt[896]; assign dt897 = fdt[897]; assign dt898 = fdt[898]; assign dt899 = fdt[899]; 
		assign dt900 = fdt[900]; assign dt901 = fdt[901]; assign dt902 = fdt[902]; assign dt903 = fdt[903]; 
		assign dt904 = fdt[904]; assign dt905 = fdt[905]; assign dt906 = fdt[906]; assign dt907 = fdt[907]; 
		assign dt908 = fdt[908]; assign dt909 = fdt[909]; assign dt910 = fdt[910]; assign dt911 = fdt[911]; 
		assign dt912 = fdt[912]; assign dt913 = fdt[913]; assign dt914 = fdt[914]; assign dt915 = fdt[915]; 
		assign dt916 = fdt[916]; assign dt917 = fdt[917]; assign dt918 = fdt[918]; assign dt919 = fdt[919]; 
		assign dt920 = fdt[920]; assign dt921 = fdt[921]; assign dt922 = fdt[922]; assign dt923 = fdt[923]; 
		assign dt924 = fdt[924]; assign dt925 = fdt[925]; assign dt926 = fdt[926]; assign dt927 = fdt[927]; 
		assign dt928 = fdt[928]; assign dt929 = fdt[929]; assign dt930 = fdt[930]; assign dt931 = fdt[931]; 
		assign dt932 = fdt[932]; assign dt933 = fdt[933]; assign dt934 = fdt[934]; assign dt935 = fdt[935]; 
		assign dt936 = fdt[936]; assign dt937 = fdt[937]; assign dt938 = fdt[938]; assign dt939 = fdt[939]; 
		assign dt940 = fdt[940]; assign dt941 = fdt[941]; assign dt942 = fdt[942]; assign dt943 = fdt[943]; 
		assign dt944 = fdt[944]; assign dt945 = fdt[945]; assign dt946 = fdt[946]; assign dt947 = fdt[947]; 
		assign dt948 = fdt[948]; assign dt949 = fdt[949]; assign dt950 = fdt[950]; assign dt951 = fdt[951]; 
		assign dt952 = fdt[952]; assign dt953 = fdt[953]; assign dt954 = fdt[954]; assign dt955 = fdt[955]; 
		assign dt956 = fdt[956]; assign dt957 = fdt[957]; assign dt958 = fdt[958]; assign dt959 = fdt[959]; 
		assign dt960 = fdt[960]; assign dt961 = fdt[961]; assign dt962 = fdt[962]; assign dt963 = fdt[963]; 
		assign dt964 = fdt[964]; assign dt965 = fdt[965]; assign dt966 = fdt[966]; assign dt967 = fdt[967]; 
		assign dt968 = fdt[968]; assign dt969 = fdt[969]; assign dt970 = fdt[970]; assign dt971 = fdt[971]; 
		assign dt972 = fdt[972]; assign dt973 = fdt[973]; assign dt974 = fdt[974]; assign dt975 = fdt[975]; 
		assign dt976 = fdt[976]; assign dt977 = fdt[977]; assign dt978 = fdt[978]; assign dt979 = fdt[979]; 
		assign dt980 = fdt[980]; assign dt981 = fdt[981]; assign dt982 = fdt[982]; assign dt983 = fdt[983]; 
		assign dt984 = fdt[984]; assign dt985 = fdt[985]; assign dt986 = fdt[986]; assign dt987 = fdt[987]; 
		assign dt988 = fdt[988]; assign dt989 = fdt[989]; assign dt990 = fdt[990]; assign dt991 = fdt[991]; 
		assign dt992 = fdt[992]; assign dt993 = fdt[993]; assign dt994 = fdt[994]; assign dt995 = fdt[995]; 
		assign dt996 = fdt[996]; assign dt997 = fdt[997]; assign dt998 = fdt[998]; assign dt999 = fdt[999]; 
		assign dt1000 = fdt[1000]; assign dt1001 = fdt[1001]; assign dt1002 = fdt[1002]; assign dt1003 = fdt[1003]; 
		assign dt1004 = fdt[1004]; assign dt1005 = fdt[1005]; assign dt1006 = fdt[1006]; assign dt1007 = fdt[1007]; 
		assign dt1008 = fdt[1008]; assign dt1009 = fdt[1009]; assign dt1010 = fdt[1010]; assign dt1011 = fdt[1011]; 
		assign dt1012 = fdt[1012]; assign dt1013 = fdt[1013]; assign dt1014 = fdt[1014]; assign dt1015 = fdt[1015]; 
		assign dt1016 = fdt[1016]; assign dt1017 = fdt[1017]; assign dt1018 = fdt[1018]; assign dt1019 = fdt[1019]; 
		assign dt1020 = fdt[1020]; assign dt1021 = fdt[1021]; assign dt1022 = fdt[1022]; assign dt1023 = fdt[1023];

// synopsys translate_on
endmodule

//==========================================================================
//
//
//==========================================================================
module vcWriteFile
#(
	parameter filename 	= "output.txt",			// output dt text file
	parameter size		= 8,					// number of dt per line of input file
	parameter hwidth     	= 12					// dt hwidth
)
(
	input 							clk, rst, stall,

	input signed [hwidth-1:0] 	dt0, dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12, dt13, dt14, dt15, 
									dt16, dt17, dt18, dt19, dt20, dt21, dt22, dt23, dt24, dt25, dt26, dt27, dt28, dt29, dt30, dt31, 
									dt32, dt33, dt34, dt35, dt36, dt37, dt38, dt39, dt40, dt41, dt42, dt43, dt44, dt45, dt46, dt47, 
									dt48, dt49, dt50, dt51, dt52, dt53, dt54, dt55, dt56, dt57, dt58, dt59, dt60, dt61, dt62, dt63, 
									dt64, dt65, dt66, dt67, dt68, dt69, dt70, dt71, dt72, dt73, dt74, dt75, dt76, dt77, dt78, dt79, 
									dt80, dt81, dt82, dt83, dt84, dt85, dt86, dt87, dt88, dt89, dt90, dt91, dt92, dt93, dt94, dt95, 
									dt96, dt97, dt98, dt99, dt100, dt101, dt102, dt103, dt104, dt105, dt106, dt107, dt108, dt109, dt110, dt111, 
									dt112, dt113, dt114, dt115, dt116, dt117, dt118, dt119, dt120, dt121, dt122, dt123, dt124, dt125, dt126, dt127, 
									dt128, dt129, dt130, dt131, dt132, dt133, dt134, dt135, dt136, dt137, dt138, dt139, dt140, dt141, dt142, dt143, 
									dt144, dt145, dt146, dt147, dt148, dt149, dt150, dt151, dt152, dt153, dt154, dt155, dt156, dt157, dt158, dt159, 
									dt160, dt161, dt162, dt163, dt164, dt165, dt166, dt167, dt168, dt169, dt170, dt171, dt172, dt173, dt174, dt175, 
									dt176, dt177, dt178, dt179, dt180, dt181, dt182, dt183, dt184, dt185, dt186, dt187, dt188, dt189, dt190, dt191, 
									dt192, dt193, dt194, dt195, dt196, dt197, dt198, dt199, dt200, dt201, dt202, dt203, dt204, dt205, dt206, dt207, 
									dt208, dt209, dt210, dt211, dt212, dt213, dt214, dt215, dt216, dt217, dt218, dt219, dt220, dt221, dt222, dt223, 
									dt224, dt225, dt226, dt227, dt228, dt229, dt230, dt231, dt232, dt233, dt234, dt235, dt236, dt237, dt238, dt239, 
									dt240, dt241, dt242, dt243, dt244, dt245, dt246, dt247, dt248, dt249, dt250, dt251, dt252, dt253, dt254, dt255, 
									dt256, dt257, dt258, dt259, dt260, dt261, dt262, dt263, dt264, dt265, dt266, dt267, dt268, dt269, dt270, dt271, 
									dt272, dt273, dt274, dt275, dt276, dt277, dt278, dt279, dt280, dt281, dt282, dt283, dt284, dt285, dt286, dt287, 
									dt288, dt289, dt290, dt291, dt292, dt293, dt294, dt295, dt296, dt297, dt298, dt299, dt300, dt301, dt302, dt303, 
									dt304, dt305, dt306, dt307, dt308, dt309, dt310, dt311, dt312, dt313, dt314, dt315, dt316, dt317, dt318, dt319, 
									dt320, dt321, dt322, dt323, dt324, dt325, dt326, dt327, dt328, dt329, dt330, dt331, dt332, dt333, dt334, dt335, 
									dt336, dt337, dt338, dt339, dt340, dt341, dt342, dt343, dt344, dt345, dt346, dt347, dt348, dt349, dt350, dt351, 
									dt352, dt353, dt354, dt355, dt356, dt357, dt358, dt359, dt360, dt361, dt362, dt363, dt364, dt365, dt366, dt367, 
									dt368, dt369, dt370, dt371, dt372, dt373, dt374, dt375, dt376, dt377, dt378, dt379, dt380, dt381, dt382, dt383, 
									dt384, dt385, dt386, dt387, dt388, dt389, dt390, dt391, dt392, dt393, dt394, dt395, dt396, dt397, dt398, dt399, 
									dt400, dt401, dt402, dt403, dt404, dt405, dt406, dt407, dt408, dt409, dt410, dt411, dt412, dt413, dt414, dt415, 
									dt416, dt417, dt418, dt419, dt420, dt421, dt422, dt423, dt424, dt425, dt426, dt427, dt428, dt429, dt430, dt431, 
									dt432, dt433, dt434, dt435, dt436, dt437, dt438, dt439, dt440, dt441, dt442, dt443, dt444, dt445, dt446, dt447, 
									dt448, dt449, dt450, dt451, dt452, dt453, dt454, dt455, dt456, dt457, dt458, dt459, dt460, dt461, dt462, dt463, 
									dt464, dt465, dt466, dt467, dt468, dt469, dt470, dt471, dt472, dt473, dt474, dt475, dt476, dt477, dt478, dt479, 
									dt480, dt481, dt482, dt483, dt484, dt485, dt486, dt487, dt488, dt489, dt490, dt491, dt492, dt493, dt494, dt495, 
									dt496, dt497, dt498, dt499, dt500, dt501, dt502, dt503, dt504, dt505, dt506, dt507, dt508, dt509, dt510, dt511, 
									dt512, dt513, dt514, dt515, dt516, dt517, dt518, dt519, dt520, dt521, dt522, dt523, dt524, dt525, dt526, dt527, 
									dt528, dt529, dt530, dt531, dt532, dt533, dt534, dt535, dt536, dt537, dt538, dt539, dt540, dt541, dt542, dt543, 
									dt544, dt545, dt546, dt547, dt548, dt549, dt550, dt551, dt552, dt553, dt554, dt555, dt556, dt557, dt558, dt559, 
									dt560, dt561, dt562, dt563, dt564, dt565, dt566, dt567, dt568, dt569, dt570, dt571, dt572, dt573, dt574, dt575, 
									dt576, dt577, dt578, dt579, dt580, dt581, dt582, dt583, dt584, dt585, dt586, dt587, dt588, dt589, dt590, dt591, 
									dt592, dt593, dt594, dt595, dt596, dt597, dt598, dt599, dt600, dt601, dt602, dt603, dt604, dt605, dt606, dt607, 
									dt608, dt609, dt610, dt611, dt612, dt613, dt614, dt615, dt616, dt617, dt618, dt619, dt620, dt621, dt622, dt623, 
									dt624, dt625, dt626, dt627, dt628, dt629, dt630, dt631, dt632, dt633, dt634, dt635, dt636, dt637, dt638, dt639, 
									dt640, dt641, dt642, dt643, dt644, dt645, dt646, dt647, dt648, dt649, dt650, dt651, dt652, dt653, dt654, dt655, 
									dt656, dt657, dt658, dt659, dt660, dt661, dt662, dt663, dt664, dt665, dt666, dt667, dt668, dt669, dt670, dt671, 
									dt672, dt673, dt674, dt675, dt676, dt677, dt678, dt679, dt680, dt681, dt682, dt683, dt684, dt685, dt686, dt687, 
									dt688, dt689, dt690, dt691, dt692, dt693, dt694, dt695, dt696, dt697, dt698, dt699, dt700, dt701, dt702, dt703, 
									dt704, dt705, dt706, dt707, dt708, dt709, dt710, dt711, dt712, dt713, dt714, dt715, dt716, dt717, dt718, dt719, 
									dt720, dt721, dt722, dt723, dt724, dt725, dt726, dt727, dt728, dt729, dt730, dt731, dt732, dt733, dt734, dt735, 
									dt736, dt737, dt738, dt739, dt740, dt741, dt742, dt743, dt744, dt745, dt746, dt747, dt748, dt749, dt750, dt751, 
									dt752, dt753, dt754, dt755, dt756, dt757, dt758, dt759, dt760, dt761, dt762, dt763, dt764, dt765, dt766, dt767, 
									dt768, dt769, dt770, dt771, dt772, dt773, dt774, dt775, dt776, dt777, dt778, dt779, dt780, dt781, dt782, dt783, 
									dt784, dt785, dt786, dt787, dt788, dt789, dt790, dt791, dt792, dt793, dt794, dt795, dt796, dt797, dt798, dt799, 
									dt800, dt801, dt802, dt803, dt804, dt805, dt806, dt807, dt808, dt809, dt810, dt811, dt812, dt813, dt814, dt815, 
									dt816, dt817, dt818, dt819, dt820, dt821, dt822, dt823, dt824, dt825, dt826, dt827, dt828, dt829, dt830, dt831, 
									dt832, dt833, dt834, dt835, dt836, dt837, dt838, dt839, dt840, dt841, dt842, dt843, dt844, dt845, dt846, dt847, 
									dt848, dt849, dt850, dt851, dt852, dt853, dt854, dt855, dt856, dt857, dt858, dt859, dt860, dt861, dt862, dt863, 
									dt864, dt865, dt866, dt867, dt868, dt869, dt870, dt871, dt872, dt873, dt874, dt875, dt876, dt877, dt878, dt879, 
									dt880, dt881, dt882, dt883, dt884, dt885, dt886, dt887, dt888, dt889, dt890, dt891, dt892, dt893, dt894, dt895, 
									dt896, dt897, dt898, dt899, dt900, dt901, dt902, dt903, dt904, dt905, dt906, dt907, dt908, dt909, dt910, dt911, 
									dt912, dt913, dt914, dt915, dt916, dt917, dt918, dt919, dt920, dt921, dt922, dt923, dt924, dt925, dt926, dt927, 
									dt928, dt929, dt930, dt931, dt932, dt933, dt934, dt935, dt936, dt937, dt938, dt939, dt940, dt941, dt942, dt943, 
									dt944, dt945, dt946, dt947, dt948, dt949, dt950, dt951, dt952, dt953, dt954, dt955, dt956, dt957, dt958, dt959, 
									dt960, dt961, dt962, dt963, dt964, dt965, dt966, dt967, dt968, dt969, dt970, dt971, dt972, dt973, dt974, dt975, 
									dt976, dt977, dt978, dt979, dt980, dt981, dt982, dt983, dt984, dt985, dt986, dt987, dt988, dt989, dt990, dt991, 
									dt992, dt993, dt994, dt995, dt996, dt997, dt998, dt999, dt1000, dt1001, dt1002, dt1003, dt1004, dt1005, dt1006, dt1007, 
									dt1008, dt1009, dt1010, dt1011, dt1012, dt1013, dt1014, dt1015, dt1016, dt1017, dt1018, dt1019, dt1020, dt1021, dt1022, dt1023
);

	integer               					fOutput   ; // file handler
	integer 							line_cnt, i;
	wire signed	 [hwidth-1:0] 		fdt[1024:0];

// synopsys translate_off
	initial begin : parameter_check
		fOutput = $fopen(filename, "w");
		if (fOutput == 0) begin
		    $display ("ERROR --- WriteData handle was NULL");
		    $finish;
		end
		$fwrite(fOutput, "//INFOR -- Output data of %d-bit, %d-FFT\n", hwidth, size/2);
		$fwrite(fOutput, "//INFOR -- Sample   Input Data\n");
	end

	// assign input
		assign fdt[0] = dt0; assign fdt[1] = dt1; assign fdt[2] = dt2; assign fdt[3] = dt3; 
		assign fdt[4] = dt4; assign fdt[5] = dt5; assign fdt[6] = dt6; assign fdt[7] = dt7; 
		assign fdt[8] = dt8; assign fdt[9] = dt9; assign fdt[10] = dt10; assign fdt[11] = dt11; 
		assign fdt[12] = dt12; assign fdt[13] = dt13; assign fdt[14] = dt14; assign fdt[15] = dt15; 
		assign fdt[16] = dt16; assign fdt[17] = dt17; assign fdt[18] = dt18; assign fdt[19] = dt19; 
		assign fdt[20] = dt20; assign fdt[21] = dt21; assign fdt[22] = dt22; assign fdt[23] = dt23; 
		assign fdt[24] = dt24; assign fdt[25] = dt25; assign fdt[26] = dt26; assign fdt[27] = dt27; 
		assign fdt[28] = dt28; assign fdt[29] = dt29; assign fdt[30] = dt30; assign fdt[31] = dt31; 
		assign fdt[32] = dt32; assign fdt[33] = dt33; assign fdt[34] = dt34; assign fdt[35] = dt35; 
		assign fdt[36] = dt36; assign fdt[37] = dt37; assign fdt[38] = dt38; assign fdt[39] = dt39; 
		assign fdt[40] = dt40; assign fdt[41] = dt41; assign fdt[42] = dt42; assign fdt[43] = dt43; 
		assign fdt[44] = dt44; assign fdt[45] = dt45; assign fdt[46] = dt46; assign fdt[47] = dt47; 
		assign fdt[48] = dt48; assign fdt[49] = dt49; assign fdt[50] = dt50; assign fdt[51] = dt51; 
		assign fdt[52] = dt52; assign fdt[53] = dt53; assign fdt[54] = dt54; assign fdt[55] = dt55; 
		assign fdt[56] = dt56; assign fdt[57] = dt57; assign fdt[58] = dt58; assign fdt[59] = dt59; 
		assign fdt[60] = dt60; assign fdt[61] = dt61; assign fdt[62] = dt62; assign fdt[63] = dt63; 
		assign fdt[64] = dt64; assign fdt[65] = dt65; assign fdt[66] = dt66; assign fdt[67] = dt67; 
		assign fdt[68] = dt68; assign fdt[69] = dt69; assign fdt[70] = dt70; assign fdt[71] = dt71; 
		assign fdt[72] = dt72; assign fdt[73] = dt73; assign fdt[74] = dt74; assign fdt[75] = dt75; 
		assign fdt[76] = dt76; assign fdt[77] = dt77; assign fdt[78] = dt78; assign fdt[79] = dt79; 
		assign fdt[80] = dt80; assign fdt[81] = dt81; assign fdt[82] = dt82; assign fdt[83] = dt83; 
		assign fdt[84] = dt84; assign fdt[85] = dt85; assign fdt[86] = dt86; assign fdt[87] = dt87; 
		assign fdt[88] = dt88; assign fdt[89] = dt89; assign fdt[90] = dt90; assign fdt[91] = dt91; 
		assign fdt[92] = dt92; assign fdt[93] = dt93; assign fdt[94] = dt94; assign fdt[95] = dt95; 
		assign fdt[96] = dt96; assign fdt[97] = dt97; assign fdt[98] = dt98; assign fdt[99] = dt99; 
		assign fdt[100] = dt100; assign fdt[101] = dt101; assign fdt[102] = dt102; assign fdt[103] = dt103; 
		assign fdt[104] = dt104; assign fdt[105] = dt105; assign fdt[106] = dt106; assign fdt[107] = dt107; 
		assign fdt[108] = dt108; assign fdt[109] = dt109; assign fdt[110] = dt110; assign fdt[111] = dt111; 
		assign fdt[112] = dt112; assign fdt[113] = dt113; assign fdt[114] = dt114; assign fdt[115] = dt115; 
		assign fdt[116] = dt116; assign fdt[117] = dt117; assign fdt[118] = dt118; assign fdt[119] = dt119; 
		assign fdt[120] = dt120; assign fdt[121] = dt121; assign fdt[122] = dt122; assign fdt[123] = dt123; 
		assign fdt[124] = dt124; assign fdt[125] = dt125; assign fdt[126] = dt126; assign fdt[127] = dt127; 
		assign fdt[128] = dt128; assign fdt[129] = dt129; assign fdt[130] = dt130; assign fdt[131] = dt131; 
		assign fdt[132] = dt132; assign fdt[133] = dt133; assign fdt[134] = dt134; assign fdt[135] = dt135; 
		assign fdt[136] = dt136; assign fdt[137] = dt137; assign fdt[138] = dt138; assign fdt[139] = dt139; 
		assign fdt[140] = dt140; assign fdt[141] = dt141; assign fdt[142] = dt142; assign fdt[143] = dt143; 
		assign fdt[144] = dt144; assign fdt[145] = dt145; assign fdt[146] = dt146; assign fdt[147] = dt147; 
		assign fdt[148] = dt148; assign fdt[149] = dt149; assign fdt[150] = dt150; assign fdt[151] = dt151; 
		assign fdt[152] = dt152; assign fdt[153] = dt153; assign fdt[154] = dt154; assign fdt[155] = dt155; 
		assign fdt[156] = dt156; assign fdt[157] = dt157; assign fdt[158] = dt158; assign fdt[159] = dt159; 
		assign fdt[160] = dt160; assign fdt[161] = dt161; assign fdt[162] = dt162; assign fdt[163] = dt163; 
		assign fdt[164] = dt164; assign fdt[165] = dt165; assign fdt[166] = dt166; assign fdt[167] = dt167; 
		assign fdt[168] = dt168; assign fdt[169] = dt169; assign fdt[170] = dt170; assign fdt[171] = dt171; 
		assign fdt[172] = dt172; assign fdt[173] = dt173; assign fdt[174] = dt174; assign fdt[175] = dt175; 
		assign fdt[176] = dt176; assign fdt[177] = dt177; assign fdt[178] = dt178; assign fdt[179] = dt179; 
		assign fdt[180] = dt180; assign fdt[181] = dt181; assign fdt[182] = dt182; assign fdt[183] = dt183; 
		assign fdt[184] = dt184; assign fdt[185] = dt185; assign fdt[186] = dt186; assign fdt[187] = dt187; 
		assign fdt[188] = dt188; assign fdt[189] = dt189; assign fdt[190] = dt190; assign fdt[191] = dt191; 
		assign fdt[192] = dt192; assign fdt[193] = dt193; assign fdt[194] = dt194; assign fdt[195] = dt195; 
		assign fdt[196] = dt196; assign fdt[197] = dt197; assign fdt[198] = dt198; assign fdt[199] = dt199; 
		assign fdt[200] = dt200; assign fdt[201] = dt201; assign fdt[202] = dt202; assign fdt[203] = dt203; 
		assign fdt[204] = dt204; assign fdt[205] = dt205; assign fdt[206] = dt206; assign fdt[207] = dt207; 
		assign fdt[208] = dt208; assign fdt[209] = dt209; assign fdt[210] = dt210; assign fdt[211] = dt211; 
		assign fdt[212] = dt212; assign fdt[213] = dt213; assign fdt[214] = dt214; assign fdt[215] = dt215; 
		assign fdt[216] = dt216; assign fdt[217] = dt217; assign fdt[218] = dt218; assign fdt[219] = dt219; 
		assign fdt[220] = dt220; assign fdt[221] = dt221; assign fdt[222] = dt222; assign fdt[223] = dt223; 
		assign fdt[224] = dt224; assign fdt[225] = dt225; assign fdt[226] = dt226; assign fdt[227] = dt227; 
		assign fdt[228] = dt228; assign fdt[229] = dt229; assign fdt[230] = dt230; assign fdt[231] = dt231; 
		assign fdt[232] = dt232; assign fdt[233] = dt233; assign fdt[234] = dt234; assign fdt[235] = dt235; 
		assign fdt[236] = dt236; assign fdt[237] = dt237; assign fdt[238] = dt238; assign fdt[239] = dt239; 
		assign fdt[240] = dt240; assign fdt[241] = dt241; assign fdt[242] = dt242; assign fdt[243] = dt243; 
		assign fdt[244] = dt244; assign fdt[245] = dt245; assign fdt[246] = dt246; assign fdt[247] = dt247; 
		assign fdt[248] = dt248; assign fdt[249] = dt249; assign fdt[250] = dt250; assign fdt[251] = dt251; 
		assign fdt[252] = dt252; assign fdt[253] = dt253; assign fdt[254] = dt254; assign fdt[255] = dt255; 
		assign fdt[256] = dt256; assign fdt[257] = dt257; assign fdt[258] = dt258; assign fdt[259] = dt259; 
		assign fdt[260] = dt260; assign fdt[261] = dt261; assign fdt[262] = dt262; assign fdt[263] = dt263; 
		assign fdt[264] = dt264; assign fdt[265] = dt265; assign fdt[266] = dt266; assign fdt[267] = dt267; 
		assign fdt[268] = dt268; assign fdt[269] = dt269; assign fdt[270] = dt270; assign fdt[271] = dt271; 
		assign fdt[272] = dt272; assign fdt[273] = dt273; assign fdt[274] = dt274; assign fdt[275] = dt275; 
		assign fdt[276] = dt276; assign fdt[277] = dt277; assign fdt[278] = dt278; assign fdt[279] = dt279; 
		assign fdt[280] = dt280; assign fdt[281] = dt281; assign fdt[282] = dt282; assign fdt[283] = dt283; 
		assign fdt[284] = dt284; assign fdt[285] = dt285; assign fdt[286] = dt286; assign fdt[287] = dt287; 
		assign fdt[288] = dt288; assign fdt[289] = dt289; assign fdt[290] = dt290; assign fdt[291] = dt291; 
		assign fdt[292] = dt292; assign fdt[293] = dt293; assign fdt[294] = dt294; assign fdt[295] = dt295; 
		assign fdt[296] = dt296; assign fdt[297] = dt297; assign fdt[298] = dt298; assign fdt[299] = dt299; 
		assign fdt[300] = dt300; assign fdt[301] = dt301; assign fdt[302] = dt302; assign fdt[303] = dt303; 
		assign fdt[304] = dt304; assign fdt[305] = dt305; assign fdt[306] = dt306; assign fdt[307] = dt307; 
		assign fdt[308] = dt308; assign fdt[309] = dt309; assign fdt[310] = dt310; assign fdt[311] = dt311; 
		assign fdt[312] = dt312; assign fdt[313] = dt313; assign fdt[314] = dt314; assign fdt[315] = dt315; 
		assign fdt[316] = dt316; assign fdt[317] = dt317; assign fdt[318] = dt318; assign fdt[319] = dt319; 
		assign fdt[320] = dt320; assign fdt[321] = dt321; assign fdt[322] = dt322; assign fdt[323] = dt323; 
		assign fdt[324] = dt324; assign fdt[325] = dt325; assign fdt[326] = dt326; assign fdt[327] = dt327; 
		assign fdt[328] = dt328; assign fdt[329] = dt329; assign fdt[330] = dt330; assign fdt[331] = dt331; 
		assign fdt[332] = dt332; assign fdt[333] = dt333; assign fdt[334] = dt334; assign fdt[335] = dt335; 
		assign fdt[336] = dt336; assign fdt[337] = dt337; assign fdt[338] = dt338; assign fdt[339] = dt339; 
		assign fdt[340] = dt340; assign fdt[341] = dt341; assign fdt[342] = dt342; assign fdt[343] = dt343; 
		assign fdt[344] = dt344; assign fdt[345] = dt345; assign fdt[346] = dt346; assign fdt[347] = dt347; 
		assign fdt[348] = dt348; assign fdt[349] = dt349; assign fdt[350] = dt350; assign fdt[351] = dt351; 
		assign fdt[352] = dt352; assign fdt[353] = dt353; assign fdt[354] = dt354; assign fdt[355] = dt355; 
		assign fdt[356] = dt356; assign fdt[357] = dt357; assign fdt[358] = dt358; assign fdt[359] = dt359; 
		assign fdt[360] = dt360; assign fdt[361] = dt361; assign fdt[362] = dt362; assign fdt[363] = dt363; 
		assign fdt[364] = dt364; assign fdt[365] = dt365; assign fdt[366] = dt366; assign fdt[367] = dt367; 
		assign fdt[368] = dt368; assign fdt[369] = dt369; assign fdt[370] = dt370; assign fdt[371] = dt371; 
		assign fdt[372] = dt372; assign fdt[373] = dt373; assign fdt[374] = dt374; assign fdt[375] = dt375; 
		assign fdt[376] = dt376; assign fdt[377] = dt377; assign fdt[378] = dt378; assign fdt[379] = dt379; 
		assign fdt[380] = dt380; assign fdt[381] = dt381; assign fdt[382] = dt382; assign fdt[383] = dt383; 
		assign fdt[384] = dt384; assign fdt[385] = dt385; assign fdt[386] = dt386; assign fdt[387] = dt387; 
		assign fdt[388] = dt388; assign fdt[389] = dt389; assign fdt[390] = dt390; assign fdt[391] = dt391; 
		assign fdt[392] = dt392; assign fdt[393] = dt393; assign fdt[394] = dt394; assign fdt[395] = dt395; 
		assign fdt[396] = dt396; assign fdt[397] = dt397; assign fdt[398] = dt398; assign fdt[399] = dt399; 
		assign fdt[400] = dt400; assign fdt[401] = dt401; assign fdt[402] = dt402; assign fdt[403] = dt403; 
		assign fdt[404] = dt404; assign fdt[405] = dt405; assign fdt[406] = dt406; assign fdt[407] = dt407; 
		assign fdt[408] = dt408; assign fdt[409] = dt409; assign fdt[410] = dt410; assign fdt[411] = dt411; 
		assign fdt[412] = dt412; assign fdt[413] = dt413; assign fdt[414] = dt414; assign fdt[415] = dt415; 
		assign fdt[416] = dt416; assign fdt[417] = dt417; assign fdt[418] = dt418; assign fdt[419] = dt419; 
		assign fdt[420] = dt420; assign fdt[421] = dt421; assign fdt[422] = dt422; assign fdt[423] = dt423; 
		assign fdt[424] = dt424; assign fdt[425] = dt425; assign fdt[426] = dt426; assign fdt[427] = dt427; 
		assign fdt[428] = dt428; assign fdt[429] = dt429; assign fdt[430] = dt430; assign fdt[431] = dt431; 
		assign fdt[432] = dt432; assign fdt[433] = dt433; assign fdt[434] = dt434; assign fdt[435] = dt435; 
		assign fdt[436] = dt436; assign fdt[437] = dt437; assign fdt[438] = dt438; assign fdt[439] = dt439; 
		assign fdt[440] = dt440; assign fdt[441] = dt441; assign fdt[442] = dt442; assign fdt[443] = dt443; 
		assign fdt[444] = dt444; assign fdt[445] = dt445; assign fdt[446] = dt446; assign fdt[447] = dt447; 
		assign fdt[448] = dt448; assign fdt[449] = dt449; assign fdt[450] = dt450; assign fdt[451] = dt451; 
		assign fdt[452] = dt452; assign fdt[453] = dt453; assign fdt[454] = dt454; assign fdt[455] = dt455; 
		assign fdt[456] = dt456; assign fdt[457] = dt457; assign fdt[458] = dt458; assign fdt[459] = dt459; 
		assign fdt[460] = dt460; assign fdt[461] = dt461; assign fdt[462] = dt462; assign fdt[463] = dt463; 
		assign fdt[464] = dt464; assign fdt[465] = dt465; assign fdt[466] = dt466; assign fdt[467] = dt467; 
		assign fdt[468] = dt468; assign fdt[469] = dt469; assign fdt[470] = dt470; assign fdt[471] = dt471; 
		assign fdt[472] = dt472; assign fdt[473] = dt473; assign fdt[474] = dt474; assign fdt[475] = dt475; 
		assign fdt[476] = dt476; assign fdt[477] = dt477; assign fdt[478] = dt478; assign fdt[479] = dt479; 
		assign fdt[480] = dt480; assign fdt[481] = dt481; assign fdt[482] = dt482; assign fdt[483] = dt483; 
		assign fdt[484] = dt484; assign fdt[485] = dt485; assign fdt[486] = dt486; assign fdt[487] = dt487; 
		assign fdt[488] = dt488; assign fdt[489] = dt489; assign fdt[490] = dt490; assign fdt[491] = dt491; 
		assign fdt[492] = dt492; assign fdt[493] = dt493; assign fdt[494] = dt494; assign fdt[495] = dt495; 
		assign fdt[496] = dt496; assign fdt[497] = dt497; assign fdt[498] = dt498; assign fdt[499] = dt499; 
		assign fdt[500] = dt500; assign fdt[501] = dt501; assign fdt[502] = dt502; assign fdt[503] = dt503; 
		assign fdt[504] = dt504; assign fdt[505] = dt505; assign fdt[506] = dt506; assign fdt[507] = dt507; 
		assign fdt[508] = dt508; assign fdt[509] = dt509; assign fdt[510] = dt510; assign fdt[511] = dt511; 
		assign fdt[512] = dt512; assign fdt[513] = dt513; assign fdt[514] = dt514; assign fdt[515] = dt515; 
		assign fdt[516] = dt516; assign fdt[517] = dt517; assign fdt[518] = dt518; assign fdt[519] = dt519; 
		assign fdt[520] = dt520; assign fdt[521] = dt521; assign fdt[522] = dt522; assign fdt[523] = dt523; 
		assign fdt[524] = dt524; assign fdt[525] = dt525; assign fdt[526] = dt526; assign fdt[527] = dt527; 
		assign fdt[528] = dt528; assign fdt[529] = dt529; assign fdt[530] = dt530; assign fdt[531] = dt531; 
		assign fdt[532] = dt532; assign fdt[533] = dt533; assign fdt[534] = dt534; assign fdt[535] = dt535; 
		assign fdt[536] = dt536; assign fdt[537] = dt537; assign fdt[538] = dt538; assign fdt[539] = dt539; 
		assign fdt[540] = dt540; assign fdt[541] = dt541; assign fdt[542] = dt542; assign fdt[543] = dt543; 
		assign fdt[544] = dt544; assign fdt[545] = dt545; assign fdt[546] = dt546; assign fdt[547] = dt547; 
		assign fdt[548] = dt548; assign fdt[549] = dt549; assign fdt[550] = dt550; assign fdt[551] = dt551; 
		assign fdt[552] = dt552; assign fdt[553] = dt553; assign fdt[554] = dt554; assign fdt[555] = dt555; 
		assign fdt[556] = dt556; assign fdt[557] = dt557; assign fdt[558] = dt558; assign fdt[559] = dt559; 
		assign fdt[560] = dt560; assign fdt[561] = dt561; assign fdt[562] = dt562; assign fdt[563] = dt563; 
		assign fdt[564] = dt564; assign fdt[565] = dt565; assign fdt[566] = dt566; assign fdt[567] = dt567; 
		assign fdt[568] = dt568; assign fdt[569] = dt569; assign fdt[570] = dt570; assign fdt[571] = dt571; 
		assign fdt[572] = dt572; assign fdt[573] = dt573; assign fdt[574] = dt574; assign fdt[575] = dt575; 
		assign fdt[576] = dt576; assign fdt[577] = dt577; assign fdt[578] = dt578; assign fdt[579] = dt579; 
		assign fdt[580] = dt580; assign fdt[581] = dt581; assign fdt[582] = dt582; assign fdt[583] = dt583; 
		assign fdt[584] = dt584; assign fdt[585] = dt585; assign fdt[586] = dt586; assign fdt[587] = dt587; 
		assign fdt[588] = dt588; assign fdt[589] = dt589; assign fdt[590] = dt590; assign fdt[591] = dt591; 
		assign fdt[592] = dt592; assign fdt[593] = dt593; assign fdt[594] = dt594; assign fdt[595] = dt595; 
		assign fdt[596] = dt596; assign fdt[597] = dt597; assign fdt[598] = dt598; assign fdt[599] = dt599; 
		assign fdt[600] = dt600; assign fdt[601] = dt601; assign fdt[602] = dt602; assign fdt[603] = dt603; 
		assign fdt[604] = dt604; assign fdt[605] = dt605; assign fdt[606] = dt606; assign fdt[607] = dt607; 
		assign fdt[608] = dt608; assign fdt[609] = dt609; assign fdt[610] = dt610; assign fdt[611] = dt611; 
		assign fdt[612] = dt612; assign fdt[613] = dt613; assign fdt[614] = dt614; assign fdt[615] = dt615; 
		assign fdt[616] = dt616; assign fdt[617] = dt617; assign fdt[618] = dt618; assign fdt[619] = dt619; 
		assign fdt[620] = dt620; assign fdt[621] = dt621; assign fdt[622] = dt622; assign fdt[623] = dt623; 
		assign fdt[624] = dt624; assign fdt[625] = dt625; assign fdt[626] = dt626; assign fdt[627] = dt627; 
		assign fdt[628] = dt628; assign fdt[629] = dt629; assign fdt[630] = dt630; assign fdt[631] = dt631; 
		assign fdt[632] = dt632; assign fdt[633] = dt633; assign fdt[634] = dt634; assign fdt[635] = dt635; 
		assign fdt[636] = dt636; assign fdt[637] = dt637; assign fdt[638] = dt638; assign fdt[639] = dt639; 
		assign fdt[640] = dt640; assign fdt[641] = dt641; assign fdt[642] = dt642; assign fdt[643] = dt643; 
		assign fdt[644] = dt644; assign fdt[645] = dt645; assign fdt[646] = dt646; assign fdt[647] = dt647; 
		assign fdt[648] = dt648; assign fdt[649] = dt649; assign fdt[650] = dt650; assign fdt[651] = dt651; 
		assign fdt[652] = dt652; assign fdt[653] = dt653; assign fdt[654] = dt654; assign fdt[655] = dt655; 
		assign fdt[656] = dt656; assign fdt[657] = dt657; assign fdt[658] = dt658; assign fdt[659] = dt659; 
		assign fdt[660] = dt660; assign fdt[661] = dt661; assign fdt[662] = dt662; assign fdt[663] = dt663; 
		assign fdt[664] = dt664; assign fdt[665] = dt665; assign fdt[666] = dt666; assign fdt[667] = dt667; 
		assign fdt[668] = dt668; assign fdt[669] = dt669; assign fdt[670] = dt670; assign fdt[671] = dt671; 
		assign fdt[672] = dt672; assign fdt[673] = dt673; assign fdt[674] = dt674; assign fdt[675] = dt675; 
		assign fdt[676] = dt676; assign fdt[677] = dt677; assign fdt[678] = dt678; assign fdt[679] = dt679; 
		assign fdt[680] = dt680; assign fdt[681] = dt681; assign fdt[682] = dt682; assign fdt[683] = dt683; 
		assign fdt[684] = dt684; assign fdt[685] = dt685; assign fdt[686] = dt686; assign fdt[687] = dt687; 
		assign fdt[688] = dt688; assign fdt[689] = dt689; assign fdt[690] = dt690; assign fdt[691] = dt691; 
		assign fdt[692] = dt692; assign fdt[693] = dt693; assign fdt[694] = dt694; assign fdt[695] = dt695; 
		assign fdt[696] = dt696; assign fdt[697] = dt697; assign fdt[698] = dt698; assign fdt[699] = dt699; 
		assign fdt[700] = dt700; assign fdt[701] = dt701; assign fdt[702] = dt702; assign fdt[703] = dt703; 
		assign fdt[704] = dt704; assign fdt[705] = dt705; assign fdt[706] = dt706; assign fdt[707] = dt707; 
		assign fdt[708] = dt708; assign fdt[709] = dt709; assign fdt[710] = dt710; assign fdt[711] = dt711; 
		assign fdt[712] = dt712; assign fdt[713] = dt713; assign fdt[714] = dt714; assign fdt[715] = dt715; 
		assign fdt[716] = dt716; assign fdt[717] = dt717; assign fdt[718] = dt718; assign fdt[719] = dt719; 
		assign fdt[720] = dt720; assign fdt[721] = dt721; assign fdt[722] = dt722; assign fdt[723] = dt723; 
		assign fdt[724] = dt724; assign fdt[725] = dt725; assign fdt[726] = dt726; assign fdt[727] = dt727; 
		assign fdt[728] = dt728; assign fdt[729] = dt729; assign fdt[730] = dt730; assign fdt[731] = dt731; 
		assign fdt[732] = dt732; assign fdt[733] = dt733; assign fdt[734] = dt734; assign fdt[735] = dt735; 
		assign fdt[736] = dt736; assign fdt[737] = dt737; assign fdt[738] = dt738; assign fdt[739] = dt739; 
		assign fdt[740] = dt740; assign fdt[741] = dt741; assign fdt[742] = dt742; assign fdt[743] = dt743; 
		assign fdt[744] = dt744; assign fdt[745] = dt745; assign fdt[746] = dt746; assign fdt[747] = dt747; 
		assign fdt[748] = dt748; assign fdt[749] = dt749; assign fdt[750] = dt750; assign fdt[751] = dt751; 
		assign fdt[752] = dt752; assign fdt[753] = dt753; assign fdt[754] = dt754; assign fdt[755] = dt755; 
		assign fdt[756] = dt756; assign fdt[757] = dt757; assign fdt[758] = dt758; assign fdt[759] = dt759; 
		assign fdt[760] = dt760; assign fdt[761] = dt761; assign fdt[762] = dt762; assign fdt[763] = dt763; 
		assign fdt[764] = dt764; assign fdt[765] = dt765; assign fdt[766] = dt766; assign fdt[767] = dt767; 
		assign fdt[768] = dt768; assign fdt[769] = dt769; assign fdt[770] = dt770; assign fdt[771] = dt771; 
		assign fdt[772] = dt772; assign fdt[773] = dt773; assign fdt[774] = dt774; assign fdt[775] = dt775; 
		assign fdt[776] = dt776; assign fdt[777] = dt777; assign fdt[778] = dt778; assign fdt[779] = dt779; 
		assign fdt[780] = dt780; assign fdt[781] = dt781; assign fdt[782] = dt782; assign fdt[783] = dt783; 
		assign fdt[784] = dt784; assign fdt[785] = dt785; assign fdt[786] = dt786; assign fdt[787] = dt787; 
		assign fdt[788] = dt788; assign fdt[789] = dt789; assign fdt[790] = dt790; assign fdt[791] = dt791; 
		assign fdt[792] = dt792; assign fdt[793] = dt793; assign fdt[794] = dt794; assign fdt[795] = dt795; 
		assign fdt[796] = dt796; assign fdt[797] = dt797; assign fdt[798] = dt798; assign fdt[799] = dt799; 
		assign fdt[800] = dt800; assign fdt[801] = dt801; assign fdt[802] = dt802; assign fdt[803] = dt803; 
		assign fdt[804] = dt804; assign fdt[805] = dt805; assign fdt[806] = dt806; assign fdt[807] = dt807; 
		assign fdt[808] = dt808; assign fdt[809] = dt809; assign fdt[810] = dt810; assign fdt[811] = dt811; 
		assign fdt[812] = dt812; assign fdt[813] = dt813; assign fdt[814] = dt814; assign fdt[815] = dt815; 
		assign fdt[816] = dt816; assign fdt[817] = dt817; assign fdt[818] = dt818; assign fdt[819] = dt819; 
		assign fdt[820] = dt820; assign fdt[821] = dt821; assign fdt[822] = dt822; assign fdt[823] = dt823; 
		assign fdt[824] = dt824; assign fdt[825] = dt825; assign fdt[826] = dt826; assign fdt[827] = dt827; 
		assign fdt[828] = dt828; assign fdt[829] = dt829; assign fdt[830] = dt830; assign fdt[831] = dt831; 
		assign fdt[832] = dt832; assign fdt[833] = dt833; assign fdt[834] = dt834; assign fdt[835] = dt835; 
		assign fdt[836] = dt836; assign fdt[837] = dt837; assign fdt[838] = dt838; assign fdt[839] = dt839; 
		assign fdt[840] = dt840; assign fdt[841] = dt841; assign fdt[842] = dt842; assign fdt[843] = dt843; 
		assign fdt[844] = dt844; assign fdt[845] = dt845; assign fdt[846] = dt846; assign fdt[847] = dt847; 
		assign fdt[848] = dt848; assign fdt[849] = dt849; assign fdt[850] = dt850; assign fdt[851] = dt851; 
		assign fdt[852] = dt852; assign fdt[853] = dt853; assign fdt[854] = dt854; assign fdt[855] = dt855; 
		assign fdt[856] = dt856; assign fdt[857] = dt857; assign fdt[858] = dt858; assign fdt[859] = dt859; 
		assign fdt[860] = dt860; assign fdt[861] = dt861; assign fdt[862] = dt862; assign fdt[863] = dt863; 
		assign fdt[864] = dt864; assign fdt[865] = dt865; assign fdt[866] = dt866; assign fdt[867] = dt867; 
		assign fdt[868] = dt868; assign fdt[869] = dt869; assign fdt[870] = dt870; assign fdt[871] = dt871; 
		assign fdt[872] = dt872; assign fdt[873] = dt873; assign fdt[874] = dt874; assign fdt[875] = dt875; 
		assign fdt[876] = dt876; assign fdt[877] = dt877; assign fdt[878] = dt878; assign fdt[879] = dt879; 
		assign fdt[880] = dt880; assign fdt[881] = dt881; assign fdt[882] = dt882; assign fdt[883] = dt883; 
		assign fdt[884] = dt884; assign fdt[885] = dt885; assign fdt[886] = dt886; assign fdt[887] = dt887; 
		assign fdt[888] = dt888; assign fdt[889] = dt889; assign fdt[890] = dt890; assign fdt[891] = dt891; 
		assign fdt[892] = dt892; assign fdt[893] = dt893; assign fdt[894] = dt894; assign fdt[895] = dt895; 
		assign fdt[896] = dt896; assign fdt[897] = dt897; assign fdt[898] = dt898; assign fdt[899] = dt899; 
		assign fdt[900] = dt900; assign fdt[901] = dt901; assign fdt[902] = dt902; assign fdt[903] = dt903; 
		assign fdt[904] = dt904; assign fdt[905] = dt905; assign fdt[906] = dt906; assign fdt[907] = dt907; 
		assign fdt[908] = dt908; assign fdt[909] = dt909; assign fdt[910] = dt910; assign fdt[911] = dt911; 
		assign fdt[912] = dt912; assign fdt[913] = dt913; assign fdt[914] = dt914; assign fdt[915] = dt915; 
		assign fdt[916] = dt916; assign fdt[917] = dt917; assign fdt[918] = dt918; assign fdt[919] = dt919; 
		assign fdt[920] = dt920; assign fdt[921] = dt921; assign fdt[922] = dt922; assign fdt[923] = dt923; 
		assign fdt[924] = dt924; assign fdt[925] = dt925; assign fdt[926] = dt926; assign fdt[927] = dt927; 
		assign fdt[928] = dt928; assign fdt[929] = dt929; assign fdt[930] = dt930; assign fdt[931] = dt931; 
		assign fdt[932] = dt932; assign fdt[933] = dt933; assign fdt[934] = dt934; assign fdt[935] = dt935; 
		assign fdt[936] = dt936; assign fdt[937] = dt937; assign fdt[938] = dt938; assign fdt[939] = dt939; 
		assign fdt[940] = dt940; assign fdt[941] = dt941; assign fdt[942] = dt942; assign fdt[943] = dt943; 
		assign fdt[944] = dt944; assign fdt[945] = dt945; assign fdt[946] = dt946; assign fdt[947] = dt947; 
		assign fdt[948] = dt948; assign fdt[949] = dt949; assign fdt[950] = dt950; assign fdt[951] = dt951; 
		assign fdt[952] = dt952; assign fdt[953] = dt953; assign fdt[954] = dt954; assign fdt[955] = dt955; 
		assign fdt[956] = dt956; assign fdt[957] = dt957; assign fdt[958] = dt958; assign fdt[959] = dt959; 
		assign fdt[960] = dt960; assign fdt[961] = dt961; assign fdt[962] = dt962; assign fdt[963] = dt963; 
		assign fdt[964] = dt964; assign fdt[965] = dt965; assign fdt[966] = dt966; assign fdt[967] = dt967; 
		assign fdt[968] = dt968; assign fdt[969] = dt969; assign fdt[970] = dt970; assign fdt[971] = dt971; 
		assign fdt[972] = dt972; assign fdt[973] = dt973; assign fdt[974] = dt974; assign fdt[975] = dt975; 
		assign fdt[976] = dt976; assign fdt[977] = dt977; assign fdt[978] = dt978; assign fdt[979] = dt979; 
		assign fdt[980] = dt980; assign fdt[981] = dt981; assign fdt[982] = dt982; assign fdt[983] = dt983; 
		assign fdt[984] = dt984; assign fdt[985] = dt985; assign fdt[986] = dt986; assign fdt[987] = dt987; 
		assign fdt[988] = dt988; assign fdt[989] = dt989; assign fdt[990] = dt990; assign fdt[991] = dt991; 
		assign fdt[992] = dt992; assign fdt[993] = dt993; assign fdt[994] = dt994; assign fdt[995] = dt995; 
		assign fdt[996] = dt996; assign fdt[997] = dt997; assign fdt[998] = dt998; assign fdt[999] = dt999; 
		assign fdt[1000] = dt1000; assign fdt[1001] = dt1001; assign fdt[1002] = dt1002; assign fdt[1003] = dt1003; 
		assign fdt[1004] = dt1004; assign fdt[1005] = dt1005; assign fdt[1006] = dt1006; assign fdt[1007] = dt1007; 
		assign fdt[1008] = dt1008; assign fdt[1009] = dt1009; assign fdt[1010] = dt1010; assign fdt[1011] = dt1011; 
		assign fdt[1012] = dt1012; assign fdt[1013] = dt1013; assign fdt[1014] = dt1014; assign fdt[1015] = dt1015; 
		assign fdt[1016] = dt1016; assign fdt[1017] = dt1017; assign fdt[1018] = dt1018; assign fdt[1019] = dt1019; 
		assign fdt[1020] = dt1020; assign fdt[1021] = dt1021; assign fdt[1022] = dt1022; assign fdt[1023] = dt1023;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			line_cnt = 0;
		end 
		else begin
			line_cnt = line_cnt + 1;			 
			if (!stall) begin
				// write output data to file				
					$fwrite(fOutput, "%-10d ", line_cnt);
					for (i=0; i<size; i = i+1)
						$fwrite(fOutput, "%8d ", fdt[i]);				
					$fwrite(fOutput, "\n");$fflush(fOutput);

				`ifdef debug_print_write
					$write("WRITE Line %d:  ", line_cnt);
					for (i=0; i<size; i = i+1)
						$write("%d  ", fdt[i]);				
					$write("\n");	
				`endif
			end
			else begin
				//$write  ("INFOR --- Stop writing into file %s\n", filename);
				//$fwrite (fOutput, "\nINFOR --- End cycle = %d\n", line_cnt);
				//$fclose(fOutput);
			end
		end 
	end
// synopsys translate_on

endmodule

//==========================================================================
//
//
//==========================================================================
/*
module vcFileAccess
#(
	parameter simcycle 		= 100,
	parameter size				= 8,
	parameter hwidth 			= 12,
	parameter clockperiod 		= 10	// in ns
)
(

);

	wire							clk, rst, stall, stall_out;
	wire 	signed [31:0]			cur_cycle;
	wire                                          dt_ready;

	wire signed [hwidth-1:0] 		dt0, dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12, dt13, dt14, dt15, 
									dt16, dt17, dt18, dt19, dt20, dt21, dt22, dt23, dt24, dt25, dt26, dt27, dt28, dt29, dt30, dt31, 
									dt32, dt33, dt34, dt35, dt36, dt37, dt38, dt39, dt40, dt41, dt42, dt43, dt44, dt45, dt46, dt47, 
									dt48, dt49, dt50, dt51, dt52, dt53, dt54, dt55, dt56, dt57, dt58, dt59, dt60, dt61, dt62, dt63, 
									dt64, dt65, dt66, dt67, dt68, dt69, dt70, dt71, dt72, dt73, dt74, dt75, dt76, dt77, dt78, dt79, 
									dt80, dt81, dt82, dt83, dt84, dt85, dt86, dt87, dt88, dt89, dt90, dt91, dt92, dt93, dt94, dt95, 
									dt96, dt97, dt98, dt99, dt100, dt101, dt102, dt103, dt104, dt105, dt106, dt107, dt108, dt109, dt110, dt111, 
									dt112, dt113, dt114, dt115, dt116, dt117, dt118, dt119, dt120, dt121, dt122, dt123, dt124, dt125, dt126, dt127, 
									dt128, dt129, dt130, dt131, dt132, dt133, dt134, dt135, dt136, dt137, dt138, dt139, dt140, dt141, dt142, dt143, 
									dt144, dt145, dt146, dt147, dt148, dt149, dt150, dt151, dt152, dt153, dt154, dt155, dt156, dt157, dt158, dt159, 
									dt160, dt161, dt162, dt163, dt164, dt165, dt166, dt167, dt168, dt169, dt170, dt171, dt172, dt173, dt174, dt175, 
									dt176, dt177, dt178, dt179, dt180, dt181, dt182, dt183, dt184, dt185, dt186, dt187, dt188, dt189, dt190, dt191, 
									dt192, dt193, dt194, dt195, dt196, dt197, dt198, dt199, dt200, dt201, dt202, dt203, dt204, dt205, dt206, dt207, 
									dt208, dt209, dt210, dt211, dt212, dt213, dt214, dt215, dt216, dt217, dt218, dt219, dt220, dt221, dt222, dt223, 
									dt224, dt225, dt226, dt227, dt228, dt229, dt230, dt231, dt232, dt233, dt234, dt235, dt236, dt237, dt238, dt239, 
									dt240, dt241, dt242, dt243, dt244, dt245, dt246, dt247, dt248, dt249, dt250, dt251, dt252, dt253, dt254, dt255, 
									dt256, dt257, dt258, dt259, dt260, dt261, dt262, dt263, dt264, dt265, dt266, dt267, dt268, dt269, dt270, dt271, 
									dt272, dt273, dt274, dt275, dt276, dt277, dt278, dt279, dt280, dt281, dt282, dt283, dt284, dt285, dt286, dt287, 
									dt288, dt289, dt290, dt291, dt292, dt293, dt294, dt295, dt296, dt297, dt298, dt299, dt300, dt301, dt302, dt303, 
									dt304, dt305, dt306, dt307, dt308, dt309, dt310, dt311, dt312, dt313, dt314, dt315, dt316, dt317, dt318, dt319, 
									dt320, dt321, dt322, dt323, dt324, dt325, dt326, dt327, dt328, dt329, dt330, dt331, dt332, dt333, dt334, dt335, 
									dt336, dt337, dt338, dt339, dt340, dt341, dt342, dt343, dt344, dt345, dt346, dt347, dt348, dt349, dt350, dt351, 
									dt352, dt353, dt354, dt355, dt356, dt357, dt358, dt359, dt360, dt361, dt362, dt363, dt364, dt365, dt366, dt367, 
									dt368, dt369, dt370, dt371, dt372, dt373, dt374, dt375, dt376, dt377, dt378, dt379, dt380, dt381, dt382, dt383, 
									dt384, dt385, dt386, dt387, dt388, dt389, dt390, dt391, dt392, dt393, dt394, dt395, dt396, dt397, dt398, dt399, 
									dt400, dt401, dt402, dt403, dt404, dt405, dt406, dt407, dt408, dt409, dt410, dt411, dt412, dt413, dt414, dt415, 
									dt416, dt417, dt418, dt419, dt420, dt421, dt422, dt423, dt424, dt425, dt426, dt427, dt428, dt429, dt430, dt431, 
									dt432, dt433, dt434, dt435, dt436, dt437, dt438, dt439, dt440, dt441, dt442, dt443, dt444, dt445, dt446, dt447, 
									dt448, dt449, dt450, dt451, dt452, dt453, dt454, dt455, dt456, dt457, dt458, dt459, dt460, dt461, dt462, dt463, 
									dt464, dt465, dt466, dt467, dt468, dt469, dt470, dt471, dt472, dt473, dt474, dt475, dt476, dt477, dt478, dt479, 
									dt480, dt481, dt482, dt483, dt484, dt485, dt486, dt487, dt488, dt489, dt490, dt491, dt492, dt493, dt494, dt495, 
									dt496, dt497, dt498, dt499, dt500, dt501, dt502, dt503, dt504, dt505, dt506, dt507, dt508, dt509, dt510, dt511, 
									dt512, dt513, dt514, dt515, dt516, dt517, dt518, dt519, dt520, dt521, dt522, dt523, dt524, dt525, dt526, dt527, 
									dt528, dt529, dt530, dt531, dt532, dt533, dt534, dt535, dt536, dt537, dt538, dt539, dt540, dt541, dt542, dt543, 
									dt544, dt545, dt546, dt547, dt548, dt549, dt550, dt551, dt552, dt553, dt554, dt555, dt556, dt557, dt558, dt559, 
									dt560, dt561, dt562, dt563, dt564, dt565, dt566, dt567, dt568, dt569, dt570, dt571, dt572, dt573, dt574, dt575, 
									dt576, dt577, dt578, dt579, dt580, dt581, dt582, dt583, dt584, dt585, dt586, dt587, dt588, dt589, dt590, dt591, 
									dt592, dt593, dt594, dt595, dt596, dt597, dt598, dt599, dt600, dt601, dt602, dt603, dt604, dt605, dt606, dt607, 
									dt608, dt609, dt610, dt611, dt612, dt613, dt614, dt615, dt616, dt617, dt618, dt619, dt620, dt621, dt622, dt623, 
									dt624, dt625, dt626, dt627, dt628, dt629, dt630, dt631, dt632, dt633, dt634, dt635, dt636, dt637, dt638, dt639, 
									dt640, dt641, dt642, dt643, dt644, dt645, dt646, dt647, dt648, dt649, dt650, dt651, dt652, dt653, dt654, dt655, 
									dt656, dt657, dt658, dt659, dt660, dt661, dt662, dt663, dt664, dt665, dt666, dt667, dt668, dt669, dt670, dt671, 
									dt672, dt673, dt674, dt675, dt676, dt677, dt678, dt679, dt680, dt681, dt682, dt683, dt684, dt685, dt686, dt687, 
									dt688, dt689, dt690, dt691, dt692, dt693, dt694, dt695, dt696, dt697, dt698, dt699, dt700, dt701, dt702, dt703, 
									dt704, dt705, dt706, dt707, dt708, dt709, dt710, dt711, dt712, dt713, dt714, dt715, dt716, dt717, dt718, dt719, 
									dt720, dt721, dt722, dt723, dt724, dt725, dt726, dt727, dt728, dt729, dt730, dt731, dt732, dt733, dt734, dt735, 
									dt736, dt737, dt738, dt739, dt740, dt741, dt742, dt743, dt744, dt745, dt746, dt747, dt748, dt749, dt750, dt751, 
									dt752, dt753, dt754, dt755, dt756, dt757, dt758, dt759, dt760, dt761, dt762, dt763, dt764, dt765, dt766, dt767, 
									dt768, dt769, dt770, dt771, dt772, dt773, dt774, dt775, dt776, dt777, dt778, dt779, dt780, dt781, dt782, dt783, 
									dt784, dt785, dt786, dt787, dt788, dt789, dt790, dt791, dt792, dt793, dt794, dt795, dt796, dt797, dt798, dt799, 
									dt800, dt801, dt802, dt803, dt804, dt805, dt806, dt807, dt808, dt809, dt810, dt811, dt812, dt813, dt814, dt815, 
									dt816, dt817, dt818, dt819, dt820, dt821, dt822, dt823, dt824, dt825, dt826, dt827, dt828, dt829, dt830, dt831, 
									dt832, dt833, dt834, dt835, dt836, dt837, dt838, dt839, dt840, dt841, dt842, dt843, dt844, dt845, dt846, dt847, 
									dt848, dt849, dt850, dt851, dt852, dt853, dt854, dt855, dt856, dt857, dt858, dt859, dt860, dt861, dt862, dt863, 
									dt864, dt865, dt866, dt867, dt868, dt869, dt870, dt871, dt872, dt873, dt874, dt875, dt876, dt877, dt878, dt879, 
									dt880, dt881, dt882, dt883, dt884, dt885, dt886, dt887, dt888, dt889, dt890, dt891, dt892, dt893, dt894, dt895, 
									dt896, dt897, dt898, dt899, dt900, dt901, dt902, dt903, dt904, dt905, dt906, dt907, dt908, dt909, dt910, dt911, 
									dt912, dt913, dt914, dt915, dt916, dt917, dt918, dt919, dt920, dt921, dt922, dt923, dt924, dt925, dt926, dt927, 
									dt928, dt929, dt930, dt931, dt932, dt933, dt934, dt935, dt936, dt937, dt938, dt939, dt940, dt941, dt942, dt943, 
									dt944, dt945, dt946, dt947, dt948, dt949, dt950, dt951, dt952, dt953, dt954, dt955, dt956, dt957, dt958, dt959, 
									dt960, dt961, dt962, dt963, dt964, dt965, dt966, dt967, dt968, dt969, dt970, dt971, dt972, dt973, dt974, dt975, 
									dt976, dt977, dt978, dt979, dt980, dt981, dt982, dt983, dt984, dt985, dt986, dt987, dt988, dt989, dt990, dt991, 
									dt992, dt993, dt994, dt995, dt996, dt997, dt998, dt999, dt1000, dt1001, dt1002, dt1003, dt1004, dt1005, dt1006, dt1007, 
									dt1008, dt1009, dt1010, dt1011, dt1012, dt1013, dt1014, dt1015, dt1016, dt1017, dt1018, dt1019, dt1020, dt1021, dt1022, dt1023;

	vcClockGen #(.clockperiod(clockperiod)) 
		inst_vcClockGen (.clk(clk), .rst(rst), .cur_cycle(cur_cycle));

	fifo #(.depth(8)) 
		fifo(.clk(clk), .rst(rst), .stall_in(stall), .stall_out(stall_out));

	vcReadFile #(.size(size), .filename("fft2_bw12_input.txt"), .hwidth(12))
		dut_vcReadFile (clk, rst, 
						stall, 
		 				dt0, dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12, dt13, dt14, dt15, 
						dt16, dt17, dt18, dt19, dt20, dt21, dt22, dt23, dt24, dt25, dt26, dt27, dt28, dt29, dt30, dt31, 
						dt32, dt33, dt34, dt35, dt36, dt37, dt38, dt39, dt40, dt41, dt42, dt43, dt44, dt45, dt46, dt47, 
						dt48, dt49, dt50, dt51, dt52, dt53, dt54, dt55, dt56, dt57, dt58, dt59, dt60, dt61, dt62, dt63, 
						dt64, dt65, dt66, dt67, dt68, dt69, dt70, dt71, dt72, dt73, dt74, dt75, dt76, dt77, dt78, dt79, 
						dt80, dt81, dt82, dt83, dt84, dt85, dt86, dt87, dt88, dt89, dt90, dt91, dt92, dt93, dt94, dt95, 
						dt96, dt97, dt98, dt99, dt100, dt101, dt102, dt103, dt104, dt105, dt106, dt107, dt108, dt109, dt110, dt111, 
						dt112, dt113, dt114, dt115, dt116, dt117, dt118, dt119, dt120, dt121, dt122, dt123, dt124, dt125, dt126, dt127, 
						dt128, dt129, dt130, dt131, dt132, dt133, dt134, dt135, dt136, dt137, dt138, dt139, dt140, dt141, dt142, dt143, 
						dt144, dt145, dt146, dt147, dt148, dt149, dt150, dt151, dt152, dt153, dt154, dt155, dt156, dt157, dt158, dt159, 
						dt160, dt161, dt162, dt163, dt164, dt165, dt166, dt167, dt168, dt169, dt170, dt171, dt172, dt173, dt174, dt175, 
						dt176, dt177, dt178, dt179, dt180, dt181, dt182, dt183, dt184, dt185, dt186, dt187, dt188, dt189, dt190, dt191, 
						dt192, dt193, dt194, dt195, dt196, dt197, dt198, dt199, dt200, dt201, dt202, dt203, dt204, dt205, dt206, dt207, 
						dt208, dt209, dt210, dt211, dt212, dt213, dt214, dt215, dt216, dt217, dt218, dt219, dt220, dt221, dt222, dt223, 
						dt224, dt225, dt226, dt227, dt228, dt229, dt230, dt231, dt232, dt233, dt234, dt235, dt236, dt237, dt238, dt239, 
						dt240, dt241, dt242, dt243, dt244, dt245, dt246, dt247, dt248, dt249, dt250, dt251, dt252, dt253, dt254, dt255, 
						dt256, dt257, dt258, dt259, dt260, dt261, dt262, dt263, dt264, dt265, dt266, dt267, dt268, dt269, dt270, dt271, 
						dt272, dt273, dt274, dt275, dt276, dt277, dt278, dt279, dt280, dt281, dt282, dt283, dt284, dt285, dt286, dt287, 
						dt288, dt289, dt290, dt291, dt292, dt293, dt294, dt295, dt296, dt297, dt298, dt299, dt300, dt301, dt302, dt303, 
						dt304, dt305, dt306, dt307, dt308, dt309, dt310, dt311, dt312, dt313, dt314, dt315, dt316, dt317, dt318, dt319, 
						dt320, dt321, dt322, dt323, dt324, dt325, dt326, dt327, dt328, dt329, dt330, dt331, dt332, dt333, dt334, dt335, 
						dt336, dt337, dt338, dt339, dt340, dt341, dt342, dt343, dt344, dt345, dt346, dt347, dt348, dt349, dt350, dt351, 
						dt352, dt353, dt354, dt355, dt356, dt357, dt358, dt359, dt360, dt361, dt362, dt363, dt364, dt365, dt366, dt367, 
						dt368, dt369, dt370, dt371, dt372, dt373, dt374, dt375, dt376, dt377, dt378, dt379, dt380, dt381, dt382, dt383, 
						dt384, dt385, dt386, dt387, dt388, dt389, dt390, dt391, dt392, dt393, dt394, dt395, dt396, dt397, dt398, dt399, 
						dt400, dt401, dt402, dt403, dt404, dt405, dt406, dt407, dt408, dt409, dt410, dt411, dt412, dt413, dt414, dt415, 
						dt416, dt417, dt418, dt419, dt420, dt421, dt422, dt423, dt424, dt425, dt426, dt427, dt428, dt429, dt430, dt431, 
						dt432, dt433, dt434, dt435, dt436, dt437, dt438, dt439, dt440, dt441, dt442, dt443, dt444, dt445, dt446, dt447, 
						dt448, dt449, dt450, dt451, dt452, dt453, dt454, dt455, dt456, dt457, dt458, dt459, dt460, dt461, dt462, dt463, 
						dt464, dt465, dt466, dt467, dt468, dt469, dt470, dt471, dt472, dt473, dt474, dt475, dt476, dt477, dt478, dt479, 
						dt480, dt481, dt482, dt483, dt484, dt485, dt486, dt487, dt488, dt489, dt490, dt491, dt492, dt493, dt494, dt495, 
						dt496, dt497, dt498, dt499, dt500, dt501, dt502, dt503, dt504, dt505, dt506, dt507, dt508, dt509, dt510, dt511, 
						dt512, dt513, dt514, dt515, dt516, dt517, dt518, dt519, dt520, dt521, dt522, dt523, dt524, dt525, dt526, dt527, 
						dt528, dt529, dt530, dt531, dt532, dt533, dt534, dt535, dt536, dt537, dt538, dt539, dt540, dt541, dt542, dt543, 
						dt544, dt545, dt546, dt547, dt548, dt549, dt550, dt551, dt552, dt553, dt554, dt555, dt556, dt557, dt558, dt559, 
						dt560, dt561, dt562, dt563, dt564, dt565, dt566, dt567, dt568, dt569, dt570, dt571, dt572, dt573, dt574, dt575, 
						dt576, dt577, dt578, dt579, dt580, dt581, dt582, dt583, dt584, dt585, dt586, dt587, dt588, dt589, dt590, dt591, 
						dt592, dt593, dt594, dt595, dt596, dt597, dt598, dt599, dt600, dt601, dt602, dt603, dt604, dt605, dt606, dt607, 
						dt608, dt609, dt610, dt611, dt612, dt613, dt614, dt615, dt616, dt617, dt618, dt619, dt620, dt621, dt622, dt623, 
						dt624, dt625, dt626, dt627, dt628, dt629, dt630, dt631, dt632, dt633, dt634, dt635, dt636, dt637, dt638, dt639, 
						dt640, dt641, dt642, dt643, dt644, dt645, dt646, dt647, dt648, dt649, dt650, dt651, dt652, dt653, dt654, dt655, 
						dt656, dt657, dt658, dt659, dt660, dt661, dt662, dt663, dt664, dt665, dt666, dt667, dt668, dt669, dt670, dt671, 
						dt672, dt673, dt674, dt675, dt676, dt677, dt678, dt679, dt680, dt681, dt682, dt683, dt684, dt685, dt686, dt687, 
						dt688, dt689, dt690, dt691, dt692, dt693, dt694, dt695, dt696, dt697, dt698, dt699, dt700, dt701, dt702, dt703, 
						dt704, dt705, dt706, dt707, dt708, dt709, dt710, dt711, dt712, dt713, dt714, dt715, dt716, dt717, dt718, dt719, 
						dt720, dt721, dt722, dt723, dt724, dt725, dt726, dt727, dt728, dt729, dt730, dt731, dt732, dt733, dt734, dt735, 
						dt736, dt737, dt738, dt739, dt740, dt741, dt742, dt743, dt744, dt745, dt746, dt747, dt748, dt749, dt750, dt751, 
						dt752, dt753, dt754, dt755, dt756, dt757, dt758, dt759, dt760, dt761, dt762, dt763, dt764, dt765, dt766, dt767, 
						dt768, dt769, dt770, dt771, dt772, dt773, dt774, dt775, dt776, dt777, dt778, dt779, dt780, dt781, dt782, dt783, 
						dt784, dt785, dt786, dt787, dt788, dt789, dt790, dt791, dt792, dt793, dt794, dt795, dt796, dt797, dt798, dt799, 
						dt800, dt801, dt802, dt803, dt804, dt805, dt806, dt807, dt808, dt809, dt810, dt811, dt812, dt813, dt814, dt815, 
						dt816, dt817, dt818, dt819, dt820, dt821, dt822, dt823, dt824, dt825, dt826, dt827, dt828, dt829, dt830, dt831, 
						dt832, dt833, dt834, dt835, dt836, dt837, dt838, dt839, dt840, dt841, dt842, dt843, dt844, dt845, dt846, dt847, 
						dt848, dt849, dt850, dt851, dt852, dt853, dt854, dt855, dt856, dt857, dt858, dt859, dt860, dt861, dt862, dt863, 
						dt864, dt865, dt866, dt867, dt868, dt869, dt870, dt871, dt872, dt873, dt874, dt875, dt876, dt877, dt878, dt879, 
						dt880, dt881, dt882, dt883, dt884, dt885, dt886, dt887, dt888, dt889, dt890, dt891, dt892, dt893, dt894, dt895, 
						dt896, dt897, dt898, dt899, dt900, dt901, dt902, dt903, dt904, dt905, dt906, dt907, dt908, dt909, dt910, dt911, 
						dt912, dt913, dt914, dt915, dt916, dt917, dt918, dt919, dt920, dt921, dt922, dt923, dt924, dt925, dt926, dt927, 
						dt928, dt929, dt930, dt931, dt932, dt933, dt934, dt935, dt936, dt937, dt938, dt939, dt940, dt941, dt942, dt943, 
						dt944, dt945, dt946, dt947, dt948, dt949, dt950, dt951, dt952, dt953, dt954, dt955, dt956, dt957, dt958, dt959, 
						dt960, dt961, dt962, dt963, dt964, dt965, dt966, dt967, dt968, dt969, dt970, dt971, dt972, dt973, dt974, dt975, 
						dt976, dt977, dt978, dt979, dt980, dt981, dt982, dt983, dt984, dt985, dt986, dt987, dt988, dt989, dt990, dt991, 
						dt992, dt993, dt994, dt995, dt996, dt997, dt998, dt999, dt1000, dt1001, dt1002, dt1003, dt1004, dt1005, dt1006, dt1007, 
						dt1008, dt1009, dt1010, dt1011, dt1012, dt1013, dt1014, dt1015, dt1016, dt1017, dt1018, dt1019, dt1020, dt1021, dt1022, dt1023);

	vcWriteFile #(.size(size), .filename("output_write.txt"), .hwidth(12))
		dut_vcWriteFile (clk, rst, 
						stall,
		 				dt0, dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12, dt13, dt14, dt15, 
						dt16, dt17, dt18, dt19, dt20, dt21, dt22, dt23, dt24, dt25, dt26, dt27, dt28, dt29, dt30, dt31, 
						dt32, dt33, dt34, dt35, dt36, dt37, dt38, dt39, dt40, dt41, dt42, dt43, dt44, dt45, dt46, dt47, 
						dt48, dt49, dt50, dt51, dt52, dt53, dt54, dt55, dt56, dt57, dt58, dt59, dt60, dt61, dt62, dt63, 
						dt64, dt65, dt66, dt67, dt68, dt69, dt70, dt71, dt72, dt73, dt74, dt75, dt76, dt77, dt78, dt79, 
						dt80, dt81, dt82, dt83, dt84, dt85, dt86, dt87, dt88, dt89, dt90, dt91, dt92, dt93, dt94, dt95, 
						dt96, dt97, dt98, dt99, dt100, dt101, dt102, dt103, dt104, dt105, dt106, dt107, dt108, dt109, dt110, dt111, 
						dt112, dt113, dt114, dt115, dt116, dt117, dt118, dt119, dt120, dt121, dt122, dt123, dt124, dt125, dt126, dt127, 
						dt128, dt129, dt130, dt131, dt132, dt133, dt134, dt135, dt136, dt137, dt138, dt139, dt140, dt141, dt142, dt143, 
						dt144, dt145, dt146, dt147, dt148, dt149, dt150, dt151, dt152, dt153, dt154, dt155, dt156, dt157, dt158, dt159, 
						dt160, dt161, dt162, dt163, dt164, dt165, dt166, dt167, dt168, dt169, dt170, dt171, dt172, dt173, dt174, dt175, 
						dt176, dt177, dt178, dt179, dt180, dt181, dt182, dt183, dt184, dt185, dt186, dt187, dt188, dt189, dt190, dt191, 
						dt192, dt193, dt194, dt195, dt196, dt197, dt198, dt199, dt200, dt201, dt202, dt203, dt204, dt205, dt206, dt207, 
						dt208, dt209, dt210, dt211, dt212, dt213, dt214, dt215, dt216, dt217, dt218, dt219, dt220, dt221, dt222, dt223, 
						dt224, dt225, dt226, dt227, dt228, dt229, dt230, dt231, dt232, dt233, dt234, dt235, dt236, dt237, dt238, dt239, 
						dt240, dt241, dt242, dt243, dt244, dt245, dt246, dt247, dt248, dt249, dt250, dt251, dt252, dt253, dt254, dt255, 
						dt256, dt257, dt258, dt259, dt260, dt261, dt262, dt263, dt264, dt265, dt266, dt267, dt268, dt269, dt270, dt271, 
						dt272, dt273, dt274, dt275, dt276, dt277, dt278, dt279, dt280, dt281, dt282, dt283, dt284, dt285, dt286, dt287, 
						dt288, dt289, dt290, dt291, dt292, dt293, dt294, dt295, dt296, dt297, dt298, dt299, dt300, dt301, dt302, dt303, 
						dt304, dt305, dt306, dt307, dt308, dt309, dt310, dt311, dt312, dt313, dt314, dt315, dt316, dt317, dt318, dt319, 
						dt320, dt321, dt322, dt323, dt324, dt325, dt326, dt327, dt328, dt329, dt330, dt331, dt332, dt333, dt334, dt335, 
						dt336, dt337, dt338, dt339, dt340, dt341, dt342, dt343, dt344, dt345, dt346, dt347, dt348, dt349, dt350, dt351, 
						dt352, dt353, dt354, dt355, dt356, dt357, dt358, dt359, dt360, dt361, dt362, dt363, dt364, dt365, dt366, dt367, 
						dt368, dt369, dt370, dt371, dt372, dt373, dt374, dt375, dt376, dt377, dt378, dt379, dt380, dt381, dt382, dt383, 
						dt384, dt385, dt386, dt387, dt388, dt389, dt390, dt391, dt392, dt393, dt394, dt395, dt396, dt397, dt398, dt399, 
						dt400, dt401, dt402, dt403, dt404, dt405, dt406, dt407, dt408, dt409, dt410, dt411, dt412, dt413, dt414, dt415, 
						dt416, dt417, dt418, dt419, dt420, dt421, dt422, dt423, dt424, dt425, dt426, dt427, dt428, dt429, dt430, dt431, 
						dt432, dt433, dt434, dt435, dt436, dt437, dt438, dt439, dt440, dt441, dt442, dt443, dt444, dt445, dt446, dt447, 
						dt448, dt449, dt450, dt451, dt452, dt453, dt454, dt455, dt456, dt457, dt458, dt459, dt460, dt461, dt462, dt463, 
						dt464, dt465, dt466, dt467, dt468, dt469, dt470, dt471, dt472, dt473, dt474, dt475, dt476, dt477, dt478, dt479, 
						dt480, dt481, dt482, dt483, dt484, dt485, dt486, dt487, dt488, dt489, dt490, dt491, dt492, dt493, dt494, dt495, 
						dt496, dt497, dt498, dt499, dt500, dt501, dt502, dt503, dt504, dt505, dt506, dt507, dt508, dt509, dt510, dt511, 
						dt512, dt513, dt514, dt515, dt516, dt517, dt518, dt519, dt520, dt521, dt522, dt523, dt524, dt525, dt526, dt527, 
						dt528, dt529, dt530, dt531, dt532, dt533, dt534, dt535, dt536, dt537, dt538, dt539, dt540, dt541, dt542, dt543, 
						dt544, dt545, dt546, dt547, dt548, dt549, dt550, dt551, dt552, dt553, dt554, dt555, dt556, dt557, dt558, dt559, 
						dt560, dt561, dt562, dt563, dt564, dt565, dt566, dt567, dt568, dt569, dt570, dt571, dt572, dt573, dt574, dt575, 
						dt576, dt577, dt578, dt579, dt580, dt581, dt582, dt583, dt584, dt585, dt586, dt587, dt588, dt589, dt590, dt591, 
						dt592, dt593, dt594, dt595, dt596, dt597, dt598, dt599, dt600, dt601, dt602, dt603, dt604, dt605, dt606, dt607, 
						dt608, dt609, dt610, dt611, dt612, dt613, dt614, dt615, dt616, dt617, dt618, dt619, dt620, dt621, dt622, dt623, 
						dt624, dt625, dt626, dt627, dt628, dt629, dt630, dt631, dt632, dt633, dt634, dt635, dt636, dt637, dt638, dt639, 
						dt640, dt641, dt642, dt643, dt644, dt645, dt646, dt647, dt648, dt649, dt650, dt651, dt652, dt653, dt654, dt655, 
						dt656, dt657, dt658, dt659, dt660, dt661, dt662, dt663, dt664, dt665, dt666, dt667, dt668, dt669, dt670, dt671, 
						dt672, dt673, dt674, dt675, dt676, dt677, dt678, dt679, dt680, dt681, dt682, dt683, dt684, dt685, dt686, dt687, 
						dt688, dt689, dt690, dt691, dt692, dt693, dt694, dt695, dt696, dt697, dt698, dt699, dt700, dt701, dt702, dt703, 
						dt704, dt705, dt706, dt707, dt708, dt709, dt710, dt711, dt712, dt713, dt714, dt715, dt716, dt717, dt718, dt719, 
						dt720, dt721, dt722, dt723, dt724, dt725, dt726, dt727, dt728, dt729, dt730, dt731, dt732, dt733, dt734, dt735, 
						dt736, dt737, dt738, dt739, dt740, dt741, dt742, dt743, dt744, dt745, dt746, dt747, dt748, dt749, dt750, dt751, 
						dt752, dt753, dt754, dt755, dt756, dt757, dt758, dt759, dt760, dt761, dt762, dt763, dt764, dt765, dt766, dt767, 
						dt768, dt769, dt770, dt771, dt772, dt773, dt774, dt775, dt776, dt777, dt778, dt779, dt780, dt781, dt782, dt783, 
						dt784, dt785, dt786, dt787, dt788, dt789, dt790, dt791, dt792, dt793, dt794, dt795, dt796, dt797, dt798, dt799, 
						dt800, dt801, dt802, dt803, dt804, dt805, dt806, dt807, dt808, dt809, dt810, dt811, dt812, dt813, dt814, dt815, 
						dt816, dt817, dt818, dt819, dt820, dt821, dt822, dt823, dt824, dt825, dt826, dt827, dt828, dt829, dt830, dt831, 
						dt832, dt833, dt834, dt835, dt836, dt837, dt838, dt839, dt840, dt841, dt842, dt843, dt844, dt845, dt846, dt847, 
						dt848, dt849, dt850, dt851, dt852, dt853, dt854, dt855, dt856, dt857, dt858, dt859, dt860, dt861, dt862, dt863, 
						dt864, dt865, dt866, dt867, dt868, dt869, dt870, dt871, dt872, dt873, dt874, dt875, dt876, dt877, dt878, dt879, 
						dt880, dt881, dt882, dt883, dt884, dt885, dt886, dt887, dt888, dt889, dt890, dt891, dt892, dt893, dt894, dt895, 
						dt896, dt897, dt898, dt899, dt900, dt901, dt902, dt903, dt904, dt905, dt906, dt907, dt908, dt909, dt910, dt911, 
						dt912, dt913, dt914, dt915, dt916, dt917, dt918, dt919, dt920, dt921, dt922, dt923, dt924, dt925, dt926, dt927, 
						dt928, dt929, dt930, dt931, dt932, dt933, dt934, dt935, dt936, dt937, dt938, dt939, dt940, dt941, dt942, dt943, 
						dt944, dt945, dt946, dt947, dt948, dt949, dt950, dt951, dt952, dt953, dt954, dt955, dt956, dt957, dt958, dt959, 
						dt960, dt961, dt962, dt963, dt964, dt965, dt966, dt967, dt968, dt969, dt970, dt971, dt972, dt973, dt974, dt975, 
						dt976, dt977, dt978, dt979, dt980, dt981, dt982, dt983, dt984, dt985, dt986, dt987, dt988, dt989, dt990, dt991, 
						dt992, dt993, dt994, dt995, dt996, dt997, dt998, dt999, dt1000, dt1001, dt1002, dt1003, dt1004, dt1005, dt1006, dt1007, 
						dt1008, dt1009, dt1010, dt1011, dt1012, dt1013, dt1014, dt1015, dt1016, dt1017, dt1018, dt1019, dt1020, dt1021, dt1022, dt1023);

	always @(posedge clk) begin
		if (cur_cycle == simcycle) begin
			$display ("INFOR --- Simulation is finished at cycle %d", cur_cycle);
			$finish;
		end
	end


// synopsys translate_on
endmodule
*/
