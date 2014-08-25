@@ -0,0 +1,266 @@
<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.10.1 of February 6, 2014 on August 25, 2014 at 2:39:46 PM</time-stamp>


<component-created>
<name>Assignment5</name> <type>package</type>
</component-created>
<!-- Package Assignment5(1.9,pithadia) -->


<component-property>
<name>Assignment5</name> <type>package</type>
<property>comment</property> <value>'"Contains Code related to Assignment 5"
'</value>
</component-property>

<class>
<name>CurrencyTests</name>
<environment>Smalltalk</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment5</package>
</attributes>
</class>

<class>
<name>Currency</name>
<environment>Smalltalk</environment>
<super>Core.Magnitude</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>amount </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment5</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Currency</class-id>
<body>"Represents currency"

Instance Variables
	amount	&lt;MessageForwarder | Object | ProtoObject | ProtoObject | WeakProxy&gt;	description of amount

</body>
</comment>

<class>
<name>BankAccount</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>balance name type timestampCollection balanceInStream availableBalanceStream availableBalance </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment5</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.BankAccount</class-id>
<body>"Contains methods for bank transactions such as deposit, withdrawal and balance"
</body>
</comment>

<class>
<name>BankAccountTests</name>
<environment>Smalltalk</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment5</package>
</attributes>
</class>

<methods>
<class-id>BankAccount</class-id> <category>accessing</category>

<body package="Assignment5" selector="withdrawal:">withdrawal: anAmount

	self type = 'Normal'
		ifTrue: 
			[(balance - anAmount asCurrency) amount &lt;= 0.0
				ifTrue: [Dialog warn: 'You have exceeded the withdrawal amount allowance. A $5 fee will be deducted from your account'.
						balance := balance - 5.0 asCurrency]
				ifFalse: [balance := balance - anAmount asCurrency]].
	self type = 'Preferred'
		ifTrue: 
			[(balance - anAmount asCurrency) amount &lt;= 0.0
				ifTrue: 
					[(anAmount asCurrency) &lt; (balance + 1000 asCurrency)
						ifTrue: [balance := balance - anAmount asCurrency]
						ifFalse: [Dialog warn: 'You have exceeded the withdrawal amount allowance. A $3 fee will be deducted from your account'.
								balance := balance - 3.0 asCurrency]]
				ifFalse: [balance := balance - anAmount asCurrency]]</body>

<body package="Assignment5" selector="availableBalance:">availableBalance: anAmount

	availableBalance := anAmount</body>

<body package="Assignment5" selector="depositCash:">depositCash: anAmount

	balance := self balance.
	availableBalance := self availableBalance.
	anAmount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is: $1']
		ifFalse: 
			[balance := balance + anAmount asCurrency.
			availableBalance := availableBalance + anAmount asCurrency].
	^self</body>

<body package="Assignment5" selector="availableBalance">availableBalance
	
	^availableBalance</body>

<body package="Assignment5" selector="availableBalanceIn:">availableBalanceIn: aDuration

	| firstRead secondRead testTime dollarRead amount |
	testTime := Timestamp now + aDuration.
	firstRead := ReadStream on: availableBalanceStream contents.
	secondRead := ReadStream on: availableBalanceStream contents.
	secondRead nextLine.
	[secondRead peek = nil] whileFalse: 
			[((Timestamp
				readFromDateAndTime: (firstRead upTo: Character tab) readStream)
					&lt;= testTime and: 
						[testTime &lt; (Timestamp
									readFromDateAndTime: (secondRead upTo: Character tab) readStream)])
				ifTrue: 
					[dollarRead := (firstRead upTo: Character cr) readStream.
					[dollarRead peek = nil] whileFalse: 
							[dollarRead upTo: $$.
							^amount := dollarRead upToEnd asNumber asCurrency]]
				ifFalse: 
					[firstRead nextLine.
					secondRead nextLine]].
	firstRead reset.
	testTime &lt; (Timestamp
				readFromDateAndTime: (firstRead upTo: Character tab) readStream)
		ifTrue: [^0.0 asCurrency]
		ifFalse: [^availableBalance]</body>

