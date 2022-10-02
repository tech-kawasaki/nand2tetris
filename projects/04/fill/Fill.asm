// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    // スクリーンのアドレス範囲は16384-24575
    // 0のアドレスに24575を格納
    @24575
    D=A
    @0
    M=D
    // 1のアドレスに16384を格納
    @SCREEN
    D=A
    @1
    M=D
    // キーボード入力があればFILLに移動、なければCLEARに移動
(LOOP)
    @KBD
    D=M
    @FILL
    D;JGT
    @CLEAR
    0;JMP
(FILL)
    // 24575までのアドレスを一つずつ黒にしていく
    @0
    D=M
    @1
    D=D-M
    @LOOP
    D;JLT
    @1
    D=M
    A=M
    // -1は全てのbitが1なのでスクリーンのこのワード範囲を黒にしている
    M=-1
    // 1つ後のアドレスを@1に格納
    @1
    M=D+1
    @LOOP
    0;JMP
(CLEAR)
    // 16384までのアドレスを戻りながら一つずつ白にしていく
    @SCREEN
    D=A
    @1
    D=D-M
    @LOOP
    D;JGT
    @1
    D=M
    A=M
    M=0
    @1
    // 1つ前のアドレスを@1に格納
    M=D-1
    @LOOP
    0;JMP
