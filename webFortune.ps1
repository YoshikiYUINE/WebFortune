#webFortune.ps1

function webFortune (){
$requestDate = Get-Date -Format "yyyy/MM/dd"
$baseUrl = "http://api.jugemkey.jp/api/horoscope/free/"
$requestUrl = "${baseurl}${reuestDate}"
$responseObject = Invoke-WebRequest $requestUrl
$statusCode = $responseObject.StatusCode
$content = $responseObject.Content | ConvertFrom-Json
$horoscope = $content.horoscope
$data = $horoscope.$requestDate
Write-Output ($requestDate + "の運勢")
for($i = 0; $i -lt $data.length; $i++){
Write-Output "================================================="
Write-Output ($data[$i].sign + "[" + $data[$i].rank + "位]")
Write-Output ("総合運: " + $data[$i].total)
Write-Output ("仕事運: " + $data[$i].job)
Write-Output ("恋愛運: " + $data[$i].love)
Write-Output ("金運: " + $data[$i].money)
Write-Output ("ラッキーアイテム: " + $data[$i].item)
Write-Output ("ラッキーカラー: " + $data[$i].color)
Write-Output $data[$i].content
}
Write-Output "================================================="
Write-Output "powered by JugemKey [http://jugemkey.jp/api/waf/api_free.php]"
Write-Output "【PR】原宿占い館 塔里木 [http://www.tarim.co.jp/]"
#data[0]~data[11]
}
webFortune
