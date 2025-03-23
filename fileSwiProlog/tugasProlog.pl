% Pasangan Suami-Istri
pasangan(david, amy).
pasangan(jack, karen).
pasangan(john, susan).

% Anak dari pasangan
anak(liza, david, amy).
anak(john, david, amy).
anak(ray, jack, karen).

% Anak dari pasangan John dan Susan
anak(peter, john, susan).
anak(mary, john, susan).

% Jenis Kelamin
laki_laki(david).
laki_laki(jack).
laki_laki(john).
laki_laki(ray).
laki_laki(peter).

perempuan(amy).
perempuan(karen).
perempuan(susan).
perempuan(liza).
perempuan(mary).


% Aturan untuk menentukan apakah X adalah ayah dari Y
ayah(X, Y) :- anak(Y, X, _).

% Aturan untuk menentukan apakah X adalah ibu dari Y
ibu(X, Y) :- anak(Y, _, X).

% Aturan untuk menentukan apakah X adalah saudara kandung Y
saudara_kandung(X, Y) :-
    anak(X, A, B), anak(Y, A, B), X \= Y.

% Aturan untuk menentukan apakah X adalah kakek dari Y
kakek(X, Y) :-
    anak(Z, X, _), anak(Y, Z, _).

% Aturan untuk menentukan apakah X adalah nenek dari Y
nenek(X, Y) :-
    anak(Z, _, X), anak(Y, Z, _).

% Aturan untuk menentukan apakah X adalah cucu dari Y
cucu(X, Y) :-
    anak(X, Z, _), anak(Z, Y, _).
cucu(X, Y) :-
    anak(X, Z, _), anak(Z, _, Y).

% Aturan untuk menentukan apakah X adalah paman dari Y
paman(X, Y) :-
    laki_laki(X), saudara_kandung(X, Z), anak(Y, Z, _).

% Aturan untuk menentukan apakah X adalah bibi dari Y
bibi(X, Y) :-
    perempuan(X), saudara_kandung(X, Z), anak(Y, Z, _).
