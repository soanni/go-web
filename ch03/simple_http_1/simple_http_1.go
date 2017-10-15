package main

import (
	"net/http"
)

func main() {
	server := http.Server{
		Addr:    "127.0.0.1:8081",
		Handler: nil,
	}
	server.ListenAndServe()
}
