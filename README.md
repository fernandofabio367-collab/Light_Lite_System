# ❄️ Light Lite System (Nord Edition)

Um sistema operacional de **código aberto**, **ultra-otimizado**, rápido e com um design moderno baseado em **Wayland + Hyprland** utilizando a elegante paleta de cores **Nord**.

---

## 🌟 Destaques do Sistema

* **Compositor Gráfico:** [Hyprland](https://hyprland.org/) com aceleração por GPU, animações suaves em curvas Bézier, cantos arredondados e desfoque acrílico (*blur*).
* **Paleta Nord:** Interface coesa baseada em tons de azul polar, cinza ardósia e toques árticos (`#2E3440`, `#88C0D0`, `#81A1C1`, `#A3BE8C`).
* **Kernel Otimizado:** `linux-zen` para baixa latência em tarefas de desktop, reprodução de mídia e jogos.
* **Memória Inteligente (ZRAM):** Compactação de memória RAM em tempo real com `zstd` através do `systemd-zram-generator`, eliminando congelamentos por falta de memória.
* **Áudio Moderno:** Stack [PipeWire](https://pipewire.org/) de baixíssima latência nativo.
* **Barra de Status:** [Waybar](https://github.com/Alexays/Waybar) estilizada em formato de pílulas flutuantes com monitor de CPU, RAM, volume, relógio e workspaces.
* **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) com aceleração por hardware e transparência.
* **Launcher de Apps:** [Wofi](https://hg.sr.ht/~scoopta/wofi) centralizado com busca instantânea.

---

## ⌨️ Atalhos Principais (Keybindings)

| Teclas de Atalho | Ação |
| :--- | :--- |
| `Super + Enter` | Abre o terminal **Kitty** |
| `Super + Espaço` ou `Super + D` | Abre o menu de aplicativos **Wofi** |
| `Super + B` | Abre o navegador **Firefox** |
| `Super + E` | Abre o gerenciador de arquivos **Thunar** |
| `Super + Q` | Fecha a janela ativa |
| `Super + V` | Alterna janela entre modo flutuante e ladrilhado (tiling) |
| `Super + F` | Alterna modo tela cheia |
| `Super + 1..6` | Troca para a área de trabalho (workspace) correspondente |
| `Super + Shift + 1..6` | Move a janela atual para o workspace correspondente |
| `Super + Botão Esquerdo do Mouse` | Arrasta e move a janela livremente |
| `Super + Botão Direito do Mouse` | Redimensiona a janela |
| `PrintScreen` | Captura uma área da tela e copia para a área de transferência |

---

## 🚀 Como Gerar a Imagem ISO (`.iso`)

Você pode compilar a ISO oficial do **Light Lite System** de 3 maneiras:

### Opção 1: Pela Nuvem via GitHub Actions (Mais Fácil - Sem instalar nada no PC)
1. Crie um repositório no seu GitHub e suba os arquivos desta pasta.
2. Acesse a aba **Actions** no seu repositório.
3. O workflow `Build Light Lite System ISO` iniciará automaticamente e compilará a ISO usando servidores na nuvem em cerca de 8 a 12 minutos.
4. Ao finalizar, baixe a ISO pronta na seção **Artifacts** ou **Releases**!

### Opção 2: Localmente usando Docker
Se você tiver o Docker instalado:
```bash
# Na pasta do projeto:
docker build -t lightlite-builder .
docker run --privileged --rm -v $(pwd)/out:/out lightlite-builder
```
A ISO será salva diretamente na pasta `out/`.

### Opção 3: Em uma máquina com Arch Linux
Se você estiver rodando Arch Linux nativo ou em máquina virtual:
```bash
sudo pacman -S --needed archiso
sudo ./build.sh
```

---

## 🖥️ Como Testar no QEMU (Máquina Virtual)

Após compilar a ISO, você pode testar imediatamente:
```bash
qemu-system-x86_64 -m 4G -enable-kvm -cpu host -smp 4 \
    -vga virtio -display gtk,gl=on \
    -cdrom out/light_lite_system-*.iso
```

---

## 💾 Gravando em um Pendrive para Usar no PC Real

Para instalar no seu computador físico:
1. Baixe o [Ventoy](https://www.ventoy.net/) (recomendado) ou [Rufus](https://rufus.ie/).
2. Grave o Ventoy no seu Pendrive.
3. Apenas copie o arquivo `.iso` gerado para dentro do pendrive.
4. Reinicie o computador e dê boot pelo pendrive via UEFI!
