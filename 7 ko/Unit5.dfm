object Form5: TForm5
  Left = 565
  Top = 115
  Width = 308
  Height = 600
  Caption = #1047#1072#1076#1072#1085#1080#1077' '#8470'4'
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
    Left = 8
    Top = 8
    Width = 255
    Height = 13
    Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' '#1087#1077#1088#1074#1099#1081' '#1080' '#1087#1086#1089#1083#1077#1076#1085#1080#1081' '#1089#1090#1086#1083#1073#1094#1099'.'
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 128
    Width = 217
    Height = 129
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 0
  end
  object Button2: TButton
    Left = 32
    Top = 288
    Width = 225
    Height = 25
    Caption = #1074#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object StringGrid2: TStringGrid
    Left = 32
    Top = 344
    Width = 217
    Height = 137
    DefaultColWidth = 24
    FixedCols = 0
    FixedRows = 0
    TabOrder = 2
  end
  object Button3: TButton
    Left = 24
    Top = 72
    Width = 225
    Height = 25
    Caption = #1079#1072#1087#1086#1083#1085#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 80
    Top = 504
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
    TabOrder = 4
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 248
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Left = 248
    Top = 72
  end
end
