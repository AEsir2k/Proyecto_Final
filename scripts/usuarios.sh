#!/bin/bash

# Crear usuarios
sudo useradd admin1
sudo useradd tecnico1
sudo useradd auditor1

# Crear grupos
sudo groupadd administracion
sudo groupadd tecnicos

# Asignar usuarios a gruposn 
sudo usermod -aG administracion admin1
sudo usermod -aG tecnicos tecnico1
sudo usermod -aG tecnicos auditor1

# Crear directorios
sudo mkdir -p /tmp/empresa/admin/
sudo mkdir -p /tmp/empresa/tecnicos/
sudo mkdir -p /tmp/empresa/compartido/

# Asignar permisos
sudo chmod 700 /tmp/empresa/admin/
sudo chmod 770 /tmp/empresa/tecnicos/
sudo chmod 1777 /tmp/empresa/compartido/

# SetUID, SetGID y Sticky Bit
sudo chmod u+s /tmp/empresa/admin/
sudo chmod g+s /tmp/empresa/tecnicos/
sudo chmod +t /tmp/empresa/compartido/

# Usar setfacl para auditor1
sudo setfacl -m u:auditor1:r-- /tmp/empresa/admin/
sudo setfacl -m u:auditor1:r-- /tmp/empresa/tecnicos/

echo "Usuarios y permisos configurados correctamente."
