# Auteur du script : MONTAGNIER, Yrlan
# Date de 1ère création : 19/10/2020
# Ce script affiche des informations sur la machine et l'os, la liste d'utilisateur ainsi que le temps de réponse (ping) vers 8.8.8.8
# Pour ce script, j'ai utilisé PowerShell qui est le langage natif de Windows.

# Variables qui récupèrent les informations qu'on veut afficher

$HostName = hostname
$IPAddress = (Get-NetIPAddress -AddressState Preferred -AddressFamily IPv4 -InterfaceAlias 'Wi-Fi').IPAddress
$Os = (Get-WmiObject -class Win32_OperatingSystem).Caption
$OsVersion = (Get-WmiObject Win32_OperatingSystem).Version
$RamSize = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb
$RamFree = (Get-Ciminstance Win32_OperatingSystem).FreePhysicalMemory /1mb
$RamUsed = $RamSize - $RamFree
$DiskSize = (Get-WmiObject Win32_LogicalDisk ).Size /1gb
$DiskFree = (Get-WmiObject Win32_LogicalDisk ).FreeSpace /1gb
$DiskUsed = $DiskSize - $DiskFree
$Users = (Get-WmiObject Win32_UserAccount).Name
$ping = Ping 8.8.8.8

#Commandes

echo "||||||||||||||||| Machine |||||||||||||||||"
Write-Output "Nom de la machine : $HostName"
Write-Output "Adresse IPV4 de la machine : $IPAddress"
systeminfo | find /i "Heure de d?marrage du syst?me:"
echo ""

echo "||||||||||||||||| Systeme d'exploitation |||||||||||||||||"
Write-Output "Nom du systeme : $Os"
Write-Output "version du systeme : $OsVersion"
echo ""

echo "||||||||||||||||| Memoire physique - RAM |||||||||||||||||"
Write-Output "Memoire physique totale : $RamSize Gb"
Write-Output "Memoire physique utilisée : $RamUsed Gb"
Write-Output "Memoire physique disponible : $RamFree Gb"
echo ""

echo "||||||||||||||||| Disques |||||||||||||||||"
Write-Output "Espace total : $DiskSize Gb"
Write-Output "Espace utilise : $DiskUsed Gb"
Write-Output "Espace disponible : $DiskFree Gb"
echo ""

echo "||||||||||||||||| Liste d'utilisateurs |||||||||||||||||"
Write-Output "Liste des utilisateurs : $Users"
echo ""

echo "||||||||||||||||| Ping vers serveur google |||||||||||||||||"
Write-Output "Ping vers 8.8.8.8 : $ping "
echo ""