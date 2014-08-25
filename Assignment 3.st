@@ -0,0 +1,569 @@
<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.10.1 of February 6, 2014 on August 25, 2014 at 2:40:53 PM</time-stamp>


<component-created>
<name>Assignment #3</name> <type>package</type>
</component-created>
<!-- Package Assignment #3(1.0,pithadia) -->


<component-property>
<name>Assignment #3</name> <type>package</type>
<property>comment</property> <value>'Created this new package, as the previous one was not getting published.'</value>
</component-property>

<class>
<name>MatrixTest</name>
<environment>Core</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<class>
<name>BinarySearchTree</name>
<environment>Core</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>leftSubTree rightSubTree value </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Core.BinarySearchTree</class-id>
<body>"BinarySearchTree has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation."

Instance Variables
	leftSubTree	&lt;BinarySearchTree&gt;	description of leftSubTree
	rightSubTree	&lt;BinarySearchTree&gt;	description of rightSubTree
	value	&lt;Object | ProtoObject&gt;	description of value

</body>
</comment>

<class>
<name>Collection</name>
<environment>Core</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Collections-Abstract</category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Core.Collection</class-id>
<body>The abstract class Collection is at the top of the collection hierarchy.  Typical subclasses are Bag, SequenceableCollection, and Set.  Bag and Set are unordered and their elements are not accessible by an external key.  Duplicates are not allowed in a Set.  Elements of a SequenceableCollection are ordered and the ordering can be determined externally, as in an ArrayedCollection, or internally, as in an Interval.

Subclasses must implement the following messages:
	adding
		add:
	removing
		remove:ifAbsent:
	enumerating
		do:

Subclasses should also consider implementing the following, if they have additional named instance variables (such as SortedCollection):
	copying
		copyEmpty:


Object Reference:
The abstract class Collection is at the top of the collection hierarchy. Applications use collections for a variety of purposes, such as storing a set of data elements, creating a lookup table (Dictionary), or temporarily holding a group of computed values. 
The most commonly used collections are Array, List, Dictionary and Set. Older applications also use OrderedCollection and SortedCollection -- in many situations, these classes have been superseded by List, which combines and extends their main features. 
Except for specialized subclasses such as ByteArray, a collection accepts any type of object as an element. Elements of different types can inhabit the same collection. At a minimum, an element is expected to respond to #= and, in a sorting collection, #&lt;=. 
In addition to inherited abilities, a collection knows how to: 
	-Create an instance with one or more starting elements (instance creation protocol) 
	-Supply its size (accessing protocol) 
	-Find an element (testing) 
	-Add and remove elements (adding, removing) 
	-Loop through its elements (enumerating) 
	-Convert to a different type of collection (converting) 
When creating a subclass, equip it with the following methods: 
	Instance protocol 
		remove:ifAbsent: 
		add: 
		do: 
		copyEmpty:	(if the subclass has named instance variables) 
</body>
</comment>

<class>
<name>Array</name>
<environment>Core</environment>
<super>Core.ArrayedCollection</super>
<private>false</private>
<indexed-type>objects</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>Collections-Arrayed</category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Core.Array</class-id>
<body>Class Array represents SequenceableCollections whose elements are any objects. It provides the concrete representation for storing a collection of elements that have integers as external keys.

Instance variables:
	(indexed instance variables)  &lt;Object&gt;  the elements of the array


Object Reference:
An Array is a very simple collection in which each element is associated with a sequential integer that identifies its position in the array. An Array is efficient in situations that do not require adding or removing of elements, or sorting. When adding or removing are likely to be needed frequently, use a List or OrderedCollection instead. Adding and removing of elements can be achieved via the copying protocol that is inherited, but because it involves making a copy of the array, it is inefficient for frequent usage. 
An Array is typically created via #new: or a variant of #with:with:with:with:. However, unlike other types of collections, an Array can be specified literally as long as all of its elements can be specified literally. Thus, the two expressions that follow create equivalent arrays: 
	#( 500 'fat' #toads) 
	Array with: 500 with: 'fat' with: #toads 
On the other hand, the following array cannot be written literally because its lone element cannot be written literally: 
	Array with: ColorValue black 
Array's abilities are inherited, though it redefines a few methods for performance reasons. 
</body>
</comment>

<class>
<name>ArrayTest</name>
<environment>Core</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<class>
<name>Matrix</name>
<environment>Core</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>rows columns array </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Core.Matrix</class-id>
<body>"Matrix has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation."

Instance Variables
	array	&lt;Object | Struct&gt;	description of array
	columns	&lt;MessageForwarder | Object | ProtoObject | ProtoObject | WeakProxy&gt;	description of columns
	rows	&lt;MessageForwarder | Object | ProtoObject | ProtoObject | WeakProxy&gt;	description of rows

</body>
</comment>

<class>
<name>CollectionTest</name>
<environment>Core</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<class>
<name>BinarySearchTreeTest</name>
<environment>Core</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #3</package>
</attributes>
</class>

<methods>
<class-id>Core.BinarySearchTree class</class-id> <category>instance creation</category>

<body package="Assignment #3" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Core.CollectionTest</class-id> <category>tests</category>

