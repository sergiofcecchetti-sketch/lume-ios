# Lume iOS — teste de compilação e Live Activity

Este projeto é um teste técnico nativo. O botão abre o Lume web no Safari; a Live Activity mostra apenas dados de demonstração. Não possui autenticação Spotify nativa nem letras no CarPlay.

## Compilação

O GitHub Actions usa um runner macOS padrão e XcodeGen para gerar o projeto Xcode e compilar para iPhone sem assinatura. O artefato `Lume-unsigned` contém um IPA sem assinatura: ele não pode ser instalado diretamente pelo app Arquivos. Assinatura e instalação devem ser avaliadas separadamente, sem enviar senha ou certificados Apple ao GitHub.

O projeto não contém senhas, tokens ou certificados. O endereço web é público. Não é necessário configurar segredos no GitHub para compilar.

## Teste após instalação válida

Abra Lume Teste e toque em Iniciar Live Activity de teste. Confira a Tela Bloqueada e a Dynamic Island. Encerre a atividade quando terminar. A compatibilidade em CarPlay ainda não foi testada. Não há atualização em segundo plano conectada ao Spotify.

## Limites

O Swift Playground no iPad não forneceu um caminho documentado para criar a extensão WidgetKit necessária. A compilação remota testa esse ponto sem comprar um Mac. Compilação bem-sucedida não comprova a instalação, o funcionamento no CarPlay nem autorização da Apple para exibir letras.

O projeto é público para utilizar os runners padrão gratuitos para repositórios públicos. Nenhum serviço pago ou runner maior é configurado.
