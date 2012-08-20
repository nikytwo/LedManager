object FormSetting: TFormSetting
  Left = 416
  Top = 259
  BorderStyle = bsDialog
  Caption = #35774#32622
  ClientHeight = 337
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cnpnlLeft: TCnPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 337
    Align = alLeft
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    Transparent = False
    object alblScreenTitle: TCnAALabel
      Left = 8
      Top = 8
      Width = 67
      Height = 13
      ParentEffect.ParentFont = False
      Caption = #26174#31034#23631#21015#34920
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
    end
    object cnbtnAddScreen: TCnBitBtn
      Left = 8
      Top = 304
      Width = 57
      Height = 25
      Caption = #28155#21152
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 0
      TabStop = True
      OnClick = cnbtnAddScreenClick
    end
    object cnbtnDelScreen: TCnBitBtn
      Left = 80
      Top = 304
      Width = 57
      Height = 25
      Caption = #21024#38500
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 1
      TabStop = True
      OnClick = cnbtnDelScreenClick
    end
    object lstScreens: TListBox
      Left = 8
      Top = 32
      Width = 129
      Height = 265
      ItemHeight = 13
      Items.Strings = (
        'LSN1')
      TabOrder = 2
      OnClick = lstScreensClick
    end
  end
  object cnpnlContext: TCnPanel
    Left = 145
    Top = 0
    Width = 411
    Height = 337
    Align = alClient
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    Transparent = False
    object alblTextSource: TCnAALabel
      Left = 8
      Top = 312
      Width = 94
      Height = 13
      ParentEffect.ParentFont = False
      AutoSize = False
      Caption = #26174#31034#23631#20869#23481#26469#28304
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
    end
    object grpHardSetting: TGroupBox
      Left = 8
      Top = 16
      Width = 393
      Height = 73
      Caption = #26174#31034#23631#30828#20214#35774#32622
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 91
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #36890#35759#20018#21475
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 252
        Top = 21
        Width = 44
        Height = 13
        AutoSize = False
        Caption = #27874#29305#29575
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 102
        Top = 50
        Width = 46
        Height = 13
        AutoSize = False
        Caption = 'IP '#22320#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 240
        Top = 50
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #21457#36865#31471#21475
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object rbRs: TRadioButton
        Left = 7
        Top = 19
        Width = 81
        Height = 17
        Caption = 'RS232/485'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbClick
      end
      object cbbPort: TComboBox
        Left = 146
        Top = 17
        Width = 87
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'COM1'
        OnChange = CtrlChange
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9'
          'COM10'
          'COM11'
          'COM12'
          'COM13'
          'COM14'
          'COM15'
          'COM16')
      end
      object cbbBaudrate: TComboBox
        Left = 296
        Top = 17
        Width = 88
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = '115200'
        OnChange = CtrlChange
        Items.Strings = (
          '115200'
          '57600'
          '38400'
          '19200'
          '9600'
          '4800'
          '2400')
      end
      object rbNet: TRadioButton
        Left = 7
        Top = 48
        Width = 89
        Height = 17
        Caption = #32593#32476#20256#36755
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = rbClick
      end
      object edtIPPort: TEdit
        Tag = 1
        Left = 296
        Top = 47
        Width = 88
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '1024'
        OnChange = CtrlChange
      end
      object edtIP: TEdit
        Tag = 1
        Left = 146
        Top = 47
        Width = 87
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '192.168.128.128'
        OnChange = CtrlChange
      end
    end
    object grpParaSetting: TGroupBox
      Left = 8
      Top = 96
      Width = 393
      Height = 73
      Caption = #21442#25968#35774#32622
      TabOrder = 1
      object lblWidth: TLabel
        Left = 9
        Top = 21
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #27178#21521#28857#25968
      end
      object lblHeight: TLabel
        Left = 184
        Top = 21
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #32437#21521#28857#25968
      end
      object lblColorStyle: TLabel
        Left = 16
        Top = 45
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #21333'/'#21452#33394
      end
      object lblModeStyle: TLabel
        Left = 184
        Top = 45
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #27169#22359#31867#22411
      end
      object seWidth: TCnSpinEdit
        Left = 66
        Top = 16
        Width = 65
        Height = 22
        EditorEnabled = False
        Increment = 16
        MaxValue = 16000
        MinValue = 16
        TabOrder = 0
        Value = 128
        OnChange = CtrlChange
      end
      object seHeight: TCnSpinEdit
        Left = 242
        Top = 16
        Width = 65
        Height = 22
        EditorEnabled = False
        Increment = 16
        MaxValue = 16000
        MinValue = 16
        TabOrder = 1
        Value = 64
        OnChange = CtrlChange
      end
      object cbbColorStyle: TComboBox
        Left = 66
        Top = 41
        Width = 67
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 2
        Text = #21452#22522#33394
        OnChange = CtrlChange
        Items.Strings = (
          #21333#33394
          #21452#22522#33394)
      end
      object cbbModeStyle: TComboBox
        Left = 242
        Top = 41
        Width = 67
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'R+G'
        OnChange = CtrlChange
        Items.Strings = (
          'R+G'
          'G+R')
      end
    end
    object grpTemplet: TGroupBox
      Left = 8
      Top = 176
      Width = 393
      Height = 121
      Caption = #26174#31034#27169#26495#35774#32622
      TabOrder = 2
      object lblFontName: TLabel
        Left = 9
        Top = 21
        Width = 27
        Height = 13
        AutoSize = False
        Caption = #23383#20307
      end
      object lblFontSize: TLabel
        Left = 86
        Top = 21
        Width = 27
        Height = 13
        AutoSize = False
        Caption = #22823#23567
      end
      object lblEffect: TLabel
        Left = 9
        Top = 50
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #26174#31034#26041#24335
      end
      object lblRunSpeed: TLabel
        Left = 9
        Top = 79
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #36816#34892#36895#24230
      end
      object lblStayTime: TLabel
        Left = 138
        Top = 79
        Width = 53
        Height = 13
        AutoSize = False
        Caption = #25552#30041#26102#38388
      end
      object lblFontColor: TLabel
        Left = 167
        Top = 21
        Width = 27
        Height = 13
        AutoSize = False
        Caption = #39068#33394
      end
      object cbbFontSize: TComboBox
        Left = 114
        Top = 17
        Width = 48
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 1
        Text = '12'
        OnChange = CtrlChange
        Items.Strings = (
          '8'
          '12'
          '16'
          '24'
          '32'
          '40'
          '48'
          '56'
          '64')
      end
      object cbbFontName: TComboBox
        Left = 36
        Top = 17
        Width = 47
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #23435#20307
        OnChange = CtrlChange
        Items.Strings = (
          #23435#20307)
      end
      object cbbEffect: TComboBox
        Left = 64
        Top = 46
        Width = 177
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 2
        TabOrder = 3
        Text = #24038#35206#30422
        OnChange = CtrlChange
        Items.Strings = (
          #38543#26426
          #32763#39029
          #24038#35206#30422
          #21491#35206#30422
          #19978#35206#30422
          #19979#35206#30422
          #24038#19978#35282#35206#30422#65288#26012#32447#65289
          #21491#19978#35282#35206#30422#65288#26012#32447#65289
          #24038#19979#35282#35206#30422#65288#26012#32447#65289
          #21491#19979#35282#35206#30422#65288#26012#32447#65289
          #24038#19978#35282#35206#30422#65288#30452#32447#65289
          #21491#19978#35282#35206#30422#65288#30452#32447#65289
          #24038#19979#35282#35206#30422#65288#30452#32447#65289
          #21491#19979#35282#35206#30422#65288#30452#32447#65289
          #24038#19978#35282#35206#30422#65288#36793#27839#65289
          #21491#19978#35282#35206#30422#65288#36793#27839#65289
          #24038#19979#35282#35206#30422#65288#36793#27839#65289
          #21491#19979#35282#35206#30422#65288#36793#27839#65289
          #27700#24179#30334#21494#65288#24038#21491#65289
          #27700#24179#30334#21494#65288#19978#19979#65289
          #22402#30452#30334#21494#65288#24038#21491#65289
          #22402#30452#30334#21494#65288#19978#19979#65289
          #24038#21491#23545#24320
          #19978#19979#23545#24320
          #24038#21491#38381#21512
          #19978#19979#38381#21512
          #19978#31227
          #19979#31227
          #24038#31227
          #21491#31227
          #36830#32493#19978#31227
          #36830#32493#19979#31227
          #36830#32493#24038#31227
          #36830#32493#21491#31227
          #20013#38388#21521#22235#21608#65288#30697#24418#65289
          #22235#21608#21521#20013#38388#65288#30697#24418#65289
          #20013#38388#21521#22235#21608#65288#33777#24418#65289
          #22235#21608#21521#20013#38388#65288#33777#24418#65289
          #20013#38388#21521#22235#21608#65288#21313#23383#65289
          #22235#21608#21521#20013#38388#65288#21313#23383#65289)
      end
      object seRunSpeed: TCnSpinEdit
        Left = 64
        Top = 74
        Width = 47
        Height = 22
        MaxValue = 30
        MinValue = 0
        TabOrder = 4
        Value = 4
        OnChange = CtrlChange
      end
      object seStayTime: TCnSpinEdit
        Left = 193
        Top = 74
        Width = 47
        Height = 22
        MaxValue = 255
        MinValue = 0
        TabOrder = 5
        Value = 0
        OnChange = CtrlChange
      end
      object cbbFontColor: TComboBox
        Left = 194
        Top = 17
        Width = 48
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #32418#33394
        OnChange = CtrlChange
        Items.Strings = (
          #32418#33394
          #32511#33394
          #40644#33394)
      end
      object mmoText: TMemo
        Left = 248
        Top = 16
        Width = 137
        Height = 65
        Lines.Strings = (
          #27979#35797#26174#31034#23631#27979#35797#26174#31034
          #23631#27979#35797#26174#31034#23631
          #27979#35797#26174#31034#23631#27979#35797#26174#31034
          #23631#27979#35797#26174#31034#23631
          #27979#35797#26174#31034#23631#27979#35797#26174#31034
          #23631#27979#35797#26174#31034#23631
          #27979#35797#26174#31034#23631#27979#35797#26174#31034
          #23631#27979#35797#26174#31034#23631)
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object cnbtnTest: TCnBitBtn
        Left = 288
        Top = 86
        Width = 57
        Height = 24
        Caption = #27979#35797
        Color = clBtnFace
        DownBold = False
        FlatBorder = False
        HotTrackBold = False
        NumGlyphs = 1
        ParentColor = False
        TabOrder = 7
        TabStop = True
        OnClick = cnbtnTestClick
      end
    end
    object cnbtnSave: TCnBitBtn
      Left = 272
      Top = 306
      Width = 57
      Height = 25
      Caption = #20445#23384
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 3
      TabStop = True
      OnClick = cnbtnSaveClick
    end
    object cnbtnCancel: TCnBitBtn
      Left = 344
      Top = 306
      Width = 57
      Height = 25
      Caption = #21462#28040
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 4
      TabStop = True
      OnClick = cnbtnCancelClick
    end
    object edtTextSource: TEdit
      Tag = 1
      Left = 104
      Top = 309
      Width = 88
      Height = 19
      Hint = #35813#26174#31034#23631#26174#31034#30340#20869#23481#26469#28304#12290#22914#33509#35813#26174#31034#23631#29992#26469#26174#31034#24037#20316#31449'001'#30340#20869#23481#65292#21017#36755#20837#24037#20316#31449'001'#30340#35782#21035#21495#12290
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'gzz001'
      OnChange = CtrlChange
    end
  end
end
