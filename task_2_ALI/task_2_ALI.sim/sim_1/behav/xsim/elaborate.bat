@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Oct 21 16:36:07 -0700 2019
REM SW Build 2615518 on Fri Aug  9 15:55:25 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto a11d474919464768a40a48adf949fe47 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot fifo_tb_behav xil_defaultlib.fifo_tb xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto a11d474919464768a40a48adf949fe47 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot fifo_tb_behav xil_defaultlib.fifo_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0