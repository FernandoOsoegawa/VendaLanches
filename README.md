# VendaLanches
Projeto simples de demonstração, desenvolvido em Delphi. A idéia é mostrar como poderia ser um inicialmente um sistema para venda de lanches. Como o projeto é demonstração, faltaria adicionar funcionalidades como controle de estoque, financeiro, cadastro de clientes, relatórios, criptografia, classes, melhorar a interface gráfica, etc.

- Delphi 10.2 Tokyo
- Banco de Dados Firebird 3.0
- Multicamadas com datasnap

Para executar o projeto:

1) Configurar os arquivos abaixo, que devem ficar no mesmo diretório do Cliente.exe e Servidor.exe:

- ConfigCliente.ini: 
  - PORTA= porta TCP do servidor
  - ENDERECO= endereço IP do servidor
- ConfigServidor.ini:
  - CAMINHO= caminho do banco de dados
  - ENDERECO= endereço IP do micro que estará o banco de dados, que pode ser o próprio servidor
  - PORTA= digitar a porta TCP do servidor

2) É necessário baixar o instalador do Firebird no link https://www.firebirdsql.org/en/firebird-3-0/

3) Executar o Servidor.exe, selecionar uma porta TCP e clicar em Iniciar.

4) Executar o Cliente.exe.
