package assembler

import (
	"bufio"
	"os"
)

func Assembler(filepath string) {
	f,_ := os.Open(filepath)
	defer f.Close()

	sc := bufio.NewScanner(f)

	parser := NewParser(sc)
	for parser.HasMoreCommands() {
		parser.Advance()
		if parser.currentCommand == "" || parser.currentCommand[0:2] == `//` {
			continue
		}
	}
}
