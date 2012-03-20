*POST* /api/login
----------
Given a user's username and password, an authentication token is returned if valid.
This token is used along with any API call required *by that user*. 

**Parameters**

* *username* - The login username for the user. ***[String]***
* *password* - The user's password.  ***[String]***

**Returned**

* ***[String]*** - Authentication token for the user. Must be stored client-side.

*POST* /api/upload
----------
Upload a file to the cloud. Returns a hash string to uniquely identify the file.

**Parameters**

* *file* 	   - The file to be uploaded.  ***[Binary]***
* *username*   - The username of the user this file belongs to. (optional)
* *auth_token* - The authentication token for the above user (optional)

(Username and auth_token *must* be used together, not separately)

**Returned**

* ***[String]*** - Unique hash representing the file or error string.

*GET* /api/file/<hash>
----------
Retrieve the file identified by the given hash.

**Parameters**

* *hash* - The hash of the file to be retrieved.  ***[String]***

**Returned**

* ***[Binary]*** - The image identified by the hash.

**OR**

* ***[String]*** - Error message.

*GET* /api/files/<user>
----------

Retrieve all the files belonging to the *user*.

**Parameters**

* *user* - The username of the user whose files are to be retrieved.  ***[String]***

**Returned**

* ***[JSON Array]*** - Array of image hashes, each corresponding to an image which belongs to the <user>.

**OR**

* ***[String]*** - Error message.

