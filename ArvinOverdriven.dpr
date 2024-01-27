{$J-,H+,T-P+,X+,B-,V-,O+,A+,W-,U-,R-,I-,Q-,D-,L-,Y-,C-}
library ArvinOverdriven;

uses
  Forms,
  DVSTEffect,
  DVSTModule,
  OvendrivenDM in 'src\OvendrivenDM.pas' {OverdivenDataModule: TVSTModule},
  OverdrivenFrm in 'src\OverdrivenFrm.pas' {OverdrivenForm};

function main(audioMaster: TAudioMasterCallbackFunc): PVSTEffect; cdecl; export;
var
  OverdivenDataModule: TOverdivenDataModule;
begin
  try
    OverdivenDataModule := TOverdivenDataModule.Create(Application);
    OverdivenDataModule.Effect^.user := OverdivenDataModule;
    OverdivenDataModule.AudioMaster := audioMaster;
    Result := OverdivenDataModule.Effect;
  except
    Result := nil;
  end;
end;

exports Main name 'main';
exports Main name 'VSTPluginMain';

begin
end.