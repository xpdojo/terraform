import json
import random


def scramble(text: str) -> str:
    return "".join(random.sample(text, len(text)))


def handler(event, context):
    print("event: %s", event)
    print("context: %s", context)

    sample_text = "Hello World!"

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"result": scramble(sample_text)}),
    }
