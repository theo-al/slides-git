# WIP
- integração git posit/Rstudio/vscode
- completar o resto
	- completar coisas com [!]
	- falar de stash?
- tabela de conteúdo

# introdução
## o que é git?
git é um sistema de controle de versão de arquivos e é principalmente utilizado em desenvolvimento de software. ele permite o controle detalhado de todas as alterações feitas nos arquivos, possibilitando que os colaboradores trabalhem simultaneamente sem causar conflitos. com o git, você pode fazer alterações, experimentar novas ideias e, se necessário, voltar a versões anteriores do projeto com facilidade.

imagine quando trabalhamos em um projeto em equipe, como um artigo para a faculdade. cada membro do grupo fica responsável por uma parte do trabalho, e, ao final, é necessário unificar tudo em um único documento. às vezes, surgem divergências sobre o conteúdo, o que pode resultar em um retrabalho tedioso. é esse o problema que o git resolve.

## o que é GitHub?
GitHub é uma plataforma de hospedagem de projetos que utilizam o Git para controle de versão. é uma espécie de rede social para desenvolvedores, onde você pode armazenar seus repositórios (pastas do Git) e compartilhar seu trabalho com a comunidade.

## importância 
- controle de versão na nuvem:  
    ao hospedar seus projetos no GitHub, você mantém uma cópia na nuvem, o que protege contra a perda de dados caso algo aconteça com o seu computador.
- colaboração simplificada:  
	o git facilita o trabalho em equipe, permitindo que vários desenvolvedores trabalhem simultaneamente no mesmo projeto, gerenciando as alterações de forma inteligente.
- explorar códigos e projetos:  
	além de compartilhar seus projetos, no github você pode explorar o trabalho de outros desenvolvedores, encontrando inspiração ou colaborando com seus projetos. também dá mais visibilidade aos seus próprios.

## conceitos
- commit & branch  
    um `commit` é um registro do estado do código num certo ponto do tempo[^4]. o controle de versão no git funciona com uma sequência de `commits`, que são estruturados na forma de uma árvore (cada commit é ligado a pelo menos um outro, em sequência). cada ramo dessa árvore é uma `branch`.
