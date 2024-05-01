@echo off 

cls && color 4 && cls


::------------------------------------------------------------------------------------------------------------------------
:: MESAJ INTAMPINARE
echo ----------------------------------------------------------------------------------------------------------------------
echo.
echo Hello, %username%
echo.
echo Incepe actualizarea ! ......................
echo.
::------------------------------------------------------------------------------------------------------------------------
:: PENTRU A PRELUA AUTOMAT CALEA LOCALA UNDE SE AFLA FIZIC SCRIPTUL
echo ----------------------------------------------------------------------------------------------------------------------
echo.
set mypath=%cd%
echo Locatia folderului curent este : %mypath%
echo.
::------------------------------------------------------------------------------------------------------------------------
:: COMENZI GIT
echo ----------------------------------------------------------------------------------------------------------------------
echo.
cd %mypath%
git checkout update
git add .
git status
echo.
::------------------------------------------------------------------------------------------------------------------------
:: COMENZI PENTRU A EXTRAGE DATA SI ORA PENTRU A LE FOLOSI IN DENUMIREA UPDATE-ULUI
echo ----------------------------------------------------------------------------------------------------------------------
echo.
@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%:%Min%:%Sec%"
echo Data si Ora: "%fullstamp%"
echo.
::------------------------------------------------------------------------------------------------------------------------
:: COMENZI GIT PENTRU PUSH UPDATE
echo ----------------------------------------------------------------------------------------------------------------------
echo.
git commit -m "update-%fullstamp%"
git push origin update
echo.
echo ----------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo Actualizare finalizata cu success !

pause

