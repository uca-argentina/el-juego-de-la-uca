# Ingenieria del Software II - El Juego de la UCA

[![Build Status](https://travis-ci.org/uca-is2/el-juego-de-la-uca.svg?branch=master)](https://travis-ci.org/uca-is2/el-juego-de-la-uca)
[![Coverage Status](https://coveralls.io/repos/github/uca-is2/el-juego-de-la-uca/badge.svg?branch=master)](https://coveralls.io/github/uca-is2/el-juego-de-la-uca?branch=master)

## Metacello

```smalltalk
Metacello new
   baseline: 'IngSoft2';
   githubUser: 'uca-is2' project: 'el-juego-de-la-uca' commitish: 'master' path: 'repository';
   load: 'development'.
```

## Enunciado

### Parte 1

Es un juego de mesa, con varios jugadores juando en secuencia, estos jugadores tiran un dado y avanzan tanto como indique el dado.

Gana el primer jugador en cruzar el final del tablero.

El tablero tiene N casilleros en secuencia. La cantidad de dados y  caras de los mismos pueden variar de juego a juego, pero siempre son los mismos durante un mismo juego

#### Requisitos de aprobación

- Dados de N caras.
- Posibilidad de usar M dados, no necesariamente con la misma cantidad de caras.
- El juego puede jugarse con más de un jugador.
- La cantidad de casilleros del tablero puede variar de un juego a otro.
- Se puede saber si terminó el juego.
- Se puede sabre quien fue el ganador del juego.
- Se puede saber en que posición terminó cada jugador.
