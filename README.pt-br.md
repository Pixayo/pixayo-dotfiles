<!-- Brazilian Portuguese README -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./assets/ignore/banner-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="./assets/ignore/banner-light.png">
    <img alt="Pixayo Dotfiles - NixOS / Home Manager Setup" src="./assets/ignore/banner-dark.png">
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

Portanto, acredito que a minha configuração é um bom exemplo de como tornar sua própria configuração
portátil e robusta com o uso de metadados e um modelo "lego".

### Estrutura do repositório

```text
├── assets -> Recursos visuais e utilitários não essenciais
│   └── ...
├── home-manager -> Configuração do ambiente de usuário
│   ├── data -> metadados do ambiente home
│   └── ...
├── nixos -> Configuração do sistema NixOS
│   ├── data -> metadados do sistema
│   └── ...
└── template -> Modelos reutilizáveis
    └── ...
```

Os diretórios `nixos` e `home-manager` são independentes e podem ser utilizados separadamente.
Ambos contam com um módulo `flake` próprio que fornece recursos essenciais para seus submódulos, 
tornando sua replicação em outras máquinas e sistemas Linux com o gerenciador de pacotes Nix
muito mais intuitiva.

Em especial, os diretórios `data` não definem comportamento, eles apenas retêm dados mutáveis daquele
ambiente, no caso do `home-manager` o arquivo `./home-manager/data/env.nix` contém dados do usuário como:
nome, `home`, `paths` importantes e até a arquitetura do sistema, que é passada para `nixpkgs`.

Por outro lado, `assets`, `template`, e essencialmente qualquer outro diretório que não seja os dois 
principais, não exercem função técnica e, embora possuam *scripts* e outros utilitários, não são
necessários para o funcionamento do sistema.

### Sobre Wallpapers 

A implementação de "papéis de paredes" ou *wallpapers* no diretório `assets` parece uma decisão desconexa
com o objetivo do repositório, mas é uma decisão pessoal. Sempre que preciso aplicar meu sistema em outra
máquina ou reformatar um já existente, prefiro ter tudo versionado em um único local, agilizando o processo
de replicação e simplificando scripts de instalação.

Todos são de uso público. Fique à vontade para utilizá-los, se assim desejar.

## Visual

Toda a identidade visual da minha configuração provém do `home-manager` + `stilyx`, você consegue ver mais sobre no diretório `./home-manager/myDotfiles`.

<p align="center"> 
  <img src="./assets/ignore/screenshot1.png">
  <img src="./assets/ignore/screenshot2.png">
  <img src="./assets/ignore/screenshot3.png">
</p>

## Instalação

Antes de começar o processo de instalação, certifique-se de que o seu sistema NixOS ou gerenciador Nix tenha `flakes` habilitado, esse é o único requisito para o processo de instalação.

### Automática

> Ainda não foi implementada.

### Manual

O processo de instalação manual deveria ser bem direto, mas por falta de testes extensivos não posso
afirmar que sempre será bem-sucedido.

Para usar minha configuração, apenas instale os arquivos de `nixos` e/ou `home-manager`, seja com `git clone` 
ou diretamente pelo GitHub, e passe o conteúdo desses diretórios para `/etc/nixos` e `~/.config/home-manager`, respectivamente. 

```shell
git clone https://github.com/Pixayo/pixayo-dotfiles
```

Após a instalação, modifique os arquivos, se necessário, antes de prosseguir; seja para alterar
o nome do `host`/`user` ou para desabilitar certos módulos e opções. O conteúdo do diretório  `data`,
presente tanto em `nixos` quanto em `home-manager`, contém boa parte dos dados que poderiam causar 
algum tipo de conflito ou erro em novas instalações.

Exemplo de conflitos que podem ocorrer:
- Nome do usuário padrão em `./nixos/configuration.nix` não corresponde ao usuário real.
- Arquiteturas diferentes em `./nixos/data/env.nix` e `./nixos/hardware-configuration.nix`.
- entre outros ...

Ajustes feitos (ou não), em um novo terminal, acesse o diretório contendo os arquivos com o comando `cd`.

#### NixOS

Para instalar corretamente minha configuração do NixOS, é necessário que você inicialize uma sessão de seu
gerenciador de arquivos como administrador ou use o comando `sudo mv` para transportar o conteúdo de `nixos`
para o diretório do sistema.

```shell
sudo mv /etc/nixos /etc/nixos.backup
sudo mv ./nixos /etc/nixos
sudo cp /etc/nixos.backup/hardware-configuration.nix /etc/nixos
```
> **AVISO**: o comando `mv` preserva o dono original, então, após a execução desse comando, 
`nixos` não pertencerá mais ao `root`.

O comando acima renomeia o diretório `/etc/nixos` para `/etc/nixos.backup` e copia as configurações de
hardware para o novo `/etc/nixos`, sobrescrevendo o meu próprio.

Com tudo isso pronto, podemos executar:

```shell
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```
> **AVISO**: a terminação `#nixos` se refere ao nome do host definido em `./nixos/data/system.nix`, tenha isso
em mente.

Fechando o processo de instalação da configuração do sistema.

#### Home-manager

Para instalar minha configuração do home-manager, você só precisa mover o conteúdo de `./home-manager` para
`~/.config/home-manager` e ir até o diretório com `cd`, após isso, execute o comando:

```shell
nix run github:nix-community/home-manager -- init --flake .#user
```
> **AVISO**: a terminação `#user` se refere ao nome do usuário definido em `./home-manager/data/env.nix`, tenha isso em mente.

É apenas isso, o processo de instalação do home-manager é muito mais tranquilo.

## ...