<body package="Assignment #3" selector="testSquares">testSquares

	self assert: #(1 2 3) squares = #(1 4 9).
	self assert:  (#(1 0 3 44 0.5)squares) =  #(1 0 9 1936 0.25).</body>

<body package="Assignment #3" selector="testVariance">testVariance

	self assert: #(17 15 23 7 9 13) variance = 33.2d.
	self assert:  (#(1 2 3 4 -5) variance) =   12.5d.</body>
</methods>


<methods>
<class-id>Core.BinarySearchTree</class-id> <category>accessing</category>

<body package="Assignment #3" selector="do:">do: aBlock
	"Evaluates aBlock for each element in the tree"

	self isEmpty ifTrue: [^self].
	self leftSubTree isNil ifFalse: [self leftSubTree do: aBlock].
	aBlock value: self value.
	self rightSubTree isNil ifFalse: [self rightSubTree do: aBlock]</body>

<body package="Assignment #3" selector="isEmpty">isEmpty

	^self value isNil</body>

<body package="Assignment #3" selector="size">size
	"Returns the number of elements in the tree"

	| treeSize |
	treeSize := 0.
	self do: [:each | treeSize := treeSize + 1].
	^treeSize</body>

<body package="Assignment #3" selector="value">value

	^value</body>

<body package="Assignment #3" selector="rightSubTree">rightSubTree

	^rightSubTree</body>

<body package="Assignment #3" selector="add:">add: aNode
	"Method to add elements to the binary search tree"

	value isNil
		ifTrue: [value := aNode]
		ifFalse: 
			[aNode &gt; value
				ifTrue: 
					[rightSubTree isNil
						ifTrue: 
							[rightSubTree := BinarySearchTree new.
							rightSubTree add: aNode]
						ifFalse: [rightSubTree add: aNode]]
				ifFalse: 
					[leftSubTree isNil
						ifTrue: 
							[leftSubTree := BinarySearchTree new.
							leftSubTree add: aNode]
						ifFalse: [leftSubTree add: aNode]]]</body>

<body package="Assignment #3" selector="withAll:">withAll: aCollection
	"This method creates and returns a search tree with the elements in the argument"

	| size |
	size := aCollection size.
	1 to: size do: [:each | self add: (aCollection at: each)]</body>

<body package="Assignment #3" selector="leftSubTree">leftSubTree

	^leftSubTree</body>
</methods>

<methods>
<class-id>Core.BinarySearchTree</class-id> <category>printing</category>

<body package="Assignment #3" selector="printOn:">printOn: aStream
	"Prints a presentation of the tree"

	aStream nextPut: $(.
	self value == nil ifFalse: [self value printOn: aStream].
	self leftSubTree == nil ifFalse: [self leftSubTree printOn: aStream].
	self rightSubTree == nil ifFalse: [self rightSubTree printOn: aStream].
	aStream nextPut: $)</body>
</methods>

<methods>
<class-id>Core.BinarySearchTree</class-id> <category>initialize-release</category>

<body package="Assignment #3" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Core.Array</class-id> <category>accessing</category>

<body package="Assignment #3" selector="averageArray">averageArray

| inputArray sum arraySize average |
	arraySize := (inputArray := self asArray) size.
	sum := 0.
	1 to: arraySize do: [:each | sum := sum + (inputArray at: each)].
	average := sum / arraySize.
	^average asDouble</body>

<body package="Assignment #3" selector="replaceFrom:to:with:startingAt:">replaceFrom: start to: stop with: replacement startingAt: repStart 
	"This destructively replaces elements from start to stop in the 
	receiver starting at index, repStart, in the collection, replacement. 
	Answer the receiver. No range checks are performed, but 
	overlapping replacements are handled correctly."

	&lt;primitive: 450&gt;
	^super replaceFrom: start to: stop with: replacement startingAt: repStart</body>

<body package="Assignment #3" selector="identityIndexOf:from:to:ifAbsent:">identityIndexOf: anElement from: startIndex to: stopIndex ifAbsent: exceptionBlock 
	"Answer the identity index of anElement within the receiver.  If the receiver does
	not contain anElement, answer the result of evaluating the exceptionBlock."

	| idx |
	idx := self identityIndexOf: anElement
			replaceWith: anElement
			startingAt: startIndex
			stoppingAt: stopIndex.
	^idx = 0
		ifTrue: [exceptionBlock value]
		ifFalse: [idx]</body>

<body package="Assignment #3" selector="valuesBetween:and:">valuesBetween: lowerBound and: upperBound

	| inputArray outputArray |
	inputArray := self asArray.
	outputArray := inputArray
				select: [:each | each between: lowerBound and: upperBound].
	^outputArray</body>
</methods>

<methods>
<class-id>Core.Array</class-id> <category>printing</category>

<body package="Assignment #3" selector="printFormattedOn:">printFormattedOn: aStream 
	"Append to the argument, aStream, the elements of the Array 
	enclosed by parentheses."

	| tooMany |
	tooMany := aStream position + self maxPrint.
	aStream nextPutAll: '#('.
	self 
		do: 
			[:each | 
			aStream position &gt; tooMany ifTrue: 
				[aStream nextPutAll: (#etc &lt;&lt; #dialogs &gt;&gt; '...etc...') asString, ')'.
				^self].
			each printOn: aStream]
		separatedBy: [aStream crtab].
	aStream nextPut: $)</body>

<body package="Assignment #3" selector="printOn:">printOn: aStream 
	"Append to the argument, aStream, the elements of the Array 
	enclosed by parentheses."

	| tooMany |
	tooMany := aStream position + self maxPrint.
	aStream nextPutAll: '#('.
	self do: [:element | 
			aStream position &gt; tooMany
				ifTrue: 
					[aStream nextPutAll: (#etc &lt;&lt; #dialogs &gt;&gt; '...etc...') asString, ')'.
					^self].
			element printOn: aStream]
		separatedBy: [aStream space].
	aStream nextPut: $)</body>

<body package="Assignment #3" selector="storeOn:">storeOn: aStream 
	"Append to the argument aStream a sequence of characters that is an
	expression whose evaluation creates an object similar to the receiver.
	Use the literal form if possible."

	self isLiteral
		ifTrue: 
			[aStream nextPutAll: '#('.
			aStream policy
				printCharactersLiterally: true
				while: [self
						do: [:element | element storeOn: aStream]
						separatedBy: [aStream space]].
			aStream nextPut: $)]
		ifFalse: [super storeOn: aStream]</body>

<body package="Assignment #3" selector="isImmutableLiteral">isImmutableLiteral
	"Answer if the receiver has a literal text form 
	 recognized by the compiler and is immutable.
	 This is so if the receiver is mutable and all the
	 receiver's elements are also are immuble literals"

	(self isImmutable
	 and: [self isMemberOf: Array]) ifFalse: [^false].  "Subclass instances aren't literals"
	^self allSatisfy: [:element | element isImmutableLiteral]</body>

<body package="Assignment #3" selector="isLiteral">isLiteral
	"Answer whether all the elements of the array are literal."

	^(self isMemberOf: Array)  "Subclass instances aren't literals"
	  and: [self allSatisfy: [:element | element isLiteral]]</body>
</methods>

<methods>
<class-id>Core.Array</class-id> <category>testing</category>

<body package="Assignment #3" selector="refersToLiteral:">refersToLiteral: anObject
	" Look inside the Array. "

	self = anObject ifTrue: [^true].
	1 to: self size do: [:index |
		((self at: index) refersToLiteral: anObject) ifTrue: [^true]].
	^false</body>
</methods>

<methods>
<class-id>Core.Array</class-id> <category>converting</category>

<body package="Assignment #3" selector="asImmutableLiteral">asImmutableLiteral
	"Answer an immutable literal version of the revceiver f it is representable by literals.
	 If the receiver is already an immutable literal answer itself."
	^self isImmutableLiteral
		ifTrue: [self]
		ifFalse: [(self collect: [:ea| ea asImmutableLiteral]) isImmutable: true; yourself]</body>

<body package="Assignment #3" selector="decodeAsLiteralArray">decodeAsLiteralArray
	"Return an instance based on the information encoded in the receiver."

	| theClass |
	theClass := self at: 1.
	^theClass == #PopUpMenu
		ifTrue: [Menu decodePopUpFromLiteralArray: self]
		ifFalse: [theClass asQualifiedReference value decodeFromLiteralArray: self]</body>

<body package="Assignment #3" selector="literalArrayEncoding">literalArrayEncoding
	"Return a literal suitable for reconstituting the receiver."

	^self collect: [:i | i literalArrayEncoding]</body>
</methods>

<methods>
<class-id>Core.Array</class-id> <category>private</category>

<body package="Assignment #3" selector="startingAt:replaceElementsIn:from:to:">startingAt: repStart replaceElementsIn: collection from: start to: stop
	"This destructively replaces elements from start to stop in the 
	collection starting at index, repStart, in the receiver. 
	Answer the collection."

	^collection
		replaceElementsFrom: start
		to: stop
		withArray: self startingAt: repStart</body>

<body package="Assignment #3" selector="identityIndexOf:replaceWith:startingAt:stoppingAt:">identityIndexOf: oldValue replaceWith: newValue startingAt: startIndex stoppingAt: stopIndex 
	"Searches the specified portion of the receiver for the first reference
	 to oldValue, replacing that reference with newValue, and answers
	 the 1-based index at which the oldValue was found. Zero is returned if
	 the oldValue cannot be found. The search is restricted to and inclusive
	 of the specified start and stop indices. The primitive fails if the start and
	 stop indices are not SmallIntegers, if either is out of range, or if the
	 receiver is immutable and oldValue ~~ newValue."

	&lt;primitive: 422&gt;
	startIndex to: stopIndex do:
		[:idx |
		(self at: idx) == oldValue ifTrue:
			[newValue ~~ oldValue ifTrue:
				[self at: idx put: newValue].
				 ^idx]].
	^0</body>
</methods>


<methods>
<class-id>Core.Array class</class-id> <category>private</category>

<body package="Assignment #3" selector="decodeFromLiteralArray:">decodeFromLiteralArray: anArray
	^self withAll: (anArray copyFrom: 2 to: anArray size)</body>
</methods>

<methods>
<class-id>Core.Array class</class-id> <category>testing</category>

<body package="Assignment #3" selector="needsSafeRebinding">needsSafeRebinding

	^true</body>
</methods>


<methods>
<class-id>Core.ArrayTest</class-id> <category>tests</category>

<body package="Assignment #3" selector="testAverageArray">testAverageArray

self assert: #(1 2 3 4) averageArray = 2.5.
self assert: #(2 3 1 5) averageArray = 2.75</body>

<body package="Assignment #3" selector="testValuesBetween">testValuesBetween

	self assert: (#(2 4 3 1 6 8 5 2.1 3.2) valuesBetween: 2 and: 5) = #(2 4 3 5 2.1 3.2).
	self assert:  (#(1 2 3 4 -5) valuesBetween:2 and:-10) = #().
	self assert:  (#(1 0 3 44 0.5) valuesBetween:0 and:4) =  #(1 0 3 0.5).</body>
</methods>


<methods>
<class-id>Core.Matrix class</class-id> <category>instance creation</category>

<body package="Assignment #3" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Core.Collection</class-id> <category>converting</category>

<body package="Assignment #3" selector="asSortedStrings:">asSortedStrings: aSortBlock
	"The receiver is assumed to be a collection of Strings.
	 Create a SortedCollection that collates them using the
	 specified collation policy."

	^(SortedCollection forStrings: self size)
		sortBlock: aSortBlock;
		addAll: self;
		yourself</body>

<body package="Assignment #3" selector="asSortedStrings:with:">asSortedStrings: aSortBlock with: aCollationPolicy
	"The receiver is assumed to be a collection of Strings.
	 Create a SortedCollection that collates them using the
	 specified collation policy."

	^(SortedCollection forStrings: self size collatedBy: aCollationPolicy)
		sortBlock: aSortBlock;
		addAll: self;
		yourself</body>

<body package="Assignment #3" selector="asOrderedCollection">asOrderedCollection
	"Answer a new instance of OrderedCollection whose elements are the elements of
	the receiver.  The order in which elements are added depends on the order in
	which the receiver enumerates its elements.  In the case of unordered collections,
	the ordering is not necessarily the same for multiple requests for the conversion."

	| anOrderedCollection |
	anOrderedCollection := OrderedCollection new: self size.
	self do: [:each | anOrderedCollection addLast: each].
	^anOrderedCollection</body>

<body package="Assignment #3" selector="asList">asList
	"Answer a new instance of List whose elements are the elements of
	the receiver.  The order in which elements are added depends on the order in
	which the receiver enumerates its elements.  In the case of unordered collections,
	the ordering is not necessarily the same for multiple requests for the conversion."

	| aList |
	aList := List new: self size.
	self do: [:each | aList addLast: each].
	^aList</body>

<body package="Assignment #3" selector="asSortedCollection">asSortedCollection
	"Answer a new instance of SortedCollection whose elements are the elements of
	the receiver.  The sort order is the default less than or equal ordering."

	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	aSortedCollection addAll: self.
	^aSortedCollection</body>

<body package="Assignment #3" selector="literalArrayEncoding">literalArrayEncoding

	^self asArray literalArrayEncoding</body>

<body package="Assignment #3" selector="sorted:">sorted: aBlock
	"Return an array containing our contents and sorted using aBlock as the sort criteria.
	e.g. (Set with: 1 with: 4 with: 2 with: 3) sorted: [:a :b | a abs &lt;= b abs]
	returns
	#(1 2 3 4)"
	^self asArray sorted: aBlock.</body>

<body package="Assignment #3" selector="asSet">asSet
	"Answer a new instance of Set whose elements are the unique elements of
	the receiver."

	| aSet |
	aSet := Set withAll: self.
	^aSet</body>

<body package="Assignment #3" selector="asSortedStringsWith:">asSortedStringsWith: aCollationPolicy
	"The receiver is assumed to be a collection of Strings.
	 Create a SortedCollection that collates them using the
	 specified collation policy."

	^(SortedCollection forStrings: self size collatedBy: aCollationPolicy)
		addAll: self;
		yourself</body>

<body package="Assignment #3" selector="asBag">asBag
	"Answer a new instance of Bag whose elements are the elements of
	the receiver."

	| aBag |
	aBag := Bag new.
	self do: [:each | aBag add: each].
	^aBag</body>

<body package="Assignment #3" selector="asSortedStrings">asSortedStrings
	"The receiver is assumed to be a collection of Strings.
	 Create a SortedCollection that collates them using the
	 current Locale's collation policy."

	^(SortedCollection forStrings: self size)
		addAll: self;
		yourself</body>

<body package="Assignment #3" selector="asArray">asArray
	"Answer a new instance of Array whose elements are the elements of
	the receiver.  The order in which elements are added depends on the order in
	which the receiver enumerates its elements.  In the case of unordered collections,
	the ordering is not necessarily the same for multiple requests for the conversion."

	| anArray index |
	anArray := Array new: self size.
	index := 0.
	self do: [:each | anArray at: (index := index + 1) put: each].
	^anArray</body>

<body package="Assignment #3" selector="asSortedCollection:">asSortedCollection: aBlock 
	"Answer a new instance of SortedCollection whose elements are the elements of
	the receiver.  The sort order is defined by the argument, aBlock."

	| aSortedCollection |
	aSortedCollection := SortedCollection new: self size.
	aSortedCollection sortBlock: aBlock.
	aSortedCollection addAll: self.
	^aSortedCollection</body>

<body package="Assignment #3" selector="sorted">sorted
	"Return an array containing our contents and sorted by the default criteria."
	^self asArray sorted.</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>enumerating</category>

<body package="Assignment #3" selector="do:separatedBy:">do: elementBlock separatedBy: separatorBlock
	"Evaluate elementBlock for each element in the collection.
	Between each pair of elements, but not before the first or
	after the last, evaluate the separatorBlock."

	| first |
	first := true.
	self do:
		[:elmnt |
		first ifTrue: [first := false]
			ifFalse: [separatorBlock value].
		elementBlock value: elmnt]</body>

<body package="Assignment #3" selector="groupedBy:">groupedBy: aBlock
	"Return a dictionary whose keys are the result of evaluating aBlock for all elements in
	 the collection, and the value for each key is the collection of elements that evaluated
	 to that key. e.g.
	     #(1 2 3 4 5) groupedBy: [:each | each odd]
	   a Dictionary  
	     true ---&gt; #( 1 3 5)
	     false --&gt; #(2 4)"

	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new].
		collection add: each].
	self species ~~ OrderedCollection ifTrue:
		["Convert the result collections to be the right type.
		  Note that it should be safe to modify the dictionary
		  while iterating because we only replace values for existing keys"
		result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)]].

	^result</body>

