[Setup]
AppId={{E3D4B4AE-2A38-4C31-A78A-3F8E3E4AE511}
AppName=Zaldo Printer
AppVersion=1.0.0
AppPublisher=Zaldo
DefaultDirName={autopf}\ZaldoPrinter
DefaultGroupName=Zaldo Printer
DisableProgramGroupPage=no
UninstallDisplayIcon={app}\ZaldoPrinter.ConfigApp.exe
OutputDir=..\dist
OutputBaseFilename=ZaldoPrinterSetup
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
WizardStyle=modern

[Files]
Source: "..\dist\package\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\Zaldo Printer\Zaldo Printer Config"; Filename: "{app}\ZaldoPrinter.ConfigApp.exe"
Name: "{autodesktop}\Zaldo Printer Config"; Filename: "{app}\ZaldoPrinter.ConfigApp.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Criar atalho no desktop"; GroupDescription: "Atalhos:"

[Run]
Filename: "{cmd}"; Parameters: "/C sc query \"ZaldoPrinterService\" >nul 2>nul && sc stop \"ZaldoPrinterService\" >nul 2>nul"; Flags: runhidden
Filename: "{cmd}"; Parameters: "/C sc query \"ZaldoPrinterService\" >nul 2>nul || sc create \"ZaldoPrinterService\" binPath= \"\"\"{app}\\ZaldoPrinter.Service.exe\"\"\" start= auto DisplayName= \"\"\"Zaldo Printer Service\"\"\""; Flags: runhidden
Filename: "{cmd}"; Parameters: "/C sc description \"ZaldoPrinterService\" \"Zaldo Printer local API and thermal print service\""; Flags: runhidden
Filename: "{cmd}"; Parameters: "/C sc start \"ZaldoPrinterService\""; Flags: runhidden
Filename: "{app}\ZaldoPrinter.ConfigApp.exe"; Description: "Abrir Zaldo Printer Config"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{cmd}"; Parameters: "/C sc stop \"ZaldoPrinterService\" >nul 2>nul"; Flags: runhidden
Filename: "{cmd}"; Parameters: "/C sc delete \"ZaldoPrinterService\" >nul 2>nul"; Flags: runhidden
