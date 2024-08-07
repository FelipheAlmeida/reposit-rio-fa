#!/bin/bash

echo "Criando diretórios (/publico /adm /ven /sec), grupos (GRP_ADM, GRP_VEN, GRP_SEC) e usuários"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários"

useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
passwd carlos -e
useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
passwd maria -e
useradd joao -c "Joao" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
passwd joao -e

useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
passwd debora -e
useradd sebastiana -c "Sebastiana" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
passwd sebastiana -e
useradd roberto -c "Roberto" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
passwd roberto -e

useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC
passwd josefina -e
useradd amanda -c "Amanda" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC
passwd amanda -e
useradd rogerio -c "Rogerio" -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC
passwd rogerio -e

echo "Permissões para usuários de acordo com cada grupo"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Finalizado!"