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

#GET vs POST
##GET
Simply: GET is used for viewing something without changing it.
GET retrieves remote data.
GET appends the key/value pairs to the URL, rather than the body of the HTTP request. This can cause problems if the URL is too long, or if the data is sensitive as it could be viewed by anyone.

##POST
Simply: POST is used to change something.
POST updates or inserts remote data.
POST inserts the key/value pairs within the body of the HTTP request. This keeps the URL neat, avoids clipping because there are no size limitations like the URL, and is more secure.

##When to use
A search page should use GET
A form to change your password should use POST
GET *should not* be used for submitting sensitive data. Use POST for sensitive data so it is not available to third parties.

#Cookies