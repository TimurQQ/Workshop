object Form6: TForm6
  Left = 378
  Top = 278
  Width = 335
  Height = 167
  Caption = 'Form6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 266
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1088#1072#1079#1084#1077#1088#1085#1086#1089#1100' '#1084#1072#1089#1089#1080#1074#1072' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
  end
  object Label2: TLabel
    Left = 24
    Top = 32
    Width = 39
    Height = 16
    Caption = #1057#1090#1088#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 136
    Top = 32
    Width = 64
    Height = 16
    Caption = #1057#1090#1086#1083#1073#1094#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 72
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 208
    Top = 32
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 249
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 96
    Width = 249
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 288
    Top = 24
  end
end
