import pytest
import sys
sys.path.append("..")
from ..app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    client = app.test_client()
    yield client

def test_health(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert response.data == b'OK'