<body package="Assignment5" selector="type">type

	^type</body>

<body package="Assignment5" selector="transactionsFrom:">transactionsFrom: aFileName

	| file fileRead secondRead depositType transactionType dollarRead transactionId newAccountTimestamp holdDays checkClearDate amount currentTimestamp dictionary flag time currentTimestampStream key value |
	file := aFileName asFilename.
	fileRead := file readStream.
	dollarRead := ReadStream on: String new.
	balanceInStream := WriteStream on: String new.
	availableBalanceStream := WriteStream on: String new.
	dictionary := Dictionary new.
	fileRead upTo: Character tab.
	newAccountTimestamp := fileRead upTo: Character tab.
	balanceInStream
		nextPutAll: newAccountTimestamp;
		tab;
		print: balance;
		cr.
	availableBalanceStream
		nextPutAll: newAccountTimestamp;
		tab;
		print: availableBalance;
		cr.
	fileRead reset.
	[fileRead peek = nil] whileFalse: 
			[value := fileRead upTo: Character tab.
			key := fileRead upTo: Character tab.
			dictionary at: key put: value.
			fileRead nextLine].
	fileRead reset.
	timestampCollection := SortedCollection new.
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: Character tab.
			timestampCollection add: (fileRead upTo: Character tab).
			fileRead nextLine].
	fileRead reset.
	1 to: timestampCollection size
		do: 
			[:each |
			fileRead reset.
			flag := 0.
			currentTimestamp := timestampCollection at: each.
			fileRead upToAll: currentTimestamp.
			currentTimestampStream := fileRead upTo: Character tab.
			transactionType := (fileRead upTo: Character tab) asString.
			transactionType = 'NewAccount'
				ifFalse: 
					[balanceInStream
						nextPutAll: currentTimestampStream;
						tab.
					availableBalanceStream
						nextPutAll: currentTimestampStream;
						tab].
			transactionType = 'Deposit'
				ifTrue: 
					[depositType := fileRead upTo: Character tab.
					depositType = 'Cash'
						ifTrue: 
							[dollarRead := (fileRead upTo: Character cr) readStream.
							[dollarRead peek = nil] whileFalse: 
									[dollarRead upTo: $$.
									amount := dollarRead upToEnd asNumber].
							self depositCash: amount.
							balanceInStream
								print: balance;
								cr.
							availableBalanceStream
								print: availableBalance;
								cr]
						ifFalse: 
							[depositType = 'Check'
								ifTrue: 
									[availableBalanceStream
										print: availableBalance;
										cr.
									holdDays := (fileRead upTo: Character tab) asNumber.
									checkClearDate := (Timestamp
												readFromDateAndTime: currentTimestamp readStream) + holdDays days.
									dollarRead := (fileRead upTo: Character cr) readStream.
									[dollarRead peek = nil] whileFalse: 
											[dollarRead upTo: $$.
											amount := dollarRead upToEnd asNumber].
									self depositCheck: amount.
									balanceInStream
										print: balance;
										cr.
									secondRead := file readStream.
									1 to: timestampCollection size
										do: 
											[:q |
											secondRead upTo: Character tab.
											time := Timestamp
														readFromDateAndTime: (secondRead upTo: Character tab) readStream.
											(secondRead upTo: Character tab) = 'Cancel'
												ifTrue: 
													[(secondRead upTo: Character cr) = (dictionary at: currentTimestamp)
														&amp; (time &lt; checkClearDate) ifTrue: [flag := 1]]
												ifFalse: [secondRead nextLine].
											flag = 0
												ifTrue: 
													[time &gt;= checkClearDate
														ifTrue: 
															[self depositCash: amount.
															availableBalanceStream
																print: checkClearDate;
																tab;
																print: availableBalance;
																cr.
															self withdrawal: amount]]]]]]
				ifFalse: 
					[transactionType = 'Withdrawal'
						ifTrue: 
							[dollarRead := (fileRead upTo: Character cr) readStream.
							[dollarRead peek = nil] whileFalse: 
									[dollarRead upTo: $$.
									amount := dollarRead upToEnd asNumber.
									self withdrawal: amount.
									self withdrawalCheck: amount.
									balanceInStream
										print: balance;
										cr.
									availableBalanceStream
										print: availableBalance;
										cr]]
						ifFalse: 
							[transactionType = 'Cancel'
								ifTrue: 
									[transactionId := fileRead upTo: Character cr.
									fileRead reset.
									fileRead upToAll: transactionId.
									dollarRead := (fileRead upTo: Character cr) readStream.
									[dollarRead peek = nil] whileFalse: 
											[dollarRead upTo: $$.
											self withdrawal: dollarRead upToEnd asNumber.
											balanceInStream
												print: balance;
												cr]]]]].
	^self</body>

