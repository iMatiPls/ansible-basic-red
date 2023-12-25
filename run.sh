#!/bin/bash

# Asegurarse de que el script se ejecute con permisos de superusuario
if [ "$EUID" -ne 0 ]
  then echo "Por favor, ejecute como root"
  exit
fi

# Actualizar el sistema
echo "Actualizando el sistema..."
dnf update -y > /dev/null

# Instalar epel-release
echo "Instalando epel-release..."
dnf install epel-release -y > /dev/null

# Instalar ansible
echo "Instalando Ansible..."
dnf install ansible -y > /dev/null

echo "Instalación completada."

# Generacion de clave ssh para Ansible
echo "Generando clave ssh para Ansible..."
ssh-keygen -t ed25519 -f ~/.ssh/ansible -q -N ""
echo "Clave generada."