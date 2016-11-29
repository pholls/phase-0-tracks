#Common HTTP status codes
##Format:
* 1xx - informational message (rarely seen)
* 2xx - successful response
* 3xx - redirection response (usually handled by browser without user interaction) 
* 4xx - client-side error (such as incorrect URL)
* 5xx - server-side error

##Examples:
* 200 - Success
* 404 - resource not found (user typed incorrect URL, page has moved, etc)
* 403 - access to resource forbidden (client certificate invalid, faulty permissions)
* 401 - authentication problem
* 500 - internal server error
* 503 - service unavailable (web server is unavailable)
* 504 - gateway timeout (DNS issue, network device down, server too busy, etc)