<body package="Assignment5" selector="deposit:">deposit: anAmount

	balance := self balance.
	anAmount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is: $1']
		ifFalse: [balance := balance + anAmount asCurrency]</body>

<body package="Assignment5" selector="balanceIn:">balanceIn: aDuration

	| firstRead secondRead testTime dollarRead amount |
	testTime := Timestamp now + aDuration.
	firstRead := ReadStream on: balanceInStream contents.
	secondRead := ReadStream on: balanceInStream contents.
	secondRead nextLine.
	[secondRead peek = nil] whileFalse: 
			[((Timestamp
				readFromDateAndTime: (firstRead upTo: Character tab) readStream)
					&lt;= testTime and: 
						[testTime &lt; (Timestamp
									readFromDateAndTime: (secondRead upTo: Character tab) readStream)])
				ifTrue: 
					[dollarRead := (firstRead upTo: Character cr) readStream.
					[dollarRead peek = nil] whileFalse: 
							[dollarRead upTo: $$.
							^amount := dollarRead upToEnd asNumber asCurrency]]
				ifFalse: 
					[firstRead nextLine.
					secondRead nextLine]].
	firstRead reset.
	testTime &lt; (Timestamp
				readFromDateAndTime: (firstRead upTo: Character tab) readStream)
		ifTrue: [^0.0 asCurrency]
		ifFalse: [^balance]</body>

<body package="Assignment5" selector="withdrawalCheck:">withdrawalCheck: anAmount

	^availableBalance := availableBalance - anAmount asCurrency</body>

<body package="Assignment5" selector="depositCheck:">depositCheck: anAmount

	balance := self balance.
	anAmount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is: $1']
		ifFalse: [balance := balance + anAmount asCurrency]</body>

<body package="Assignment5" selector="name">name

	^name</body>

<body package="Assignment5" selector="balance">balance
	
	^balance</body>
</methods>

<methods>
<class-id>BankAccount</class-id> <category>initialize-release</category>

<body package="Assignment5" selector="initialize:type:">initialize: accountName type: accountType

	super initialize.
	availableBalance := balance := 0.0 asCurrency.
	name := accountName.
	type := accountType.
	^self</body>

<body package="Assignment5" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Assignment5" selector="initialize:">initialize: accountName

	super initialize.
	balance := 0.
	name := accountName.
	^self</body>
</methods>


<methods>
<class-id>BankAccount class</class-id> <category>instance creation</category>

<body package="Assignment5" selector="fromFile:">fromFile: aFileName

	| file fileRead accountName accountType dollarRead |
	file := aFileName asFilename.
	fileRead := file readStream.
	[fileRead peek = nil] whileFalse: 
			[(fileRead upTo: Character tab) asString = 'NewAccount'
				ifTrue: 
					[accountName := fileRead upTo: Character tab.
					accountType := fileRead upTo: Character tab.
					dollarRead := (fileRead upTo: Character cr) readStream.
					dollarRead upTo: $$.
					^((self name: accountName type: accountType)
						depositCash: dollarRead upToEnd asNumber) transactionsFrom: file]]</body>

