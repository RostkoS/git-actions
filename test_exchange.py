from app.main import exchange

def test_exchange():
    assert exchange(100, 1.5) == 150
    assert exchange(200, 0.75) == 150
    assert exchange(0, 2) == 0
