object FormDBSetting: TFormDBSetting
  Left = 472
  Top = 266
  BorderStyle = bsDialog
  Caption = #25968#25454#28304#35774#32622
  ClientHeight = 225
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpDBServer: TGroupBox
    Left = 0
    Top = 0
    Width = 345
    Height = 97
    Align = alTop
    Caption = #25968#25454#24211#20449#24687
    TabOrder = 0
    object lbl5: TLabel
      Left = 19
      Top = 47
      Width = 43
      Height = 13
      AutoSize = False
      Caption = #26381#21153#22120
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDriverName: TLabel
      Left = 6
      Top = 22
      Width = 55
      Height = 13
      AutoSize = False
      Caption = #25968#25454#39537#21160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblDatabase: TLabel
      Left = 187
      Top = 47
      Width = 43
      Height = 13
      AutoSize = False
      Caption = #25968#25454#24211
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblUser: TLabel
      Left = 33
      Top = 71
      Width = 29
      Height = 13
      AutoSize = False
      Caption = #29992#25143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblPassword: TLabel
      Left = 200
      Top = 71
      Width = 29
      Height = 13
      AutoSize = False
      Caption = #23494#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtDBServer: TEdit
      Tag = 1
      Left = 64
      Top = 44
      Width = 88
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = 'Server'
    end
    object cbbDriverName: TComboBox
      Left = 64
      Top = 18
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Sybase'
      Items.Strings = (
        'Sybase'
        'MSSQL'
        'SybaseOLEDB')
    end
    object edtDatabase: TEdit
      Tag = 1
      Left = 232
      Top = 44
      Width = 88
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Text = 'Database'
    end
    object edtUser: TEdit
      Tag = 1
      Left = 64
      Top = 68
      Width = 88
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = 'sa'
    end
    object edtPassword: TEdit
      Tag = 1
      Left = 232
      Top = 68
      Width = 88
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Text = 'password'
    end
  end
  object grpSourceTable: TGroupBox
    Left = 0
    Top = 97
    Width = 345
    Height = 95
    Align = alClient
    Caption = #25968#25454#26469#28304#20449#24687
    TabOrder = 1
    object lblTable: TLabel
      Left = 32
      Top = 15
      Width = 29
      Height = 13
      AutoSize = False
      Caption = #34920#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTextSource: TLabel
      Left = 4
      Top = 39
      Width = 55
      Height = 13
      AutoSize = False
      Caption = #26631#35782#21015#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblText: TLabel
      Left = 4
      Top = 63
      Width = 55
      Height = 13
      AutoSize = False
      Caption = #20869#23481#21015#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtTable: TEdit
      Tag = 1
      Left = 64
      Top = 12
      Width = 257
      Height = 19
      Hint = #26174#31034#20869#23481#26469#33258#21738#24352#34920
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'Test'
    end
    object edtTextSource: TEdit
      Tag = 1
      Left = 64
      Top = 36
      Width = 257
      Height = 19
      Hint = #26174#31034#20869#23481#30340#26469#28304#26631#35782#21015#12290#22914#33509#35813#26174#31034#23631#29992#26469#26174#31034#24037#20316#31449'001'#30340#20869#23481#65292#21017#36755#20837#24037#20316#31449'001'#25152#23545#24212#30340#21015#21517#12290
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = 'TextSource'
    end
    object edtText: TEdit
      Tag = 1
      Left = 64
      Top = 60
      Width = 257
      Height = 19
      Hint = #35201#26174#31034#20869#23481#25152#22312#21015#21517
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      Text = 'Text'
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 192
    Width = 345
    Height = 33
    Align = alBottom
    TabOrder = 2
    object btnSave: TButton
      Left = 136
      Top = 4
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TButton
      Left = 240
      Top = 4
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnTest: TButton
      Left = 32
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 2
      OnClick = btnTestClick
    end
  end
end
