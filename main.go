package main

import (
	"flag"
	"log"
)

func main() {
	var flgC = flag.String("c", "", "ContainerID/Name")
	flag.Parse()
	log.Printf(*flgC)
	runWatch("\\Qmysqld: ready for connections.\\E", 2, "docker", "logs", "-f", *flgC)
}
