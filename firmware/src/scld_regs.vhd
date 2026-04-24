--
-- TIMEX(tm) SCLD 2068 Model (CPLD Implementation)
--
-- Original work:
--  (c) by Load ZX Spectrum Museum <curator@loadzx.com>
--  (c) by Álvaro Lopes <alvieboy@alvie.com>
--  (c) by Paulo Cortesão <cortesao.paulo@outlook.pt>
--
-- Additional contributors:
--  João Diogo
--  Hugo Pinto
--
-- Extended, fixed and hardware-validated implementation:
--  (c) by António Vítor
--
-- Additional support:
--  Rui Ribeiro
--
-- Description:
--  This version includes fixes and adjustments required to achieve
--  correct behaviour on real Timex Computer 2068 hardware, including:
--   - Timing corrections (MREQ, RAS/CAS)
--   - Improved compatibility with CMOS Z80 CPUs
--   - Bus contention fixes
--   - EXROM behaviour stabilization
--
-- License:
--  This work follows a free/open philosophy similar to GNU licensing:
--   - Free to use
--   - Free to modify
--   - Free to share
--  Please keep derivatives open and share improvements.
--
-- TIMEX is a trademark of TIMEX GROUP USA, INC
-- This project is not affiliated with or endorsed by the trademark holders.
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
library work;


entity scld_regs is
  port (
    -- synthesis translate_off
    simcontrol    : in simcontrol_in_type;
    -- synthesis translate_on
    clk_i         : in std_logic;
    cpuclk_i      : in std_logic;
    hcounter_i    : in std_logic_vector(1 downto 0);
    D_i           : in std_logic_vector(7 downto 0);
    A_i           : in std_logic_vector(15 downto 0);
    IORQ_i        : in std_logic;
	 MREQ_i          : in std_logic;
    WR_i          : in std_logic;
    TS_i          : in std_logic;
    screenmode_o  : out std_logic_vector(2 downto 0);
    hirescolor_o  : out std_logic_vector(2 downto 0);
    disableint_o  : out std_logic;
    bank_o        : out std_logic; -- 0: dock, 1: exrom.
    border_o      : out std_logic_vector(2 downto 0);
    ear_o         : out std_logic;
    banksel_o     : out std_logic_vector(7 downto 0)
  );

end entity scld_regs;

architecture beh of scld_regs is

  -- port FF registers
  signal screenmode_r             : std_logic_vector(2 downto 0) := "000";
  signal hirescolor_r             : std_logic_vector(2 downto 0) := "000";
  signal disableint_r             : std_logic := '0';
  signal bank_r                   : std_logic := '0'; -- 0: dock, 1: exrom.

  -- port FE registers
  signal border_r                 : std_logic_vector(2 downto 0) := "000";
  signal ear_r                    : std_logic := '0';

  -- port F4 registers
  signal banksel_r                : std_logic_vector(7 downto 0) := (others => '0'); -- '0': HOME, '1': DOCK/EXROM

begin

  process(
    -- synthesis translate_off
    simcontrol,
    -- synthesis translate_on
    clk_i)
  begin
    if falling_edge(clk_i) then
      if hcounter_i(1 downto 0)="00" then
        if IORQ_i='0' and WR_i='0' and TS_i='0' and MREQ_i='1' then
          if A_i(7 downto 0)=x"FF" then
            screenmode_r  <= D_i(2 downto 0);
            hirescolor_r  <= D_i(5 downto 3);
            disableint_r  <= D_i(6);
            bank_r        <= D_i(7);
          end if;

          if A_i(7 downto 0)=x"F4" then
            banksel_r     <= D_i;
          end if;

          if A_i(7 downto 0)=x"FE" then
            border_r <= D_i(2 downto 0);
            ear_r    <= D_i(4);
          end if;

        end if;
      end if;
    end if;
   
  end process;

  screenmode_o  <= screenmode_r;
  hirescolor_o  <= hirescolor_r;
  disableint_o  <= disableint_r;
  bank_o        <= bank_r;
  border_o      <= border_r;
  ear_o         <= ear_r;
  banksel_o     <= banksel_r;

end beh;
