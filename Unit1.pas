unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdDNSResolver, winsock,
  Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Grids, Vcl.ComCtrls, ClipBrd ;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Memo2: TMemo;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetIP(const HostName: string): string;
    function IPAddrToName(IPAddr: string): string;
    function GetProtocolName(id : Integer) : String;
    function ClearGrid() : Boolean;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.ClearGrid() : Boolean;
var I: Integer;
begin
   for I := 1 to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[I].Clear;
   result := True;
end;


function TForm1.GetProtocolName(id : Integer) : String;
begin
    case id of
      0	: Result := 'HOPOPT';
      1	: Result := 'ICMP';
      2	: Result := 'IGMP';
      3	: Result := 'GGP';
      4	: Result := 'IP-in-IP';
      5	: Result := 'ST';
      6	: Result := 'TCP';
      7	: Result := 'CBT';
      8	: Result := 'EGP';
      9	: Result := 'IGP';
      10	: Result := 'BBN-RCC-MON';
      11	: Result := 'NVP-II';
      12	: Result := 'PUP';
      13	: Result := 'ARGUS';
      14	: Result := 'EMCON';
      15	: Result := 'XNET';
      16	: Result := 'CHAOS';
      17	: Result := 'UDP';
      18	: Result := 'MUX';
      19	: Result := 'DCN-MEAS';
      20	: Result := 'HMP';
      21	: Result := 'PRM';
      22	: Result := 'XNS-IDP';
      23	: Result := 'TRUNK-1';
      24	: Result := 'TRUNK-2';
      25	: Result := 'LEAF-1';
      26	: Result := 'LEAF-2';
      27	: Result := 'RDP';
      28	: Result := 'IRTP';
      29	: Result := 'ISO-TP4';
      30	: Result := 'NETBLT';
      31	: Result := 'MFE-NSP';
      32	: Result := 'MERIT-INP';
      33	: Result := 'DCCP';
      34	: Result := '3PC';
      35	: Result := 'IDPR';
      36	: Result := 'XTP';
      37	: Result := 'DDP';
      38	: Result := 'IDPR-CMTP';
      39	: Result := 'TP++';
      40	: Result := 'IL';
      41	: Result := 'IPv6';
      42	: Result := 'SDRP';
      43	: Result := 'IPv6-Route';
      44	: Result := 'IPv6-Frag';
      45	: Result := 'IDRP';
      46	: Result := 'RSVP';
      47	: Result := 'GRE';
      48	: Result := 'DSR';
      49	: Result := 'BNA';
      50	: Result := 'ESP';
      51	: Result := 'AH';
      52	: Result := 'I-NLSP';
      53	: Result := 'SWIPE';
      54	: Result := 'NARP';
      55	: Result := 'MOBILE';
      56	: Result := 'TLSP';
      57	: Result := 'SKIP';
      58	: Result := 'IPv6-ICMP';
      59	: Result := 'IPv6-NoNxt';
      60	: Result := 'IPv6-Opts';
      62	: Result := 'CFTP';
      64	: Result := 'SAT-EXPAK';
      65	: Result := 'KRYPTOLAN';
      66	: Result := 'RVD';
      67	: Result := 'IPPC';
      69	: Result := 'SAT-MON';
      70	: Result := 'VISA';
      71	: Result := 'IPCU';
      72	: Result := 'CPNX';
      73	: Result := 'CPHB';
      74	: Result := 'WSN';
      75	: Result := 'PVP';
      76	: Result := 'BR-SAT-MON';
      77	: Result := 'SUN-ND';
      78	: Result := 'WB-MON';
      79	: Result := 'WB-EXPAK';
      80	: Result := 'ISO-IP';
      81	: Result := 'VMTP';
      82	: Result := 'SECURE-VMTP';
      83	: Result := 'VINES';
      84	: Result := 'TTP/IPTM';
      85	: Result := 'NSFNET-IGP';
      86	: Result := 'DGP';
      87	: Result := 'TCF';
      88	: Result := 'EIGRP';
      89	: Result := 'OSPF';
      90	: Result := 'Sprite-RPC';
      91	: Result := 'LARP';
      92	: Result := 'MTP';
      93	: Result := 'AX.25';
      94	: Result := 'OS';
      95	: Result := 'MICP';
      96	: Result := 'SCC-SP';
      97	: Result := 'ETHERIP';
      98	: Result := 'ENCAP';
      100	: Result := 'GMTP';
      101	: Result := 'IFMP';
      102	: Result := 'PNNI';
      103	: Result := 'PIM';
      104	: Result := 'ARIS';
      105	: Result := 'SCPS';
      106	: Result := 'QNX';
      107	: Result := 'A/N';
      108	: Result := 'IPComp';
      109	: Result := 'SNP';
      110	: Result := 'Compaq-Peer';
      111	: Result := 'IPX-in-IP';
      112	: Result := 'VRRP';
      113	: Result := 'PGM';
      115	: Result := 'L2TP';
      116	: Result := 'DDX';
      117	: Result := 'IATP';
      118	: Result := 'STP';
      119	: Result := 'SRP';
      120	: Result := 'UTI';
      121	: Result := 'SMP';
      122	: Result := 'SM';
      123	: Result := 'PTP';
      124	: Result := 'IS-IS over IPv4';
      125	: Result := 'FIRE';
      126	: Result := 'CRTP';
      127	: Result := 'CRUDP';
      128	: Result := 'SSCOPMCE';
      129	: Result := 'IPLT';
      130	: Result := 'SPS';
      131	: Result := 'PIPE';
      132	: Result := 'SCTP';
      133	: Result := 'FC';
      134	: Result := 'RSVP-E2E-IGNORE';
      135	: Result := 'Mobility Header';
      136	: Result := 'UDPLite';
      137	: Result := 'MPLS-in-IP';
      138	: Result := 'manet';
      139	: Result := 'HIP';
      140	: Result := 'Shim6';
      141	: Result := 'WESP';
      142	: Result := 'ROHC';
    else
      Result := '';
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);

