<!-- Brazilian Portuguese README -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./assets/banner-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="./assets/banner-light.png">
    <img alt="Pixayo Dotfiles - NixOS / Home Manager Setup" src="./assets/banner-dark.png">
  </picture>
</p>

<p align="center"> 
  <img src="https://img.shields.io/badge/Nix-Flakes-7EBAE4?style=for-the-badge&logo=nixos&logoColor=white">
  <!-- <img src="https://img.shields.io/badge/Hyprland-Wayland-00C2FF?style=for-the-badge"> -->
  <img src="https://img.shields.io/badge/GNOME-4A86CF?style=for-the-badge&logo=gnome&logoColor=white">
</p>

---

<p>
  <a href="README.md">EN</a> |
  <a href="README.pt-br.md">PT-BR</a>
</p>

> **AVISO**: Eu planejo continuar expandindo a documentação, mas apenas em inglês por ser mais fácil
de gerenciar e manter tudo atualizado. A única exceção é este README, ele continuará sendo atualizado.

## Sobre

Este repositório é uma coletânea de arquivos Nix que definem e gerenciam meu sistema NixOS.

Algo assim poderia (e provavelmente deveria) ser privado. No entanto, eu quis tornar este 
repositório público para compartilhar minha experiência com o ecossistema Nix, além de servir 
como uma fonte de informação para outros usuários.

Muito do que foi implementado aqui está documentado em algum nível, seja por arquivos 
Markdown (.md) dentro ou fora do repositório, ou por anotações e comentários dentro do código. 

## Conteúdo

Meu sistema é pensado para ser portátil e adaptável, com múltiplos ou apenas um único usuário. 
Muitas configurações foram repartidas em módulos próprios que podem ser facilmente desacoplados, 
sobrescritos ou removidos; também fornecendo uma base para a expansão e criação de novos módulos.

### Estrutura do repositório

```text
├── assets -> Recursos visuais e utilitários não essenciais
│   └── ...
├── home-manager -> Configuração do ambiente de usuário
│   └── ...
├── nixos -> Configuração do sistema NixOS
│   └── ...
└── template -> Modelos reutilizáveis
    └── ...
```

Os diretórios `nixos` e `home-manager` são independentes e podem ser utilizados separadamente.
Ambos contam com um módulo `flake` próprio que fornece recursos essenciais para seus submódulos, 
tornando sua replicação em outras máquinas e sistemas Linux com o gerenciador de pacotes Nix
muito mais intuitiva.

Por outro lado, os diretórios `assets`, `template`, e essencialmente qualquer outro diretório 
que não seja os dois principais citados no último parágrafo, não exercem função técnica e, embora
possuam *scripts* e outros utilitários, não são necessários para o funcionamento do sistema.

### Sobre Wallpapers 

A implementação de "papéis de paredes" ou *wallpapers* no diretório `assets` parece uma decisão desconexa
com o objetivo do repositório, mas é uma decisão pessoal. Sempre que preciso aplicar meu sistema em outra
máquina ou reformatar um já existente, prefiro ter tudo versionado em um único local, agilizando o processo
de replicagem e simplificando scripts de instalação.

Todos são de uso público. Fique a vontade para utilizá-los, se assim desejar.

## Instalação

> Em construção...

## ...