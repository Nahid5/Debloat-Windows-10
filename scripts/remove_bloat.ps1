#Author: Nahid Sarker
#Date created: 9/1/2017
#Date modified: 9/5/2017
#Created on: Lununtu 16.04.3
#Tested on: Windows 10 pro
#Purpose: Remove bloatware from windows 10

#Uninstall 3D Builder
Get-AppxPackage *3dbuilder* | Remove-AppxPackage

#Uninstall Alarms and Clock
Get-AppxPackage *windowsalarms* | Remove-AppxPackage

#Uninstall Calculator
Get-AppxPackage *windowscalculator* | Remove-AppxPackage

#Uninstall Calandar and Mail
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage

#Uninstall Camera
Get-AppxPackage *windowscamera* | Remove-AppxPackage

#Uninstall Contact Support (Cant be removed)
#Uninstall Cortana (Cant be removed)

#Uninstall Get office
Get-AppxPackage *officehub* | Remove-AppxPackage

#Uninstall get skype
Get-AppxPackage *skypeapp* | Remove-AppxPackage

#Uninstall get started
Get-AppxPackage *getstarted* | Remove-AppxPackage

#Uninstall groove music
Get-AppxPackage *zunemusic* | Remove-AppxPackage

#Uninstall maps
Get-AppxPackage *windowsmaps* | Remove-AppxPackage

#Uninstall microsoft edge(Cant be removed)

#Uninstall microsoft solitare collections
Get-AppxPackage *solitairecollection* | Remove-AppxPackage

#Uninstall money
Get-AppxPackage *bingfinance* | Remove-AppxPackage

#Uninstall movies and TV
Get-AppxPackage *zunevideo* | Remove-AppxPackage

#Uninstall news
Get-AppxPackage *bingnews* | Remove-AppxPackage

#Uninstall oenNote
Get-AppxPackage *onenote* | Remove-AppxPackage

#Uninstall people
Get-AppxPackage *people* | Remove-AppxPackage

#Uninstall phone companion
Get-AppxPackage *windowsphone* | Remove-AppxPackage

#Uninstall photos
Get-AppxPackage *photos* | Remove-AppxPackage

#Uninstall store
#Get-AppxPackage *windowsstore* | Remove-AppxPackage

#Uninstalll sports
Get-AppxPackage *bingsports* | Remove-AppxPackage

#Uninstall voice record
Get-AppxPackage *soundrecorder* | Remove-AppxPackage

#Uninstall weather
Get-AppxPackage *bingweather* | Remove-AppxPackage

#Uninstall feedback(cant be removed)

#Uninstall xbox
Get-AppxPackage *xboxapp* | Remove-AppxPackage
    
