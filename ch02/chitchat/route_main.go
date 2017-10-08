package main

import (
	"go-web/ch02/chitchat/data"
	"net/http"
)

// GET /err?msg=
// shows the error message page
func err(w http.ResponseWriter, r *http.Request) {
	vals := r.URL.Query()
	_, err := session(w, r)
	if err != nil {
		generateHTML(w, vals.Get("msg"), "layout", "public.navbar", "error")
	} else {
		generateHTML(w, vals.Get("msg"), "layout", "private.navbar", "error")
	}
}

func index(w http.ResponseWriter, r *http.Request) {
	threads, err := data.Threads()
	if err != nil {
		error_message(w, r, "Cannot get threads")
	} else {
		_, err := session(w, r)
		//public_tmpl_files := []string{"templates/layout.html", "templates/public.navbar.html", "templates/index.html"}
		//private_tmpl_files := []string{"templates/layout.html", "templates/private.navbar.html", "templates/index.html"}
		//var templates *template.Template
		if err != nil {
			generateHTML(w, threads, "layout", "public.navbar", "index")
			//templates = template.Must(template.ParseFiles(private_tmpl_files...))
		} else {
			generateHTML(w, threads, "layout", "private.navbar", "index")
			//templates = template.Must(template.ParseFiles(public_tmpl_files...))
		}
		//templates.ExecuteTemplate(w, "layout", threads)
	}
}
