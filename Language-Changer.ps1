# Set the GUI

[console]::WindowWidth=50; 
[console]::WindowHeight=27; 
[console]::BufferWidth=[console]::WindowWidth
$host.ui.RawUI.WindowTitle = 'Hogwarts Legacy Language Changer'
$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
$Host.UI.RawUI.ForegroundColor = 'White'

# Welcome screen with hint and confirmation prompt.

function Lang-Menu

{
	Clear-Host
	
	Write-Host ""
    Write-Host "         Hogwarts Legacy Language Changer" -ForegroundColor Cyan
	Write-Host ""
    Write-Host "                    By Erassus" -ForegroundColor Magenta
	Write-Host ""
    Write-Host " Current Language is: $viewLang" -ForegroundColor Yellow
	Write-Host ""
    Write-Host " Press '1' for English"
    Write-Host " Press '2' for French"
    Write-Host " Press '3' for German"
    Write-Host " Press '4' for Italian"
    Write-Host " Press '5' for Spanish (Spain)"
    Write-Host " Press '6' for Portuguese (Brazil)"
    Write-Host " Press '7' for Polish"
    Write-Host " Press '8' for Russian"
    Write-Host " Press '9' for Spanish (Latin America)"
    Write-Host " Press '10' for Arabic"
    Write-Host " Press '11' for Japanese"
    Write-Host " Press '12' for Korean"
    Write-Host " Press '13' for Simplified Chinese"
    Write-Host " Press '14' for Traditional Chinese"
	Write-Host ""
    Write-Host " Press 'X' or CTRL+C to abort" -ForegroundColor DarkGray
	Write-Host ""
	
 }
 
do

{
	
# Gets the path of the installed Hogwarts Legacy game.

$envInstalledPath = Get-ChildItem HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | % { Get-ItemProperty $_.PsPath } | Where-Object -Property DisplayName -eq -Value 'Hogwarts Legacy' | Select -ExpandProperty InstallLocation

# Fuse root path with the language path.

$envLangFile = $envInstalledPath + 'Engine\Binaries\ThirdParty\Steamworks\Steamv154\Win64\steam_api64.ini'

#	$currentLang = Get-Content $envLangFile | Select -Index 5 # For debug purposes.

$currentLang = Select-String -Path $envLangFile -Pattern '(Language=\w+)' | ForEach-Object -Process {$_.Matches[0].Value} | Out-String -Stream
$currentLang = $currentLang -replace 'Language=',''

# Setting up steamworks API language codes variables
	
if ($currentLang -eq 'english') { $viewLang = 'English' }
if ($currentLang -eq 'french') { $viewLang = 'French' }
if ($currentLang -eq 'german') { $viewLang = 'German' }
if ($currentLang -eq 'italian') { $viewLang = 'Italian' }
if ($currentLang -eq 'spanish') { $viewLang = 'Spanish (Spain)' }
if ($currentLang -eq 'brazilian') { $viewLang = 'Portuguese (Brazil)' }
if ($currentLang -eq 'polish') { $viewLang = 'Polish' }
if ($currentLang -eq 'russian') { $viewLang = 'Russian' }
if ($currentLang -eq 'latam') { $viewLang = 'Spanish (Latin America)' }
if ($currentLang -eq 'arabic') { $viewLang = 'Arabic' }
if ($currentLang -eq 'japanese') { $viewLang = 'Japanese' }
if ($currentLang -eq 'koreana') { $viewLang = 'Korean' }
if ($currentLang -eq 'schinese') { $viewLang = 'Simplified Chinese' }
if ($currentLang -eq 'tchinese') { $viewLang = 'Traditional Chinese' }

	Lang-Menu
	
    $selection = Read-Host " Please make a selection"
	 
    switch ($selection) {
		# English
        '1' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'english') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to English" -ForegroundColor Green
			Write-Host ""
			Pause
			}
		# French	 
		'2' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'french') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to French" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # German
		'3' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'german') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to German" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Italian
		'4' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'italian') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Italian" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Spanish (Spain)
		'5' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'spanish') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Spanish (Spain)" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Portuguese (Brazil)
		'6' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'brazilian') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Portuguese (Brazil)" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Polish
		'7' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'polish') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Polish" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Russian
		'8' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'russian') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Russian" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Spanish (Latin America)
		'9' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'latam') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Spanish (Latin America)" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Arabic
		'10' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'arabic') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Arabic" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Japanese
		'11' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'japanese') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Japanese" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Korean
		'12' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'koreana') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Korean" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Simplified Chinese
		'13' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'schinese') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Simplified Chinese" -ForegroundColor Green
			Write-Host ""
			Pause
         }
		 # Traditional Chinese
		'14' {
			Write-Host ""
			((Get-Content -path "$envLangFile") -replace "$currentLang",'tchinese') | Set-Content -Path $envLangFile
            Write-Host " Game language changed to Traditional Chinese" -ForegroundColor Green
			Write-Host ""
			Pause
         }
     }
 }
 
 until ($selection -eq 'x')
