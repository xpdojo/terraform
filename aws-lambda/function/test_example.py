from example import handler


def test_handler():
    test = handler(None, None)
    assert test['statusCode'] == 200
    assert test['headers'] == {'Content-Type': 'application/json'}
