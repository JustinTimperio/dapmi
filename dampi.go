package main

import (
	"fmt"
	"os"
	"runtime"
)

func PathExists(name string) bool {
	if _, err := os.Stat(name); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}
	return true
}

func main() {
	if runtime.GOOS == "freebsd" {
		fmt.Println("This is a FreeBSD System!")
	} else if runtime.GOOS == "linux" {
		fmt.Println("This is a Linux System!")
	} else {
		fmt.Println("This is an UNKOWN System!")
	}
}
