# Simulador PRO HFC/G-PON/XGS-PON

**Versão Prévia 0.39** · by BRENDLER™

Simulador de projetos de rede coaxial (TV e banda larga HFC) e de fibra óptica (GPON / XGS-PON) que roda direto no navegador, no PC, tablet ou celular deitado, inclusive sem internet.

**Usar online:** https://simulador-pro-hfc-gpon-xgspon.pages.dev

## O que ele faz

- Monta a instalação a partir de um **TAP Rede externa** (2, 4 ou 8 vias) ou de um **DG** (4 vias, só RG6 Branco).
- Passivos: divisores 1/2, 1/3, 1/3D, 1/4, 1/8, DCs 6, 9, 12, 16, 20 (botão inverter OUT ⇄ TAP), **CABLE ISOLATOR**, **MINI ISOLATOR** e **TRAVA LOCK** (toda saída de passivo sem cabo precisa de TRAVA LOCK; o simulador alerta).
- **MINI ISOLATOR** obrigatório no EMTA e no Decoder 4K (conector F comum); o Box TV HFC tem entrada RF CABLE e dispensa. Ao ligar o cabo coaxial aparece um alerta com a foto do conector.
- **Numeradores** em todo cabo que sai do TAP, DG, DIO ou NAP: amarelos na NAP de poste, no DG e no DIO; pretos no TAP e na NAP de cordoalha. Editáveis (letras e números).
- Cabos RG6 Branco, RG6 Preto e RG11 (RG11 só no cabo de entrada acima de 80 m).
- Calcula CA, CB, RX e TX em cada EMTA, Decoder e Box TV e compara com o padrão: TX 38 a 51, RX −12 a 12, CA e CB ≥ 0 (dBmV).
- Alerta de TX na origem: TAP 36 a 43, DG 37 a 43; CA acima de 22 ou CB acima de 16 na origem = possível sinal desalinhado.
- Começa de qualquer ponto: o sinal medido num equipamento ou passivo vira a base e recalcula toda a rede (mesmo sem TAP/DG).
- Cabo drop que sai do TAP leva CABLE ISOLATOR automático, seguido de RG6 Branco.
- TVs do projeto: todas via HFC (Decoder, Box TV coaxial) ou todas via IP (Box TV via IP, TV APP e Sound Box no EMTA; até 3 pontos).
- Rede do cliente (HFC e GPON): Box TV e TV APP por Wi-Fi, cabo RJ45 1,5 m ou PONTO ULTRA (acima de 1,5 m); Sound Box de preferência por PONTO ULTRA; dispositivos Smart TV, Video-game, PC e Notebook por Wi-Fi ou PONTO ULTRA (cabo de rede RJ45 em metros, até 100 m). Alerta de Wi-Fi: rede 5 GHz e RSSI até −60 dBm (pontilhado azul = 5 GHz, amarelo = 2,4 GHz). Câmera Wi-Fi na rede IoT (2,4 GHz), que precisa estar habilitada no EMTA/ONT. Aparelho offline: botão **conectar** com as opções de cada um (PONTO ULTRA com custo; grátis na Sound Box, que também aceita RJ45 1,5 m e pede confirmação para usar Wi-Fi).
- Sugestões de correção testadas no projeto (só aparecem as que funcionam).
- Botão **Novo** (projeto em branco, exemplo ou arquivo), um exemplo por modo, Cenário+ (cenário em branco que salva sozinho), relatório técnico com desenho da topologia e checklist de instalação por tecnologia, salvar como JSON ou como HTML offline com o projeto dentro.

- **Modo GPON / XGS-PON** (chave no topo): origem DIO 8 portas ou NAP de poste/cordoalha com 8 ou 16 portas (cada 8 portas = 1 NAP, com potência e etiqueta próprias; etiqueta do DIO começa com MM, a da NAP nunca), potência em dBm, divisor 1:2 (3,5 dB), PTO (1 entrada e 1 saída, vertical), fibras Drop Low Friction, Cabo Micro Low e Fibra Invisível (metros, sempre 2 conectores), cordão óptico de 1,5 m (1,0 a 1,6 dB), fita autofusão no conector do DIO e da ONT e ONT/ONU (genérica ou **ZTE F8748Q** XGS-PON: descida 1577 nm, subida 1310/1270 nm; alerta se a origem estiver como GPON) com MÍN e MÁX: RX OK de −8 a −27 dBm (fora disso, vermelho; não há faixa amarela). Potência na NAP/DIO esperada de 0 a −25 dBm (fora disso, alerta na origem). Pontos de TV e dispositivos na ONT (4 LAN + Wi-Fi, até 3 pontos de TV), com selo online/offline.

## Reportar bug ou falar com o autor

- No simulador: botão **?** → **Reportar bug** ou **Contato**.
- Aqui no GitHub: aba **Issues** → **New issue**.
- E-mail: fabiobrendler@outlook.com

## Arquivos

- `index.html`: o simulador completo em um único arquivo (estilos, ícones e fonte embutidos).
