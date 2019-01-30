# Team Todo API

Feature :

- Password encryption using gem "bcrypt"
- Login random token using gem "JSONWEBTOKEN"

replace "api/"  with http://localhost:3000/ 

# Users Collection

## Sign Up User
---
Sign up with new user info

+ URL

    api/user

+ Method

    POST

+ Require:

    + body content :

            {
                "email": "email..",
                "password": "password...",
                "password_confirmation":"password_confirmation..."
            }

+ Success Response:

    + Code:201
    + Content:

            {
                "id": 5,
                "email": "yourmail@gmail.com",
                "password_digest": "hashed_password here..",
                "created_at": "2019-01-30T05:50:04.000Z",
                "updated_at": "2019-01-30T05:50:04.000Z"
            }

+ Error Response:

    + Code:500
    + Content:

            {
                status: 500
                error: "Internal server error"
            }
---
## Sign In User
---
Sign in user

+ URL

    api/signin

+ Method

    POST

+ Require:

    body content :

            {
                "email": "email of registered user..",
                "password": "password of registered user.."
            }

+ Success Response:

    + Code:200
    + Content:  

            {
                "auth_token": "<jwt token here..>'
            }

+ Error Response:

    + Code:400
    + Content: 

            {
                "error": {
                    "user_authentication": [
                    "invalid credentials"
                    ]
                }
            }
---

# Todo Collection

## Create
---
Create new personal todo

+ URL

    api/tasks

+ Method

    POST

+ Require:

    + header content :

            {
                "Authorization": "token from login user here..."
            }
    + body content :

            {
                "priority": <number of priority here..>,
                "description": "ini dari abdmukmin91 yang pertama.....",
                "due_date": <format must date, month, full of year, example 1/02/2019>
            }

+ Success Response:

    + Code:201
    + Content:
    
	        {
                "id": 5,
                "description": "ini dari abdmukmin91 yang pertama.....",
                "due_date": "2019-02-01",
                "priority": 0,
                "user_id": 11,
                "created_at": "2019-01-30T06:01:01.000Z",
                "updated_at": "2019-01-30T06:01:01.000Z"
            }
    

+ Error Response:

    + Code:401
    + Content:

            {
                "error": "Not Authorized"
            }

    OR

    + Code:400
    + Content:

            {
                "status": 400,
                "message": "The minimum date that can be inputted is today"
            }

    OR

    + Code:500
    + Content:

            {
                "status": 500,
                "message": "Internal Server Error"
            }
---
## Read all user todos
---
Display all user todos (only owned by user)

+ URL

    api/tasks

+ Method

    GET

+ Require:

    + header content :

            {
                "Authorization": "token from login user here..."
            }

+ Success Response:

    + Code:200
    + Content:
    
            [
                {
                    "id": 5,
                    "description": "description here.....",
                    "due_date": "2019-02-01",
                    "priority": 0,
                    "user_id": 11,
                    "created_at": "2019-01-30T06:01:01.000Z",
                    "updated_at": "2019-01-30T06:01:01.000Z"
                },...
            ]
    

+ Error Response:

    + Code:400
    + Content:

            {
                "status": 400,
                "message": "Invalid token"
            }
    
    OR

    + Code:500
    + Content:

            {
                error:"Uuupss something wrong, please call developer!"
            }
---

## Read one user todo
---
Display one user todo (only owned by user)

+ URL

    api/tasks/<: todoid_here>

+ Method

    GET

+ Require:

    + header content :

            {
                "Authorization": "token from login user here..."
            }

+ Success Response:

    + Code:200
    + Content:
    
            {
                "id": 5,
                "description": "description.....",
                "due_date": "2019-02-01",
                "priority": 0,
                "user_id": 11,
                "created_at": "2019-01-30T06:01:01.000Z",
                "updated_at": "2019-01-30T06:01:01.000Z"
            }
    

+ Error Response:

    + Code:400
    + Content:

            {
                "status": 400,
                "message": "Invalid token"
            }
    
    OR

    + Code:500
    + Content:

            {
                "status": 500,
                "message": "Internal Server Error"
            }
    
    OR

    + Code:401
    + Content:

            {
                "error": "Not Authorized"
            }            
---
## Change Todo Status
---
Change user todo completion status (only owned by user)

+ URL

    api/tasks/changestatus/ <: todoid_here>

+ Method

    PATCH

+ Require:

    + header content :

            {
                "Authorization": "token from login user here..."
            }

+ Success Response:
    
    + Code:200
    + Status before changed = "done"
    + Content:
                
            {
                "status": "not done",
                "_id": "5c445492f0f6974757d8bac1",
                "__v": 0,
                "description": "test",
                "targetDate": "2019-01-21T17:00:00.000Z",
                "title": "test",
                "doneDate": "2019-01-20T11:54:11.312Z"
            }
    
    + Code:200
    + Status before changed = "not done"
    + Content:
                
            {
                "status": "done",
                "_id": "5c445492f0f6974757d8bac1",
                "__v": 0,
                "description": "test",
                "targetDate": "2019-01-21T17:00:00.000Z",
                "title": "test",
                "doneDate": "2019-01-20T11:54:11.312Z"
            }

+ Error Response:

    + Code:400
    + Content:

            {
                error: "Not Authorized!"
            }
    
    OR

    + Code:400
    + Content:

            {
                "error": "Bad Request"
            }

    OR

    + Code:500
    + Content:

            {
                "status": 500,
                "message": "Internal Server Error"
            }
---
## Update
---
Update user todo (only owned by user)

+ URL

    api/tasks/ <: todoid_here>

+ Method

    PUT

+ Require:

    + header content :

            {
                "jtoken": "token from login user here..."
            }
    + body content example :

            {
                "title": "test",
                "description": "test",
                "targetDate": "01/22/2019",
                "status": "not done"
            }

+ Success Response:

    + Code:200
    + Content:
                
            {
                "message": "Success change task!"
            }
                

+ Error Response:

    + Code:400
    + Content:

            {
                error: "Please login!"
            }
    
    OR

    + Code:400
    + Content:

            {
                "error": "Please insert valid Todo Title, or description, or status, or target date! "
            }

    OR

    + Code:500
    + Content:

            {
                "status": 500,
                "message": "Internal Server Error"
            }
---
## Delete
---
Delete user todo (only owned by user)

+ URL

    api/tasks/ <: todoid_here>

+ Method

    DELETE

+ Require:

    + header content :

            {
                "jtoken": "token from login user here..."
            }
    + body content example :

            {
                "title": "test",
                "description": "test",
                "targetDate": "01/22/2019",
                "status": "not done"
            }

+ Success Response:

    + Code:200
    + Content:
                
            "success delete task on user"
                

+ Error Response:

    + Code:400
    + Content:

            {
                error: "Please login!"
            }

    OR

    + Code:500
    + Content:

            {
                error:"Uuupss something wrong, please call developer!"
            }
---