<body package="Assignment5" selector="new">new

	^self shouldNotImplement</body>

<body package="Assignment5" selector="name:type:">name: accountName type: accountType

	^super new initialize: accountName type: accountType</body>

<body package="Assignment5" selector="name:">name: accountName

	^super new initialize: accountName</body>
</methods>


<methods>
<class-id>Currency</class-id> <category>comparing</category>

<body package="Assignment5" selector="-">- aCurrency

	^Currency fromNumber: self amount - aCurrency amount</body>

<body package="Assignment5" selector="&lt;=">&lt;= aCurrency

	^self amount &lt;= aCurrency amount</body>

<body package="Assignment5" selector="&gt;=">&gt;= aCurrency

	^self amount &gt;= aCurrency amount</body>

<body package="Assignment5" selector="&lt;">&lt; aCurrency

	^self amount &lt; aCurrency amount</body>

<body package="Assignment5" selector="+">+ aCurrency

	^Currency fromNumber: (self amount + aCurrency amount)</body>

<body package="Assignment5" selector="=">= aCurrency

	^self amount = aCurrency amount</body>

<body package="Assignment5" selector="hash">hash
	" *** This method was defined by Magnitude as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	self error: 'Subclass responsibility stub not reimplemented'</body>
</methods>

<methods>
<class-id>Currency</class-id> <category>printing</category>

<body package="Assignment5" selector="printOn:">printOn: aStream

	"aStream
		nextPutAll: '$';
		nextPutAll: self amount printString"

	| negativeBalance |
	amount &lt; 0.0
		ifTrue: 
			[negativeBalance := amount.
			negativeBalance := negativeBalance * -1.0.
			aStream
				nextPutAll: '-$';
				nextPutAll: negativeBalance printString]
		ifFalse: 
			[aStream
				nextPutAll: '$';
				nextPutAll: amount printString]</body>
</methods>

<methods>
<class-id>Currency</class-id> <category>initialize-release</category>

<body package="Assignment5" selector="initialize:">initialize: aNumber
	"Initialize a newly created instance. This method must answer the receiver."

	amount := aNumber asNumber</body>

<body package="Assignment5" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Assignment5" selector="amount:">amount: aNumber

	amount := aNumber</body>

<body package="Assignment5" selector="amount">amount

	^amount</body>
</methods>


<methods>
<class-id>BankAccountTests</class-id> <category>test data</category>

<body package="Assignment5" selector="simpleCreate">simpleCreate

	^'1\' , (self today - 2 days) printString
		, '\NewAccount\Roger Whitney\Normal\$10.00' replaceAll: $\
			with: Character tab</body>

<body package="Assignment5" selector="dataFiles">dataFiles

	^#( 'simpleCreate' 'cashDepositsWithdrawals' 'wrongOrder' 'checkDeposits' 'futureAction')</body>

<body package="Assignment5" selector="futureAction">futureAction
	"The \ characters are converted to tabs when data is written to file"

	^'9\',  (self today - 5 days) printString ,' \NewAccount\Roger Whitney\Normal\$100.00
2\',   (self today - 2 days) printString ,'\Deposit\Check\3\$20.00
4\',  (self today - 1 days) printString ,'\Withdrawal\$15.00
'.</body>

<body package="Assignment5" selector="checkDeposits">checkDeposits
	"The \ characters are converted to tabs when data is written to file"
	
	^'9\',  (self today - 15 days) printString ,' \NewAccount\Roger Whitney\Normal\$100.00
5\',  (self today - 10 days) printString ,' \Deposit\Check\2\$10.00
2\',   (self today - 6 days) printString ,'\Deposit\Check\5\$20.00
7\',  (self today - 5 days) printString ,'\Deposit\Cash\$30.00
4\',  (self today - 4 days) printString ,'\Withdrawal\$15.00
'.</body>

<body package="Assignment5" selector="cashDepositsWithdrawals">cashDepositsWithdrawals
	"The \ characters are converted to tabs when data is written to file"
	
	^'1\',  (self today - 3 days) printString ,' \NewAccount\Roger Whitney\Normal\$10.00
