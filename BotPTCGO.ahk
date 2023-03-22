;é possível fazer validações de imagens e caso não ache, procurar outras imagens através de condicionais
;Criar checkBoxEsquerda para Energias Especiais
FileEncoding, UTF-8
trocas = 0
moedas = 0
modo = false

#SingleInstance force
CoordMode, Pixel, Window
Menu, Tray, Icon , imagem\bolaMestre.png, 1

;Gui, Color, Red
;Lado Esquerdo
Gui, Add, GroupBox, w240 h240, Oferecendo Boosters
Gui, Show, w510 h510, TradeBot_v2.0
Gui, Add, Text, x20 y50 w210 h50, Selecione abaixo o tipo de carta que deseja solicitar para troca.
Gui, Add, DDL, x20 y100 w210 h50 r5 vescolhaEsquerda, Pokemon|Treinador|Energia
Gui, Add, CheckBox, x80 y130 w150 h50 vcheckBoxEsquerda gSubmit_All, Somente Ultra Raras
Gui, Add, Button,x20 y180 w210 h50 gDefineOferecendo, Selecionar

;Lado Direito
Gui, Add, GroupBox, x260 y5 w240 h240, Pedindo Boosters
Gui, Add, Text, x280 y50 w210 h50, Selecione abaixo o tipo de carta que deseja oferecer para troca.
Gui, Add, DDL, x280 y100 w210 h50 r5 vescolhaDireita, Pokemon|Treinador|Energia
Gui, Add, CheckBox, x330 y130 w150 h50 vcheckBoxDireita gSubmit_All, Somente Ultra Raras
Gui, Add, Button,x280 y180 w210 h50 gDefinePedindo, Selecionar

;Inferior
Gui, Add, GroupBox, x10 y250 w490 h105
Gui, Add, Edit, x20 y270 w470 h70 ReadOnly vModoAtual, Os dados das opções selecionadas serão exibidos aqui. Fique atento
Gui, Add, GroupBox, x10 y355 w490 h80
Gui, Add, Edit, x20 y370 w470 h50 ReadOnly vContent, Estatísticas de trocas. Clique no botão abaixo para atualizar as informações.
Gui, Add, Button,x10 y440 w490 h20 gAtualiza, Clique para atualizar as estatisticas de trocas
Gui, Add, Button,x10 y470 w490 h20 gInstructions, Clique para acessar o manual de instruções

return


;--------------------SUBROTINAS---------------------

instructions:
FileRead, arquivo, imagem\manual.txt
MsgBox % arquivo

atualiza:
GuiControl,, content, Trocas realizadas até o momento: %trocas%`n`nMoedas gastas até o momento: %moedas%
return

definePedindo:
Gui, Submit, NoHide
ToolTip, %DDL%
modo := false
if (modo = false){
	if (checkBoxDireita = 1){
		GuiControl,, modoAtual, --------------------------------------------- MODO SELECIONADO: PEDINDO ---------------------------------------------`nTipo de carta selecionada: %escolhaDireita%`nUltra Raras ativadas
	}else{
		GuiControl,, modoAtual, --------------------------------------------- MODO SELECIONADO: PEDINDO ---------------------------------------------`nTipo de carta selecionada: %escolhaDireita%`nUltra Raras desativadas
	}
}
return

defineOferecendo:
Gui, Submit, NoHide
ToolTip, %DDL%
modo := true
if (modo = true){
	if (checkBoxEsquerda = 1){
		GuiControl,, modoAtual, ----------------------------------------- MODO SELECIONADO: OFERECENDO -----------------------------------------`nTipo de carta selecionada: %escolhaEsquerda%`nUltra Raras ativadas
	}else{
		GuiControl,, modoAtual, ----------------------------------------- MODO SELECIONADO: OFERECENDO -----------------------------------------`nTipo de carta selecionada: %escolhaEsquerda%`nUltra Raras desativadas
	}
}
return

Submit_All:
Gui, Submit, NoHide
return

GuiClose:
ExitApp
return

;---------------------HOTKEYS----------------------

RButton::
finalizar()
oitoHoras()
posTroca()
ok()
return

