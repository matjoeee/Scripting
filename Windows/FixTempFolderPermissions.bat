# Use this script when zipped folders give a permission error
# Run as Administrator

takeown /f %temp% /r /d y
icacls %temp% /reset
icacls %temp% /inheritance:r
icacls %temp% /grant %username%:(OI)(CI)F /T /C
icacls %temp% /grant Administrators:(OI)(CI)F /T /C
icacls %temp% /grant SYSTEM:(OI)(CI)F /T /C
md %temp%\Low
icacls %temp%\Low /setintegritylevel (OI)(CI)low