object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #34218#36164#35745#31639#24037#20855
  ClientHeight = 520
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 464
    Width = 889
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnReset: TButton
      Left = 288
      Top = 16
      Width = 97
      Height = 25
      Caption = #37325#26032#35745#31639
      TabOrder = 0
      OnClick = btnResetClick
    end
    object btnDemo: TButton
      Left = 776
      Top = 16
      Width = 97
      Height = 25
      Caption = #36733#20837#28436#31034#25968#25454
      TabOrder = 1
      OnClick = btnDemoClick
    end
    object DBNavigator1: TDBNavigator
      Left = 16
      Top = 16
      Width = 240
      Height = 25
      DataSource = dsView
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 889
    Height = 464
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 304
    ExplicitTop = 176
    ExplicitWidth = 289
    ExplicitHeight = 193
    object TabSheet1: TTabSheet
      Caption = #25968#25454
      ExplicitWidth = 281
      ExplicitHeight = 165
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 881
        Height = 436
        Align = alClient
        DataSource = dsView
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'it_'
            Title.Alignment = taCenter
            Title.Caption = #24207
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_'
            Title.Alignment = taCenter
            Title.Caption = #22995#21517
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'std1_'
            Title.Alignment = taCenter
            Title.Caption = #22522#20934#24037#36164
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'std2_'
            Title.Alignment = taCenter
            Title.Caption = #22870#37329#65288#28014#21160#65289
            Width = 85
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'base1_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24037#36164#26102#34218
            Width = 65
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'base2_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #22870#37329#26102#34218
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'num_'
            Title.Alignment = taCenter
            Title.Caption = #20986#21220#24635#26102#25968
            Width = 85
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'week_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #21608#25968
            Width = 65
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'hous_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #26102#25968
            Width = 65
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'amount1_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24212#21457#24037#36164
            Width = 65
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'amount2_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24212#21457#22870#37329
            Width = 65
            Visible = True
          end
          item
            Color = clSilver
            Expanded = False
            FieldName = 'total_'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #24212#21457#21512#35745
            Width = 75
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35828#26126
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 881
        Height = 436
        Align = alClient
        Lines.Strings = (
          #22522#20934#26102#34218#30340#35745#31639#20844#24335#65306
          ''
          
            '1'#12289#21608#24037#26102' = 5*8H + 2*3H + 8H/2 = 50H'#65292#21608#34218#36164#35745#31639#31995#25968#20026#65306'5*8 + 2*3*1.5 + 8/2*2 ' +
            '= 57'
          '2'#12289#24180#34218#36164#35745#31639#31995#25968#20026' = 365 / 7 * 57 = 2972'
          '3'#12289#22522#20934#26102#34218' = '#21407#26376#34218' * 12'#20010#26376' / 2972')
        ReadOnly = True
        TabOrder = 0
        ExplicitTop = -2
      end
    end
  end
  object cdsView: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewNewRecord
    Left = 80
    Top = 176
    object cdsViewit_: TIntegerField
      FieldName = 'it_'
    end
    object cdsViewname_: TWideStringField
      FieldName = 'name_'
      Size = 8
    end
    object cdsViewstd1_: TFloatField
      FieldName = 'std1_'
    end
    object cdsViewstd2_: TFloatField
      FieldName = 'std2_'
    end
    object cdsViewbase1_: TFloatField
      FieldName = 'base1_'
    end
    object cdsViewbase2_: TFloatField
      FieldName = 'base2_'
    end
    object cdsViewnum_: TIntegerField
      FieldName = 'num_'
    end
    object cdsViewweek_: TIntegerField
      FieldName = 'week_'
    end
    object cdsViewhous_: TIntegerField
      FieldName = 'hous_'
    end
    object cdsViewamount1_: TFloatField
      FieldName = 'amount1_'
    end
    object cdsViewamount2_: TFloatField
      FieldName = 'amount2_'
    end
    object cdsViewtotal_: TFloatField
      FieldName = 'total_'
    end
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 80
    Top = 248
  end
end
