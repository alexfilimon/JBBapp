//
//  CustomColor.swift
//  JBBApp
//
//  Created by Александр Филимонов on 01/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class CustomColor {
    
    var defaultName: String! = nil
    var customName: String?
    let colorValue: UIColor
    
    init(with color: UIColor, name customName: String? = nil) {
        self.colorValue = color
        if let customName = customName {
            self.customName = customName
        }
        
        self.defaultName = getDefaultName(with: color)
        
    }
    
    private func getDefaultName(with color: UIColor) -> String {
        let defaultNamesDB =
        """
Абрикос            251    206    177
Французский абрикос            230    126    48
Военно-воздушный синий            93    138    168
Синий Элис            240    248    255
Ализариновый красный            227    38    54
Миндаль Крайола            239    222    205
Амарантовый            229    43    80
Янтарный            255    191    0
Американская роза            255    3    62
Аметистовый            153    102    204
Матовый белый            242    243    244
Античный белый            250    235    215
Яблочно-зелёный            141    182    0
Спаржа            123    160    91
Цвет морской волны            0    255    255
Аквамариновый            127    255    212
Армейский зелёный            75    83    32
Мышьяковый            59    68    75
Лазурный, Азур            0    127    255
Голубовато-серый цвет            132    132    130
Беж, бежевый            245    245    220
Бистр            61    43    31
Горькая радость            254    111    94
Чёрный            0    0    0
Белокурый            250    240    190
Синий            0    0    255
Вода пляжа Бонди            0    149    182
Красный Универс. Бостона            204    0    0
Латунный            181    166    66
Ярко-зелёный            102    255    0
Ярко-бирюзовый            8    232    222
Ярко-фиолетовый            205    0    205
Бронзовый            205    127    50
Коричневый            150    75    0
Кожа буйвола, палевый            240    220    130
Бургундский            144    0    32
Выгоревший оранжевый            204    85    0
Сиена жжёная            233    116    81
// Коричневый, умбра жжёная            138    51    36
Хаки            120    134    107
Канареечный            253    255    99
Баклажановый            119    41    83
Тёмно-красный, кардинал            196    30    58
Кармин            150    0    24
Морковный            237    145    33
Селадоновый            172    225    175
Светлая вишня            222    49    99
Лазурный            0    123    167
Лазурно-синий            42    82    190
Салатовый цвет, шартрез            127    255    0
Каштановый            205    92    92
Шоколадный            210    105    30
Коричный            123    63    0
Кобальт синий            0    71    171
Кофейный            75    54    33
Медный            184    115    51
Кораллово-красный            255    127    80
Кукурузный            251    236    93
Васильковый            100    149    237
Кремовый            255    253    208
Малиновый, тёмно-красный            220    20    60
Циан            0    255    255
Тёмно-синий цвет            0    0    139
Тёмно-коричневый            101    67    33
Тёмно-лазурный            8    69    126
Тёмно-каштановый            152    105    96
Тёмно-коралловый            205    91    69
Тёмно-золотой            184    134    11
Тёмный сланцево-серый            47    79    79
Тёмно-зелёный            1    50    32
Тёмный индиго, индиго            49    0    98
Тёмный хаки, хаки            189    183    107
Тёмно-оливковый            85    104    50
Тёмный пастельно-зелёный            3    192    60
Тёмно-персиковый            255    218    185
Тёмно-розовый            231    84    128
Тёмная лососина            233    150    122
Тёмно-алый            86    3    25
Тёмный весенне-зелёный            23    114    69
Тёмный жёлто-коричневый            145    129    81
Тёмно-мандариновый            255    168    18
Тёмный зелёный чай            186    219    173
Тёмно-бирюзовый            17    96    98
Тёмно-фиолетовый цвет            66    49    137
Глубокий розовый цвет            255    20    147
Голубой цвет            0    191    255
Джинсовый синий            21    96    189
Защитно-синий            30    144    255
Изумрудный            80    200    120
Баклажановый            153    0    102
Электрик            125    249    255
Зелёный папоротник            79    121    66
Кирпичный            178    34    34
Льняной            238    220    130
Фуксия            255    0    255
Гуммигут            228    155    15
Золотой            255    215    0
Золотисто-берёзовый            218    165    32
Серый            128    128    128
Серая спаржа            70    89    69
Зелёный серый чай            202    218    186
Зелёный, Лаймовый            0    255    0
Жёлто-зелёный            173    255    47
Синий Градуса            0    125    255
Гелиотроп            223    115    255
Голливудский светло-вишнёвый            244    0    161
Ярко-розовый цвет            252    15    192
Индиго            75    0    130
"Международный (сигнальный) оранжевый"            255    79    0
Индийский красный, каштановый            205    92    92
Слоновая кость            255    255    240
Нефритовый            0    168    107
Хаки            195    176    145
Синий Клейна            58    117    196
Лаванда, лавандово-синий            230    230    250
Розово-лавандовый            255    240    245
Лимонный            253    233    16
Лимонно-кремовый            255    250    205
Светло-коричневый            205    133    63
Сиреневый            200    162    200
Электрик Лайм            204    255    0
Льняной            250    240    230
Зелёная лужайка            124    252    0
Маджента фуксия            255    0    255
"Малахитовая зелень (малахитовый)"            11    218    81
Тёмно-бордовый            128    0    0
"Марсала (бордово-коричневый) (?)"            155    81    80
Розовато-лиловый            153    51    102
Полуночно-синий            0    51    102
Зелёная мята (мятный)            152    255    152
Зелёный мох            173    223    173
Розовый Маунтбэттена            153    122    141
Горчичный            255    219    88
Белый навахо            255    222    173
Тёмно-синий            0    0    128
Охра            204    119    34
Старое золото            207    181    59
Оливковый            128    128    0
Нежно-оливковый            107    142    35
Оранжевый            255    165    0
Орхидея            218    112    214
Старое кружево            253    245    230
Бледно-синий            175    238    238
Бледно-коричневый            152    118    84
Бледно-карминный            175    64    53
Бледно-каштановый            221    173    175
Бледно-васильковый            171    205    239
Бледно-пурпурный            249    132    229
Бледный розовато-лиловый            153    102    102
Бледно-розовый            250    218    221
Лиловый            219    112    147
Бледно-песочный цвет            218    189    171
Палевый            240    220    130
Панг            199    252    236
Побег папайи            255    239    213
Пастельно-зелёный            119    221    119
Пастельно-розовый            255    209    220
Персиковый            255    229    180
Оранжево-персиковый            255    204    153
Жёлто-персиковый            250    223    173
Грушевый            209    226    49
Барвинок            204    204    255
Персидский синий            102    0    255
Зелёная сосна            1    121    111
Розовый            255    192    203
Оранжево-розовый            255    153    102
Фисташковый            190    245    116
Сливовый            102    0    102
Гранатовый            243    71    35
Пороховая синь            0    51    153
Пюсовый, блошиный            204    136    153
Берлинская лазурь            0    49    83
Тыква            255    117    24
Фиолетовый (оттенок)            128    0    128
Умбра            115    74    18
Красный            255    0    0
Фиолетово-красный            199    21    133
Цвет яйца дрозда            0    204    204
"Ярко-синий («королевский синий»)"            65    105    225
Рубиновый            224    17    95
Красновато-коричневый            117    90    87
Ржавый            183    65    14
Розово-коричневый            188    143    143
Сигнальный оранжевый            255    153    0
Шафрановый            244    196    48
Сапфировый            8    37    103
Лососёвый            255    55    105
Песочный цвет            244    164    96
Сангрия, Бордовый            146    0    10
Ярко-красный, алый            255    36    0
"Цвет жёлтого школьного автобуса"            255    216    0
Зелёное море            46    139    87
Цвет морской пены            255    245    238
Отборный жёлтый            255    186    0
Сепия            112    66    20
Серебристый            192    192    192
Серый шифер            112    128    144
Зелёная весна            0    255    127
Синяя сталь            70    130    180
Болотный            172    183    142
Цвет загара            210    180    140
Краснобуро-оранжевый            205    87    0
Мандариновый            255    204    0
Зелёный чай            208    240    192
Сине-зелёный            0    128    128
Телемагента, Телемаджента            207    52    118
"Терракотовый (кирпично-красный)"            203    104    67
Тёмно-терракотовый            204    78    92
Чертополох            216    191    216
Бирюзовый            48    213    200
Тициановый            213    62    7
Транспортный красный            204    6    5
Томатный            255    99    71
Ультрамариновый            18    10    143
Цвет флага ООН            91    146    229
Оранжевый            221    72    20
Ванильный            243    229    171
Киноварь            227    66    52
"Фиолетовый (фиалковый, синепурпурный)"            139    0    255
Фиолетово-баклажанный            153    17    153
Ядовито-зелёный            64    130    109
Пшеничный            245    222    179
Белый            255    255    255
Глициния            201    160    220
Вино            114    47    55
Шанду            115    134    120
Жёлтый            255    255    0
Кобальтовая синь            0    20    168
Циннвальдит            235    194    175
"""
        
        let rows = defaultNamesDB.split(separator: "\n")
        
        var colorsDB: [(String, UIColor)] = []
        
        for row in rows {
            
            if row.starts(with: "//") {
                continue
            }
            
            let partials = row.split(separator: " ")
            
            var name = ""
            var colorParts: [Int] = []
            
            for part in partials {
                if String(part).isNumber() {
                    colorParts.append(Int(part)!)
                } else {
                    name += String(part) + " "
                }
            }
            
            let curItem: (String, UIColor) = (name, UIColor(red: CGFloat(colorParts[0])/255.0, green: CGFloat(colorParts[1])/255.0, blue: CGFloat(colorParts[2])/255.0, alpha: 1.0))
            
            colorsDB.append(curItem)
            
        }
        
        var comparedValues: [Double] = []
        
        for comparingRow in colorsDB {
            
            guard let rgb1 = color.rgb(), let rgb2 = comparingRow.1.rgb() else { return "" }
            
            let val = sqrt(pow(Double(rgb1.red - rgb2.red), 2.0) + pow(Double(rgb1.green - rgb2.green), 2.0) + pow(Double(rgb1.blue - rgb2.blue), 2.0))
            
            comparedValues.append(val)
        }
        
        guard let minValue = comparedValues.min(), let minIndex = comparedValues.index(of: minValue) else { return "" }
        
        
        
        
        return colorsDB[minIndex].0
    }
    
}
