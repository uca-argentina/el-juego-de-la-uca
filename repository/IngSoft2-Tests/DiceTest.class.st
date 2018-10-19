Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testDeterministicDice [

	| dice provider |

	provider := FixedNumberProvider returning: 1.
	dice := Dice withSides: 6 numbersProvidedBy: provider.
	self assert: dice sides equals: 6.
	self assert: dice roll equals: 1.
	provider changeNumberTo: 2.
	self assert: dice roll equals: 2
]

{ #category : #tests }
DiceTest >> testRandomDice [

	| dice |

	dice := Dice withSides: 6.
	self assert: dice sides equals: 6.
	self assert: (dice roll between: 1 and: 6)
]
