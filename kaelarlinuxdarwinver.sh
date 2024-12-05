#!/bin/bash
echo ===================================================
echo Script de Diagnostic et de Nettoyage Système
echo Copyright (c) 2024 KAELAR. Tous droits réservés.
echo ===================================================
# Détecter le système d'exploitation
OS=$(uname -s)

if [ "$OS" = "Linux" ]; then
    echo "Système d'exploitation détecté : Linux"

    echo "Mise à jour du système..."
    sudo apt update && sudo apt upgrade -y

    echo "Effectuer des diagnostics système..."
    echo "Utilisation du CPU :"
    top -bn1 | grep "Cpu(s)"
    echo "Utilisation de la mémoire :"
    free -h
    echo "Utilisation du disque :"
    df -h

    echo "Nettoyage du système en arrière-plan..."
    sudo apt autoremove -y
    sudo apt clean

    echo "Tâches terminées."
    
elif [ "$OS" = "Darwin" ]; then
    echo "Système d'exploitation détecté : macOS"

    echo "Mise à jour du système..."
    softwareupdate --install --all

    echo "Effectuer des diagnostics système..."
    echo "Utilisation du CPU :"
    top -l 1 | grep "CPU usage"
    echo "Utilisation de la mémoire :"
    vm_stat
    echo "Utilisation du disque :"
    df -h

    echo "Nettoyage du système en arrière-plan..."
    sudo rm -rf /Library/Caches/*
    sudo rm -rf ~/Library/Caches/*

    echo "Tâches terminées."

else
    echo "Système d'exploitation non pris en charge."
fi