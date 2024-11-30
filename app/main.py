def add(a, b):
    return a + b


def exchange(amount, rate):
    return amount * rate



def lambda_handler(event, context):
    addition_result = add(5, 3)
    exchange_result = exchange(100, 1.2)

    return {
        "statusCode": 200,
        "body": {
            "Addition": addition_result,
            "Currency Exchange": exchange_result
        }
    }
