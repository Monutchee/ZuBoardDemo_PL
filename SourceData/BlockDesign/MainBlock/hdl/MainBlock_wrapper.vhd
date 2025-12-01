--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
--Date        : Mon Dec  1 10:14:27 2025
--Host        : lpc1 running 64-bit Ubuntu 24.04.3 LTS
--Command     : generate_target MainBlock_wrapper.bd
--Design      : MainBlock_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainBlock_wrapper is
  port (
    led_pin_extconn : out STD_LOGIC;
    rgb1_led_3bits_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    tempsensor_i2c_pl_scl_io : inout STD_LOGIC;
    tempsensor_i2c_pl_sda_io : inout STD_LOGIC
  );
end MainBlock_wrapper;

architecture STRUCTURE of MainBlock_wrapper is
  component MainBlock is
  port (
    tempsensor_i2c_pl_scl_i : in STD_LOGIC;
    tempsensor_i2c_pl_scl_o : out STD_LOGIC;
    tempsensor_i2c_pl_scl_t : out STD_LOGIC;
    tempsensor_i2c_pl_sda_i : in STD_LOGIC;
    tempsensor_i2c_pl_sda_o : out STD_LOGIC;
    tempsensor_i2c_pl_sda_t : out STD_LOGIC;
    rgb1_led_3bits_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    led_pin_extconn : out STD_LOGIC
  );
  end component MainBlock;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal tempsensor_i2c_pl_scl_i : STD_LOGIC;
  signal tempsensor_i2c_pl_scl_o : STD_LOGIC;
  signal tempsensor_i2c_pl_scl_t : STD_LOGIC;
  signal tempsensor_i2c_pl_sda_i : STD_LOGIC;
  signal tempsensor_i2c_pl_sda_o : STD_LOGIC;
  signal tempsensor_i2c_pl_sda_t : STD_LOGIC;
begin
MainBlock_i: component MainBlock
     port map (
      led_pin_extconn => led_pin_extconn,
      rgb1_led_3bits_tri_o(2 downto 0) => rgb1_led_3bits_tri_o(2 downto 0),
      tempsensor_i2c_pl_scl_i => tempsensor_i2c_pl_scl_i,
      tempsensor_i2c_pl_scl_o => tempsensor_i2c_pl_scl_o,
      tempsensor_i2c_pl_scl_t => tempsensor_i2c_pl_scl_t,
      tempsensor_i2c_pl_sda_i => tempsensor_i2c_pl_sda_i,
      tempsensor_i2c_pl_sda_o => tempsensor_i2c_pl_sda_o,
      tempsensor_i2c_pl_sda_t => tempsensor_i2c_pl_sda_t
    );
tempsensor_i2c_pl_scl_iobuf: component IOBUF
     port map (
      I => tempsensor_i2c_pl_scl_o,
      IO => tempsensor_i2c_pl_scl_io,
      O => tempsensor_i2c_pl_scl_i,
      T => tempsensor_i2c_pl_scl_t
    );
tempsensor_i2c_pl_sda_iobuf: component IOBUF
     port map (
      I => tempsensor_i2c_pl_sda_o,
      IO => tempsensor_i2c_pl_sda_io,
      O => tempsensor_i2c_pl_sda_i,
      T => tempsensor_i2c_pl_sda_t
    );
end STRUCTURE;
