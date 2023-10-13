#   UTILISATION :
#   ./tp1_script2.ps1 <shutdown/lock> <temps en secondes> 
#   La commande est lancée directement si on ne passe pas l'argument du temps, mais la commande est obligatoire.

# Variables qui récupèrent les arguments qu'on passe.

$command = $args[0]
$time = $args[1]

# Si le premier argument est = lock, on lance un temps d'attente égal au 2ème argument puis on lance le lock

if($command -eq "lock"){
    Start-Sleep $time
    rundll32.exe user32.dll,LockWorkStation
}

# Si le premier argument est = shutdown, on lance un temps d'attente égal au 2ème argument puis on lance le lock

if ($command -eq "shutdown"){
    Start-Sleep $time
    Shutdown /s
}