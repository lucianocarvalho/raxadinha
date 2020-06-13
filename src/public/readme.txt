POST /api/register
{
    "name": "Xandeus",
    "email": "xandao@bol.com.br",
    "password": "12345"
}
Eu retorno: 200
{
    "successful": true
}


POST /api/login
Você me manda email e password.
Eu retorno: 200:
{
    "successful": true
    "user_id": 1
}

----

GET /api/groups/{user_id}
{
    {
        "name": "Gastos Casa",
        "expires_at": "2020-12-30",
        "total": 3600.50,
        "participants": [
            {
                "user_id": 1,
                "name": "Victorio"
            },
            {
                "user_id": 2,
                "name": "Luciano"
            }
        ]
    }
}

GET /api/users?q=vic
{
    {
        "user_id": 1,
        "name": "Victorio"
    },
    {
        "user_id": 2,
        "name": "Victorio2"
    }
}



POST /api/groups
{
    "name": "Gastos Casa",
    "expires_at": "2020-12-30",
    "participants": [
        1, 2, 3
    ]
}
Retorno:
{
    "successful": true
}


GET /api/groups/{group_id}
{
    "transactions": [
        {
            "user_id": 1,
            "value": 350,
            "description": "Mercado",
            "date": "2020-08-01 18:02:01"
        },
        {
            "user_id": 2,
            "value": 200,
            "description": "Mercado",
            "date": "2020-08-01 18:02:01"
        }
    ],
    "resume": {
        "total": 1000.00,
        "total_paid": {
            {
                "user_id": 1,
                "name": "aa",
                "sum": 500,
                "balance": 167.00,
            },
            {
                "user_id": 2,
                "name": "bb",
                "sum": 400,
                "balance": 67.00,
            },
            {
                "user_id": 3,
                "name": "cc",
                "sum": 100
                "balance": -233.00
            }
        }
    }
}


POST /api/transactions
{
    "group_id": 1,
    "user_id": 1,
    "value": 350.05,
    "description": "Mercado",
    "date": "2020-08-01 18:02:01"
}
Retorno:
{
    "successful": true
}