begin
   Memo1.Lines.Clear;
   Memo2.Lines.Clear;
   ClearGrid;
   ProgressBar1.Position := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveTextFileDialog1.Execute then
  begin
     Memo2.Lines.SaveToFile(SaveTextFileDialog1.FileName);
     showmessage('Arquivo Salvo !');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var S: string;
    i, k: Integer;
begin
  S := EmptyStr;
  with StringGrid1 do
  begin
    for i := FixedRows to RowCount - 1 do
    begin
      for k := FixedCols to ColCount - 1 do
      begin
        if k > FixedCols then
          S := S + #9;
        S := S + Cells[k, i];
      end;
      S := S + #13#10;
    end;
  end;
  Clipboard.AsText := S;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SaveTextFileDialog1.Filter := 'Arquivos CSV (*.csv)| *.csv | Any file (*.*)|*.*';
  StringGrid1.Cells[0,0] := 'ID';
  StringGrid1.Cells[1,0] := 'Src IF';
  StringGrid1.Cells[2,0] := 'Src IP';
  StringGrid1.Cells[3,0] := 'Src Port';
  StringGrid1.Cells[4,0] := 'Src Name';
  StringGrid1.Cells[5,0] := 'Dest IF';
  StringGrid1.Cells[6,0] := 'Dest IP';
  StringGrid1.Cells[7,0] := 'Dest Port';
  StringGrid1.Cells[8,0] := 'Dest Name';
  StringGrid1.Cells[9,0] := 'Protocol';
  StringGrid1.Cells[10,0] := 'Traffic';
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 80;
  StringGrid1.ColWidths[2] := 100;
  StringGrid1.ColWidths[3] := 80;
  StringGrid1.ColWidths[4] := 250;
  StringGrid1.ColWidths[5] := 80;
  StringGrid1.ColWidths[6] := 100;
  StringGrid1.ColWidths[7] := 80;
  StringGrid1.ColWidths[8] := 250;
  StringGrid1.ColWidths[9] := 80;
  StringGrid1.ColWidths[10] := 80;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((ssCtrl in Shift) and (Key = 86)) or ((ssShift in Shift) and (Key = 45)) then
   begin
      Memo1.PasteFromClipboard;
      Button1.Click;
   end;
