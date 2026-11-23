% ==========================================
% RELATÓRIO 14 - BANCO DE DADOS: O MUNDO NINJA
% ==========================================

% Fatos: Linhagem de treinamento (mestre, discipulo) - HIERARQUIA DE MESTRES
mestre(hashirama, hiruzen).
mestre(tobirama, hiruzen).
mestre(hiruzen, jiraiya).
mestre(hiruzen, tsunade).
mestre(hiruzen, orochimaru).
mestre(jiraiya, minato).
mestre(jiraiya, nagato).
mestre(jiraiya, naruto).
mestre(minato, kakashi).
mestre(minato, obito).
mestre(minato, rin).
mestre(kakashi, naruto).
mestre(kakashi, sasuke).
mestre(kakashi, sakura).
mestre(tsunade, sakura).
mestre(orochimaru, sasuke).
mestre(orochimaru, kabuto).
mestre(guy, lee).
mestre(guy, neji).
mestre(guy, tenten).
mestre(kurenai, hinata).
mestre(kurenai, kiba).
mestre(kurenai, shino).
mestre(asuma, shikamaru).
mestre(asuma, ino).
mestre(asuma, choji).
mestre(naruto, konohamaru).
mestre(sasuke, boruto).   % Exercício 1: Boruto foi treinado por Sasuke...
mestre(naruto, boruto).   % ...e por Naruto

% Fatos: Natureza do chakra (ninja, elemento)
natureza(naruto, vento).
natureza(sasuke, fogo).
natureza(sasuke, raio).
natureza(sakura, terra).
natureza(kakashi, raio).
natureza(kakashi, agua).
natureza(kakashi, terra).
natureza(jiraiya, fogo).
natureza(jiraiya, terra).
natureza(hiruzen, fogo).
natureza(hiruzen, terra).
natureza(hashirama, terra).
natureza(hashirama, agua).
natureza(tobirama, agua).
natureza(obito, fogo).
natureza(itachi, fogo).
natureza(itachi, agua).
natureza(asuma, vento).
natureza(gaara, vento).
natureza(deidara, terra).
natureza(deidara, raio).
natureza(kisame, agua).
natureza(boruto, raio).
natureza(boruto, vento).

% Fatos: Clã (ninja, cla)
cla(naruto, uzumaki).
cla(nagato, uzumaki).
cla(boruto, uzumaki).
cla(sasuke, uchiha).
cla(itachi, uchiha).
cla(obito, uchiha).
cla(minato, namikaze).
cla(kakashi, hatake).
cla(hashirama, senju).
cla(tobirama, senju).
cla(tsunade, senju).
cla(hiruzen, sarutobi).
cla(asuma, sarutobi).
cla(konohamaru, sarutobi).
cla(hinata, hyuga).
cla(neji, hyuga).
cla(shikamaru, nara).
cla(ino, yamanaka).
cla(choji, akimichi).
cla(kiba, inuzuka).
cla(shino, aburame).

% Fatos: Vila de origem (ninja, vila)
vila(naruto, konoha).
vila(sasuke, konoha).
vila(sakura, konoha).
vila(kakashi, konoha).
vila(jiraiya, konoha).
vila(tsunade, konoha).
vila(hiruzen, konoha).
vila(hashirama, konoha).
vila(minato, konoha).
vila(guy, konoha).
vila(lee, konoha).
vila(hinata, konoha).
vila(shikamaru, konoha).
vila(gaara, suna).
vila(kisame, kiri).
vila(deidara, iwa).
vila(nagato, ame).

% Fatos: Organização (ninja, organizacao)
organizacao(itachi, akatsuki).
organizacao(kisame, akatsuki).
organizacao(deidara, akatsuki).
organizacao(nagato, akatsuki).
organizacao(obito, akatsuki).
organizacao(jiraiya, sannin).
organizacao(tsunade, sannin).
organizacao(orochimaru, sannin).

% Fatos: Invocação (ninja, animal)
invocacao(naruto, sapo).
invocacao(jiraiya, sapo).
invocacao(minato, sapo).
invocacao(tsunade, lesma).
invocacao(orochimaru, cobra).
invocacao(sasuke, falcao).
invocacao(kakashi, cao_ninja).

% ==========================================
% EXERCÍCIOS
% ==========================================

% Regra 1: aprendiz_de_elite(Ninja)
% Verdadeira SE o Ninja for discípulo de kakashi OU de sasuke
% E tiver natureza de chakra raio OU fogo.
aprendiz_de_elite(Ninja) :-
    ( mestre(kakashi, Ninja) ; mestre(sasuke, Ninja) ),
    ( natureza(Ninja, raio) ; natureza(Ninja, fogo) ).

%Query 1: quem são os aprendizes de elite?
% ?- aprendiz_de_elite(Quem).
% Quem = sasuke ;   (fogo)
% Quem = sasuke ;   (raio - repetida: cada caminho que dá certo vira uma resposta)
% Quem = boruto.    (raio)


%Regra 2: ninja_versatil(Ninja)
% Verdadeira SE o Ninja tiver pelo menos duas naturezas de chakra
% diferentes no banco de dados E for da vila konoha.
ninja_versatil(Ninja) :-
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y,
    vila(Ninja, konoha).

%Query 2: quem é (são) o(s) ninja(s) versátil(eis)?
% ?- ninja_versatil(Quem).
% Respostas distintas: sasuke, kakashi, jiraiya, hiruzen, hashirama.
% (aparecem repetidas: o par (X, Y) é testado nas duas ordens;
%  kakashi, com 3 naturezas, aparece 6 vezes)


%Regra 3: rivais(A, B)
% Verdadeira SE A e B tiverem o mesmo mestre, NÃO forem o mesmo ninja
% E pertencerem a clãs diferentes.
rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, ClaA),
    cla(B, ClaB),
    ClaA \= ClaB.

%Query 3: quem é (são) o(s) rival(is) de Naruto?
% ?- rivais(naruto, Rival).
% Rival = minato ;  (mestre jiraiya; clãs uzumaki x namikaze)
% Rival = sasuke.   (mestre kakashi; clãs uzumaki x uchiha)
% Obs.: sakura também é discípula de kakashi, mas não tem fato cla/2
%       no banco, então não satisfaz a condição de clãs diferentes.


%Regra 4: linhagem(Mestre, Discipulo)
% Cadeia de treinamento (discípulos diretos ou indiretos).
% Caso base: M é mestre direto de D.
linhagem(M, D) :-
    mestre(M, D).
% Passo recursivo: M é mestre de um intermediário Z
% E Z está na linhagem de D.
linhagem(M, D) :-
    mestre(M, Z),
    linhagem(Z, D).

%Query 4: quem faz parte da linhagem de Jiraiya (diretos ou indiretos)?
% ?- linhagem(jiraiya, Discipulo).
% Discípulos distintos (10): minato, nagato, naruto, kakashi, obito, rin,
%                            sasuke, sakura, konohamaru, boruto
% Diretos:   minato, nagato, naruto
% Indiretos: kakashi, obito, rin (via minato); sasuke, sakura (via kakashi);
%            konohamaru, boruto (via naruto); boruto também via sasuke
% Há repetições: naruto aparece 2x (direto e via kakashi), konohamaru 2x
% e boruto 3x, pois existe mais de um caminho de Jiraiya até eles.
