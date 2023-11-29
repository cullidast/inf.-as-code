#!/bin/bash

# Создание директорий
mkdir -p ansible_project/inventory/production
mkdir -p ansible_project/inventory/staging
mkdir -p ansible_project/group_vars
mkdir -p ansible_project/roles/common/tasks
mkdir -p ansible_project/roles/common/handlers
mkdir -p ansible_project/roles/common/files
mkdir -p ansible_project/roles/common/templates
mkdir -p ansible_project/playbooks

# Создание файлов
touch ansible_project/inventory/production/hosts
touch ansible_project/inventory/staging/hosts
touch ansible_project/group_vars/all.yml
touch ansible_project/roles/common/tasks/main.yml
touch ansible_project/roles/common/handlers/main.yml
touch ansible_project/playbooks/deploy_app.yml
touch ansible_project/playbooks/setup_vm.yml
touch ansible_project/ansible.cfg

# Заполнение файлов содержимым
cat <<EOL > ansible_project/ansible.cfg
[defaults]
inventory = ./inventory/production
EOL

# Замечание: Вероятно, нужно будет дополнительно настроить конфигурацию Ansible в ansible.cfg 

echo "Структура директорий и файлов создана."