3\',  (self today - 2 days) printString ,'\Deposit\Cash\$30.00
4\',  (self today - 1 days) printString ,'\Withdrawal\$15.00
'.</body>

<body package="Assignment5" selector="wrongOrder">wrongOrder
	"The \ characters are converted to tabs when data is written to file"

	^'9\',  (self today - 3 days) printString ,' \NewAccount\Roger Whitney\Normal\$10.00
4\',  (self today - 1 days) printString ,'\Withdrawal\$15.00
3\',  (self today - 2 days) printString ,'\Deposit\Cash\$30.00
'.</body>
</methods>

<methods>
<class-id>BankAccountTests</class-id> <category>private</category>

<body package="Assignment5" selector="today">today

	^Timestamp now</body>

<body package="Assignment5" selector="createFile:">createFile: aStringName

	| file fileWrite contents |
	file := aStringName asFilename.
	fileWrite := file writeStream.
	
	[contents := self perform: aStringName asSymbol.
	contents replaceAll: $\ with: Character tab.
	fileWrite nextPutAll: contents]
			ensure: [fileWrite close]</body>
</methods>

<methods>
<class-id>BankAccountTests</class-id> <category>tests</category>

<body package="Assignment5" selector="testCashDepositsWithdrawals">testCashDepositsWithdrawals

	| account |
	self createFile: 'cashDepositsWithdrawals'.
	account := BankAccount fromFile: 'cashDepositsWithdrawals'.
	self
		assert: (account balanceIn: -3 days) = '10.00' asCurrency;
		assert: (account balanceIn: -2 days) = '40.00' asCurrency;
		assert: (account balanceIn: -1 days) = '25.00' asCurrency</body>

<body package="Assignment5" selector="testSimpleCreate">testSimpleCreate

	| account |
	self createFile: 'simpleCreate'.
	account := BankAccount fromFile: 'simpleCreate'.
	self
		assert: account balance = '10.00' asCurrency;
		assert: account availableBalance = '10.00' asCurrency</body>

<body package="Assignment5" selector="testCheckDeposits">testCheckDeposits

	| account |
	self createFile: 'checkDeposits'.
	account := BankAccount fromFile: 'checkDeposits'.
	self
		assert: (account balanceIn: -15 days) = 100 asCurrency;
		assert: (account balanceIn: -6 days) = 120 asCurrency;
		assert: (account balanceIn: -5 days + 1 minutes) = 150 asCurrency;
		assert: account balance = 145 asCurrency.
	self
		assert: (account availableBalanceIn: -15 days) = 100 asCurrency;
		assert: (account availableBalanceIn: -9 days) = 100 asCurrency;
		assert: (account availableBalanceIn: -5 days + 1 minutes) = 130 asCurrency;
		assert: (account availableBalanceIn: -4 days + 1 minutes) = 145 asCurrency;
		assert: account availableBalance = 145 asCurrency</body>

<body package="Assignment5" selector="testNormalCustomerWithdrawal">testNormalCustomerWithdrawal

	| account |
	account := BankAccount name: 'Rakshit' type: 'Normal'.
	account deposit: 100.
	account withdrawal: 101.
	self assert: account balance = 95 asCurrency</body>

<body package="Assignment5" selector="testPreferredCustomerWithdrawal">testPreferredCustomerWithdrawal

	| account |
	account := BankAccount name: 'Voldemort' type: 'Preferred'.
	account deposit: 1000.
	account withdrawal: 1200.
	self assert: account balance = -200 asCurrency.
	account withdrawal: 1000.
	self assert: account balance = -203 asCurrency</body>

