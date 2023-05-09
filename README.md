
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h1>Login App</h1>
	<p>Login App é um aplicativo iOS desenvolvido em Swift e SwiftUI utilizando o padrão MVVM. O objetivo do aplicativo é permitir que usuários possam realizar login e cadastro utilizando o Firebase Authentication e armazenar seus dados no Firestore Cloud.</p>
	<h2>Funcionalidades</h2>
	<ul>
    <li>Login e Cadastro com Email e Senha</li>
		<li>Armazenamento de dados do usuário no Firestore Cloud</li>
		<li>Recuperação de senha via e-mail</li>
		<li>Deletar conta do usuário</li>
	</ul>
	<h2>Tecnologias</h2>
	<ul>
		<li>Swift</li>
		<li>SwiftUI</li>
		<li>MVVM</li>
		<li>Firebase Authentication</li>
		<li>Firestore Cloud</li>
	</ul>
	<h2>Requisitos</h2>
	<ul>
		<li>Xcode 12 ou superior</li>
		<li>iOS 14.0 ou superior</li>
    <li>Conta Firebase</li>
		<li>Conexão com a Internet</li>
	</ul>
	<h2>Configuração</h2>
	<p>Para executar o aplicativo, siga os seguintes passos:</p>
	<ol>
		<li>Clone o repositório em sua máquina local</li>
		<li>Abra o arquivo Login.xcworkspace no Xcode</li>
		<li>Adicione o arquivo GoogleService-Info.plist do seu projeto Firebase ao diretório do projeto</li>
		<li>Abra o Terminal e navegue até o diretório do projeto</li>
		<li>Execute o comando pod install para instalar as dependências do Firebase</li>
		<li>Execute o aplicativo no simulador ou em um dispositivo físico conectado</li>
	</ol>
	<h2>Como usar</h2>
	<p>Ao abrir o aplicativo, você será apresentado com uma tela de Login. Caso já tenha uma conta, insira seu e-mail e senha nos campos apropriados e clique no botão "Log In". Caso não tenha uma conta, clique no botão "Cadastre-se" para criar uma nova conta.</p>
	<p>Na tela de cadastro, preencha os campos de e-mail, senha e nome completo e clique no botão "Cadastrar-se". Você será redirecionado para a tela de profile, onde poderá ver seus dados recém cadastrados.</p>
	<p>Caso tenha esquecido sua senha, clique no botão "Esqueceu sua senha?" na tela de login e siga as instruções para recuperar sua senha via e-mail.</p>
	<p>Caso queira excluir sua conta, clique no botão "Deletar Conta" na tela de perfil e siga as instruções para confirmar a exclusão da conta.</p>
	<h2>Conclusão</h2>
	<p>O Login App é uma ótima base para quem deseja implementar um sistema de login e cadastro
