import json
import requests

def lambda_handler(event, context):
    # Parse input from API Gateway
    topic = event["queryStringParameters"]["topic"]

    # Send request to Wikipedia API
    url = f"https://en.wikipedia.org/api/rest_v1/page/summary/{topic}"
    response = requests.get(url)

    # Format response for API Gateway
    body = {
        "message": response.json()["extract"]
    }

    return {
        "statusCode": response.status_code,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(body)
    }
