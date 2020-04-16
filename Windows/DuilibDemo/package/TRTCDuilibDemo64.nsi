; Script generated by the HM NIS Edit Script Wizard.

SetCompress force
SetCompressor /SOLID LZMA
  
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "TRTCDuilibDemo"
!define PRODUCT_VERSION "6.0.1.100"
!define PRODUCT_PUBLISHER "腾讯云"
!define PRODUCT_WEB_SITE "https://cloud.tencent.com/document/product/454/6555#Windows"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "setup.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

;WorkPlus Setup Script
Unicode true

;Windows Vista系统为应用程序请求权限
;RequestExecutionLevel admin
  
; Welcome page
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY ;调用NSIS选择目录窗口
; License page
;!insertmacro MUI_PAGE_LICENSE "c:\path\to\licence\YourSoftwareLicence.txt"
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\TRTCDuilibDemo.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "TRTCAppSetup64_6.0.1.100.exe"
InstallDir "$PROGRAMFILES\TRTCDuilibDemo"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  CreateDirectory "$INSTDIR\trtcres\"
  CreateDirectory "$INSTDIR\trtcskin\"
  CreateDirectory "$INSTDIR\trtcskin\bottom"
  CreateDirectory "$INSTDIR\trtcskin\common"
  CreateDirectory "$INSTDIR\trtcskin\login"
  CreateDirectory "$INSTDIR\trtcskin\menu"
  CreateDirectory "$INSTDIR\trtcskin\msgbox"
  CreateDirectory "$INSTDIR\trtcskin\setting"
  CreateDirectory "$INSTDIR\trtcskin\videoview"
  CreateDirectory "$INSTDIR\trtcskin\userlist"

  SetOverwrite on
  
  SetOutPath "$INSTDIR"
  File "..\Build\Bin\Win64\Release\*.dll"
  File "..\Build\Bin\Win64\Release\*.exe"
 
  SetOutPath "$INSTDIR\trtcskin"
  File "..\Build\Bin\Win64\Release\trtcskin\*.*"
  SetOutPath "$INSTDIR\trtcskin\bottom"
  File "..\Build\Bin\Win64\Release\trtcskin\bottom\*.*"
  SetOutPath "$INSTDIR\trtcskin\common"
  File "..\Build\Bin\Win64\Release\trtcskin\common\*.*"
  SetOutPath "$INSTDIR\trtcskin\login"
  File "..\Build\Bin\Win64\Release\trtcskin\login\*.*"
  SetOutPath "$INSTDIR\trtcskin\menu"
  File "..\Build\Bin\Win64\Release\trtcskin\menu\*.*"
  SetOutPath "$INSTDIR\trtcskin\msgbox"
  File "..\Build\Bin\Win64\Release\trtcskin\msgbox\*.*"
  SetOutPath "$INSTDIR\trtcskin\setting"
  File "..\Build\Bin\Win64\Release\trtcskin\setting\*.*"
  SetOutPath "$INSTDIR\trtcskin\videoview"
  File "..\Build\Bin\Win64\Release\trtcskin\videoview\*.*"
  SetOutPath "$INSTDIR\trtcskin\userlist"
  File "..\Build\Bin\Win32\Release\trtcskin\userlist\*.*"

  SetOutPath "$INSTDIR\trtcres"
  File "..\Build\Bin\Win64\Release\trtcres\*.*"

  ;Exec "$INSTDIR\vc_redist.x86.exe /q" ;若不存在，执行静默安装
  
  CreateShortCut "$SMPROGRAMS\TRTCDuilibDemo\${PRODUCT_NAME}.lnk" "$INSTDIR\TRTCDuilibDemo.exe"
  
  ;WriteRegStr HKCR "TXCloudRoom" "" "TXCloudRoom Protocol"
  ;WriteRegStr HKCR "TXCloudRoom" "URL Protocol" "$INSTDIR\TXCloudRoom.exe"
  ;WriteRegStr HKCR "TXCloudRoom\DefaultIcon" "" "$INSTDIR\TXCloudRoom.exe,1"
  ;WriteRegStr HKCR "TXCloudRoom\shell\open\command" "" '"$INSTDIR\TXCloudRoom.exe","%1"'
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\TRTCDuilibDemo\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\TRTCDuilibDemo\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\TRTCDuilibDemo.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\TRTCDuilibDemo.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\TRTCDuilibDemo.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd

Function un.onInit
!verbose push
!verbose push
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "你确实要完全移除 $(^Name) ，其及所有的组件？" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\*.exe"
  Delete "$INSTDIR\*.dll"

  Delete "$SMPROGRAMS\TRTCDuilibDemo\Uninstall.lnk"
  Delete "$SMPROGRAMS\TRTCDuilibDemo\Website.lnk"
  Delete "$SMPROGRAMS\TRTCDuilibDemo\TRTCDuilibDemo.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk"

  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  
  Delete "$INSTDIR\trtcres\*.*"
  Delete "$INSTDIR\trtcskin\*.*"
  Delete "$INSTDIR\trtcskin\bottom\*.*"
  Delete "$INSTDIR\trtcskin\common\*.*"
  Delete "$INSTDIR\trtcskin\login\*.*"
  Delete "$INSTDIR\trtcskin\menu\*.*"
  Delete "$INSTDIR\trtcskin\msgbox\*.*"
  Delete "$INSTDIR\trtcskin\setting\*.*"
  Delete "$INSTDIR\trtcskin\videoview\*.*"
  Delete "$INSTDIR\trtcskin\userlist\*.*"

  RMDir "$SMPROGRAMS\TRTCDuilibDemo"
  RMDir "$INSTDIR\trtcres"
  RMDir "$INSTDIR\trtcskin\bottom"
  RMDir "$INSTDIR\trtcskin\common"
  RMDir "$INSTDIR\trtcskin\login"
  RMDir "$INSTDIR\trtcskin\menu"
  RMDir "$INSTDIR\trtcskin\msgbox"
  RMDir "$INSTDIR\trtcskin\setting"
  RMDir "$INSTDIR\trtcskin\videoview"
  RMDir "$INSTDIR\trtcskin\userlist"
  RMDir "$INSTDIR\trtcskin"
  RMDir "$INSTDIR"

  DeleteRegKey HKCR "TRTCDuilibDemo"
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
