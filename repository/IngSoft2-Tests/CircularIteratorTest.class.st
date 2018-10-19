"
A CircularIteratorTest is a test class for testing the behavior of CircularIterator
"
Class {
	#name : #CircularIteratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CircularIteratorTest >> testCurrent [

	| iterator |

	iterator := CircularIterator over: #(1 2 3 4 5).
	self assert: iterator current equals: 1
]

{ #category : #tests }
CircularIteratorTest >> testNext [

	| iterator |

	iterator := CircularIterator over: #(1 2 3 4 5).
	self assert: iterator next equals: 2.
	self assert: iterator current equals: 2.
	self assert: iterator current equals: 2
]
