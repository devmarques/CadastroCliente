object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 547
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 746
    Height = 506
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 281
      ExplicitHeight = 161
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 738
        Height = 105
        Align = alTop
        Caption = 'Panel1'
        Color = cl3DLight
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object Label14: TLabel
          Left = 1
          Top = 1
          Width = 736
          Height = 20
          Align = alTop
          Alignment = taCenter
          Caption = 'Pesquise atrav'#233's dos filtros desejados:'
          Color = clHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          ExplicitWidth = 268
        end
        object Label15: TLabel
          Left = 30
          Top = 40
          Width = 36
          Height = 17
          Caption = 'Nome'
        end
        object Label16: TLabel
          Left = 475
          Top = 40
          Width = 21
          Height = 17
          Caption = 'CPF'
        end
        object Label17: TLabel
          Left = 26
          Top = 71
          Width = 40
          Height = 17
          Caption = 'Estado'
        end
        object btnConsultar: TSpeedButton
          Left = 635
          Top = 31
          Width = 94
          Height = 66
          Caption = 'Consultar'
          Transparent = False
          OnClick = btnConsultarClick
        end
        object txtNomeConsulta: TEdit
          Left = 72
          Top = 37
          Width = 397
          Height = 25
          TabOrder = 0
        end
        object txtCPFConsulta: TEdit
          Left = 502
          Top = 37
          Width = 127
          Height = 25
          TabOrder = 1
        end
        object txtEstadoConsulta: TEdit
          Left = 72
          Top = 68
          Width = 52
          Height = 25
          TabOrder = 2
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 105
        Width = 738
        Height = 369
        Align = alClient
        DataSource = dsCliente
        DrawingStyle = gdsGradient
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cpf'
            Title.Caption = 'CPF'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome Completo'
            Width = 448
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'identidade'
            Title.Caption = 'Identidade'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Title.Caption = 'Telefone'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'Email'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cep'
            Title.Caption = 'CEP'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'logradouro'
            Title.Caption = 'Logradouro'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero'
            Title.Caption = 'N'#186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'complemento'
            Title.Caption = 'Complemento'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bairro'
            Title.Caption = 'Bairro'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Title.Caption = 'Cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estado'
            Title.Caption = 'Estado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pais'
            Title.Caption = 'Pais'
            Width = 150
            Visible = True
          end>
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 32
      ExplicitHeight = 515
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 738
        Height = 105
        Align = alTop
        Caption = 'Identifica'#231#227'o'
        TabOrder = 0
        ExplicitWidth = 746
        object Label1: TLabel
          Left = 8
          Top = 35
          Width = 97
          Height = 17
          Caption = 'Nome Completo'
        end
        object Label2: TLabel
          Left = 84
          Top = 66
          Width = 21
          Height = 17
          Caption = 'CPF'
        end
        object Label3: TLabel
          Left = 238
          Top = 66
          Width = 62
          Height = 17
          Caption = 'Identidade'
        end
        object txtNome: TDBEdit
          Left = 111
          Top = 32
          Width = 618
          Height = 25
          DataField = 'nome'
          DataSource = dsCliente
          TabOrder = 0
        end
        object txtCPF: TDBEdit
          Left = 111
          Top = 63
          Width = 121
          Height = 25
          DataField = 'cpf'
          DataSource = dsCliente
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 306
          Top = 63
          Width = 121
          Height = 25
          DataField = 'identidade'
          DataSource = dsCliente
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 105
        Width = 738
        Height = 112
        Align = alTop
        Caption = 'Contatos'
        TabOrder = 1
        object Label5: TLabel
          Left = 74
          Top = 33
          Width = 31
          Height = 17
          Caption = 'Email'
        end
        object Label4: TLabel
          Left = 56
          Top = 64
          Width = 49
          Height = 17
          Caption = 'Telefone'
        end
        object txtEmail: TDBEdit
          Left = 111
          Top = 30
          Width = 618
          Height = 25
          DataField = 'email'
          DataSource = dsCliente
          TabOrder = 0
        end
        object txtTelefone: TDBEdit
          Left = 111
          Top = 61
          Width = 202
          Height = 25
          DataField = 'telefone'
          DataSource = dsCliente
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 217
        Width = 738
        Height = 248
        Align = alTop
        Caption = 'Endere'#231'o'
        TabOrder = 2
        object Label7: TLabel
          Left = 35
          Top = 67
          Width = 70
          Height = 17
          Caption = 'Logradouro'
        end
        object Label8: TLabel
          Left = 89
          Top = 98
          Width = 16
          Height = 17
          BiDiMode = bdLeftToRight
          Caption = 'N'#186
          ParentBiDiMode = False
        end
        object Label9: TLabel
          Left = 23
          Top = 160
          Width = 82
          Height = 17
          Caption = 'Complemento'
        end
        object Label10: TLabel
          Left = 70
          Top = 129
          Width = 35
          Height = 17
          Caption = 'Bairro'
        end
        object Label6: TLabel
          Left = 83
          Top = 36
          Width = 22
          Height = 17
          Caption = 'CEP'
        end
        object Label11: TLabel
          Left = 238
          Top = 36
          Width = 40
          Height = 17
          Caption = 'Estado'
        end
        object Label12: TLabel
          Left = 335
          Top = 36
          Width = 41
          Height = 17
          Caption = 'Cidade'
        end
        object Label13: TLabel
          Left = 82
          Top = 191
          Width = 23
          Height = 17
          Caption = 'Pa'#237's'
        end
        object DBEdit7: TDBEdit
          Left = 111
          Top = 33
          Width = 121
          Height = 25
          DataField = 'cep'
          DataSource = dsCliente
          MaxLength = 8
          TabOrder = 0
          OnExit = DBEdit7Exit
        end
        object DBEdit1: TDBEdit
          Left = 284
          Top = 33
          Width = 45
          Height = 25
          DataField = 'estado'
          DataSource = dsCliente
          MaxLength = 2
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 382
          Top = 33
          Width = 347
          Height = 25
          DataField = 'cidade'
          DataSource = dsCliente
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 111
          Top = 64
          Width = 618
          Height = 25
          DataField = 'logradouro'
          DataSource = dsCliente
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 111
          Top = 95
          Width = 57
          Height = 25
          DataField = 'numero'
          DataSource = dsCliente
          MaxLength = 2
          TabOrder = 4
        end
        object DBEdit11: TDBEdit
          Left = 111
          Top = 126
          Width = 618
          Height = 25
          DataField = 'bairro'
          DataSource = dsCliente
          TabOrder = 5
        end
        object DBEdit12: TDBEdit
          Left = 111
          Top = 157
          Width = 618
          Height = 25
          DataField = 'complemento'
          DataSource = dsCliente
          TabOrder = 6
        end
        object DBEdit13: TDBEdit
          Left = 111
          Top = 188
          Width = 618
          Height = 25
          DataField = 'pais'
          DataSource = dsCliente
          TabOrder = 7
        end
      end
    end
    object tsConfiguracaoEmail: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 2
      TabVisible = False
      OnShow = tsConfiguracaoEmailShow
      DesignSize = (
        738
        474)
      object btnSalvarConfiguracaoEmail: TSpeedButton
        Left = 492
        Top = 436
        Width = 120
        Height = 35
        Anchors = [akTop, akRight]
        Caption = 'Salvar'
        Transparent = False
        OnClick = btnSalvarConfiguracaoEmailClick
      end
      object btnCancelarConfiguracaoEmail: TSpeedButton
        Left = 615
        Top = 436
        Width = 120
        Height = 35
        Anchors = [akTop, akRight]
        Caption = 'Cancelar'
        Transparent = False
        OnClick = btnCancelarConfiguracaoEmailClick
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 738
        Height = 105
        Align = alTop
        Caption = 'Email'
        TabOrder = 0
        ExplicitLeft = -3
        object Label18: TLabel
          Left = 44
          Top = 26
          Width = 31
          Height = 17
          Caption = 'Email'
        end
        object Label19: TLabel
          Left = 420
          Top = 26
          Width = 56
          Height = 17
          Caption = 'Password'
        end
        object Label20: TLabel
          Left = 42
          Top = 57
          Width = 33
          Height = 17
          Caption = 'SMTP'
        end
        object Label21: TLabel
          Left = 271
          Top = 57
          Width = 31
          Height = 17
          Caption = 'Porta'
        end
        object DBEdit14: TDBEdit
          Left = 81
          Top = 23
          Width = 333
          Height = 25
          DataField = 'email'
          DataSource = dsEmail
          TabOrder = 0
        end
        object DBEdit15: TDBEdit
          Left = 482
          Top = 23
          Width = 247
          Height = 25
          DataField = 'password'
          DataSource = dsEmail
          TabOrder = 1
        end
        object DBEdit16: TDBEdit
          Left = 81
          Top = 54
          Width = 184
          Height = 25
          DataField = 'smtp'
          DataSource = dsEmail
          TabOrder = 2
        end
        object DBEdit17: TDBEdit
          Left = 308
          Top = 54
          Width = 106
          Height = 25
          DataField = 'porta'
          DataSource = dsEmail
          TabOrder = 3
        end
        object DBCheckBox1: TDBCheckBox
          Left = 559
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Usa TLS'
          DataField = 'tls'
          DataSource = dsEmail
          TabOrder = 4
        end
        object DBCheckBox2: TDBCheckBox
          Left = 482
          Top = 58
          Width = 71
          Height = 17
          Caption = 'Usa SSL'
          DataField = 'ssl'
          DataSource = dsEmail
          TabOrder = 5
        end
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 506
    Width = 746
    Height = 41
    Align = alBottom
    Caption = 'pnlButtons'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 224
    ExplicitTop = 208
    ExplicitWidth = 185
    DesignSize = (
      746
      41)
    object btnAdicionar: TSpeedButton
      Left = 4
      Top = 2
      Width = 120
      Height = 35
      Caption = 'Adicionar'
      Transparent = False
      OnClick = btnAdicionarClick
    end
    object SpeedButton2: TSpeedButton
      Left = 536
      Top = 0
      Width = 97
      Height = 33
      Flat = True
    end
    object btnEditar: TSpeedButton
      Left = 130
      Top = 2
      Width = 120
      Height = 35
      Caption = 'Editar'
      Transparent = False
      OnClick = btnEditarClick
    end
    object btnCancelar: TSpeedButton
      Left = 622
      Top = 2
      Width = 120
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      Transparent = False
      OnClick = btnCancelarClick
    end
    object btnSalvar: TSpeedButton
      Left = 496
      Top = 2
      Width = 120
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      Transparent = False
      OnClick = btnSalvarClick
    end
    object btnExcluir: TSpeedButton
      Left = 256
      Top = 2
      Width = 120
      Height = 35
      Caption = 'Excluir'
      Transparent = False
      OnClick = btnExcluirClick
    end
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 452
    object cdsClienteid: TIntegerField
      FieldName = 'id'
    end
    object cdsClientenome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object cdsClientecpf: TStringField
      FieldName = 'cpf'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClienteidentidade: TStringField
      FieldName = 'identidade'
      Size = 9
    end
    object cdsClientetelefone: TStringField
      FieldName = 'telefone'
      Size = 11
    end
    object cdsClienteemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object cdsClientecep: TStringField
      FieldName = 'cep'
      EditMask = '99.999-999;0;_'
      Size = 8
    end
    object cdsClientelogradouro: TStringField
      FieldName = 'logradouro'
      Size = 80
    end
    object cdsClientenumero: TIntegerField
      FieldName = 'numero'
    end
    object cdsClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 60
    end
    object cdsClientebairro: TStringField
      FieldName = 'bairro'
      Size = 80
    end
    object cdsClientecidade: TStringField
      FieldName = 'cidade'
      Size = 80
    end
    object cdsClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object cdsClientepais: TStringField
      FieldName = 'pais'
      Size = 60
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = cdsCliente
    OnStateChange = dsClienteStateChange
    Left = 76
    Top = 452
  end
  object MainMenu1: TMainMenu
    Left = 556
    Top = 284
    object N1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object mConfiguracao: TMenuItem
        Caption = 'Configura'#231#245'es de Email'
        OnClick = mConfiguracaoClick
      end
    end
  end
  object cdsEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cdsEmailAfterInsert
    Left = 412
    Top = 228
    object cdsEmailemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object cdsEmailpassword: TStringField
      FieldName = 'password'
      Size = 50
    end
    object cdsEmailsmtp: TStringField
      FieldName = 'smtp'
      Size = 60
    end
    object cdsEmailporta: TIntegerField
      FieldName = 'porta'
    end
    object cdsEmailtls: TBooleanField
      FieldName = 'tls'
    end
    object cdsEmailssl: TBooleanField
      FieldName = 'ssl'
    end
  end
  object dsEmail: TDataSource
    DataSet = cdsEmail
    Left = 460
    Top = 228
  end
end
