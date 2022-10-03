// You can edit this code!
// Click here and start typing.
package main

import "fmt"
import "time"

type Buffer struct {
	buffer              string
	tamanho, capacidade int
}

const TAMANHO_INICIAL = 0
const CAPACIDADE = 100

var lock chan int = make(chan int, 1)

func threadInserir(buf *Buffer, c string) {
	for i := 0; i < 500; i++ {
		inserir(buf, c)
		time.Sleep(50 * time.Millisecond)
	}
}

func inserir(buf *Buffer, c string) {
	lock <- 0
	if buf.tamanho < buf.capacidade {
		buf.buffer = buf.buffer + c
		buf.tamanho++
		<- lock
	} else {
		<- lock
		pausa()
	}
}

func esvaziar(buf *Buffer) (string) {
	for buf.tamanho < buf.capacidade {
		pausa()
	}
	lock <- 1
	buf.tamanho = 0
	resultado := buf.buffer
	buf.buffer = ""
	<- lock
	return resultado
}

func pausa(){
 	time.Sleep(100*time.Millisecond)	
}

func main() {
	var buffer = Buffer{"", TAMANHO_INICIAL, CAPACIDADE}
	go threadInserir(&buffer, "1")
	go threadInserir(&buffer, "2")
	go threadInserir(&buffer, "3")
	
	for i := 0; i < 10; i++ {
		resultado := esvaziar(&buffer)

		fmt.Printf("\n\nImpressao # %v:\n Buffer = %s -> Tamanho: %v", (i+1), resultado, len(resultado))
	}

	fmt.Println("\n\nMain terminou.")
}
