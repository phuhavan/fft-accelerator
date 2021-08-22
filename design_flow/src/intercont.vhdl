--------------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_textio.all;
	use IEEE.math_real.all;

library STD;
	use STD.textio.all;

entity MUX is
	generic
	(	
			muxsize			: natural:=2					-- power of 2
	);
	port 
	(
			data_in			: in  std_logic_vector(muxsize-1             				  downto 0);
			addr_in			: in  std_logic_vector(natural(log2(real(muxsize)))-1 downto 0);
			data_out		: out std_logic
	);	
end entity;
	
architecture rtl of MUX is
begin
	process (addr_in, data_in)
	begin
		for i in 0 to muxsize-1 loop
			if (i = to_integer(unsigned(addr_in))) then
				data_out <= data_in(i);
			end if;
		end loop;
	end process;
end architecture;


--------------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_textio.all;
	use IEEE.math_real.all;

library STD;
	use STD.textio.all;

entity MUX_BASED_INTERCONT is
	generic
	(	
			muxsize			: natural:=4;					-- power of 2
			width				: natural:=64					-- power of mux_size
	);
	port 
	(
			data_in			: in  std_logic_vector(width-1            				  downto 0);
			addr_in			: in  std_logic_vector(natural(log2(real(width)))-1 downto 0);
			data_out		: out std_logic
	);	
end entity;
	
architecture rtl of MUX_BASED_INTERCONT is
	component MUX
		generic
		(	
				muxsize			: natural:=2					-- power of 2
		);
		port 
		(
				data_in			: in  std_logic_vector(muxsize-1             					downto 0);
				addr_in			: in  std_logic_vector(natural(log2(real(muxsize)))-1 downto 0);
				data_out		: out std_logic
		);	
	end component;

	constant addr_size	: natural := natural(log2(real(muxsize)));	
	constant mux_level 	: natural := natural(log2(real(width)))/addr_size;

	type imm_wire is array (0 to mux_level) of std_logic_vector(width-1 downto 0);

	signal mux_out_wr : imm_wire;

begin

	mux_out_wr(0) <= data_in;

	mux_hier_gen0: for i in 0 to mux_level-1 generate
			mux_hier_gen1: for j in 0 to (muxsize**(mux_level-1-i)-1) generate
					inst_MUX: MUX generic map (
																			muxsize 	=> muxsize
																		)
											  port map 		( 
																			data_in   => mux_out_wr(i)   ((j+1)*muxsize-1 	downto j*muxsize),
																			addr_in		=> addr_in         ((i+1)*addr_size-1 downto i*addr_size),
																			data_out	=> mux_out_wr(i+1) (j)
																		);
			end generate;
	end generate;

	data_out <= mux_out_wr(mux_level)(0);

end architecture;


--------------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_textio.all;
	use IEEE.math_real.all;

library STD;
	use STD.textio.all;

entity SHARED_BUS_INTERCONT is
	generic
	(	
			width				: natural:=64					-- power of mux_size
	);
	port 
	(
			data_in			: in  std_logic_vector(width-1 downto 0);
			addr_in			: in  std_logic_vector(width-1 downto 0);
			data_out		: out std_logic
	);	
end entity;
	
architecture rtl of SHARED_BUS_INTERCONT is
	component TNBUFFX1_HVT 
		port (
			A 		: in  std_logic;
			EN 		: in  std_logic;
			Y 		: out std_logic
		);
	end component;

	component TNBUFX1_LVT 
		port (
			A 		: in  std_logic;
			EN 		: in  std_logic;
			Y 		: out std_logic
		);
	end component;

	component TNBUFFX32_HVT 
		port (
			A 		: in  std_logic;
			EN 		: in  std_logic;
			Y 		: out std_logic
		);
	end component;

	component TNBUFX32_LVT 
		port (
			A 		: in  std_logic;
			EN 		: in  std_logic;
			Y 		: out std_logic
		);
	end component;

begin
	three_state_gen: for i in 0 to (width-1) generate
		 --inst_TNBUFFX32: TNBUFFX1_LVT port map (A => data_in(i), EN => addr_in(i), Y => data_out);
		 inst_TNBUFF: TNBUFFX1_HVT port map (A => data_in(i), EN => addr_in(i), Y => data_out);
	end generate three_state_gen;

end architecture;

--------------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_textio.all;
	use IEEE.math_real.all;

library STD;
	use STD.textio.all;

entity CROSSBAR_INTERCONT is
	generic
	(	
			width				: natural:=64					-- power of mux_size
	);
	port 
	(
			data_in			: in  std_logic_vector(width-1 downto 0);
			addr_in			: in  std_logic_vector(width-1 downto 0);
			data_out		: out std_logic
	);	
end entity;

