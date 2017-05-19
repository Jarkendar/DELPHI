object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 86
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = zamknij
  PixelsPerInch = 96
  TextHeight = 13
  object label_description: TLabel
    Left = 16
    Top = 32
    Width = 148
    Height = 13
    Caption = 'Wprowad'#378' stopie'#324' wielomianu:'
  end
  object edit_input: TEdit
    Left = 170
    Top = 29
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object button_accept: TButton
    Left = 336
    Top = 27
    Width = 75
    Height = 25
    Caption = 'button_accept'
    TabOrder = 1
    OnClick = click_accept_Unit1
  end
end