1::
if(modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	addBooster()
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
	trocas := trocas + 1
	moedas := moedas + 8
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	addBooster()
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
return


2::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	addBooster()
	addBooster()
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
	trocas := trocas + 1
	moedas := moedas + 8
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	addBooster()
	addBooster()
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
return

3::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 3{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 3{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

4::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 4{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 4{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

5::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 5{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 5{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

6::
if(modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 6{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 6{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

7::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 7{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 7{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

8::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 8{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 8{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

9::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 9{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 9{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

0::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 10{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 10{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^1::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 11{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 11{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^2::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 12{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 12{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^3::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 13{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 13{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^4::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 14{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 14{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^5::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 15{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 15{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireta = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^6::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 16{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 16{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^7::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 17{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 17{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^8::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 18{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 18{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^9::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 19{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 19{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita	= 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

^0::
if (modo = true){
	criaTroca()
	trocaPublica()
	sleep, 1500
	oferecendo()
	sleep, 1500
	pacotes()
	silverTempest()
	Loop 20{
		addBooster()
	}
	recebendo()
	if (escolhaEsquerda = "treinador"){
		treinador()
	}else if(escolhaEsquerda = "energia"){
		energia()
	}
	if (checkBoxEsquerda = 1){
		ultraRara()
	}
	sleep, 750
	procurar()
}else if(modo = false){
	criaTroca()
	trocaPublica()
	energia()
	sleep, 1000
	pacotes()
	silverTempest()
	Loop 20{
		addBooster()
	}
	oferecendo()
	if (escolhaDireita = "treinador"){
		treinador()
	}else if(escolhaDireita = "energia"){
		energia()
	}
	if (checkBoxDireita = 1){
		ultraRara()
	}
	sleep, 1000
	checkbox()
	procurar()
}
trocas := trocas + 1
moedas := moedas + 8
return

Esc::
MsgBox, 36, Sair, Deseja sair da aplicação?
IfMsgBox Yes
{
	ExitApp
}
return

;---------------------------FUNÇÕES------------------------

;Criar Troca
criaTroca(){
	Loop{
		ImageSearch, x, y, 1242, 113, 1489, 190, *80 imagem\criarTroca.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Troca pública
trocaPublica(){
	MouseMove, 638, 543
	Loop{
		ImageSearch, x, y, 638, 543, 863, 610, *80 imagem\trocaPublica.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Oferecendo
oferecendo(){
	Loop{
		ImageSearch, x, y, 794, 196, 1491, 529, *80 imagem\oferecendo.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Pacotes
pacotes(){
	Loop{
		ImageSearch, x, y, 683, 625, 926, 702, *80 imagem\pacotes.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Selecionar Pack Silver Tempest
silverTempest(){
	Loop{
		ImageSearch, x, y, 390, 743, 1447, 1024, *80 imagem\silverTempest.png
		if (ErrorLevel = 0){
			MouseMove, %x%, %y%
			Click
			break
		}
	}
}

;Adiciona 1 Booster
addBooster(){
	Loop{
		ImageSearch, x, y, 390, 743, 1447, 1024, *80 imagem\add.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			MouseMove, 839, 715
			break
		}else{
			ImageSearch, x, y, 390, 743, 1447, 1024, *80 imagem\silverTempest.png
			if (ErrorLevel = 0){
				Click, %x%, %y%
			ImageSearch, x, y, 390, 743, 1447, 1024, *80 imagem\add.png
			if (ErrorLevel = 0){
				Click, %x%, %y%
				MouseMove, 839, 715
				;break
				}
			}
		}
	}
}

;Clica em Recebendo

recebendo(){
	Loop{
		ImageSearch, x, y, 118, 212 , 804, 525, *80 imagem\recebendo.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Clica em Treinador
treinador(){
	Loop{
		sleep, 500
		ImageSearch, x, y, 320, 633, 534, 690, *80 imagem\treinador.png
		if(ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Clica em Energia
energia(){
	Loop{
		ImageSearch, x, y, 536, 644, 704, 693, *80 imagem\energia.png
		if(ErrorLevel = 0){
			sleep, 500
			Click, %x%, %y%
			break
		}
	}
}

;Seleciona carta Ultra Rara
ultraRara(){
	;Clica em Filtros
	Loop{
		ImageSearch, x, y, 205, 562, 377, 606, *80 imagem\filtros.png
		if(ErrorLevel = 0){
			sleep, 500
			Click, %x%, %y%
			break
		}
	}
	;Clica na Raridade Ultra Rara
	Loop{
		ImageSearch, x, y, 405, 752, 498, 935, *80 imagem\raridade.png
		if(ErrorLevel = 0){
			sleep, 500
			Click, %x%, %y%
			break
		}
	}
	;Clicando em Aplicar
	Loop{
		ImageSearch, x, y, 859, 855, 1052, 1036, *80 imagem\aplicar.png
		if(ErrorLevel = 0){
			sleep, 500
			Click, %x%, %y%
			break
		}
	}
}


;Procurar
procurar(){
	Loop{
		ImageSearch, x, y, 1224, 549, 1435, 601, *80 imagem\procurar.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Clica em Finalizar
finalizar(){
	Loop{
		ImageSearch, x, y, 1232, 128, 1389, 179, *80 imagem\finalizar.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Clica em 8 horas
oitoHoras(){
	Loop{
		ImageSearch, x, y, 534, 537, 692, 626, *80 imagem\oitoHoras.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

posTroca(){
	Loop{
		ImageSearch, x, y, 711, 720, 875, 758, *80 imagem\posTroca.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Clicando em "OK"
ok(){
	Loop{
		ImageSearch, x, y, 742, 629, 878, 677, *80 imagem\ok.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}

;Desmarca Checkbox
checkbox(){
	Loop{
		ImageSearch, x, y, 129, 555, 178, 606, *80 imagem\checkbox.png
		if (ErrorLevel = 0){
			Click, %x%, %y%
			break
		}
	}
}
