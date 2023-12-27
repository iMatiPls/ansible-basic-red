#!/bin/bash

# Asegurarse de que el script se ejecute con permisos de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecute como root"
  exit
fi

# Actualizar el sistema
echo "Actualizando el sistema..."
dnf update -y > /dev/null

# Instalar epel-release si aún no está instalado
if ! rpm -q epel-release > /dev/null; then
    echo "Instalando epel-release..."
    dnf install epel-release -y > /dev/null
fi

# Instalar ansible si aún no está instalado
if ! rpm -q ansible > /dev/null; then
    echo "Instalando Ansible..."
    dnf install ansible -y > /dev/null
fi

# Ejecutar el playbook principal
echo "Ejecutando playbook..."
ansible-playbook ./playbook/main.yml
