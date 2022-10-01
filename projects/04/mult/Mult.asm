// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code

// ROに格納されている値をR1に格納されている値の回数分足す方針で実装する
// R2に初期値0を格納して、R2=R2+R0を繰り返せばいい？
// C命令にラベルは使えない。A命令でラベルを使って、C命令でA,M,Dを使って計算する。
    @i
    M=1
// sumではなくR2
    @R2
    M=0
(LOOP)
    @i
    D=M
    @R1
    D=D-M
    @END
    D;JGT
// 加算していく値はR0の値
    @R0
    D=M
    @R2
    M=D+M
    @i
    M=M+1
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
