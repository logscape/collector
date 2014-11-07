
; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply 
; prompts the user asking them where to install, and drops a copy of "MyProg.exe"
; there.

;--------------------------------

; The name of the installer
Name "Logscape SAAS Agent"

; The file to write
OutFile "setup.exe"
RequestExecutionLevel admin 

; The default installation directory
;InstallDir $PROGRAMFILES\Logscape\ Cloud\ Agent
InstallDir c:\LogscapeCloudAgent

; The text to prompt the user to enter a directory
DirText "This will install My Cool Program on your computer. Choose a directory"

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important
; Set output path to the installation directory.
SetOutPath $INSTDIR
; Put file there
File bundles.zip
File installservice.bat
ZipDLL::extractall "bundles.zip" "." 
Exec "installservice.bat"
DetailPrint "Program existed with $0"
;!insertmacro ZIPDLL_EXTRACT "bundles.zip" "." "<ALL>" 
;ZipDLL::extractall bundles.zip .
SectionEnd ; end the section


Section "Uninstall"
 
# Always delete uninstaller first
Delete $INSTDIR\uninstaller.exe
 
# now delete installed file
Delete $INSTDIR\bundles.zip

 
SectionEnd
