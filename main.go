package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	mux.Handle("GET /", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, World!"))
	}))

	server := &http.Server{
		Addr:    ":8000",
		Handler: mux,
	}

	log.Println("Listening...")
	server.ListenAndServe()
}
