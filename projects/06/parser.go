package assembler

import (
	"bufio"
	"strings"
)

type Parser struct {
	currentCommand string
	sc *bufio.Scanner
}

type COMMAND_TYPE int

const (
	// @Xxx
	A_COMMAND COMMAND_TYPE = iota
	// dest=comp;jump
	C_COMMAND
	// (Xxx)
	L_COMMAND
)

func NewParser(sc *bufio.Scanner) *Parser {
	return &Parser{
		currentCommand: "",
		sc: sc,
	}
}

func (p *Parser) HasMoreCommands() bool {
	return p.sc.Scan()
}

func (p *Parser) Advance() {
	p.currentCommand = strings.TrimSpace(p.sc.Text())
}

func (p *Parser) CommandType() COMMAND_TYPE {
	switch string(p.currentCommand[0]) {
	case "@":
		return A_COMMAND
	case "(":
		return L_COMMAND
	default:
		return C_COMMAND
	}
}

func (p *Parser) Symbol() {

}

func (p *Parser) Dest() {

}

func (p *Parser) Comp() {

}

func (p *Parser) Jump() {

}