<body package="Assignment #3" selector="detect:">detect: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the first element for which aBlock evaluates to true."

	^self detect: aBlock ifNone: [self notFoundError]</body>

<body package="Assignment #3" selector="detect:ifFound:">detect: aBlock ifFound: detectedBlock
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If any found, evaluate detectedBlock &lt;one or no argument block&gt; (possibly with the first element for which aBlock evaluates to true).
	Returns #value of detectedBlock or nil if no element was found."

	^self
		detect: aBlock
		ifFound: detectedBlock
		ifNone: [nil]</body>

<body package="Assignment #3" selector="do:">do: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	self subclassResponsibility</body>

<body package="Assignment #3" selector="inject:into:">inject: thisValue into: binaryBlock 
	"Accumulate a running value associated with evaluating the argument,
	binaryBlock, with the current value and the receiver as block arguments. 
	The initial value is the value of the argument, thisValue."

	"For example, to sum a collection, use: 
		collection inject: 0 into: [:subTotal :next | subTotal + next]."

	| nextValue |
	nextValue := thisValue.
	self do: [:each | nextValue := binaryBlock value: nextValue value: each].
	^nextValue</body>

<body package="Assignment #3" selector="select:">select: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for which
	aBlock evaluates to true.  Answer the new collection."

	| newCollection |
	newCollection := self species new.
	self do: [:each | (aBlock value: each) ifTrue: [newCollection add: each]].
	^newCollection</body>

