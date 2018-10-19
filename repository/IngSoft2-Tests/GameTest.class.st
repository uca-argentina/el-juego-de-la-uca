Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testNoWinnerUntilGameHasEnded [

	| game provider |

	provider := FixedNumberProvider returning: 2.
	game := Game
		withDices: {(Dice withSides: 6 numbersProvidedBy: provider)}
		onBoardOfLength: 10
		playedBy: {'pepe'}.
	self
		should: [ game winner ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'game is not finished yet' ]
]

{ #category : #tests }
GameTest >> testPlayersCanNotPlayOutOfTurn [

	| game provider pepe juan |

	provider := FixedNumberProvider returning: 2.
	pepe := 'pepe'.
	juan := 'juan'.
	game := Game
		withDices: {(Dice withSides: 6 numbersProvidedBy: provider)}
		onBoardOfLength: 10
		playedBy:
			{pepe.
			juan}.

	self assert: (game positionOf: pepe) equals: 1.
	self assert: (game positionOf: juan) equals: 1.
	self
		should: [ game rollDicesFor: juan ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'juan can not play on turn of pepe' ].
	self assert: (game positionOf: pepe) equals: 1.
	self assert: (game positionOf: juan) equals: 1.
	game rollDicesFor: pepe.
	self assert: (game positionOf: pepe) equals: 3.
	self assert: (game positionOf: juan) equals: 1.
	self
		should: [ game rollDicesFor: pepe ]
		raise: GameException
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'pepe can not play on turn of juan' ].
	self assert: (game positionOf: pepe) equals: 3.
	self assert: (game positionOf: juan) equals: 1.
	game rollDicesFor: juan.
	self assert: (game positionOf: pepe) equals: 3.
	self assert: (game positionOf: juan) equals: 3
]

{ #category : #tests }
GameTest >> testPlayingUntilWinning [

	| game provider pepe juan |

	provider := FixedNumberProvider returning: 4.
	pepe := 'pepe'.
	juan := 'juan'.
	game := Game
		withDices: {(Dice withSides: 6 numbersProvidedBy: provider)}
		onBoardOfLength: 6
		playedBy:
			{pepe.
			juan}.

	self assert: (game positionOf: pepe) equals: 1.
	self assert: (game positionOf: juan) equals: 1.
	self deny: game hasEnded.
	game rollDicesFor: pepe.
	self assert: (game positionOf: pepe) equals: 5.
	self assert: (game positionOf: juan) equals: 1.
	self deny: game hasEnded.
	game rollDicesFor: juan.
	self assert: (game positionOf: pepe) equals: 5.
	self assert: (game positionOf: juan) equals: 5.
	self deny: game hasEnded.
	game rollDicesFor: pepe.
	self assert: (game positionOf: pepe) equals: 9.
	self assert: (game positionOf: juan) equals: 5.
	self assert: game hasEnded.
	self assert: game winner equals: pepe
]

{ #category : #tests }
GameTest >> testRollingDicesChangesPosition [

	| game provider player |

	provider := FixedNumberProvider returning: 2.
	player := 'pepe'.
	game := Game
		withDices: {(Dice withSides: 6 numbersProvidedBy: provider)}
		onBoardOfLength: 10
		playedBy: {player}.
	self assert: (game positionOf: player) equals: 1.
	game rollDicesFor: player.
	self assert: (game positionOf: player) equals: 3
]
