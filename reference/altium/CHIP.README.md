# Basic

## 封裝命名原則

### 通用SMD-IC封裝
```
名稱格式 : [TYPE]-[OVERLAYER][SIZE]

TYPE : SOT、TO等
OVERLAYER : 白漆類型，A = 外全包白漆，B = 內全包白漆，C = 無白漆
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
EX:SOT89-B1 SOT-89，內包全白漆，PAD尺寸大小適中
```

### 通用DIP-IC封裝
```
名稱格式 : [TYPE]-P[PITCH][I/L]-[OVERLAYER][SIZE]

TYPE : TO等
PITCH : 引腳間距。
I/L : 垂直 水平
OVERLAYER : 白漆類型，A = 外全包白漆，B = 內全包白漆，C = 無白漆
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
EX : TO220-P254L-A1，TO-220，引腳間距2.54mm，水平，外包全白漆，PAD尺寸大小適中
```

### 雙邊封裝型
```
名稱格式 : [TYPE][PIN][WITTH]-P[PITCH]-[OVERLAYER][SIZE]

TYPE : SOIC、DFN等
PIN : Pin Number
WITTH : IC封裝寬度;
	A=3.81mm(150mil)
	B=5.28mm(208mil)
	C=7.62mm(300mil)
	
PITCH : 引腳間距。
	
OVERLAYER : 白漆類型，A = 外全包白漆，B = 內全包白漆，C = 無白漆
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
EX:SOIC16A-P065-B1 SOIC雙邊封裝，IC寬度3.81mm，內包全白漆，PAD尺寸大小適中
```

### 四邊封裝型
```
名稱格式 : [TYPE][PIN]-P[PITCH]-[OVERLAYER][SIZE]

TYPE : QFP、QFN等
PIN : Pin Number
PITCH : 引腳間距
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小

EX:LQFP64-P050-B1
```

***

# Version

## v1.0.4
```
FileName    : CHIP.PcbLib
Version     : 1.0.4
Date        : 2022/04/22
Maintainer  : Danny
```
- Fix TO220-P254L-A1 hold size 3.0mm to 3.3m
- Add TO269AA-B1

## v1.0.1
```
FileName    : CHIP.PcbLib
Version     : 1.0.1
Date        : 2020/11/26
Maintainer  : Danny
```
- Fix SOIC P065 pin length 1.5mm to 1.2mm

## v1.0.0
```
FileName    : CHIP.PcbLib
Version     : 1.0.0
Date        : 2020/11/03
Maintainer  : Danny
```
- Initial version