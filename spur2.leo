
def twoDgear(self, guess=None):
    # 將標準答案存入 answer session 對應區
    theanswer = random.randint(1, 100)
    thecount = 0
    # 將答案與計算次數變數存進 session 對應變數
    cherrypy.session['answer'] = theanswer
    cherrypy.session['count'] = thecount
    # 印出讓使用者輸入的超文件表單
    outstring = '''
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!-- 載入 brython.js -->
<script type="text/javascript" src="/static/Brython3.1.1-20150328-091302/brython.js"></script>
<script src="/static/Cango2D.js" type="text/javascript"></script>
<script src="/static/gearUtils-04.js" type="text/javascript"></script>
</head>
<!-- 啟動 brython() -->
<body onload="brython()">
    
<form method=POST action=doCheck>
請輸入您所猜的整數:<input type=text name=guess><br />
<input type=submit value=send>
</form>
<hr>
<!-- 以下在網頁內嵌 Brython 程式 -->
<script type="text/python">
from browser import document, alert

def echo(ev):
    alert(document["zone"].value)

# 將文件中名稱為 mybutton 的物件, 透過 click 事件與 echo 函式 bind 在一起
document['mybutton'].bind('click',echo)
</script>
<input id="zone"><button id="mybutton">click !</button>
<hr>
<!-- 以下為 canvas 畫圖程式 -->
<script type="text/python">
# 從 browser 導入 document
from browser import document
import math

# 畫布指定在名稱為 plotarea 的 canvas 上
# 以下使用中文變數名稱
畫布 = document["plotarea"]
ctx = 畫布.getContext("2d")

# 用紅色畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(0, 500)
ctx.strokeStyle = "red"
ctx.stroke()

# 用藍色再畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(500, 0)
ctx.strokeStyle = "blue"
ctx.stroke()

# 用綠色再畫一條直線
ctx.beginPath()
ctx.lineWidth = 3
ctx.moveTo(0, 0)
ctx.lineTo(500, 500)
ctx.strokeStyle = "green"
ctx.stroke()

# 用黑色畫一個圓
ctx.beginPath()
ctx.lineWidth = 3
ctx.strokeStyle = "black"
ctx.arc(250,250,50,0,2*math.pi)
ctx.stroke()
</script>
<canvas id="plotarea" width="800" height="600"></canvas>
</body>
</html>
'''

    return outstring