- tracking & staging  
    não é necessário que cada mudança em qualquer arquivo da pasta seja registrada no repositório (nem que todos os arquivos dentro dela estejam adicionados nele). só vão fazer parte do commit os arquivos "monitorados" (tracked) e os que nunca foram vigiados não fazem parte do repositório (por exemplo quando são usados.[^6]
- fork  
	fork é uma ação disponível do github, em que você cria uma cópia de um repositório de outra pessoa para sua conta para fazer suas alterações nele. essa cópia permite que você trabalhe em melhorias sem afetar o projeto original.

[^4]: eles são armazenados (acompanhados de um identificador) como as diferenças entre os arquivos nos pontos adjacentes

# uso geral

## comandos
os comandos são chamados chamando git no terminal, seguido do nome do comando e dos argumentos e opções (ie. `git $comando $opções $args`). aqui estão alguns dos principais comandos do git que você usará com frequência:
- init:  
    é como se cria um repositório local. inicializa o git na pasta, criando um subdiretório '.git'. não faz commit nenhum quando é chamado.
- status:  
    mostra informações como ramo atual, arquivos modificados e vigiados/não vigiados.
- commit:  
    faz commit de todos as mudanças em arquivos no staging. para adicionar um arquivo ao staging, usa-se o comando `add`. um arquivo não fica automaticamente no staging por ter sido alterado[^7].  
    uso: `git commit [-m "mensagem do commit"]`
- add[^6]:  
    adiciona um arquivo ao staging para o commit. depois do commit, esse arquivo passa a ser monitorado ("tracked").  
    uso: `git add $arquivo`
- branch:  
    cria um novo ramo com o nome especificado a partir de outro, com o seu estado atual. se não especificado, cria a partir do ramo atual.  
	uso: `git branch [$velho] $novo`
- merge:  
    junta dois ramos em um só, absorvendo um deles para dentro do ramo em que foi chamado e combinando suas alterações.  
	uso: `git merge $outro_ramo`
- checkout/switch:  
    troca do ramo atual para o especificado
    uso: `git switch $outro_ramo`[^b]

[^6]: existe o arquivo .gitignore que permite que o git ignore certos arquivos/padrões de nomes (que então nunca vão ser vigiados/registrados)
[^7]: a opção `-a` faz com que os arquivos modificados que já foram indexados (basicamente "já estão no histórico") sejam automaticamente adicionados para o commit.
[^b]: a opção `-b` quando usada com `checkout` cria um ramo e muda pra ele num único passo.

# preparação
## colocando no computador
### linux
- instalar o git com o seu gerenciador de pacotes [^instalações-linux]

### windows
1. baixe o git a partir do site oficial: <https://git-scm.com/download/win> [^instalações-windows]
2. siga o instalador

a instalação por esse executável provém o 'Git Bash' (um terminal que disponibiliza o git e emula certas funcionalidades linux/unix) e uma interface gráfica para o git ('Git GUI'), além de proporcionar atalhos de git opcionais para o menu de botão direito.

## configurando [!incompleto]
essa não é uma etapa necessária, tudo o que é feito aqui e não é opcional é pedido pelo git quando necessário.  
o comando para configurar o git é `git config`  
uso: []  
existem configurações globais e locais, []


## conectando com o github
### via terminal: 
#### ssh (recomendado): [!]

1. instalar (se já não estiver instalado)
    - instalar ssh ou openssh com o seu gerenciador de pacotes [^instalações-linux]
    - windows: [winget|chocolatey]

2. gerar chaves[^2]

    rode o comando seguinte (substitua)
    ```
    ssh-keygen -t ed25519 -C "seu_email@que_usa_no_github.com"
    ```
    o programa vai então perguntar o nome/caminho do arquivo a ser salvo, com o caminho/nome padrão em parênteses; escolha um[^1]: vai pedir então uma senha para uso da chave (privada). escolha uma senha se quiser (se está no seu computador pessoal) e continue.  
    deve haver agora um novo arquivo onde/como você escolheu: essa é a sua chave privada. deve haver também um de mesmo nome mas extensão .pub: essa é a sua chave pública.

[^1]: faz sentido colocar na pasta .ssh  
[^2]: (podem ser usadas chaves já existentes [se forem do tipo certo])  

3. adicionar a chave ao agente de ssh
	- coloque o ssh-agent para rodar em segundo plano (`ssh-agent &`)
	- rode `ssh-add /caminho/para/a/chave/nome_da_chave` (substituindo)

4. associar a chave à conta
	- copie a sua chave pública (o conteúdo do arquivo .pub)
	- clique na sua foto de perfil na página inicial do github
	- configurações
	- navegue até "chaves SSH e GPG", embaixo de "acesso" [^docs-caminho]
	- clique em "nova chave SSH"
	- adicione um nome para o computador onde essa chave vai ficar
	- escolha "chave de autenticação" no campo seguinte
	- cole a chave no campo "chave"
	- clique no botão de adicionar a chave

instruções mais detalhadas (inglês): 
<https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent>

[^docs-caminho]: <https://docs.github.com/pt/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>

#### https (mais fácil) [! completar]:
1. clicar na sua foto de perfil a partir da página inicial do github
2. configurações
3. no fim da barra lateral, entre em "Configurações de desenvolvedor"
4. selecione "Personal Access Tokens" [!inglês] na barra lateral
5. <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token>

para qualquer acesso remoto a um repositório privado ou escrita em algum repositório, vai ser pedida uma senha, que é esse token de acesso.

## repositórios remotos [!]
- remote:  
	- show: lista os repositórios remotos adicionados.  
    	uso: `git remote show`
    - add: adiciona um repositório remoto com o nome especificado.  
        uso: `git remote add $nome $link`
    - remove: remove o repositório remoto.  
    	uso: `git remote remove $nome`
- clone:  
    esse é o comando para baixar um repositório remoto como uma cópia local na sua máquina. por padrão baixa o repositório inteiro, com todo o seu histórico. para mudar isso, pode-se usar o argumento `--depth $profundidade` (útil para repositórios grandes/antigos).
    para conseguir o endereço pode-se apenas copiar o link do repositório no github, ou clicar no botão "code" na página e escolher o protocolo de conexão (ssh ou https).  
    uso: `git clone $link`[^3].
- pull:  
    atualiza o repositório com as mudanças mais recentes no repositório remoto, fazendo um `merge` se existe divergência. basicamente o complementar de `push`.  
    uso: `git pull`[^5].
- push:  
    "empurra" as mudanças feitas[^commitadas] localmente para o repositório remoto, atualizando-o. basicamente o complementar de `pull`.  
    uso: `git push [-u origin]`[^upstream].

[^3]: não é necessária autenticação para repositórios públicos, e pode-se usar qualquer protocolo.
[^5]: existem as opções `--no-commit`, que pausa o processo logo depois de fazer o merge e `--commit`, que faz o commit que viria em seguida.
[^commitadas]: que já tenham sido registradas via `commit`.
[^upstream]: [explicar upstream e oq acontece quando roda com esse --set-upstream|-u, + relacionar com remote add etc.]


# clientes alternativos | interfaces gráficas
- github desktop
- git for windows
- gitkraken
- extensão do vscode
- [...]

[^instalações-linux]:
    derivados de debian/ubuntu -
    ```sh
    sudo apt install git
    ```
    
    derivados de arch -
    ```sh
    sudo pacman -Syuu git
    ```
    
    derivados de debian/ubuntu -
    ```sh
    sudo apt install ssh 
    ```
    
    derivados de arch -
    ```sh
    pacman -Syuu openssh
    ```

[^instalações-windows]:
	[winget/chocolatey]

