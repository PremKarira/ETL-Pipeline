import warnings
warnings.filterwarnings('ignore')
from src.api import get_location_current_weather_data
from unittest import mock

def mocked_requests_get(*args, **kwargs):
    class MockResponse:
        def __init__(self, json_data, status_code, text_data=""):
            self.json_data = json_data
            self.status_code = status_code
            self.ok = status_code == 200
            self.text = text_data

        def json(self):
            return self.json_data

    if args[0] == "https://open-weather13.p.rapidapi.com/city/hanoi/EN":
        return MockResponse({"data": "value1"}, 200)
    return MockResponse(None, 404, "Not Found")

@mock.patch('requests.get', side_effect=mocked_requests_get)
def test_success_get_location_current_weather_data(mock_get):
    result = get_location_current_weather_data('hanoi')
    code = result['code']
    data = result['data']
    assert code == 200
    assert data == {"data": "value1"}

@mock.patch('requests.get', side_effect=mocked_requests_get)
def test_fail_get_location_current_weather_data(mock_get):
    result = get_location_current_weather_data('tan uyen')
    code = result['code']
    message = result['message']
    assert code == 404
    assert message == "Not Found"