<body package="Assignment #3" selector="fold:">fold: binaryBlock
	"Evaluate the block with two elements of the receiver,
	then with the result of the first evaluation and another element,
	then with the result of the second evaluation and another element...
	For unordered collections, elements are picked in some unspecified
	order, for ordered collections, they are picked in the order they are stored
	in the collection. Answer the result of the final evaluation. If the receiver
	is empty, fail. If the receiver contains a single element, answer the element."
	" #('to' 'be' 'or' 'not' 'to' 'be') asSet fold: [:a :b | a, ' ', b] "

	| firstValue nextValue |
	firstValue := nextValue := Object new. "a convenient object not in the receiver"
	self do:
		[:each |
		firstValue == nextValue
			ifTrue: [nextValue := each]
			ifFalse: [nextValue := binaryBlock value: nextValue value: each]].
	^nextValue == firstValue
		ifTrue: [self emptyCollectionError]
		ifFalse: [nextValue]

	"Another example:
	(| mc |
	mc := MethodCollector new.
	mc browseSelect:
			(((ProcessorScheduler organization listAtCategoryNamed: #'priority names')
				collect: [:s| mc referencesTo: s])
					fold: [:a :b| a | b])
			&amp; (mc referencesTo: #{Kernel.Processor} binding))
	"</body>

<body package="Assignment #3" selector="detect:ifFound:ifNone:">detect: aBlock ifFound: detectedBlock ifNone: elseBlock
	"Evaluate aBlock with each of the receiver's elements as the argument.
	If any found, evaluate detectedBlock &lt;one or no argument block&gt; (possibly with the first element for which aBlock evaluates to true).
	Returns #value of detectedBlock or #value of elseBlock &lt;no argument block&gt; if no element was found."

	| elem |
	elem := self detect: aBlock ifNone: [^elseBlock value].
	^detectedBlock cull: elem</body>

<body package="Assignment #3" selector="reject:">reject: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for which
	aBlock evaluates to false.  Answer the new collection."

	^self select: [:element | (aBlock value: element) == false]</body>

<body package="Assignment #3" selector="glorpGroupedBy:">glorpGroupedBy: aBlock
	"Same as VW groupedBy:. This is too useful not to be able to use, but we don't want to conflict with other dialects/extensions that might implement, so make our own prefixed version"

	"Return a dictionary whose keys are the result of evaluating aBlock for all elements in
	 the collection, and the value for each key is the collection of elements that evaluated
	 to that key. e.g.
	     #(1 2 3 4 5) groupedBy: [:each | each odd]
	   a Dictionary  
	     true ---&gt; #( 1 3 5)
	     false --&gt; #(2 4)"

	| result |
	result := Dictionary new.
	self do:
		[:each | | key collection |
		key := aBlock value: each.
		collection := result at: key ifAbsentPut: [OrderedCollection new].
		collection add: each].
	self species ~~ OrderedCollection ifTrue:
		["Convert the result collections to be the right type.
		  Note that it should be safe to modify the dictionary
		  while iterating because we only replace values for existing keys"
		result keysAndValuesDo:
			[:key :value | result at: key put: (self species withAll: value)]].

	^result</body>

<body package="Assignment #3" selector="detect:ifNone:">detect: aBlock ifNone: exceptionBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the first element for which aBlock evaluates to true."

	self do: [:each | (aBlock value: each) ifTrue: [^each]].
	^exceptionBlock value</body>

<body package="Assignment #3" selector="collect:">collect: aBlock  
	"Evaluate aBlock with each of the values of the receiver as the  
	argument.  Collect the resulting values into a collection that is like 
	the receiver.  Answer the new collection."

	| newCollection |
	newCollection := self species new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^newCollection</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>printing</category>

<body package="Assignment #3" selector="storeOn:">storeOn: aStream 
	"Append to the argument aStream a sequence of characters that is an expression 
	whose evaluation creates an collection similar to the receiver. The general format
	for collections is
		((class-name new) add: element; add: element; .... ; yourself)"

	| noneYet |
	aStream nextPutAll: '(('.
	aStream store: self class.
	aStream nextPutAll: ' new)'.
	noneYet := true.
	self do: 
		[:each | 
		noneYet
			ifTrue: [noneYet := false]
			ifFalse: [aStream nextPut: $;].
		aStream nextPutAll: ' add: '.
		aStream store: each].
	noneYet ifFalse: [aStream nextPutAll: '; yourself'].
	aStream nextPut: $)</body>

<body package="Assignment #3" selector="forStackDumpPrintUsing:">forStackDumpPrintUsing: aPolicy
	aPolicy printCollection: self.</body>

<body package="Assignment #3" selector="printBriefInspectorTextOn:">printBriefInspectorTextOn: aTextStream 

	| summary |
	summary := self size = 1
		ifTrue: [#collectionSummary1 &lt;&lt; #dialogs &gt;&gt; 'a &lt;1p&gt; (1 element)']
		ifFalse: [#collectionSummaryMany &lt;&lt; #dialogs &gt;&gt; 'a &lt;1p&gt; (&lt;2p&gt; elements)'].
	aTextStream
		nextPutAll: (summary
				expandMacrosWith: self class
				with: self size)</body>

<body package="Assignment #3" selector="printOn:">printOn: aStream 
	"Append to the argument aStream a sequence of characters 
	that identifies the collection.  The general format for collections
	is
		Collection-name ( element element element )
	unless there are a large number in which case the listing is
	truncated with the words ...etc..."

	| tooMany |
	tooMany := aStream position + self maxPrint.
	aStream print: self class; nextPutAll: ' ('.
	self do: [:element | 
			aStream position &gt; tooMany ifTrue: [aStream nextPutAll: (#etc &lt;&lt; #dialogs &gt;&gt; '...etc...') asString, ')'. ^self].
			element printOn: aStream]
		separatedBy: [aStream space].
	aStream nextPut: $)</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>COMPATIBILITY-testing</category>

<body package="Assignment #3" selector="isNotEmpty">isNotEmpty
	"Compatibility message; please use the ANSI standard notEmpty instead."

	^self notEmpty</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>accessing</category>

<body package="Assignment #3" selector="any">any
	"Return an arbitrary element of the receiver. Error if the receiver is empty"

	self do: [:each | ^each].
	self emptyCollectionError</body>

<body package="Assignment #3" selector="variance">variance

	| variance inputArray averageOfArray totalElements |
	variance := 0.
	totalElements := (inputArray := self asArray) size.
	averageOfArray := inputArray averageArray.
	(inputArray
		collect: [:each | (each - averageOfArray) * (each - averageOfArray)])
			do: [:each | variance := variance + each].
	^(variance := variance / (totalElements - 1)) asDouble</body>

<body package="Assignment #3" selector="capacity">capacity
	"Answer how many elements the receiver
	is currently capable of holding.  By default,
	this is the current size; however, some kinds
	of collections pre-allocate extra space."

	^self size</body>

<body package="Assignment #3" selector="squares">squares
	"Returns the square of each element in an array"

	| inputArray outputArray |
	inputArray := self asArray.
	outputArray := inputArray collect: [:each | each * each].
	^outputArray</body>

<body package="Assignment #3" selector="size">size
	"Answer how many elements the receiver contains."

	| tally |
	tally := 0.
	self do: [:each | tally := tally + 1].
	^tally</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>removing</category>

<body package="Assignment #3" selector="removeAll">removeAll
	"Remove every element in the receiver. Return a collection of the items removed."

	^self removeAll: self copy</body>

<body package="Assignment #3" selector="remove:ifAbsent:">remove: oldObject ifAbsent: anExceptionBlock 
	"Remove oldObject as one of the receiver's elements.  If several of the
	elements are equal to oldObject, only one is removed. If no element is equal to
	oldObject, answer the result of evaluating anExceptionBlock.  Otherwise,
	answer the argument, oldObject.

	SequenceableCollections can not respond to this message."

	self subclassResponsibility</body>

<body package="Assignment #3" selector="removeAll:">removeAll: aCollection 
	"Remove each element of aCollection from the receiver.  If successful for each,
	answer aCollection."

	aCollection do: [:each | self remove: each].
	^aCollection</body>

<body package="Assignment #3" selector="remove:">remove: oldObject 
	"Remove oldObject as one of the receiver's elements.  Answer 
	oldObject unless no element is equal to oldObject, in which case, 
	provide an error notification. "

	^self remove: oldObject ifAbsent: [self notFoundError]</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>testing</category>

<body package="Assignment #3" selector="anySatisfy:">anySatisfy: aBlock
	"Answer true if aBlock answers true for any element of the receiver.
	 An empty collection answers false."

	self do: [:each| (aBlock value: each) ifTrue: [^true]].
	^false</body>

<body package="Assignment #3" selector="contains:">contains: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.
	 Answer true if aBlock ever evaluates to true, otherwise answer false."

	self detect: aBlock ifNone: [^false].
	^true</body>

<body package="Assignment #3" selector="notEmpty">notEmpty
	"Answer if the receiver contains any elements."

	^self size &gt; 0</body>

<body package="Assignment #3" selector="isWeakContainer">isWeakContainer
	"Answer if the receiver references its contents weakly."
	&lt;primitive: 465&gt;
	^self primitiveFailed</body>

<body package="Assignment #3" selector="occurrencesOf:">occurrencesOf: anObject 
	"Answer how many of the receiver's elements are equal to anObject."

	| tally |
	tally := 0.
	self do: [:each | anObject = each ifTrue: [tally := tally + 1]].
	^tally</body>

<body package="Assignment #3" selector="isWeakContainer:">isWeakContainer: aBoolean
	"Determine whether the receiver references its contents weakly or not.
	 Answer the receiver's previous weakness state."
	&lt;primitive: 467&gt;
	^self primitiveFailed</body>

<body package="Assignment #3" selector="includes:">includes: anObject 
	"Answer whether anObject is one of the receiver's elements."

	self do: [:each | anObject = each ifTrue: [^true]].
	^false</body>

<body package="Assignment #3" selector="isEmpty">isEmpty
	"Answer if the receiver contains no elements."

	^self size = 0</body>

<body package="Assignment #3" selector="allSatisfy:">allSatisfy: aBlock
	"Answer true if aBlock answers true for all elements of the receiver.
	 An empty collection answers true."

	self do: [:each| (aBlock value: each) ifFalse: [^false]].
	^true</body>

<body package="Assignment #3" selector="glorpIsCollection">glorpIsCollection

	^true.</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>copying</category>

<body package="Assignment #3" selector="copyEmpty:">copyEmpty: aSize
	"Answer a copy of the receiver that contains no elements.

	This method should be redefined in subclasses that add
	instance variables, so that the state of those variables
	is preserved"

	^self class new: aSize</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>comparing</category>

<body package="Assignment #3" selector="rehash">rehash
	"As per the ANSI spec, all collections must understand the message
	rehash.  However, note that the selector might be questionable
	because it could be seen as to assume implementation details"

	^self</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>glorp</category>

<body package="Assignment #3" selector="glorpPrintSQLOn:for:">glorpPrintSQLOn: aStream for: aType
	aStream nextPut: $(.
	self isEmpty
		ifTrue: [aStream nextPutAll: 'NULL']
		ifFalse:
			[GlorpHelper
				do: [:each | aType print: each on: aStream]
				for: self
				separatedBy: [aStream nextPutAll: ', ']].
	aStream nextPut: $).</body>

<body package="Assignment #3" selector="glorpPrintSQLOn:">glorpPrintSQLOn: aCommand
	aCommand nextPut: $(.
	self isEmpty
		ifTrue: [aCommand nextPutAll: 'NULL']
		ifFalse:
			[GlorpHelper
				do: [:each | each glorpPrintSQLOn: aCommand]
				for: self
				separatedBy: [aCommand nextPutAll: ', ']].
	aCommand nextPut: $).</body>

<body package="Assignment #3" selector="glorpRegisterCollectionInternalsIn:">glorpRegisterCollectionInternalsIn: anObjectTransaction 
	"Explicitly register any internal structures (e.g. a VW identity dictionary's valueArray) with the transaction. Assume we can safely register everything inside the collection reflectively. The obvious exceptions would be dependents and sortblocks. This is a cheat, and for peculiar cases you'll need to override this in the subclass"

	| names |
	names := self class allInstVarNames.
	(1 to: names size) do: 
			[:index | 
			(#('dependents' 'sortBlock') includes: (names at: index)) 
				ifFalse: [anObjectTransaction register: (self instVarAt: index)]]</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>streams</category>

<body package="Assignment #3" selector="writeStream">writeStream
	^AddingWriteStream on: self</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>private</category>

<body package="Assignment #3" selector="emptyCollectionError">emptyCollectionError
	"Answer an error notification because the collection is empty."

	self error: (#errEmptyCollection &lt;&lt; #dialogs &gt;&gt; 'this collection is empty')</body>

<body package="Assignment #3" selector="emptyCheck">emptyCheck
	"Provide an error notification if the collection is empty."

	self isEmpty ifTrue: [^self emptyCollectionError]</body>

<body package="Assignment #3" selector="notFoundError">notFoundError
	"Raise a signal indicating that an object is not in the collection."

	^self class notFoundSignal raise</body>

<body package="Assignment #3" selector="myDependents">myDependents
	"By default we don't allow collections to have dependents, as the system collections don't signal change events and it becomes a major bottleneck and potential source of deadock accessing the global DependentsFields when collections grow. If a subclass wants to have dependents, it should implement local storage for them and the myDependents/myDependents: methods. If you want the old behavior back, see the CollectionDependentsBackwardCompatibility parcel."
	^nil.</body>

<body package="Assignment #3" selector="growSize">growSize
	"Answer an amount by which the receiver should grow 
	to make room for more elements."

	^self capacity max: 2</body>

<body package="Assignment #3" selector="_addAllToDictionary:">_addAllToDictionary: aDictionary
	"This is support code for Dictionary's quirky concept of addAll:. In general
	Dictionary does not support #add: except in the specific case where the added
	object is an Association. But in that case, the Association does not become a
	member of the dictionary's values.

	But although Dictionary doesn't support #add: in the most general case, it
	does support #addAll: if the argument acts like a Dictionary. We use double-
	dispatching to handle Dictionary-like collections differently than those
	that are not like Dictionaries (and are assumed to contain a group of
	Associattions).

	To some extent, sequenceable collections like Array can act like Dictionaries,
	but because there's already some code that expects #addAll: to ignore the
	indices of an Array of Associations, so for this purpose, SequenceableCollections
	are not considered as 'keyed'."

	self do: [:each | aDictionary add: each].</body>

<body package="Assignment #3" selector="maxPrint">maxPrint
	"Answer the maximum number of characters to print with printOn:."

	^5000</body>

<body package="Assignment #3" selector="noMatchError">noMatchError
	"Answer an error notification because the collection sizes do not match."

	self error: (#errCollectionNoMatch &lt;&lt; #dialogs &gt;&gt; 'collection sizes do not match')</body>

<body package="Assignment #3" selector="notKeyedError">notKeyedError
	"Answer an error notification because the collection 
	does not respond to keyed accessing messages."

	self error: ((#errKeyedAccessingMessages &lt;&lt; #dialogs &gt;&gt; 'Instances of &lt;1p&gt; do not respond to keyed accessing messages.') 
		expandMacrosWith: (self class))</body>

<body package="Assignment #3" selector="myEventTable:">myEventTable: newTable
	"By default we don't allow collections to have an event table, as the system collections do not signal any, and it becomes a major bottleneck and potential source of deadlock accessing the global EventHandlers when collections grow. If a subclass wants to signal events, it should implement local storage for them and the myEventTable/myEventTable: methods.  If you want the old behavior back, see the CollectionDependentsBackwardCompatibility parcel."
	^self.</body>

<body package="Assignment #3" selector="myDependents:">myDependents: dependentsOrNil
	"By default we don't allow collections to have dependents, as the system collections don't signal change events and it becomes a major bottleneck and potential source of deadlock accessing the global DependentsFields when collections grow. If a subclass wants to have dependents, it should implement local storage for them and the myDependents/myDependents: methods. If you want the old behavior back, see the CollectionDependentsBackwardCompatibility parcel."
	^self.</body>

<body package="Assignment #3" selector="myEventTable">myEventTable
	"By default we don't allow collections to have an event table, as the system collections do not signal any, and it becomes a major bottleneck and potential source of deadlock accessing the global EventHandlers when collections grow. If a subclass wants to signal events, it should implement local storage for them and the myEventTable/myEventTable: methods.  If you want the old behavior back, see the CollectionDependentsBackwardCompatibility parcel."
	^nil.</body>
</methods>

<methods>
<class-id>Core.Collection</class-id> <category>adding</category>

<body package="Assignment #3" selector="glorpAddAll:">glorpAddAll: aCollection
	^self addAll: aCollection.</body>

<body package="Assignment #3" selector="addAll:">addAll: aCollection 
	"Include all the elements of aCollection as the receiver's elements.  Answer
	aCollection."

	aCollection do: [:each | self add: each].
	^aCollection</body>

<body package="Assignment #3" selector="add:">add: newObject 
	"Include newObject as one of the receiver's elements.  Answer newObject.
	This message should not be sent to instances of subclasses of ArrayedCollection."

	self subclassResponsibility</body>

<body package="Assignment #3" selector="glorpAddAllToDictionary:">glorpAddAllToDictionary: aDictionary
	"Assumes that we are a collection of associations"
	self do: [:each | aDictionary add: each].</body>
</methods>


<methods>
<class-id>Core.Matrix</class-id> <category>initialize-release</category>

<body package="Assignment #3" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>Core.Matrix</class-id> <category>accessing</category>

<body package="Assignment #3" selector="row:column:put:">row: rowIndex column: columnIndex put: aNumber
	"Puts aNumber in the given location"

	(array at: (columns * (rowIndex - 1) + columnIndex) put: aNumber).
	^array</body>

<body package="Assignment #3" selector="+">+ aMatrix

	| arraySize anArray matrix1 matrix2 sum |
	sum := Matrix new.
	sum rows: rows columns: columns.
	anArray := sum returnArray.
	matrix1 := self returnArray.
	matrix2 := aMatrix returnArray.
	arraySize := anArray size.
	1 to: arraySize
		do: [:each | anArray at: each put: ((matrix1 at: each) + (matrix2 at: each))].
	^anArray</body>

<body package="Assignment #3" selector="returnColumns">returnColumns

	^columns</body>

<body package="Assignment #3" selector="returnRows">returnRows

	^rows</body>

<body package="Assignment #3" selector="rows:columns:">rows: numberOfRows columns: numberOfColumns
	"Returns a matrix object with the given number of rows and columns"

	array := Array new: (numberOfRows * numberOfColumns).
	rows := numberOfRows.
	columns := numberOfColumns.
	^array</body>

<body package="Assignment #3" selector="*">* aMatrixObject
	"Returns a new matrix object that is the product (as matrices) of the receiver and argument"

	| product matrix1 matrix2 rows1 columns1 columns2 rows2 sum |
	matrix1 := self returnArray.
	matrix2 := aMatrixObject returnArray.
	rows1 := self returnRows.
	columns1 := self returnColumns.
	columns2 := aMatrixObject returnColumns.
	rows2 := aMatrixObject returnRows.
	product := Array new: rows1 * columns2.
	1 to: columns2
		do: 
			[:k |
			1 to: rows1
				do: 
					[:i |
					sum := 0.
					1 to: rows2
						do: 
							[:j |
							sum := sum + ((matrix1 at: columns1 * (i - 1) + j)
												* (matrix2 at: columns2 * (j - 1) + k))].
					product at: columns2 * (i - 1) + k put: sum]].
	^product</body>

<body package="Assignment #3" selector="row:column:">row: rowIndex column: columnIndex
	"Returns the number in the given location"

	| x |
	x := array at: (columns * (rowIndex - 1) + columnIndex).
	^x</body>

<body package="Assignment #3" selector="returnArray">returnArray

	^array</body>
</methods>


<methods>
<class-id>Core.Collection class</class-id> <category>accessing</category>

<body package="Assignment #3" selector="toolListIcon">toolListIcon
	^BehaviorIcons Collection</body>
</methods>

<methods>
<class-id>Core.Collection class</class-id> <category>instance creation</category>

<body package="Assignment #3" selector="withAll:">withAll: aCollection
	" Answer a new instance of this class,
	whose elements are the elements of aCollection. "

	| newCollection |
	newCollection := self new.
	newCollection addAll: aCollection.
	^newCollection</body>

<body package="Assignment #3" selector="with:with:">with: firstObject with: secondObject 
	"Answer a new instance of a Collection containing 
	the two arguments as elements."

	| newCollection |
	newCollection := self new.
	newCollection add: firstObject.
	newCollection add: secondObject.
	^newCollection</body>

<body package="Assignment #3" selector="with:with:with:with:">with: firstObject with: secondObject with: thirdObject with: fourthObject 
	"Answer a new instance of a Collection containing the	
	four arguments as the elements."

	| newCollection |
	newCollection := self new.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	newCollection add: fourthObject.
	^newCollection</body>

<body package="Assignment #3" selector="with:with:with:">with: firstObject with: secondObject with: thirdObject 
	"Answer with a new instance of a Collection containing 
	the three arguments as elements."

	| newCollection |
	newCollection := self new.
	newCollection add: firstObject.
	newCollection add: secondObject.
	newCollection add: thirdObject.
	^newCollection</body>

<body package="Assignment #3" selector="with:">with: anObject 
	"Answer a new instance of a Collection containing anObject."

	| newCollection |
	newCollection := self new.
	newCollection add: anObject.
	^newCollection</body>
</methods>


<methods>
<class-id>Core.MatrixTest</class-id> <category>tests</category>

<body package="Assignment #3" selector="testRowColumnPut">testRowColumnPut

	| matrix1 matrix2 |
	matrix1 := Matrix new.
	self
		assert: (matrix1
				rows: 2 columns: 4;
				row: 1 column: 1 put: 1;
				row: 1 column: 2 put: 2;
				row: 1 column: 3 put: 3;
				row: 1 column: 4 put: 4;
				row: 2 column: 1 put: 5;
				row: 2 column: 2 put: 6;
				row: 2 column: 3 put: 7;
				row: 2 column: 4 put: 8;
				returnArray) = #(1 2 3 4 5 6 7 8).
	matrix2 := Matrix new.
	self
		assert: (matrix2
				rows: 2 columns: 2;
				row: 1 column: 1 put: 10;
				row: 1 column: 2 put: 11;
				row: 2 column: 1 put: 12;
				row: 2 column: 2 put: 13;
				returnArray) = #(10 11 12 13)</body>

<body package="Assignment #3" selector="testplus">testplus

	| matrix1 matrix2 matrix3 matrix4 |
	matrix1 := Matrix new.
	matrix1
		rows: 2 columns: 2;
		row: 1 column: 1 put: 1;
		row: 1 column: 2 put: 2;
		row: 2 column: 1 put: 5;
		row: 2 column: 2 put: 6.	
	matrix2 := Matrix new.
	matrix2
		rows: 2 columns: 2;
		row: 1 column: 1 put: 10;
		row: 1 column: 2 put: 11;
		row: 2 column: 1 put: 12;
		row: 2 column: 2 put: 13.
	self assert: matrix1 + matrix2 = #(11 13 17 19).
	matrix3 := Matrix new.
	matrix3
		rows: 2 columns: 4;
		row: 1 column: 1 put: 1;
		row: 1 column: 2 put: 2;
		row: 1 column: 3 put: 3;
		row: 1 column: 4 put: 4;
		row: 2 column: 1 put: 5;
		row: 2 column: 2 put: 6;
		row: 2 column: 3 put: 7;
		row: 2 column: 4 put: 8.
	matrix4 := Matrix new.
	matrix4
		rows: 2 columns: 4;
		row: 1 column: 1 put: 10;
		row: 1 column: 2 put: 11;
		row: 1 column: 3 put: 12;
		row: 1 column: 4 put: 13;
		row: 2 column: 1 put: 14;
		row: 2 column: 2 put: 15;
		row: 2 column: 3 put: 16;
		row: 2 column: 4 put: 17.
	self assert: matrix3 + matrix4 = #(11 13 15 17 19 21 23 25)</body>

<body package="Assignment #3" selector="testadd">testadd

	| matrix1 matrix2 |
	matrix1 := Matrix new.
	self
		assert: (matrix1
				rows: 2 columns: 4;
				row: 1 column: 1 put: 1;
				row: 1 column: 2 put: 2;
				row: 1 column: 3 put: 3;
				row: 1 column: 4 put: 4;
				row: 2 column: 1 put: 5;
				row: 2 column: 2 put: 6;
				row: 2 column: 3 put: 7;
				row: 2 column: 4 put: 8;
				returnArray) = #(1 2 3 4 5 6 7 8).
	matrix2 := Matrix new.
	self
		assert: (matrix2
				rows: 2 columns: 2;
				row: 1 column: 1 put: 10;
				row: 1 column: 2 put: 11;
				row: 2 column: 1 put: 12;
				row: 2 column: 2 put: 13;
				returnArray) = #(10 11 12 13)</body>

<body package="Assignment #3" selector="testmultiply">testmultiply

	| matrix1 matrix2 matrix3 matrix4 |
	matrix1 := Matrix new.
	matrix1
		rows: 2 columns: 2;
		row: 1 column: 1 put: 1;
		row: 1 column: 2 put: 2;
		row: 2 column: 1 put: 5;
		row: 2 column: 2 put: 6.
	matrix2 := Matrix new.
	matrix2
		rows: 2 columns: 2;
		row: 1 column: 1 put: 10;
		row: 1 column: 2 put: 11;
		row: 2 column: 1 put: 12;
		row: 2 column: 2 put: 13.
	self assert: matrix1 * matrix2 = #(34 37 122 133).
	matrix3 := Matrix new.
	matrix3
		rows: 2 columns: 4;
		row: 1 column: 1 put: 1;
		row: 1 column: 2 put: 2;
		row: 1 column: 3 put: 3;
		row: 1 column: 4 put: 4;
		row: 2 column: 1 put: 5;
		row: 2 column: 2 put: 6;
		row: 2 column: 3 put: 7;
		row: 2 column: 4 put: 8.
	matrix4 := Matrix new.
	matrix4
		rows: 4 columns: 2;
		row: 1 column: 1 put: 10;
		row: 1 column: 2 put: 11;
		row: 2 column: 1 put: 12;
		row: 2 column: 2 put: 13;
		row: 3 column: 1 put: 14;
		row: 3 column: 2 put: 15;
		row: 4 column: 1 put: 16;
		row: 4 column: 2 put: 17.
	self assert: matrix3 * matrix4 = #(140 150 348 374)</body>

<body package="Assignment #3" selector="testRowsColumns">testRowsColumns

	| matrix1 matrix2 |
	matrix1 := Matrix new.
	self
		assert: (matrix1
				rows: 2 columns: 4;
				returnArray) = #(nil nil nil nil nil nil nil nil).
	matrix2 := Matrix new.
	self
		assert: (matrix2
				rows: 2 columns: 2;
				returnArray) = #(nil nil nil nil)</body>

<body package="Assignment #3" selector="testRowColumn">testRowColumn

	| matrix1 matrix2 |
	matrix1 := Matrix new.
	self
		assert: (matrix1
				rows: 2 columns: 4;
				row: 1 column: 1 put: 1;
				row: 1 column: 2 put: 2;
				row: 1 column: 3 put: 3;
				row: 1 column: 4 put: 4;
				row: 2 column: 1 put: 5;
				row: 2 column: 2 put: 6;
				row: 2 column: 3 put: 7;
				row: 2 column: 4 put: 8;
				row: 2 column: 1) = 5.
	self assert: (matrix1 row: 1 column: 3) = 3.
	matrix2 := Matrix new.
	self
		assert: (matrix2
				rows: 2 columns: 2;
				row: 1 column: 1 put: 10;
				row: 1 column: 2 put: 11;
				row: 2 column: 1 put: 12;
				row: 2 column: 2 put: 13;
				row: 2 column: 2) = 13.
	self assert: (matrix2 row: 1 column: 1) = 10</body>

<body package="Assignment #3" selector="testMatrix">testMatrix

	| x |
	x := Matrix new.
	self assert: (x rows: 3 columns: 2) = #(nil nil nil nil nil nil)</body>
</methods>


<methods>
<class-id>Core.BinarySearchTreeTest</class-id> <category>tests</category>

<body package="Assignment #3" selector="testDo">testDo

	| sizeOfCollection aCollection |
	aCollection := #(8 5 6 10 3 12 9).
	sizeOfCollection := aCollection size	
	self assert: (1 to: sizeOfCollection do: [:each | self add: (aCollection at: each)]) = '(8(5(3)(6))(10(9)(12)))'</body>

<body package="Assignment #3" selector="testWithAll">testWithAll

| tree1 |
	tree1=BinarySearchTree new.

	self assert:(tree1 withAll:#(1 3 2 4)) = '(1(3(2)(4)'.</body>

<body package="Assignment #3" selector="testPrintOn">testPrintOn

	| one two a |
	one := BinarySearchTree new.
	self
		assert: (one
				withAll: #(5 7 0.9 -4 12);
				printOn: a) = '(5(0.9(-4))(7(12)))'.
	two := BinarySearchTree new.
	self
		assert: (two
				withAll: #(-1 3 0.5 -23 17);
				printOn: a) = '(-1(-23)(3(0.5)(17)))'</body>

<body package="Assignment #3" selector="testSize">testSize

	| tree1 tree2 |
	tree1 := BinarySearchTree new.
	self assert: (tree1
				withAll: #(4 2 1 5 3 2);
				size) = 6.
	tree2 := BinarySearchTree new.
	self assert: (tree2
				withAll: #(-3 -14 33 2 3 6 9);
				size) = 7</body>

<body package="Assignment #3" selector="testAddNode">testAddNode

	|x|
	x := BinarySearchTree new.
	self assert: (
	x
		add:3;
		add:4;
		add:2;
		add:1;
		x )printString = '(3(2(1))(4))'</body>
</methods>



</st-source>