end;

function TForm1.GetIP(const HostName: string): string;
var
  WSAData: TWSAData;
  R: PHostEnt;
  A: TInAddr;
begin
  Result := '0.0.0.0';
  WSAStartup($101, WSAData);
  R := Winsock.GetHostByName(PAnsiChar(AnsiString(HostName)));
  if Assigned(R) then
  begin
    A := PInAddr(r^.h_Addr_List^)^;
    Result := WinSock.inet_ntoa(A);
  end;
end;

function TForm1.IPAddrToName(IPAddr: string): string;
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
  WSAData: TWSAData;
  add_pchar : PAnsiChar;
begin
  WSAStartup($101, WSAData);
  add_pchar := PAnsiChar(AnsiString(IPAddr));
  SockAddrIn.sin_addr.S_addr :=  inet_addr(add_pchar);
  HostEnt := gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
  if HostEnt <> nil then
    Result := StrPas(Hostent^.h_name)
  else
    Result := '';
end;


procedure TForm1.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((ssCtrl in Shift) and (Key = 86)) or ((ssShift in Shift) and (Key = 45)) then
   begin
      Memo1.PasteFromClipboard;
      Button1.Click;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  j,z : int64;
  valido : Boolean;
  line, ips, ipd, ps, pd, nss,nsd , data, count, ifs, ifd, proto: string;
  zoznam : TStringList;
begin
  ClearGrid;
  ProgressBar1.Min := 1;
  ProgressBar1.Max := 50;
  zoznam := TStringList.Create;
  zoznam.Assign(Memo1.Lines);

  Memo2.lines.Add('ID; Source IF ;Source IP; Source Port; Source Hostname; Dest IF; Destination IP ; Destination Port; Destination Name; Protocol ;Bytes' );
  z := 0;
  for i := z to zoznam.Count - 1 do
  begin
     line := zoznam.Strings[i]; // or: Line := zoznam[i];
     valido := True;
     valido := not(copy(line,0,5) = 'SrcIf');
     valido := not(copy(line,0,2) = '50') and (valido);
     if valido then
     begin
       ips := copy(line, 15,15);
       ipd := copy(line, 45,15);
       ps := '$' + Trim(copy(line, 64,5));
       pd := '$' + Trim(copy(line, 69,5));
       data := copy(line, 75,6);
       ifs  := copy(line, 0,14);
       ifd  := copy(line, 31,14);
       proto:= '$' + Trim(copy(line, 61,2));

       nss := IPAddrToName(ips);
       nsd := IPAddrToName(ipd);

       j := StrToInt64(ps);
       ps := IntToStr(j);
       j := StrToInt64(pd);
       pd := IntToStr(j);
       j := StrToInt64(proto);
       proto := IntToStr(j);
       proto := GetProtocolName(StrtoInt(proto));

       count := inttostr(i+1);
       Memo2.Lines.Add(count + ';'+  ifs + ';' + ips + ';' + ps + ';' + nss + ';' + ifd + ';' + ipd + ';' + pd + ';' + nsd + ';'+ proto + ';' + data + ';'  );

       StringGrid1.Cells[0,i+1]  := count;
       StringGrid1.Cells[1,i+1]  := ifs;
       StringGrid1.Cells[2,i+1]  := ips;
       StringGrid1.Cells[3,i+1]  := ps;
       StringGrid1.Cells[4,i+1]  := nss;
       StringGrid1.Cells[5,i+1]  := ifd;
       StringGrid1.Cells[6,i+1]  := ipd;
       StringGrid1.Cells[7,i+1]  := pd;
       StringGrid1.Cells[8,i+1]  := nsd;
       StringGrid1.Cells[9,i+1]  := proto;
       StringGrid1.Cells[10,i+1] := data;

       ProgressBar1.Position     := i + 1;
     end;
  end;
  zoznam.Free;
end;

end.
