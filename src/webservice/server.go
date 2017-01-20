package main 

import (
    "net/http"
    "io/ioutil"
    "os"
)


func saveHandler(w http.ResponseWriter, r *http.Request) {
	folder := "/PRODUCTION/EXPERIMENT/web/savedfiles/"
    filename := generateRandomURL()
    path := folder + filename
    
    if _, err := os.Stat(path); err != nil {
	    if os.IsNotExist(err) {
		    http.Error(w, err.Error(), http.StatusInternalServerError)
		    return
	    }
    }
    
    r.ParseForm() 
    text := r.Form.Get("text")
	ioutil.WriteFile(path, []byte(text), 0400)
	
	http.Redirect(w, r, "http://experiment.safkanyazilim.com/"+filename, http.StatusCreated)
}

func generateRandomURL() string {
	return "1234556"
}

func main() {
	http.HandleFunc("/save", saveHandler)
    http.ListenAndServe(":8080", nil)
}

