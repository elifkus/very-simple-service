package main 

import (
    "net/http"
    "io/ioutil"
    "os"
    "log"
)


func saveHandler(w http.ResponseWriter, r *http.Request) {
	folder := "/PRODUCTION/EXPERIMENT/web/savedfiles/"
    filename := generateRandomURL()
    path := folder + filename
    
    if _, err := os.Stat(path); err != nil {
	    if !(os.IsNotExist(err)) {
	    	log.Print("ListenAndServe: ", err)
		    http.Error(w, err.Error(), http.StatusInternalServerError)
		    return
	    }
	    log.Print("Other error:", err)
    }
    
    r.ParseForm() 
    text := r.Form.Get("text")
    text = "<html><body>" + text + "</html></body>"
	ioutil.WriteFile(path, []byte(text), 0400)
	os.Chown(path, 995, 994)
	
	http.Redirect(w, r, "http://experiment.safkanyazilim.com/"+filename, http.StatusTemporaryRedirect)
}

func generateRandomURL() string {
	return "1234556"
}

func main() {
	http.HandleFunc("/save", saveHandler)
	
    //http.ListenAndServe(":8080", nil)
    err := http.ListenAndServe(":8080", nil)

    if err != nil {
        log.Print("Main: ", err)
    }
}

