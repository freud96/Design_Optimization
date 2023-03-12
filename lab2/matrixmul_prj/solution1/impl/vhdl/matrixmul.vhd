-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matrixmul is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    b_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    b_empty_n : IN STD_LOGIC;
    b_read : OUT STD_LOGIC;
    a_dout : IN STD_LOGIC_VECTOR (23 downto 0);
    a_empty_n : IN STD_LOGIC;
    a_read : OUT STD_LOGIC;
    res_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    res_full_n : IN STD_LOGIC;
    res_write : OUT STD_LOGIC );
end;


architecture behav of matrixmul is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "matrixmul_matrixmul,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu50-fsvh2104-2L-e,HLS_INPUT_CLOCK=13.333000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.862000,HLS_SYN_LAT=17,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=234,HLS_SYN_LUT=317,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_9 : STD_LOGIC_VECTOR (3 downto 0) := "1001";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal select_ln58_1_reg_454 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal icmp_ln70_reg_458 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln70_reg_458_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln63_fu_187_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal a_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal b_blk_n : STD_LOGIC;
    signal res_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal select_ln58_fu_211_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln58_reg_449 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln58_1_fu_237_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln70_fu_253_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal b_copy_addr_reg_462 : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_addr_reg_462_pp0_iter2_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_addr_reg_462_pp0_iter3_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_1_addr_reg_467 : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_1_addr_reg_467_pp0_iter2_reg : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_2_addr_reg_472 : STD_LOGIC_VECTOR (1 downto 0);
    signal a_row_load_reg_477 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_load_reg_477_pp0_iter4_reg : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_1_load_reg_482 : STD_LOGIC_VECTOR (7 downto 0);
    signal mul_ln82_fu_383_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_389_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal b_copy_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_ce0 : STD_LOGIC;
    signal b_copy_we0 : STD_LOGIC;
    signal b_copy_d0 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_ce1 : STD_LOGIC;
    signal b_copy_q1 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_1_ce0 : STD_LOGIC;
    signal b_copy_1_we0 : STD_LOGIC;
    signal b_copy_1_d0 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_1_ce1 : STD_LOGIC;
    signal b_copy_1_q1 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_address0 : STD_LOGIC_VECTOR (1 downto 0);
    signal b_copy_2_ce0 : STD_LOGIC;
    signal b_copy_2_we0 : STD_LOGIC;
    signal b_copy_2_d0 : STD_LOGIC_VECTOR (7 downto 0);
    signal b_copy_2_ce1 : STD_LOGIC;
    signal b_copy_2_q1 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln65_fu_280_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal j_fu_66 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln65_fu_259_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_j_load : STD_LOGIC_VECTOR (1 downto 0);
    signal i_fu_70 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln63_fu_245_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_allocacmp_i_load : STD_LOGIC_VECTOR (1 downto 0);
    signal indvar_flatten_fu_74 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln63_fu_193_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_sig_allocacmp_indvar_flatten_load : STD_LOGIC_VECTOR (3 downto 0);
    signal a_row_fu_78 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_3_fu_313_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_1_fu_82 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_row_2_fu_86 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_397_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal icmp_ln65_fu_205_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln63_1_fu_219_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal cmp14_mid1_fu_225_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp144_fu_231_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_389_ce : STD_LOGIC;
    signal grp_fu_397_ce : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_221 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component matrixmul_mul_8s_8s_16_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component matrixmul_mac_muladd_8s_8s_16s_16_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component matrixmul_mac_muladd_8s_8s_16ns_16_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component matrixmul_b_copy_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (1 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (7 downto 0);
        address1 : IN STD_LOGIC_VECTOR (1 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


    component matrixmul_flow_control_loop_pipe IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC;
        ap_continue : IN STD_LOGIC );
    end component;



begin
    b_copy_U : component matrixmul_b_copy_RAM_AUTO_1R1W
    generic map (
        DataWidth => 8,
        AddressRange => 3,
        AddressWidth => 2)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => b_copy_address0,
        ce0 => b_copy_ce0,
        we0 => b_copy_we0,
        d0 => b_copy_d0,
        address1 => b_copy_addr_reg_462_pp0_iter3_reg,
        ce1 => b_copy_ce1,
        q1 => b_copy_q1);

    b_copy_1_U : component matrixmul_b_copy_RAM_AUTO_1R1W
    generic map (
        DataWidth => 8,
        AddressRange => 3,
        AddressWidth => 2)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => b_copy_1_address0,
        ce0 => b_copy_1_ce0,
        we0 => b_copy_1_we0,
        d0 => b_copy_1_d0,
        address1 => b_copy_1_addr_reg_467_pp0_iter2_reg,
        ce1 => b_copy_1_ce1,
        q1 => b_copy_1_q1);

    b_copy_2_U : component matrixmul_b_copy_RAM_AUTO_1R1W
    generic map (
        DataWidth => 8,
        AddressRange => 3,
        AddressWidth => 2)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => b_copy_2_address0,
        ce0 => b_copy_2_ce0,
        we0 => b_copy_2_we0,
        d0 => b_copy_2_d0,
        address1 => b_copy_2_addr_reg_472,
        ce1 => b_copy_2_ce1,
        q1 => b_copy_2_q1);

    mul_8s_8s_16_1_1_U1 : component matrixmul_mul_8s_8s_16_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        dout_WIDTH => 16)
    port map (
        din0 => b_copy_q1,
        din1 => a_row_load_reg_477_pp0_iter4_reg,
        dout => mul_ln82_fu_383_p2);

    mac_muladd_8s_8s_16s_16_4_1_U2 : component matrixmul_mac_muladd_8s_8s_16s_16_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => b_copy_2_q1,
        din1 => a_row_2_fu_86,
        din2 => mul_ln82_fu_383_p2,
        ce => grp_fu_389_ce,
        dout => grp_fu_389_p3);

    mac_muladd_8s_8s_16ns_16_4_1_U3 : component matrixmul_mac_muladd_8s_8s_16ns_16_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => b_copy_1_q1,
        din1 => a_row_1_load_reg_482,
        din2 => grp_fu_389_p3,
        ce => grp_fu_397_ce,
        dout => grp_fu_397_p3);

    flow_control_loop_pipe_U : component matrixmul_flow_control_loop_pipe
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int,
        ap_continue => ap_const_logic_1);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    i_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_221)) then
                if ((icmp_ln63_fu_187_p2 = ap_const_lv1_0)) then 
                    i_fu_70 <= select_ln63_fu_245_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_70 <= ap_const_lv2_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_74_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_221)) then
                if ((icmp_ln63_fu_187_p2 = ap_const_lv1_0)) then 
                    indvar_flatten_fu_74 <= add_ln63_fu_193_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_74 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;

    j_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_221)) then
                if ((icmp_ln63_fu_187_p2 = ap_const_lv1_0)) then 
                    j_fu_66 <= add_ln65_fu_259_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_66 <= ap_const_lv2_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                a_row_1_fu_82 <= a_dout(15 downto 8);
                a_row_2_fu_86 <= a_dout(23 downto 16);
                a_row_fu_78 <= a_row_3_fu_313_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                a_row_1_load_reg_482 <= a_row_1_fu_82;
                a_row_load_reg_477 <= a_row_fu_78;
                a_row_load_reg_477_pp0_iter4_reg <= a_row_load_reg_477;
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                b_copy_1_addr_reg_467_pp0_iter2_reg <= b_copy_1_addr_reg_467;
                b_copy_addr_reg_462_pp0_iter2_reg <= b_copy_addr_reg_462;
                b_copy_addr_reg_462_pp0_iter3_reg <= b_copy_addr_reg_462_pp0_iter2_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                b_copy_1_addr_reg_467 <= zext_ln65_fu_280_p1(2 - 1 downto 0);
                b_copy_2_addr_reg_472 <= zext_ln65_fu_280_p1(2 - 1 downto 0);
                b_copy_addr_reg_462 <= zext_ln65_fu_280_p1(2 - 1 downto 0);
                icmp_ln70_reg_458_pp0_iter1_reg <= icmp_ln70_reg_458;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln63_fu_187_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln70_reg_458 <= icmp_ln70_fu_253_p2;
                select_ln58_1_reg_454 <= select_ln58_1_fu_237_p3;
                select_ln58_reg_449 <= select_ln58_fu_211_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    a_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, a_empty_n, icmp_ln70_reg_458_pp0_iter1_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            a_blk_n <= a_empty_n;
        else 
            a_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    a_read_assign_proc : process(ap_enable_reg_pp0_iter2, icmp_ln70_reg_458_pp0_iter1_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            a_read <= ap_const_logic_1;
        else 
            a_read <= ap_const_logic_0;
        end if; 
    end process;

    a_row_3_fu_313_p1 <= a_dout(8 - 1 downto 0);
    add_ln63_1_fu_219_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_load) + unsigned(ap_const_lv2_1));
    add_ln63_fu_193_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten_load) + unsigned(ap_const_lv4_1));
    add_ln65_fu_259_p2 <= std_logic_vector(unsigned(select_ln58_fu_211_p3) + unsigned(ap_const_lv2_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, b_empty_n, select_ln58_1_reg_454, a_empty_n, icmp_ln70_reg_458_pp0_iter1_reg, res_full_n)
    begin
                ap_block_pp0_stage0_01001 <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1)) or ((icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_logic_0 = a_empty_n) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((select_ln58_1_reg_454 = ap_const_lv1_1) and (b_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, b_empty_n, select_ln58_1_reg_454, a_empty_n, icmp_ln70_reg_458_pp0_iter1_reg, res_full_n)
    begin
                ap_block_pp0_stage0_11001 <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1)) or ((icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_logic_0 = a_empty_n) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((select_ln58_1_reg_454 = ap_const_lv1_1) and (b_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, b_empty_n, select_ln58_1_reg_454, a_empty_n, icmp_ln70_reg_458_pp0_iter1_reg, res_full_n)
    begin
                ap_block_pp0_stage0_subdone <= (((res_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1)) or ((icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_logic_0 = a_empty_n) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((select_ln58_1_reg_454 = ap_const_lv1_1) and (b_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(b_empty_n, select_ln58_1_reg_454)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((select_ln58_1_reg_454 = ap_const_lv1_1) and (b_empty_n = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(a_empty_n, icmp_ln70_reg_458_pp0_iter1_reg)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((icmp_ln70_reg_458_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_logic_0 = a_empty_n));
    end process;

        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state8_pp0_stage0_iter7_assign_proc : process(res_full_n)
    begin
                ap_block_state8_pp0_stage0_iter7 <= (res_full_n = ap_const_logic_0);
    end process;


    ap_condition_221_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_221 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln63_fu_187_p2)
    begin
        if (((icmp_ln63_fu_187_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter6_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7)
    begin
        if (((ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, ap_loop_init, i_fu_70)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_i_load <= ap_const_lv2_0;
        else 
            ap_sig_allocacmp_i_load <= i_fu_70;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, ap_loop_init, indvar_flatten_fu_74)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_indvar_flatten_load <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_indvar_flatten_load <= indvar_flatten_fu_74;
        end if; 
    end process;


    ap_sig_allocacmp_j_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, j_fu_66, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_j_load <= ap_const_lv2_0;
        else 
            ap_sig_allocacmp_j_load <= j_fu_66;
        end if; 
    end process;


    b_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, b_empty_n, select_ln58_1_reg_454, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (select_ln58_1_reg_454 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_blk_n <= b_empty_n;
        else 
            b_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    b_copy_1_address0 <= zext_ln65_fu_280_p1(2 - 1 downto 0);

    b_copy_1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_1_ce0 <= ap_const_logic_1;
        else 
            b_copy_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    b_copy_1_ce1_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            b_copy_1_ce1 <= ap_const_logic_1;
        else 
            b_copy_1_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    b_copy_1_d0 <= b_dout(15 downto 8);

    b_copy_1_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, select_ln58_1_reg_454, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (select_ln58_1_reg_454 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_1_we0 <= ap_const_logic_1;
        else 
            b_copy_1_we0 <= ap_const_logic_0;
        end if; 
    end process;

    b_copy_2_address0 <= zext_ln65_fu_280_p1(2 - 1 downto 0);

    b_copy_2_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_2_ce0 <= ap_const_logic_1;
        else 
            b_copy_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    b_copy_2_ce1_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            b_copy_2_ce1 <= ap_const_logic_1;
        else 
            b_copy_2_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    b_copy_2_d0 <= b_dout(23 downto 16);

    b_copy_2_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, select_ln58_1_reg_454, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (select_ln58_1_reg_454 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_2_we0 <= ap_const_logic_1;
        else 
            b_copy_2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    b_copy_address0 <= zext_ln65_fu_280_p1(2 - 1 downto 0);

    b_copy_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_ce0 <= ap_const_logic_1;
        else 
            b_copy_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    b_copy_ce1_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            b_copy_ce1 <= ap_const_logic_1;
        else 
            b_copy_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    b_copy_d0 <= b_dout(8 - 1 downto 0);

    b_copy_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, select_ln58_1_reg_454, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (select_ln58_1_reg_454 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_copy_we0 <= ap_const_logic_1;
        else 
            b_copy_we0 <= ap_const_logic_0;
        end if; 
    end process;


    b_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, select_ln58_1_reg_454, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (select_ln58_1_reg_454 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            b_read <= ap_const_logic_1;
        else 
            b_read <= ap_const_logic_0;
        end if; 
    end process;

    cmp144_fu_231_p2 <= "1" when (ap_sig_allocacmp_i_load = ap_const_lv2_0) else "0";
    cmp14_mid1_fu_225_p2 <= "1" when (add_ln63_1_fu_219_p2 = ap_const_lv2_0) else "0";

    grp_fu_389_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_389_ce <= ap_const_logic_1;
        else 
            grp_fu_389_ce <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_397_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            grp_fu_397_ce <= ap_const_logic_1;
        else 
            grp_fu_397_ce <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln63_fu_187_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten_load = ap_const_lv4_9) else "0";
    icmp_ln65_fu_205_p2 <= "1" when (ap_sig_allocacmp_j_load = ap_const_lv2_3) else "0";
    icmp_ln70_fu_253_p2 <= "1" when (select_ln58_fu_211_p3 = ap_const_lv2_0) else "0";

    res_blk_n_assign_proc : process(ap_enable_reg_pp0_iter7, res_full_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1))) then 
            res_blk_n <= res_full_n;
        else 
            res_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    res_din <= grp_fu_397_p3;

    res_write_assign_proc : process(ap_enable_reg_pp0_iter7, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1))) then 
            res_write <= ap_const_logic_1;
        else 
            res_write <= ap_const_logic_0;
        end if; 
    end process;

    select_ln58_1_fu_237_p3 <= 
        cmp14_mid1_fu_225_p2 when (icmp_ln65_fu_205_p2(0) = '1') else 
        cmp144_fu_231_p2;
    select_ln58_fu_211_p3 <= 
        ap_const_lv2_0 when (icmp_ln65_fu_205_p2(0) = '1') else 
        ap_sig_allocacmp_j_load;
    select_ln63_fu_245_p3 <= 
        add_ln63_1_fu_219_p2 when (icmp_ln65_fu_205_p2(0) = '1') else 
        ap_sig_allocacmp_i_load;
    zext_ln65_fu_280_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln58_reg_449),64));
end behav;