import requests # type: ignore
try:
    from utilities import read_config
except ImportError:
    from src.utilities import read_config


def get_location_current_weather_data(location):
    config = read_config()
    # url = "open-weather13.p.rapidapi.com"
    base_url = "https://open-weather13.p.rapidapi.com"
    url = f"{base_url}/city/{location}/EN"
    
    headers = {
        "X-RapidAPI-Host": "open-weather13.p.rapidapi.com",
        "X-RapidAPI-Key": config['X-RapidAPI-Key']
    }
    print(f'Read data from {location}')
    response = requests.get(url, headers=headers)
    
    if response.ok:
        print(response.json())
        data_dic = response.json()
        return {"code": response.status_code,"data": data_dic}
    else :
        return {"code": response.status_code,"message": response.text}
