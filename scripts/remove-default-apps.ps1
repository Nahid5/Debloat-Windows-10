#Edited By Nahid Sarker
#Date modified: 11/15/2017
#Tested on Windwos 10 Pro, Ent

#   Description:
# This script removes unwanted Apps that come with Windows. If you  do not want
# to remove certain Apps comment out the corresponding lines below.

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\force-mkdir.psm1

Write-Output "Elevating privileges for this process"
do {} until (Elevate-Privileges SeTakeOwnershipPrivilege)

Write-Output "Uninstalling default apps"
$apps = @(
    # default Windows 10 apps
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    #"Microsoft.FreshPaint"
    "Microsoft.Getstarted"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    #"Microsoft.MicrosoftStickyNotes"
    "Microsoft.Office.OneNote"
    #"Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    #"Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    "Microsoft.WindowsCamera"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    "Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "microsoft.windowscommunicationsapps"
    "Microsoft.MinecraftUWP"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.NetworkSpeedTest"
    
    # Threshold 2 apps
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"


    #Redstone apps
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingTravel"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.WindowsReadingList"

    # non-Microsoft
    "9E2F88E3.Twitter"
    "PandoraMediaInc.29680B314EFC2"
    "Flipboard.Flipboard"
    "ShazamEntertainmentLtd.Shazam"
    "king.com.CandyCrushSaga"
    "king.com.CandyCrushSodaSaga"
    "king.com.*"
    "ClearChannelRadioDigital.iHeartRadio"
    "4DF9E0F8.Netflix"
    "6Wunderkinder.Wunderlist"
    "Drawboard.DrawboardPDF"
    "2FE3CB00.PicsArt-PhotoStudio"
    "D52A8D61.FarmVille2CountryEscape"
    "TuneIn.TuneInRadio"
    "GAMELOFTSA.Asphalt8Airborne"
    #"TheNewYorkTimes.NYTCrossword"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "Facebook.Facebook"
    "flaregamesGmbH.RoyalRevolt2"
    "Playtika.CaesarsSlotsFreeCasino"
    "A278AB0D.MarchofEmpires"
    "KeeperSecurityInc.Keeper"
    "ThumbmunkeysLtd.PhototasticCollage"
    "XINGAG.XING"
    "89006A2E.AutodeskSketchBook"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "46928bounde.EclipseManager"
    "ActiproSoftwareLLC.562882FEEB491" # next one is for the Code Writer from Actipro Software LLC


    # apps which cannot be removed using Remove-AppxPackage
    #"Microsoft.BioEnrollment"
    #"Microsoft.MicrosoftEdge"
    #"Microsoft.Windows.Cortana"
    #"Microsoft.WindowsFeedback"
    #"Microsoft.XboxGameCallableUI"
    #"Microsoft.XboxIdentityProvider"
    #"Windows.ContactSupport"
)

foreach ($app in $apps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    Get-AppXProvisionedPackage -Online |
        Where-Object DisplayName -EQ $app |
        Remove-AppxProvisionedPackage -Online
}

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


# Prevents "Suggested Applications" returning
force-mkdir "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content"
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" "DisableWindowsConsumerFeatures" 1
