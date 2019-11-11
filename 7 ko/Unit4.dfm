object Form4: TForm4
  Left = 680
  Top = 63
  Width = 323
  Height = 678
  Caption = #1047#1072#1076#1072#1085#1080#1077' '#8470'3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 8
    Width = 166
    Height = 13
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1085#1077#1075#1086' '#1082#1072#1078#1076#1091#1102' '#1089#1090#1088#1086#1082#1091','
  end
  object Label4: TLabel
    Left = 24
    Top = 24
    Width = 192
    Height = 13
    Caption = ' '#1089#1086#1076#1077#1088#1078#1072#1097#1091#1102' '#1101#1083#1077#1084#1077#1085#1090' '#1082#1088#1072#1090#1085#1099#1081' '#1090#1088#1077#1084'.'
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 168
    Width = 249
    Height = 137
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 0
  end
  object StringGrid2: TStringGrid
    Left = 32
    Top = 392
    Width = 241
    Height = 145
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 1
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Button2: TButton
    Left = 24
    Top = 336
    Width = 257
    Height = 25
    Caption = #1074#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 80
    Width = 249
    Height = 25
    Caption = #1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 96
    Top = 576
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
    TabOrder = 4
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 256
    Top = 80
  end
end
