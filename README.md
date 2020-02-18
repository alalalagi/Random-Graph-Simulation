# Social-Network-Simulation

[Eagle](https://tw.eagle.cool/)是優秀的圖片管理軟體，然缺乏自動化的標籤系統。
在六個人的小世界一書中，曾經描述這樣一個問題:
現有n個節點(倆倆之間共可做出Cn取2條連結)，想像連在一起的節點們是一串珠子，一手能把一整串提起，請問當中最大串包含多少節點?
書中描述連結(bond)數在超過某個臨界值時，節點的涵蓋率會產生急遽的變高，因此我做了個實驗模擬。

Simulation Results:
<img src="Simu result.png" width="800px">

很顯然在不同節點(node)數下他們的行為模式是相似的，也就是在bond/node趨近3時能將全部的節點串起
但並未發現書中所描述的"臨界點現象"