architecture rlt of CROSSBAR_INTERCONT is
	component PMT1_HVT
	port
	(
			G		: in   std_logic;
			S		: in   std_logic;
			D		: out  std_logic
	);
	end component;

	component NMT1_HVT
	port
	(
			G		: in   std_logic;
			S		: in   std_logic;
			D		: out  std_logic
	);
	end component;

	component PMT3_HVT
	port
	(
			G		: in   std_logic;
			S		: in   std_logic;
			D		: out  std_logic
	);
	end component;

	component NMT3_HVT
	port
	(
			G		: in   std_logic;
			S		: in   std_logic;
			D		: out  std_logic
	);
	end component;

begin

	crossbar_gen: for i in 0 to (width-1) generate
			inst_NMT: NMT1_HVT port map (G => addr_in(i), S => data_in(i), D => data_out);
			--inst_PMT_HVT: PMT1_HVT port map (G => addr_in(i), S => data_in(i), D => data_out);
	end generate crossbar_gen;

end architecture;

--------------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------------
library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;
	use IEEE.std_logic_textio.all;
	use IEEE.math_real.all;

library STD;
	use STD.textio.all;

entity TOP_INTERCONT is
	generic
	(	
			width				: natural:=64					-- power of mux_size
	);
	port 
	(
			data0_mux_based_in		: in  std_logic_vector(width-1 downto 0);
			addr0_mux_based_in		: in  std_logic_vector(natural(log2(real(width)))-1 downto 0);
			data0_mux_based_out		: out std_logic;

			data1_mux_based_in		: in  std_logic_vector(width-1 downto 0);
			addr1_mux_based_in		: in  std_logic_vector(natural(log2(real(width)))-1 downto 0);
			data1_mux_based_out		: out std_logic;

			data2_mux_based_in		: in  std_logic_vector(width-1 downto 0);
			addr2_mux_based_in		: in  std_logic_vector(natural(log2(real(width)))-1 downto 0);
			data2_mux_based_out		: out std_logic;

			data_shared_bus_in		: in  std_logic_vector(width-1 downto 0);
			addr_shared_bus_in		: in  std_logic_vector(width-1 downto 0);
			data_shared_bus_out		: out std_logic;

			data_crossbar_in			: in  std_logic_vector(width-1 downto 0);
			addr_crossbar_in			: in  std_logic_vector(width-1 downto 0);
			data_crossbar_out			: out std_logic

	);	
end entity;

architecture rtl of TOP_INTERCONT is 
	component MUX_BASED_INTERCONT
		generic
		(	
				muxsize			: natural:=4;					-- power of 2
				width				: natural:=64					-- power of mux_size
		);
		port 
		(
				data_in			: in  std_logic_vector(width-1            				  downto 0);
				addr_in			: in  std_logic_vector(natural(log2(real(width)))-1 downto 0);
				data_out		: out std_logic
		);	
	end component;

	component SHARED_BUS_INTERCONT
		generic
		(	
				width				: natural:=64					-- power of mux_size
		);
		port 
		(
				data_in			: in  std_logic_vector(width-1 downto 0);
				addr_in			: in  std_logic_vector(width-1 downto 0);
				data_out		: out std_logic
		);	
	end component;

	component CROSSBAR_INTERCONT 
		generic
		(	
				width				: natural:=64					-- power of mux_size
		);
		port 
		(
				data_in			: in  std_logic_vector(width-1 downto 0);
				addr_in			: in  std_logic_vector(width-1 downto 0);
				data_out		: out std_logic
		);	
	end component;

begin
	
	inst_MUX_BASED_INTERCONT_2_64: MUX_BASED_INTERCONT generic map  (muxsize   => 2, width => width)
																										 port    map  (data_in   => data0_mux_based_in, 
																																	 addr_in   => addr0_mux_based_in(natural(log2(real(width)))-1 downto 0), 
																																	 data_out  => data0_mux_based_out);

	inst_MUX_BASED_INTERCONT_4_64: MUX_BASED_INTERCONT generic map  (muxsize   => 4, width => width)
																										 port    map  (data_in   => data1_mux_based_in, 
																																	 addr_in   => addr1_mux_based_in(natural(log2(real(width)))-1 downto 0), 
																																	 data_out  => data1_mux_based_out);

	inst_MUX_BASED_INTERCONT_8_64: MUX_BASED_INTERCONT generic map  (muxsize   => 8, width => width)
																										 port    map  (data_in   => data2_mux_based_in, 
																																	 addr_in   => addr2_mux_based_in(natural(log2(real(width)))-1 downto 0), 
																																	 data_out  => data2_mux_based_out);

	inst_SHARED_BUS_INTERCONT		 : SHARED_BUS_INTERCONT generic map (width    => width)
																											port    map (data_in  => data_shared_bus_in,
																																	 addr_in  => addr_shared_bus_in,
																																   data_out => data_shared_bus_out);

	inst_CROSSBAR_INTERCONT      : CROSSBAR_INTERCONT   generic map (width    => width)
																											port    map (data_in  => data_crossbar_in,
																																	 addr_in  => addr_crossbar_in,
																																   data_out => data_crossbar_out);

end architecture;
