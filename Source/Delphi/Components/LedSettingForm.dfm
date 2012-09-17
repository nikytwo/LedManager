object FormSetting: TFormSetting
  Left = 416
  Top = 259
  BorderStyle = bsDialog
  Caption = #35774#32622
  ClientHeight = 381
  ClientWidth = 599
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
    Width = 151
    Height = 381
    Align = alClient
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
    object cnbtnDelScreen: TCnBitBtn
      Left = 80
      Top = 348
      Width = 57
      Height = 25
      Caption = #21024#38500
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 0
      TabStop = True
      OnClick = cnbtnDelScreenClick
    end
    object lstScreens: TListBox
      Left = 8
      Top = 32
      Width = 129
      Height = 310
      ItemHeight = 13
      Items.Strings = (
        'LSN1')
      TabOrder = 1
      OnClick = lstScreensClick
    end
    object btnAdd: TRzMenuButton
      Left = 16
      Top = 348
      Width = 41
      Caption = #28155#21152
      TabOrder = 2
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830B0000830B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E809090909
        0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
        0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
      DropDownMenu = pmAdd
    end
  end
  object cnpnlLSNPanel: TCnPanel
    Left = 151
    Top = 0
    Width = 448
    Height = 381
    Align = alRight
    Ctl3D = False
    Enabled = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
    Transparent = False
    object alblTextSource: TCnAALabel
      Left = 6
      Top = 354
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
    object grpParaSetting: TGroupBox
      Left = 6
      Top = 143
      Width = 435
      Height = 73
      Caption = #21442#25968#35774#32622
      TabOrder = 0
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
        Left = 72
        Top = 17
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
        Left = 72
        Top = 40
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
      Left = 6
      Top = 222
      Width = 435
      Height = 121
      Caption = #26174#31034#27169#26495#35774#32622
      TabOrder = 1
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
      object cbbLSEffect: TComboBox
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
        Width = 177
        Height = 65
        Lines.Strings = (
          '1'#27979#35797#26174#31034#23631'1'
          '2'#27979#35797#26174#31034#23631'2'
          '3'#27979#35797#26174#31034#23631'3'
          '4'#27979#35797#26174#31034#23631'4'
          '5'#27979#35797#26174#31034#23631'5'
          '6'#27979#35797#26174#31034#23631'6'
          '7'#27979#35797#26174#31034#23631'7'
          '8'#27979#35797#26174#31034#23631'8')
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object cnbtnTest: TCnBitBtn
        Left = 304
        Top = 87
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
      object cbbCPEffect: TComboBox
        Left = 64
        Top = 47
        Width = 177
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
        Visible = False
        OnChange = CtrlChange
        Items.Strings = (
          #31435#21363#26174#31034#65288#26080#29305#25928#65289
          #24038#24320
          #21491#24320
          #27178#20013#24320
          #31446#20013#24320
          #30334#21494#65288#22402#30452#65289
          #24038#31227
          #21491#31227
          #19978#31227
          #19979#31227
          #21521#19978#28378#21160
          #21521#24038#28378#21160
          #21521#21491#28378#21160
          #38378#28865
          #36830#32493#21521#24038#28378#21160
          #36830#32493#21521#21491#28378#21160
          #30334#21494#65288#27700#24179#65289
          #39034#26102#38024#23637#24320
          #36870#26102#38024#23637#24320
          #39118#36710
          #39118#36710#65288#36870#26102#38024#65289
          #30697#24418#21521#22806
          #30697#24418#21521#20869
          #22235#35282#21521#22806
          #22235#35282#21521#20869
          #22278#24418#21521#22806
          #22278#24418#21521#20869
          #24038#19978#35282#23637#24320
          #21491#19978#35282#23637#24320
          #24038#19979#35282#23637#24320
          #21491#19979#35282#23637#24320
          #26012#35282#23637#24320
          #21453#26012#35282#23637#24320
          #24038#19978#35282#36827#20837
          #21491#19978#35282#36827#20837
          #24038#19979#35282#36827#20837
          #21491#19979#35282#36827#20837
          #26012#35282#36827#20837
          #21453#26012#35282#36827#20837
          #27700#24179#26001#39532#32447
          #22402#30452#26001#39532#32447
          #39532#36187#20811#65288#22823#65289
          #39532#36187#20811#65288#23567#65289
          #25918#23556#32447#65288#21521#19978#65289
          #25918#23556#32447#65288#21521#19979#65289
          #31215#32858
          #19979#33853
          #21512#24182#65288#27700#24179#65289
          #21512#24182#65288#22402#30452#65289
          #26059#20986
          #26059#20837
          #26827#30424#65288#27700#24179#65289
          #26827#30424#65288#22402#30452#65289
          #36830#32493#21521#19978#28378#21160
          #36830#32493#21521#19979#28378#21160
          #20445#30041
          #20445#30041
          #36880#27493#21464#22823#65288#19978#65289
          #36880#27493#21464#22823#65288#19979#65289
          #20445#30041
          #36880#27493#21464#22823#65288#22402#30452#65289
          #38378#21160#65288#27700#24179#65289
          #38378#21160#65288#22402#30452#65289
          #39128#38634
          #21521#19979#28378#21160
          #24038#21491#28378#21160
          #19978#19979#23637#24320
          #25159#24418#23637#24320
          #20445#30041
          #26001#39532#26465#65288#27700#24179#65289
          #26001#39532#26465#65288#22402#30452#65289)
      end
    end
    object cnbtnSave: TCnBitBtn
      Left = 270
      Top = 348
      Width = 57
      Height = 25
      Caption = #20445#23384
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 2
      TabStop = True
      OnClick = cnbtnSaveClick
    end
    object cnbtnCancel: TCnBitBtn
      Left = 342
      Top = 348
      Width = 57
      Height = 25
      Caption = #21462#28040
      Color = clBtnFace
      DownBold = False
      FlatBorder = False
      HotTrackBold = False
      NumGlyphs = 1
      ParentColor = False
      TabOrder = 3
      TabStop = True
      OnClick = cnbtnCancelClick
    end
    object edtTextSource: TEdit
      Tag = 1
      Left = 102
      Top = 351
      Width = 88
      Height = 19
      Hint = #35813#26174#31034#23631#26174#31034#30340#20869#23481#26469#28304#12290#22914#33509#35813#26174#31034#23631#29992#26469#26174#31034#24037#20316#31449'001'#30340#20869#23481#65292#21017#36755#20837#24037#20316#31449'001'#30340#35782#21035#21495#12290
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'gzz001'
      OnChange = CtrlChange
    end
    object grpHardSetting: TGroupBox
      Left = 6
      Top = 9
      Width = 435
      Height = 128
      Caption = 'Listen1'#21495#23631#35774#32622#65306
      TabOrder = 5
      object lbl3: TLabel
        Left = 23
        Top = 20
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #36890#35759#27169#24335#65306
      end
      object lblCardType: TLabel
        Left = 9
        Top = 74
        Width = 74
        Height = 13
        AutoSize = False
        Caption = #25511#21046#22120#31867#22411#65306
      end
      object lbl7: TLabel
        Left = 51
        Top = 47
        Width = 36
        Height = 13
        AutoSize = False
        Caption = #23631#21495#65306
      end
      object cbbTransMode: TComboBox
        Left = 89
        Top = 16
        Width = 121
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 0
        Text = #32593#32476#27169#24335
        OnChange = CtrlChange
        Items.Strings = (
          #32593#32476#27169#24335
          #20018#21475#27169#24335)
      end
      object cbbCardType: TComboBox
        Left = 89
        Top = 69
        Width = 121
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 2
        Text = 'N1,N2,L1'
        OnChange = CtrlChange
        Items.Strings = (
          'N1,N2,L1'
          'N3'
          'T1,T2,T3,T4')
      end
      object grpNet: TGroupBox
        Left = 216
        Top = 16
        Width = 209
        Height = 89
        Caption = #32593#32476#21442#25968#65306
        TabOrder = 3
        object lbl8: TLabel
          Left = 24
          Top = 24
          Width = 46
          Height = 13
          AutoSize = False
          Caption = 'IP'#22320#22336#65306
        end
        object lblIDCode: TLabel
          Left = 24
          Top = 70
          Width = 46
          Height = 13
          AutoSize = False
          Caption = #35782#21035#30721#65306
        end
        object lblIPPort: TLabel
          Left = 6
          Top = 46
          Width = 65
          Height = 13
          AutoSize = False
          Caption = #31471#21475#22320#22336#65306
        end
        object edtIP: TEdit
          Left = 76
          Top = 21
          Width = 89
          Height = 19
          MaxLength = 15
          TabOrder = 0
          Text = '192.168.1.99'
          OnChange = CtrlChange
        end
        object edtIDCode: TEdit
          Left = 76
          Top = 67
          Width = 89
          Height = 19
          MaxLength = 15
          TabOrder = 1
          Text = '-1'
          OnChange = CtrlChange
        end
        object edtIPPort: TEdit
          Left = 76
          Top = 44
          Width = 89
          Height = 19
          MaxLength = 15
          TabOrder = 2
          Text = '1024'
          OnChange = CtrlChange
        end
      end
      object grpCom: TGroupBox
        Left = 216
        Top = 16
        Width = 209
        Height = 97
        Caption = #20018#21475#21442#25968#65306
        TabOrder = 4
        Visible = False
        object lbl9: TLabel
          Left = 30
          Top = 20
          Width = 36
          Height = 13
          AutoSize = False
          Caption = #20018#21475#65306
        end
        object lbl10: TLabel
          Left = 16
          Top = 51
          Width = 48
          Height = 13
          AutoSize = False
          Caption = #27874#29305#29575#65306
        end
        object cbbComNO: TComboBox
          Left = 72
          Top = 16
          Width = 97
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 0
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
            'COM8')
        end
        object cbbBaudrate: TComboBox
          Left = 72
          Top = 47
          Width = 97
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 1
          Text = '9600'
          OnChange = CtrlChange
          Items.Strings = (
            '9600'
            '38400'
            '57600'
            '115200')
        end
      end
      object edtScreenID: TEdit
        Left = 89
        Top = 44
        Width = 121
        Height = 19
        TabOrder = 1
        Text = '1'
        OnChange = CtrlChange
      end
    end
  end
  object pmAdd: TPopupMenu
    Left = 32
    Top = 280
    object Listen1: TMenuItem
      Caption = 'Listen'#31995#21015
      OnClick = Listen1Click
    end
    object cPower1: TMenuItem
      Caption = 'cPower'#31995#21015
      OnClick = cPower1Click
    end
  end
end
