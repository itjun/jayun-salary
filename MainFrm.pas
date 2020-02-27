unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Math,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    cdsView: TClientDataSet;
    dsView: TDataSource;
    cdsViewit_: TIntegerField;
    btnReset: TButton;
    cdsViewamount1_: TFloatField;
    cdsViewamount2_: TFloatField;
    cdsViewtotal_: TFloatField;
    cdsViewbase2_: TFloatField;
    cdsViewbase1_: TFloatField;
    cdsViewstd1_: TFloatField;
    cdsViewstd2_: TFloatField;
    cdsViewname_: TWideStringField;
    cdsViewnum_: TIntegerField;
    cdsViewweek_: TIntegerField;
    cdsViewhous_: TIntegerField;
    btnDemo: TButton;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure btnResetClick(Sender: TObject);
    procedure btnDemoClick(Sender: TObject);
  private
    { Private declarations }
    dbFile: string;
    function caclAmount(base: double): double;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  cdsView.CreateDataSet;
  cdsView.IndexFieldNames := 'it_';
  dbFile := ChangeFileExt(Application.ExeName, '.dat');
  if fileExists(dbFile) then
  begin
    try
      cdsView.LoadFromFile(dbFile);
    except
      on e: exception do
      begin
        showMessage(e.Message);
        deleteFile(dbFile);
      end;
    end;
  end;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  cdsView.SaveToFile(dbFile);
end;

//��׼ʱн�ļ��㹫ʽ��
//1���ܹ�ʱ = 5*8H + 2*3H + 8H/2 = 40H����н�ʼ���ϵ��Ϊ��5*8 + 2*3*1.5 + 8/2*2 = 57
//2����н�ʼ���ϵ��Ϊ = 365 / 7 * 57 = 2972
//3����׼ʱн = ԭ��н * 12���� / 2972
procedure TFrmMain.btnResetClick(Sender: TObject);
var
  rate: double;
begin
  rate := 2972;
  with cdsView do
  begin
    first;
    while not eof do
    begin
      edit;
      fieldByName('base1_').AsFloat := roundto(fieldByName('std1_').AsFloat * 12 / rate, -2);
      fieldByName('base2_').AsFloat := roundto(fieldByName('std2_').AsFloat * 12 / rate, -2);
      //����������
      fieldByName('week_').AsInteger := fieldByName('num_').AsInteger div 50;
      //��������ʱ��
      fieldByName('hous_').AsInteger := fieldByName('num_').AsInteger mod 50;
      fieldByName('amount1_').AsFloat := roundTo(caclAmount(fieldByName('base1_').AsFloat), -2);
      fieldByName('amount2_').AsFloat := roundTo(caclAmount(fieldByName('base2_').AsFloat), -2);
      fieldByName('total_').AsFloat := roundto(fieldByName('amount1_').AsFloat + fieldByName('amount2_').AsFloat, -2);
      post;
      next;
    end;
  end;
end;

function TFrmMain.caclAmount(base: double): double;
var
  amount: double;
  hous: double;
  i: Integer;
begin
  //����������н��
  amount := base * 40 + base * 6 * 1.5 + base * 4 * 2;
  result := amount * cdsView.fieldByName('week_').AsInteger;

  //������֮ʱ��
  hous := cdsView.fieldByName('hous_').AsInteger;

  //������1����5
  for i := 1 to 5 do
  begin
    if i in [1, 3, 5] then
      begin
        if hous > 10 then
          begin
            result := result + base * 8 + base * 2 * 1.5;
            hous := hous - 10;
          end
        else if hous > 8 then
          begin
            result := result + base * 8 + base * (hous - 8) * 1.5;
            hous := 0;
          end
        else
          begin
            result := result + base * hous;
            hous := 0;
          end;
      end
    else
      begin
        if hous > 8 then
          begin
            result := result + base * 8;
            hous := hous - 8;
          end
        else
          begin
            result := result + base * hous;
            hous := 0;
          end;
      end;
  end;
  //������ĩ
  if hous > 0 then
    result := result + base * hous * 2;
end;

procedure TFrmMain.btnDemoClick(Sender: TObject);
  procedure appendRecord(const text: string; base1, base2: double);
  begin
    with cdsView do
    begin
      append;
      fieldByName('name_').AsString := text;
      fieldByName('std1_').AsFloat := base1;
      fieldByName('std2_').AsFloat := base2;
      fieldByName('num_').AsFloat := 219;
      post;
    end;
  end;
begin
  appendRecord('����', 5000, 0);
  appendRecord('����', 6000, 0);
  appendRecord('����', 7000, 0);
  appendRecord('����', 8000, 0);
  btnReset.Click;
end;

procedure TFrmMain.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    fieldByName('it_').AsInteger := RecordCount + 1;
  end;
end;

end.
