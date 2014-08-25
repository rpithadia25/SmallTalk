@@ -0,0 +1,132 @@
<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.10.1 of February 6, 2014 on August 25, 2014 at 2:40:36 PM</time-stamp>


<component-created>
<name>Assignment #4</name> <type>package</type>
</component-created>
<!-- Package Assignment #4(1.0,pithadia) -->


<component-property>
<name>Assignment #4</name> <type>package</type>
<property>comment</property> <value>'"Contains code related to assignment 4"
'</value>
</component-property>

<class>
<name>BankAccount</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>balance newAccount </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #4</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.BankAccount</class-id>
<body>"Contains methods for bank transactions such as deposit, withdrawal and balance"
</body>
</comment>

<class>
<name>BankAccountTest</name>
<environment>Smalltalk</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment #4</package>
</attributes>
</class>

<methods>
<class-id>Core.StreamTest</class-id> <category>tests</category>

<body package="Assignment #4" selector="testLines">testLines

	| test read output |
	test := 'this
is
a test.'.
	output := OrderedCollection new.
	output add: 'this'.
	output add: 'is'.
	output add: 'a test.'.
	read := test readStream.
	self assert: read lines = output</body>

<body package="Assignment #4" selector="testNextLine">testNextLine

	| test read |
	test := 'this
is
a test.'.
	read := test readStream.
	self assert: read nextLine = 'this'.
	self assert: read nextLine = 'is'.
	self assert: read nextLine = 'a test.'</body>
</methods>


<methods>
<class-id>BankAccountTest</class-id> <category>tests</category>

<body package="Assignment #4" selector="testWithdrawal">testWithdrawal

	| account |
	account := BankAccount newAccount: 'rakshit'.
	account deposit: 1023.43.
	self assert: (account withdrawal: 23.0) = 1000.43.
	self assert: ((account withdrawal: 1000.0) printFormat: '##.00')
				= (0.43 printFormat: '##.00').
	self should: [account withdrawal: 1070.0] raise: Exception</body>

<body package="Assignment #4" selector="testDeposit">testDeposit

	| account |
	account := BankAccount newAccount: 'rakshit'.
	self assert: (account deposit: 12.0) = 12.0.
	self assert: (account deposit: 2.0) = 14.0.
	self assert: (account deposit: 1.1) = 15.1.
	self should: [account deposit: -1] raise: Exception.</body>

<body package="Assignment #4" selector="testBalance">testBalance

	| account |
	account := BankAccount newAccount: 'rakshit'.
	account deposit: 1234.45.
	self assert: account balance = 1234.45.
	account withdrawal: 234.45.
	self assert: (account balance printFormat: '##.00')
				= (1000.0 printFormat: '##.00')</body>
</methods>


<methods>
<class-id>BankAccount</class-id> <category>initialize-release</category>

<body package="Assignment #4" selector="initialize:">initialize: accountName

	super initialize.
	balance := 0.
	newAccount := accountName.
	^self</body>

<body package="Assignment #4" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>BankAccount</class-id> <category>accessing</category>

<body package="Assignment #4" selector="balance">balance
	"Returns the balance"

	balance = nil ifTrue: [^balance := 0.0] ifFalse: [^balance]</body>

<body package="Assignment #4" selector="withdrawal:">withdrawal: anAmount

	balance - anAmount asNumber &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Insufficient Balance for the current withdrawal']
		ifFalse: [^balance := balance - anAmount asNumber]</body>

<body package="Assignment #4" selector="deposit:">deposit: anAmount

	balance := self balance.
	anAmount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is 1']
		ifFalse: [^balance := balance + anAmount asNumber]</body>

<body package="Assignment #4" selector="fileTransactions">fileTransactions

	| name file fileRead account |
	name := 'BankAccount.txt'.
	
	[account := BankAccount new.
	file := name asFilename.
	fileRead := file readStream.
	[fileRead peek = nil] whileFalse: 
			[(fileRead upTo: Character tab) asString = 'deposit'
				ifTrue: [balance := account deposit: (fileRead upTo: Character cr) asNumber]
				ifFalse: 
					[balance := account withdrawal: (fileRead upTo: Character cr) asNumber]].
	^balance]
			on: Exception
			do: [Error raiseSignal: 'FILE_NOT_FOUND']</body>
</methods>


<methods>
<class-id>BankAccount class</class-id> <category>instance creation</category>

<body package="Assignment #4" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="Assignment #4" selector="newAccount:">newAccount: accountName

^(super new initialize: accountName)</body>
</methods>


<methods>
<class-id>Core.StringTest</class-id> <category>tests</category>

<body package="Assignment #4" selector="testProductSeperatedBy">testProductSeperatedBy

	self assert: ('3-2-5' productSeperatedBy: $-) = 30.
	self assert: ('2-3-4' productSeperatedBy: $-) = 24.
	self should: [('3-4-x' productSeperatedBy: $-)] raise: Exception.
	self should: [('7-r-9' productSeperatedBy: $-)] raise: Exception.
	self should: [('7-r-9q' productSeperatedBy: $-)] raise: Exception.</body>

<body package="Assignment #4" selector="testSumSeperatedBy">testSumSeperatedBy

	self assert: ('1, 2, 3' sumSeperatedBy: $,) = 6.
	self assert: ('3, 4, 8' sumSeperatedBy: $,) = 15.
	self should: ['3, 4, x' sumSeperatedBy: $,] raise: Exception.
	self should: ['5, r, 8' sumSeperatedBy: $,] raise: Exception.
	self should: ['5, r, 8a' sumSeperatedBy: $,] raise: Exception.
	self should: ['5q, rs, 8a' sumSeperatedBy: $,] raise: Exception</body>
</methods>


<methods>
<class-id>Core.String</class-id> <category>accessing</category>

<body package="Assignment #4" selector="productSeperatedBy:">productSeperatedBy: aCharacter

	| input product element |
	product := 1.
	input := ReadStream on: self.
	[input peek = nil] whileFalse: 
			[element := input upTo: aCharacter.
			(element allSatisfy: [:each1 | '-0123456789' includes: each1])
				ifTrue: [product := product * element asNumber]
				ifFalse: [Error raiseSignal: 'Please input numbers only']].
	^product</body>

<body package="Assignment #4" selector="sumSeperatedBy:">sumSeperatedBy: aCharacter

	| numbers sum sizeOf element |
	numbers := self tokensBasedOn: aCharacter.
	sum := 0.
	sizeOf := numbers size.
	1 to: sizeOf
		do: 
			[:each |
			element := numbers at: each.
			(element allSatisfy: [:each2 | ' -0123456789' includes: each2])
				ifTrue: [sum := sum + element asNumber]
				ifFalse: [Error raiseSignal: 'Please input numbers only']].
	^sum</body>
</methods>


<methods>
<class-id>Core.Stream</class-id> <category>accessing</category>

<body package="Assignment #4" selector="lines">lines
	"Returns an Ordered collection of all lines in the Stream from the current location to the end"

	| output |
	output := OrderedCollection new.
	[self peek = nil] whileFalse: [output add: self nextLine].
	^output</body>

<body package="Assignment #4" selector="nextLine">nextLine
	"Returns all characters upto the next carriage return"

	^self upTo: Character cr</body>
</methods>



</st-source>