<body package="Assignment5" selector="testFutureAction">testFutureAction

	| account |
	self createFile: 'futureAction'.
	account := BankAccount fromFile: 'futureAction'.
	self
		assert: (account balanceIn: -5 days) = 100 asCurrency;
		assert: (account balanceIn: -2 days) = 120 asCurrency;
		assert: (account balanceIn: -1 days + 1 minutes) = 105 asCurrency;
		assert: (account balanceIn: 5 days ) = 105 asCurrency;
		assert: account balance = 105 asCurrency.
	self
		assert: (account availableBalanceIn: -5 days) = 100 asCurrency;
		assert: (account availableBalanceIn: -2 days) = 100 asCurrency;
		assert: (account availableBalanceIn: -1 days - 1 minutes) = 100 asCurrency;
		assert: (account availableBalanceIn: -1 days) = 85 asCurrency;
		assert: account availableBalance = 85 asCurrency</body>

<body package="Assignment5" selector="testTwoAccounts">testTwoAccounts

	| simpleAccount cashAccount |
	self createFile: 'simpleCreate'.
	self createFile: 'cashDepositsWithdrawals'.
	simpleAccount := BankAccount fromFile: 'simpleCreate'.
	cashAccount := BankAccount fromFile: 'cashDepositsWithdrawals'.
	self
		assert: simpleAccount balance = '10.00' asCurrency;
		assert: simpleAccount availableBalance = '10.00' asCurrency.
	self
		assert: (cashAccount balanceIn: -3 days) = '10.00' asCurrency;
		assert: (cashAccount balanceIn: -2 days) = '40.00' asCurrency;
		assert: (cashAccount balanceIn: -1 days) = '25.00' asCurrency;
		assert: cashAccount balance = '25.00' asCurrency</body>

<body package="Assignment5" selector="testCashDepositsWithdrawalsWrongOrder">testCashDepositsWithdrawalsWrongOrder

	| account |
	self createFile: 'wrongOrder'.
	account := BankAccount fromFile: 'wrongOrder'.
	self
		assert: (account balanceIn: -3 days) = '10.00' asCurrency;
		assert: (account balanceIn: -2 days) = '40.00' asCurrency;
		assert: (account balanceIn: -1 days) = '25.00' asCurrency;
		assert: account balance = '25.00' asCurrency.
	self
		assert: (account availableBalanceIn: -3 days) = '10.00' asCurrency;
		assert: (account availableBalanceIn: -2 days) = '40.00' asCurrency;
		assert: (account availableBalanceIn: -1 days) = '25.00' asCurrency;
		assert: account availableBalance = '25.00' asCurrency</body>
</methods>

<methods>
<class-id>BankAccountTests</class-id> <category>initialize-release</category>

<body package="Assignment5" selector="tearDown">tearDown

	"self dataFiles do: 
			[:each |
			| file |
			file := each asFilename.
			file exists ifTrue: [file delete]]"</body>
</methods>


<methods>
<class-id>Core.Number</class-id> <category>mathematical functions</category>

<body package="Assignment5" selector="asCurrency">asCurrency

	^Currency new: self</body>
</methods>


<methods>
<class-id>CurrencyTests</class-id> <category>tests</category>

<body package="Assignment5" selector="testCurrency">testCurrency

	| a b c d sum |
	a := '1.00' asCurrency.
	b := 2.12 asCurrency.
	sum := 3.12 asCurrency.
	c := a + b.
	self assert: b &lt; c.
	self assert: c &gt; a.
	self assert: sum = c.
	d := c - 1.00 asCurrency.
	self assert: d = b.
	self assert: a printString = '$1.0'</body>
</methods>


<methods>
<class-id>Currency class</class-id> <category>instance creation</category>

<body package="Assignment5" selector="fromString:">fromString: aString

	^super new amount: aString asNumber</body>

<body package="Assignment5" selector="new:">new: aNumber
	"Answer a newly created and initialized instance."

	^super new initialize: aNumber</body>

<body package="Assignment5" selector="fromNumber:">fromNumber: aNumber

	^super new amount: aNumber asNumber</body>

<body package="Assignment5" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>Core.String</class-id> <category>converting</category>

<body package="Assignment5" selector="asCurrency">asCurrency

	^Currency new: self</body>
</methods>



</st-source>
