object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Metoda Newtona'
  ClientHeight = 369
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object label_aritmetic: TLabel
    Left = 24
    Top = 24
    Width = 60
    Height = 13
    Caption = 'Arytmetyka:'
  end
  object label_input_x0: TLabel
    Left = 216
    Top = 24
    Width = 12
    Height = 13
    Caption = 'x0'
  end
  object label_numberIteration: TLabel
    Left = 30
    Top = 160
    Width = 86
    Height = 13
    Caption = 'Dok'#322'adno'#347#263' 10^(-'
  end
  object label_score: TLabel
    Left = 32
    Top = 256
    Width = 10
    Height = 13
    Caption = 'x:'
  end
  object label_iteration: TLabel
    Left = 32
    Top = 312
    Width = 64
    Height = 13
    Caption = 'Ilo'#347#263' iteracji: '
  end
  object label_x: TLabel
    Left = 102
    Top = 256
    Width = 3
    Height = 13
  end
  object label_it: TLabel
    Left = 102
    Top = 312
    Width = 3
    Height = 13
  end
  object label_from: TLabel
    Left = 216
    Top = 46
    Width = 18
    Height = 13
    Caption = 'Od:'
  end
  object label_to: TLabel
    Left = 367
    Top = 44
    Width = 17
    Height = 13
    Caption = 'Do:'
  end
  object Label3: TLabel
    Left = 165
    Top = 160
    Width = 4
    Height = 13
    Caption = ')'
  end
  object label_stan: TLabel
    Left = 32
    Top = 344
    Width = 29
    Height = 13
    Caption = 'Stan: '
  end
  object label_st: TLabel
    Left = 102
    Top = 344
    Width = 3
    Height = 13
  end
  object label_max_it: TLabel
    Left = 32
    Top = 192
    Width = 122
    Height = 13
    Caption = 'Maksymalna liczba iteracji'
  end
  object Label1: TLabel
    Left = 32
    Top = 280
    Width = 29
    Height = 13
    Caption = 'Fatx: '
  end
  object label_fatx: TLabel
    Left = 102
    Top = 280
    Width = 3
    Height = 13
  end
  object radio_floatPoint: TRadioButton
    Left = 32
    Top = 43
    Width = 113
    Height = 17
    Caption = 'zmiennopozycyjna'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = radioFloatClick
  end
  object radio_Section: TRadioButton
    Left = 32
    Top = 68
    Width = 113
    Height = 17
    Caption = 'przedzia'#322'owa'
    TabOrder = 1
    OnClick = radioSectionClick
  end
  object edit_x0_from: TEdit
    Left = 240
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = rewriteNumber
    OnKeyPress = keyPress
  end
  object edit_x0_to: TEdit
    Left = 390
    Top = 41
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = keyPress
  end
  object edit_eps: TEdit
    Left = 122
    Top = 157
    Width = 37
    Height = 21
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 4
    OnClick = clearEditNumberIteration
  end
  object button_start: TButton
    Left = 32
    Top = 225
    Width = 209
    Height = 25
    Caption = 'START'
    TabOrder = 5
    OnClick = startClick
  end
  object edit_max_it: TEdit
    Left = 181
    Top = 189
    Width = 119
    Height = 21
    NumbersOnly = True
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 30
    Top = 112
    Width = 97
    Height = 17
    Caption = 'y=x^2-2'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = checkClick1
  end
  object CheckBox2: TCheckBox
    Left = 165
    Top = 112
    Width = 196
    Height = 17
    Caption = 'y=sin^2(x)+0,5sin(x)-0,5'
    TabOrder = 8
    OnClick = checkClick2
  end
end
