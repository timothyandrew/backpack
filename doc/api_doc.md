POST /api/login
----------
Given a user's username and password, an authentication token is returned if valid.
This token is used along with any API call required *by that user*. 

**Parameters**

* *username* - The login username for the user. ***[String]***
* *password* - The user's password.  ***[String]***

**Returned**

* ***[String]*** - Authentication token for the user. Must be stored client-side.

POST /api/upload
----------
Upload a file to the cloud. Returns a hash string to uniquely identify the file.

**Parameters**

* *file* - The file to be uploaded.  ***[Binary]***

**Returned**

* ***[String]*** - Unique hash representing the file or error string.

GET /api/file/<hash>
----------
Retrieve the file identified by the given hash.

**Parameters**

* *hash* - The hash of the file to be retrieved.  ***[String]***

**Returned**

* ***[Binary]*** - The image identified by the hash.
**OR**
* ***[String]*** - Error message.

