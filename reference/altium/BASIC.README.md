# Basic

### 通用SMD封裝命名原則
```
名稱格式 : [PACKAGE][TYPE]-[OVERLAYER][SIZE]

PACKAGE : 元件封裝，如0603、0805、SOD323、DO214AC。
TYPE : 元件類型，R、L、C、D。
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆，D = 二極體陰極線段 E = 二極體三角形符號。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
EX : 0603R-B1
```

### 電容-封裝命名原則
```
名稱格式 : [S/D]CAP-[TYPE]-P[PITCH][IL]-[OVERLAYER][SIZE]

S/D : 封裝類型，S=SMD; D=DIP
TYPE : 電容類型
	MLCC : 陶瓷電容 Multilayer Ceramic Capacitor
	EC : 電解電容 Electrolytic capacitor
	FC : 塑膠電容 Film Capacitors
	SC : 安規電容 Safety capacitors
PITCH : 尺寸，圓柱形為圓徑，長方形為寬度
IL : 擺放方式，I=垂直; L=水平
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小

EX:DCAP-EC-P508，DIP型EC電解電容，尺寸為5.08mm
```

### 電感-封裝命名原則
```
名稱格式 : [S/D]IND-[TYPE]-P[PITCH][IL]-[OVERLAYER][SIZE]

S/D : 封裝類型，S=SMD; D=DIP
TYPE : 電容類型
	PW : 功率電感
PITCH : 尺寸，圓柱形為圓徑，長方形為寬度
IL : 擺放方式，I=垂直; L=水平
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小

EX:DCAP-EC-P508，DIP型EC電解電容，尺寸為5.08mm
```

### LED-封裝命名原則
```
名稱格式 : [S/D]LED-P[PITCH][IL]-[OVERLAYER][SIZE]-[COLOR]

S/D : 封裝類型，S=SMD; D=DIP
TYPE : 電容類型
	PW : 功率電感
PITCH : 尺寸，圓柱形為圓徑，長方形為寬度
IL : 擺放方式，I=垂直; L=水平
OVERLAYER : 白漆類型，A = 全包白漆，B = 半包白漆，C = 無白漆。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
COLOR : 顏色，R、G、B、W、RGB等

EX : DLED-P300I-A1-RGB，DIP型LED，尺寸為3mm，RGB光。
```

### 蜂鳴器
```
名稱格式 : BUZZER-P[PITCH]
PITCH : 尺寸，圓柱形為圓徑，長方形為寬度
EX : DLED-P300I-A1-RGB，DIP型LED，尺寸為3mm，RGB光。
```

### 按壓開關
```
名稱格式 : [S/D]TACKSW[PIN]-P[PITCH]-[OVERLAYER][SIZE]
S/D : 封裝類型，S=SMD; D=DIP
PIN : Pin Number
PITCH : 引腳寬度
OVERLAYER : 白漆類型，A = 外邊白漆，B = 內邊白漆，C = 無白漆。
SIZE : PAD尺寸大小，0 = 較大，1 = 適中，2 = 較小
```

***

# Version

## v1.0.2
```
FileName    : BASIC.PcbLib
Version     : 1.0.2
Date        : 2021/04/12
Maintainer  : Danny
```
- add 0603JP-A1,B1,C1
- add 0402JP-A1,B1,C1

## v1.0.1
```
FileName    : BASIC.PcbLib
Version     : 1.0.1
Date        : 2021/03/03
Maintainer  : Danny
```
- add Screw-Holes-6030

## v1.0.0
```
FileName    : BASIC.PcbLib
Version     : 1.0.0
Date        : 2020/11/03
Maintainer  : Danny
```
- Initial version
