'''
python houdeyun.py
'''

import time
import httpx
Jwetoken = '查找自己的JWToken'
http = httpx.Client()
http.headers = { 
    'Cookie': 'jweToken=' + Jwetoken,
    'Jwetoken': Jwetoken,
    'Origin': 'https://www.houdeyun.cn',
    'Referer': 'https://www.houdeyun.cn/',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36'
}

while True:

    res = http.get('https://api.houdeyun.cn/order/api/v2.1/gift').json()
    print (res['items'][-1].get("remain"))
    if res['items'][-1].get("remain") < 12: 
        print("最后一张券开始使用！！可领券了")
         #触发领券
        res = http.post('https://api.houdeyun.cn/order/api/v2.1/gift/renew')
        print (res.text)
        if(res.status_code != 500):
            print("触发官方发券......")
            res = http.get('https://api.houdeyun.cn/order/api/v2.1/gift').json()
            for item in res['items']:
                if item['status'] == 0:
                    print('激活代金券：',item['name'], item['createAt'])
                    # 激活
                    resp = http.post('https://api.houdeyun.cn/order/api/v2.1/gift/effect/' + str(item['id'])).json()
    else:
        print('暂无代金券')
    print('暂停'+ str(60*2) +'分钟，继续执行>>>>>>>>')
    time.sleep(60*60*2)
