# inf.-as-code
## шаг 1 Нужно проверить поддержку процессора апартной виртуализации и что она включена

egrep -c '(vmx|svm)' /proc/cpuinfo

## шаг 2 устанавливаем kvm

sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients virtinst bridge-utils

sudo apt install -y virt-manager

   шаг 2.1 добавление пользователя в группы libvirt

sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

## шаг 3 настриваем сеть

sudo nano /etc/netplan/01-netcfg.yaml
sudo netplan apply
sudo systemctl restart systemd-networkd
sudo brctl show
sudo chmod 600 /etc/netplan/00-installer-config.yaml
sudo chmod 600 /etc/netplan/01-netcfg.yaml

# создаем скрипт развертывания вирт машины node 1

start-ubuntu22.04.sh

# шаг 4 Сервис DNS

Установка BIND9 и dnsutils
sudo apt update
sudo apt install bind9 dnsutils -y
Проверка статуса BIND9
sudo systemctl status bind9
Проверка разрешения имен с использованием nslookup
nslookup -q=A www.yandex.ru 127.0.0.1
Настройка перенаправления DNS-запросов
sudo emacs /etc/bind/named.conf.options
forwarders {
    *.*.*.*;  // Замените на IP-адрес DNS-сервера вашего провайдера или другого DNS-сервера
};
Проверка корректности файла конфигурации
named-checkconf -z
Перезагрузка конфигурации BIND9
sudo rndc reload
Настройка перенаправления



