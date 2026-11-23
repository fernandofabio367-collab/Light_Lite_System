#!/usr/bin/env bash
# ==============================================================================
# Script de Compilação Local do Light Lite System
# Requer: archiso (pacote archiso instalado em sistema Arch ou derivado)
# ==============================================================================

set -e

if [[ $EUID -ne 0 ]]; then
   echo "Este script precisa ser executado como root (sudo ./build.sh)" 
   exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="/tmp/archiso-work-lightlite"
OUT_DIR="${SCRIPT_DIR}/out"

echo -e "\e[1;36m==> Iniciando compilação da ISO do Light Lite System...\e[0m"

# Limpa builds anteriores
rm -rf "${WORK_DIR}"
mkdir -p "${OUT_DIR}"

# Executa mkarchiso
mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${SCRIPT_DIR}"

echo -e "\e[1;32m==> Compilação concluída com sucesso! ISO gerada em: ${OUT_DIR}\e[0m"
