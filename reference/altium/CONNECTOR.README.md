# Connector

## 封裝命名原則

### 連接器
```
名稱格式 : [TYPE][PITCH]-[PIN]P[I/L]


TYPE : 
	HEADER : 排針
	HEADERA : 雙排排針
	IDC : 簡易牛角
	IDCI : 牛角	
	
PITCH : 引腳間距
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
I/L : 垂直 水平

EX:LQFP64-P050-B1
```

### USB
```
名稱格式 : USB-[TYPE]-[M/F]-[S/D][I/L]


TYPE : TYPEA MINI MICRO TYPEC TYPEAGEN3
M/F : MALE FEMALE
S/D/U : SMD DIP 沉板
I/L : 垂直 水平

EX:LQFP64-P050-B1
```


***
# Version
## v1.0.4
```
FileName    : CONNECTOR.PcbLib
Date        : 2021/02/24
Maintainer  : Danny
```
- fix IDCI254-34PI pin number

## v1.0.3
```
FileName    : CONNECTOR.PcbLib
Date        : 2021/02/24
Maintainer  : Danny
```
- add multi VH396-[x]PI, x = 10, 9, 8, 7, 6, 5, 4, 3.
- add multi VH396-[x]PL, x = 10, 9, 8, 7, 6, 5, 4, 3.
- add multi IDCI254-[x]PI x = 38, 36
- add multi IDCI254-[x]PL x = 10, 14, 16

## v1.0.2
```
FileName    : CONNECTOR.PcbLib
Date        : 2020/11/03
Maintainer  : Danny
```
- fix connector USB-MICROB-FEMALE-UL keep out layer

## v1.0.1	
```
FileName    : CONNECTOR.PcbLib
Date        : 2020/11/03
Maintainer  : Danny
```
- add connector USB-MICROB-FEMALE-UL

## v1.0.0
```
FileName    : CONNECTOR.PcbLib
Date        : 2020/11/03
Maintainer  : Danny
```
- Initial version