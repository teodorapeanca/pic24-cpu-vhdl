VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL New_PC(5:0)
        SIGNAL XLXN_1
        SIGNAL Clk
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL PC(5:0)
        SIGNAL PC(5:1)
        SIGNAL Instr(23:0)
        SIGNAL Instr(18:16)
        SIGNAL Instr(5:0)
        SIGNAL Instr(18:15)
        SIGNAL Instr(14:11)
        SIGNAL RegBase
        SIGNAL Instr(3:0)
        SIGNAL Instr(10:7)
        SIGNAL RegDest
        SIGNAL XLXN_50(3:0)
        SIGNAL WrReg(3:0)
        SIGNAL RegWr
        SIGNAL RdData1(15:0)
        SIGNAL RdData2(15:0)
        SIGNAL ALUOP(2:0)
        SIGNAL CE_NF
        SIGNAL CE_ZF
        SIGNAL CE_OVF
        SIGNAL CE_CF
        SIGNAL INW0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL MemWr
        SIGNAL Instr(8:4)
        SIGNAL OUTW0(15:0)
        SIGNAL Instr(23:19)
        SIGNAL Mem2Reg
        SIGNAL Branch
        SIGNAL XLXN_96(15:0)
        SIGNAL XLXN_100(15:0)
        SIGNAL WrData(15:0)
        PORT Input Clk
        PORT Input INW0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2025 8 31 19 55 55
            LINE N 0 -144 64 -144 
            RECTANGLE N 0 -156 64 -132 
            RECTANGLE N 320 100 384 124 
            LINE N 384 112 320 112 
            LINE N 384 -96 320 -96 
            LINE N 384 48 320 48 
            RECTANGLE N 320 36 384 60 
            RECTANGLE N 64 -176 320 364 
            LINE N 384 176 320 176 
            LINE N 384 224 320 224 
            LINE N 384 272 320 272 
            LINE N 384 320 320 320 
            LINE N 384 -48 320 -48 
            RECTANGLE N 320 -60 384 -36 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2025 8 31 19 57 53
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x24
            TIMESTAMP 2025 9 15 16 45 10
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V5
            TIMESTAMP 2024 12 13 9 14 29
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2024 12 21 12 2 7
            LINE N 64 -416 0 -416 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 416 -428 480 -404 
            LINE N 416 -416 480 -416 
            RECTANGLE N 0 -12 64 12 
            LINE N 64 0 0 0 
            RECTANGLE N 416 -364 480 -340 
            LINE N 416 -352 480 -352 
            RECTANGLE N 0 84 64 108 
            LINE N 64 96 0 96 
            RECTANGLE N 64 -448 416 132 
            LINE N 64 -352 0 -352 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2025 1 8 7 39 47
            LINE N 64 -16 0 -16 
            LINE N 64 48 0 48 
            LINE N 64 112 0 112 
            LINE N 64 176 0 176 
            LINE N 64 240 0 240 
            LINE N 320 -16 384 -16 
            LINE N 320 48 384 48 
            LINE N 320 112 384 112 
            LINE N 320 176 384 176 
            RECTANGLE N 0 -284 64 -260 
            LINE N 64 -272 0 -272 
            LINE N 64 -208 0 -208 
            RECTANGLE N 0 -220 64 -196 
            LINE N 64 -80 0 -80 
            RECTANGLE N 0 -92 64 -68 
            LINE N 320 -80 384 -80 
            RECTANGLE N 320 -92 384 -68 
            RECTANGLE N 64 -320 320 276 
            LINE N 64 -144 0 -144 
            RECTANGLE N 0 -156 64 -132 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2024 12 18 7 40 7
            RECTANGLE N 0 68 64 92 
            LINE N 64 80 0 80 
            RECTANGLE N 0 132 64 156 
            LINE N 64 144 0 144 
            RECTANGLE N 384 132 448 156 
            LINE N 384 144 448 144 
            LINE N 64 16 0 16 
            RECTANGLE N 64 -240 384 188 
            LINE N 64 -208 0 -208 
            RECTANGLE N 0 -156 64 -132 
            LINE N 64 -144 0 -144 
            RECTANGLE N 384 -156 448 -132 
            LINE N 384 -144 448 -144 
            RECTANGLE N 0 -92 64 -68 
            LINE N 64 -80 0 -80 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrl
            TIMESTAMP 2024 12 21 12 20 31
            LINE N 320 96 384 96 
            LINE N 320 160 384 160 
            LINE N 320 224 384 224 
            LINE N 320 288 384 288 
            LINE N 320 352 384 352 
            LINE N 320 32 384 32 
            RECTANGLE N 0 -364 64 -340 
            LINE N 64 -352 0 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 64 -384 320 384 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2024 12 21 12 29 13
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 PC_Update
            PIN Branch XLXN_1
            PIN NF XLXN_11
            PIN ZF XLXN_12
            PIN CF XLXN_13
            PIN OVF XLXN_14
            PIN Funct(2:0) Instr(18:16)
            PIN Offset(5:0) Instr(5:0)
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 ROM32x24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 MUX2V5
            PIN Sel RegBase
            PIN I0(3:0) Instr(18:15)
            PIN I1(3:0) Instr(14:11)
            PIN Y(3:0) XLXN_50(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 MUX2V5
            PIN Sel RegDest
            PIN I0(3:0) Instr(3:0)
            PIN I1(3:0) Instr(10:7)
            PIN Y(3:0) WrReg(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_10 ALU
            PIN Clk Clk
            PIN CE_NF CE_NF
            PIN CE_ZF CE_ZF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN RdData1(15:0) RdData1(15:0)
            PIN RdData2(15:0) RdData2(15:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN NF
            PIN ZF
            PIN CF
            PIN OVF
            PIN Y(15:0) XLXN_100(15:0)
            PIN lit4(3:0) Instr(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdReg1(3:0) XLXN_50(3:0)
            PIN RdReg2(3:0) Instr(3:0)
            PIN WrReg(3:0) WrReg(3:0)
            PIN WrData(15:0) WrData(15:0)
            PIN RdData1(15:0) RdData1(15:0)
            PIN RdData2(15:0) RdData2(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_12 DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) INW0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) RdData2(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) XLXN_96(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_13 ctrl
            PIN OP(4:0) Instr(23:19)
            PIN MemWr MemWr
            PIN Mem2Reg Mem2Reg
            PIN RegWr RegWr
            PIN RegDest RegDest
            PIN RegBase RegBase
            PIN Branch Branch
            PIN CE_NF CE_NF
            PIN CE_ZF CE_ZF
            PIN CE_OVF CE_OVF
            PIN CE_CF CE_CF
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
        BEGIN BLOCK XLXI_16 MUX2V16
            PIN Sel Mem2Reg
            PIN Y(15:0) WrData(15:0)
            PIN I1(15:0) XLXN_96(15:0)
            PIN I0(15:0) XLXN_100(15:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN INSTANCE XLXI_1 128 512 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 544 1248 R0
        END INSTANCE
        BEGIN BRANCH New_PC(5:0)
            WIRE 80 368 128 368
            WIRE 80 368 80 1216
            WIRE 80 1216 240 1216
            WIRE 240 1216 544 1216
            BEGIN DISPLAY 240 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_1
            WIRE 512 416 640 416
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 512 1152 544 1152
        END BRANCH
        BEGIN INSTANCE XLXI_3 1232 1296 R0
        END INSTANCE
        BEGIN BRANCH XLXN_11
            WIRE 512 688 640 688
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 512 736 640 736
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 512 784 640 784
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 512 832 640 832
        END BRANCH
        BEGIN BRANCH PC(5:0)
            WIRE 512 624 816 624
            WIRE 816 624 1072 624
            WIRE 1072 624 1072 1152
            WIRE 1072 1152 1072 1264
            WIRE 1072 1264 1072 1568
            WIRE 928 1152 1072 1152
            BEGIN DISPLAY 816 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1072 1264 1168 1264
        BEGIN BRANCH PC(5:1)
            WIRE 1168 1264 1184 1264
            WIRE 1184 1264 1232 1264
            BEGIN DISPLAY 1184 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 512 1152 Clk R180 28
        BUSTAP 1648 464 1552 464
        BEGIN BRANCH Instr(18:16)
            WIRE 512 464 912 464
            WIRE 912 464 1552 464
            BEGIN DISPLAY 912 464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1648 560 1552 560
        BEGIN BRANCH Instr(5:0)
            WIRE 512 560 976 560
            WIRE 976 560 1552 560
            BEGIN DISPLAY 976 560 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1648 624 1744 624
        BEGIN BRANCH Instr(18:15)
            WIRE 1744 624 1760 624
            WIRE 1760 624 1808 624
            BEGIN DISPLAY 1760 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_7 1808 784 R0
        END INSTANCE
        BEGIN BRANCH Instr(23:0)
            WIRE 1616 1264 1648 1264
            WIRE 1648 1264 1648 1280
            WIRE 1648 1280 1648 1344
            WIRE 1648 1344 1648 1616
            WIRE 1648 1616 1648 1952
            WIRE 1648 1952 1648 2272
            WIRE 1632 272 1648 272
            WIRE 1648 272 1648 384
            WIRE 1648 384 1648 464
            WIRE 1648 464 1648 560
            WIRE 1648 560 1648 624
            WIRE 1648 624 1648 688
            WIRE 1648 688 1648 720
            WIRE 1648 720 1648 880
            WIRE 1648 880 1648 1264
            BEGIN DISPLAY 1648 720 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1648 688 1744 688
        BEGIN BRANCH Instr(14:11)
            WIRE 1744 688 1792 688
            WIRE 1792 688 1808 688
            BEGIN DISPLAY 1792 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 1744 752 1760 752
            WIRE 1760 752 1808 752
            BEGIN DISPLAY 1760 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_8 1824 1440 R0
        END INSTANCE
        BUSTAP 1648 1280 1744 1280
        BEGIN BRANCH Instr(3:0)
            WIRE 1744 1280 1776 1280
            WIRE 1776 1280 1824 1280
            BEGIN DISPLAY 1776 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1648 1344 1744 1344
        BEGIN BRANCH Instr(10:7)
            WIRE 1744 1344 1792 1344
            WIRE 1792 1344 1824 1344
            BEGIN DISPLAY 1792 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 1744 1408 1776 1408
            WIRE 1776 1408 1824 1408
            BEGIN DISPLAY 1776 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_50(3:0)
            WIRE 2192 624 2208 624
            WIRE 2208 624 2208 816
            WIRE 2208 816 2384 816
        END BRANCH
        BUSTAP 1648 880 1744 880
        BEGIN BRANCH Instr(3:0)
            WIRE 1744 880 1936 880
            WIRE 1936 880 2384 880
            BEGIN DISPLAY 1936 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrReg(3:0)
            WIRE 2208 1280 2256 1280
            WIRE 2256 1040 2384 1040
            WIRE 2256 1040 2256 1280
            BEGIN DISPLAY 2256 1280 ATTR Name
                ALIGNMENT SOFT-TCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2304 624 2336 624
            WIRE 2336 624 2384 624
            BEGIN DISPLAY 2336 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2304 688 2384 688
            BEGIN DISPLAY 2304 688 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_10 3040 896 R0
        END INSTANCE
        BEGIN BRANCH RdData1(15:0)
            WIRE 2864 624 2928 624
            WIRE 2928 624 3040 624
            BEGIN DISPLAY 2928 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdData2(15:0)
            WIRE 2864 688 2880 688
            WIRE 2880 688 2928 688
            WIRE 2928 688 3040 688
            WIRE 2880 688 2880 1248
            WIRE 2880 1248 3728 1248
            WIRE 3728 928 3728 1248
            BEGIN DISPLAY 2928 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_9 2384 1040 R0
        END INSTANCE
        BUSTAP 1648 384 1744 384
        BEGIN BRANCH Instr(3:0)
            WIRE 1744 384 2336 384
            WIRE 2336 384 2912 384
            WIRE 2912 384 2912 752
            WIRE 2912 752 3040 752
            BEGIN DISPLAY 2336 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2912 816 2928 816
            WIRE 2928 816 3040 816
            BEGIN DISPLAY 2928 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2912 880 2960 880
            WIRE 2960 880 3040 880
            BEGIN DISPLAY 2960 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 2928 944 2976 944
            WIRE 2976 944 3040 944
            BEGIN DISPLAY 2976 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 2912 1008 2976 1008
            WIRE 2976 1008 3040 1008
            BEGIN DISPLAY 2976 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 2928 1072 3024 1072
            WIRE 3024 1072 3040 1072
            BEGIN DISPLAY 3024 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 2912 1136 2976 1136
            WIRE 2976 1136 3040 1136
            BEGIN DISPLAY 2976 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_12 3728 784 R0
        END INSTANCE
        BEGIN BRANCH Clk
            WIRE 3616 576 3680 576
            WIRE 3680 576 3728 576
            BEGIN DISPLAY 3680 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH INW0(15:0)
            WIRE 3680 640 3728 640
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 3680 704 3728 704
        END BRANCH
        IOMARKER 3680 640 INW0(15:0) R180 28
        IOMARKER 3680 704 INW1(15:0) R180 28
        BEGIN BRANCH MemWr
            WIRE 3600 800 3632 800
            WIRE 3632 800 3728 800
            BEGIN DISPLAY 3632 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1648 1616 1744 1616
        BEGIN BRANCH Instr(8:4)
            WIRE 1744 1616 2752 1616
            WIRE 2752 1616 3488 1616
            WIRE 3488 864 3488 1616
            WIRE 3488 864 3728 864
            BEGIN DISPLAY 2752 1616 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUTW0(15:0)
            WIRE 4176 640 4208 640
        END BRANCH
        IOMARKER 4208 640 OUTW0(15:0) R0 28
        BEGIN INSTANCE XLXI_13 1856 2304 R0
        END INSTANCE
        BUSTAP 1648 1952 1744 1952
        BEGIN BRANCH Instr(23:19)
            WIRE 1744 1952 1760 1952
            WIRE 1760 1952 1856 1952
            BEGIN DISPLAY 1760 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 2240 2016 2272 2016
            WIRE 2272 2016 2288 2016
            BEGIN DISPLAY 2272 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 2240 2080 2256 2080
            WIRE 2256 2080 2288 2080
            BEGIN DISPLAY 2256 2080 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2240 2144 2272 2144
            WIRE 2272 2144 2288 2144
            BEGIN DISPLAY 2272 2144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 2240 2208 2272 2208
            WIRE 2272 2208 2304 2208
            BEGIN DISPLAY 2272 2208 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2240 2272 2288 2272
            WIRE 2288 2272 2320 2272
            BEGIN DISPLAY 2288 2272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch
            WIRE 2240 2336 2272 2336
            WIRE 2272 2336 2304 2336
            BEGIN DISPLAY 2272 2336 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 2240 2400 2288 2400
            WIRE 2288 2400 2320 2400
            BEGIN DISPLAY 2288 2400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 2240 2464 2304 2464
            WIRE 2304 2464 2336 2464
            BEGIN DISPLAY 2304 2464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 2240 2528 2304 2528
            WIRE 2304 2528 2320 2528
            BEGIN DISPLAY 2304 2528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 2240 2592 2304 2592
            WIRE 2304 2592 2320 2592
            BEGIN DISPLAY 2304 2592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 2240 2656 2288 2656
            WIRE 2288 2656 2320 2656
            BEGIN DISPLAY 2288 2656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_96(15:0)
            WIRE 4176 928 4464 928
        END BRANCH
        BEGIN INSTANCE XLXI_16 4464 1024 R0
        END INSTANCE
        BEGIN BRANCH Mem2Reg
            WIRE 4320 864 4368 864
            WIRE 4368 864 4464 864
            BEGIN DISPLAY 4368 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_100(15:0)
            WIRE 3424 816 3568 816
            WIRE 3568 816 3568 1072
            WIRE 3568 1072 4464 1072
            WIRE 4464 992 4464 1072
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2352 1136 2384 1136
            WIRE 2352 1136 2352 1360
            WIRE 2352 1360 4000 1360
            WIRE 4000 1360 4912 1360
            WIRE 4848 864 4912 864
            WIRE 4912 864 4912 1360
            BEGIN DISPLAY 4000 1360 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
