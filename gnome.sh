#!/bin/bash

# Este Script permite seleccionar que versión de Gnome se desea instalar

# Author: @andriuzha
# versión 1.2
# 12 dic 2024
# https://github.com/andriuzha/debian


# Función para mostrar el menú
function mostrar_menu() {
  echo "**Elige la versión de Gnome que deseas instalar:**"
  echo "1) Instalación completa de Gnome"
  echo "2) Gnome Básico"
  echo "3) Gnome Lite"
  echo "4) Gnome Mínimo"
  echo "0) Salir"
  read -p "Ingresa tu opción: " opcion
}

# Función para instalar la versión completa de Gnome
function instalar_gnome_completo() {
  apt update && apt install gnome
}

# Función para instalar Gnome Básico
function instalar_gnome_basico() {
  apt update && apt install gnome-core
}

# Función para instalar Gnome Lite
function instalar_gnome_lite() {
  apt update && apt install gnome-applets gnome-backgrounds gnome-control-center gnome-session gnome-shell gnome-terminal gjs mutter
}

# Función para instalar Gnome Mínimo
function instalar_gnome_minimo() {
  apt update && apt install gnome-shell gnome-terminal
  sleep 5
  systemctl enable gdm.service
  systemctl start gdm.service
}

# Mostrar el menú y procesar la selección del usuario
mostrar_menu

while [ $opcion -ne 0 ]; do
  case $opcion in
    1) instalar_gnome_completo ;;
    2) instalar_gnome_basico ;;
    3) instalar_gnome_lite ;;
    4) instalar_gnome_minimo ;;
    0) echo "Saliendo del script..." ; exit ;;
    *) echo "Opción inválida. Intenta de nuevo." ; mostrar_menu ;;
  esac
  read -p "Presiona Enter para continuar o 0 para salir: " opcion
done
