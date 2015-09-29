package main

import (
        "fmt"
        "net/http"

        "github.com/zenazn/goji"
        "github.com/zenazn/goji/web"
)

func hello(c web.C, w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, %s!", c.URLParams["name"])
}

func main() {
        goji.Get("/bind/:name", hello)
        goji.Get("/yuck/:name", hello)
        goji.Get("/none/:name", hello)
        goji.Get("/bye/:name", hello)
        goji.Get("/hello/:name", hello)
        goji.Serve()
}
