#!/bin/bash

# Este Script permite seleccionar que versión de Gnome se desea instalar

# Author: @andriuzha
# versión 2.0
# 16 dic 2024
# https://github.com/andriuzha/debian

# Función para finalizar la instalación
function finalizar_instalacion() {
  clear
  echo ""
  echo "La instalación se ha realizado con exito."
  echo "*Presiona ENTER para reiniciar el equipo y finalizar...*"
  read
  reboot
}

# Función para mostrar el menú
function mostrar_menu() {
  clear
  echo "Estamos listos para iniciar"
  echo "**Elige la versión de Gnome quieres instalar:**"
  echo "1) Gnome Completo"
  echo "2) Gnome Básico"
  echo "3) Gnome Esencial"
  echo "4) Gnome Mínimo"
  echo "0) Salir"
  read -p "Ingresa tu opción: " opcion
}

# Función para instalar la versión completa de Gnome
function instalar_gnome_completo() {
  apt install gnome
  finalizar_instalacion
}

# Función para instalar Gnome Básico
function instalar_gnome_basico() {
  apt install gnome-core
  finalizar_instalacion
}

# Función para instalar Esencial
function instalar_gnome_lite() {
  apt install gnome-applets gnome-backgrounds gnome-control-center gnome-session gnome-shell gnome-terminal gjs mutter
  finalizar_instalacion
}

# Función para instalar Gnome Mínimo
function instalar_gnome_minimo() {
  apt install gnome-shell gnome-terminal
  sleep 5
  systemctl enable gdm.service
  systemctl start gdm.service
  finalizar_instalacion
}

# Actualizar repositorios antes de comenzar
clear
echo "Para poder realizar esta instalación es necesario actualizar los repositorios."
read -p "Presiona ENTER para continuar con la actualización..." 
apt update

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
