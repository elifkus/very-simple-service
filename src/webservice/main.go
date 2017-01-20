package main 

import (
    "net/http"
    "io/ioutil"
)


func saveHandler(w http.ResponseWriter, r *http.Request) {
	folder := "/PRODUCTION/EXPERIMENT/savedfiles/"
    path := folder + generateRandomURL()
    text := r.FormValue("text")
	ioutil.WriteFile(path, text, 0400)
	
    http.Redirect(w, r, "/"+filename, http.StatusCreated)
}

function generateRandomURL() string {
	return "1234556"
}

func main() {
	http.HandleFunc("/save", saveHandler)
    http.ListenAndServe(":8080", nil)
}

