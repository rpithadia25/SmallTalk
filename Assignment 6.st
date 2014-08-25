@@ -0,0 +1,454 @@
<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.10.1 of February 6, 2014 on August 25, 2014 at 2:40:23 PM</time-stamp>


<component-created>
<name>Assignment6</name> <type>package</type>
</component-created>
<!-- Package Assignment6(1.10,pithadia) -->


<component-property>
<name>Assignment6</name> <type>package</type>
<property>comment</property> <value>'"Contains code related to assignment 6"
'</value>
</component-property>

<class>
<name>BankTest</name>
<environment>Smalltalk</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<class>
<name>BidRate</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>sourceCurrency targetCurrencyType </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.BidRate</class-id>
<body>"Contains Bid Rate Data"</body>
</comment>

<class>
<name>BankAccount</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>balance availableBalance balanceInStream availableBalanceStream name type currencyType accountId </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.BankAccount</class-id>
<body>"Contains methods for bank transactions such as deposit, withdrawal and balance"
</body>
</comment>

<class>
<name>Bank</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>routingNumber bankAccounts transactionType balance availableBalance balanceInStream availableBalanceStream fromAccount toAccount checkNumber outgoingTransactions currentTimestamp transactionIdAndTimestamp file timestampCollection </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Bank</class-id>
<body>"A Bank class"
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
<package>Assignment6</package>
</attributes>
</class>

<class>
<name>CurrencyTest</name>
<environment>Smalltalk</environment>
<super>SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<class>
<name>Currency</name>
<environment>Smalltalk</environment>
<super>Core.Magnitude</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>amount currencyType timestamp </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Assignment6</package>
</attributes>
</class>

<comment>
<class-id>Root.Smalltalk.Currency</class-id>
<body>"Represents currency"

Instance Variables
	amount	&lt;MessageForwarder | Object | ProtoObject | ProtoObject | WeakProxy&gt;	description of amount

</body>
</comment>

<methods>
<class-id>Bank class</class-id> <category>instance creation</category>

<body package="Assignment6" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="Assignment6" selector="routingNumber:">routingNumber: routingNumber

	^super new initialize: routingNumber</body>
</methods>


<methods>
<class-id>Currency class</class-id> <category>instance creation</category>

<body package="Assignment6" selector="fromString:">fromString: aString

	| type read value |
	read := ReadStream on: aString.
	read upTo: $$.
	value := read upTo: Character space.
	type := read upToEnd.
	^super new amount: value asNumber and: type</body>

<body package="Assignment6" selector="new:and:">new: aNumber and: type
	"Answer a newly created and initialized instance."

	^super new initialize: aNumber and: type</body>

<body package="Assignment6" selector="fromNumber:as:">fromNumber: aNumber as: type

	^self new
		amount: aNumber asNumber
		and: type</body>

<body package="Assignment6" selector="convertToCurrency:at:">convertToCurrency: aString at: date

	| type read value |
	read := ReadStream on: aString.
	read upTo: $$.
	value := read upTo: Character space.
	type := read upToEnd.
	^super new amount: value asNumber and: type at: date</body>

<body package="Assignment6" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>BidRate</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="populateCad">populateCad

	| fileName fileRead rate1 rate2 date cadToMxn cadToUsd |
	cadToMxn := Dictionary new.
	cadToUsd := Dictionary new.
	fileName := 'CAD.csv' asFilename.
	fileRead := fileName readStream.
	5 timesRepeat: [fileRead upTo: Character cr].
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: $".
			date := fileRead upTo: $".
			fileRead upTo: $".
			rate1 := fileRead upTo: $".
			fileRead upTo: $".
			rate2 := fileRead upTo: $".
			targetCurrencyType = 'MXN'
				ifTrue: 
					[date = ''
						ifTrue: [^cadToMxn]
						ifFalse: [cadToMxn at: date getDate put: rate1]].
			targetCurrencyType = 'USD'
				ifTrue: 
					[date = ''
						ifTrue: [^cadToUsd]
						ifFalse: [cadToUsd at: date getDate put: rate2]].
			fileRead nextLine]</body>

<body package="Assignment6" selector="readFile:for:">readFile: dictionary for: date

	dictionary keys do: [:each | date = each ifTrue: [^dictionary at: each]].
	^self getLatestRate: sourceCurrency currencyType , '.csv'</body>

<body package="Assignment6" selector="populateMxn">populateMxn

	| fileName fileRead rate1 rate2 date mxnToUsd mxnToCad |
	mxnToUsd := Dictionary new.
	mxnToCad := Dictionary new.
	fileName := 'MXN.csv' asFilename.
	fileRead := fileName readStream.
	5 timesRepeat: [fileRead upTo: Character cr].
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: $".
			date := fileRead upTo: $".
			fileRead upTo: $".
			rate1 := fileRead upTo: $".
			fileRead upTo: $".
			rate2 := fileRead upTo: $".
			targetCurrencyType = 'CAD'
				ifTrue: 
					[date = ''
						ifTrue: [^mxnToCad]
						ifFalse: [mxnToCad at: date getDate put: rate1]].
			targetCurrencyType = 'USD'
				ifTrue: 
					[date = ''
						ifTrue: [^mxnToUsd]
						ifFalse: [mxnToUsd at: date getDate put: rate2]].
			fileRead nextLine]</body>

<body package="Assignment6" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Assignment6" selector="getBidRate:">getBidRate: date

	| rate |
	sourceCurrency currencyType = 'MXN'
		ifTrue: [^rate := self readFile: self populateMxn for: date].
	sourceCurrency currencyType = 'CAD'
		ifTrue: [^rate := self readFile: self populateCad for: date].
	sourceCurrency currencyType = 'USD'
		ifTrue: [^rate := self readFile: self populateUsd for: date]</body>

<body package="Assignment6" selector="targetCurrencyType">targetCurrencyType

	^targetCurrencyType</body>

<body package="Assignment6" selector="initialize:and:">initialize: type and: source
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	targetCurrencyType := type.
	sourceCurrency := source.
	^self</body>

<body package="Assignment6" selector="populateUsd">populateUsd

	| fileName fileRead rate1 rate2 date usdToMxn usdToCad |
	usdToMxn := Dictionary new.
	usdToCad := Dictionary new.
	fileName := 'USD.csv' asFilename.
	fileRead := fileName readStream.
	5 timesRepeat: [fileRead upTo: Character cr].
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: $".
			date := fileRead upTo: $".
			fileRead upTo: $".
			rate1 := fileRead upTo: $".
			fileRead upTo: $".
			rate2 := fileRead upTo: $".
			targetCurrencyType = 'CAD'
				ifTrue: 
					[date = ''
						ifTrue: [^usdToCad]
						ifFalse: [usdToCad at: date getDate put: rate1]].
			targetCurrencyType = 'MXN'
				ifTrue: 
					[date = ''
						ifTrue: [^usdToMxn]
						ifFalse: [usdToMxn at: date getDate put: rate2]].
			fileRead nextLine]</body>
</methods>

<methods>
<class-id>BidRate</class-id> <category>accessing</category>

<body package="Assignment6" selector="getLatestRate:">getLatestRate: file

	| fileName fileRead rate1 rate2 |
	fileName := file asFilename.
	fileRead := fileName readStream.
	5 timesRepeat: [fileRead upTo: Character cr].
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: $".
			fileRead upTo: $".
			fileRead upTo: $".
			rate1 := fileRead upTo: $".
			fileRead upTo: $".
			rate2 := fileRead upTo: $".
			file = 'USD.csv'
				ifTrue: 
					[targetCurrencyType = 'MXN' ifTrue: [^rate2].
					targetCurrencyType = 'CAD' ifTrue: [^rate1]].
			file = 'CAD.csv'
				ifTrue: 
					[targetCurrencyType = 'MXN' ifTrue: [^rate1].
					targetCurrencyType = 'USD' ifTrue: [^rate2]].
			file = 'MXN.csv'
				ifTrue: 
					[targetCurrencyType = 'CAD' ifTrue: [^rate1].
					targetCurrencyType = 'USD' ifTrue:[^rate2]].
			fileRead nextLine]</body>
</methods>


<methods>
<class-id>BankTest</class-id> <category>test data</category>

<body package="Assignment6" selector="dataFiles">dataFiles

	^#('simpleCreate' 'cashDepositsWithdrawals' 'checkDepositsWithdrawals' 'checkDeposits' 'allTransactions')</body>

<body package="Assignment6" selector="checkDepositsWithdrawals">checkDepositsWithdrawals

	^'1431\' , (self today - 50 days) printString
		, '\NewAccount\000012348765\Roger Whitney\Normal\$200.00 USD

2564\'
			, (self today - 49 days) printString
			, '\NewAccount\880644404212\Roger Whitney\Preferred\$100.00 USD

3987\14 November 2013 9:28:14 PM\Withdrawal\Check\:055012581:880644404212\:055012581:000012348765\323\$10 CAD

4123\15 November 2013 9:28:14 PM\Withdrawal\Check\:055012581:000012348765\:055012581:880644404212\432\$10 MXN

5654\16 November 2013 9:28:14 PM\Deposit\Check\:055012581:000012348765\:055012581:880644404212\122\2\$5 MXN

6876\17 November 2013 9:28:14 PM\Deposit\Check\:055012581:880644404212\:055012581:000012348765\432\3\$16 CAD'</body>

<body package="Assignment6" selector="cashDepositsWithdrawals">cashDepositsWithdrawals

	^'1764\' , (self today - 50 days) printString
		, '\NewAccount\000012348765\Roger Whitney\Normal\$200.00 USD

2314\'
			, (self today - 49 days) printString
			, '\NewAccount\880644404212\Roger Whitney\Preferred\$100.00 USD

3098\14 November 2013 10:01:05 PM\Withdrawal\Cash\:055012581:880644404212\$10 CAD

4513\15 November 2013 10:01:05 PM\Withdrawal\Cash\:055012581:000012348765\$10 MXN

5876\16 November 2013 10:01:05 PM\Withdrawal\Cash\:055012581:880644404212\$10000 CAD

6123\17 November 2013 10:01:05 PM\Withdrawal\Cash\:055012581:000012348765\$1000 MXN

7634\18 November 2013 10:01:05 PM\Deposit\Cash\:055012581:880644404212\$55 MXN

8983\19 November 2013 10:01:05 PM\Deposit\Cash\:055012581:000012348765\$156 CAD'</body>

<body package="Assignment6" selector="allTransactions">allTransactions

	^'1834\' , (self today - 30 days) printString
		, '\NewAccount\000012348765\Roger Whitney\Normal\$200.00 USD

2563\'
			, (self today - 29 days) printString
			, '\NewAccount\880644404212\Roger Whitney\Preferred\$100.00 USD

4876\4 December 2013 5:42:59 PM\Withdrawal\Cash\:055012581:880644404212\$9000 MXN

8798\6 December 2013 5:42:59 PM\Deposit\Cash\:055012581:880644404212\$200 CAD

4213\2 December 2013 5:42:58 PM\Deposit\Check\:055012581:000012348765\:055012581:880644404212\1231\5\$150 CAD

9854\3 December 2013 5:42:59 PM\Cancel\:055012581:880644404212\4213

7799\1 December 2013 4:42:58 PM\Deposit\Check\:055012581:000012348765\:055012581:880644404212\1221\5\$3000 MXN

4909\8 December 2013 5:42:59 PM\Withdrawal\Check\:055012581:880644404212\:999912501:000012348765\1241\$10 MXN

6132\10 December 2013 5:42:58 PM\Deposit\Check\:999912581:000012348765\:055012581:880644404212\5531\5\$150 CAD

5345\9 December 2013 5:42:59 PM\Withdrawal\Check\:055012581:880644404212\:999912501:000012348765\8841\$10000 USD'</body>

<body package="Assignment6" selector="simpleCreate">simpleCreate

	^'143\' , (self today - 30 days) printString
		, '\NewAccount\000012348765\Roger Whitney\Normal\$200.00 USD

921\'
			, (self today - 29 days) printString
			, '\NewAccount\880644404212\Roger Whitney\Preferred\$100.00 USD'
			replaceAll: $\
			with: Character tab</body>

<body package="Assignment6" selector="checkDeposits">checkDeposits

	^'1265\' , (self today - 50 days) printString
		, '\NewAccount\000012348765\Roger Whitney\Normal\$200.00 USD

2211\'
			, (self today - 49 days) printString
			, '\NewAccount\880644404212\Roger Whitney\Preferred\$100.00 USD

5945\16 November 2013 9:28:14 PM\Deposit\Check\:999012581:000012348765\:055012581:880644404212\122\2\$5 MXN

6742\17 November 2013 9:28:14 PM\Deposit\Check\:999012581:880644404212\:055012581:000012348765\432\3\$16 CAD'</body>
</methods>

<methods>
<class-id>BankTest</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="tearDown">tearDown
	self dataFiles do: 
			[:each |
			| file |
			file := each asFilename.
			file exists ifTrue: [file delete]]</body>
</methods>

<methods>
<class-id>BankTest</class-id> <category>tests</category>

<body package="Assignment6" selector="testCheckDeposits">testCheckDeposits

	| account1 account2 bank outgoingtransactions |
	outgoingtransactions := OrderedCollection new.
	outgoingtransactions
		add: '5945	November 16, 2013 9:28:14 PM	Withdrawal	Check	:999012581:000012348765	122	$5 MXN';
		add: '6742	November 17, 2013 9:28:14 PM	Withdrawal	Check	:999012581:880644404212	432	$16 CAD'.
	self createFile: 'checkDeposits'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'checkDeposits'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.
	self
		assert: account1 balance = '$215.32 USD' asCurrency;
		assert: account1 availableBalance = '$200.00 USD' asCurrency;
		assert: account2 balance = '$100.39 USD' asCurrency;
		assert: account2 availableBalance = '$100.00 USD' asCurrency;
		assert: bank outgoingTransactions = outgoingtransactions</body>

<body package="Assignment6" selector="testCashDepositWithdrawals">testCashDepositWithdrawals

	| account1 account2 bank |
	self createFile: 'cashDepositsWithdrawals'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'cashDepositsWithdrawals'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.
	self
		assert: account1 balance = '$271.49 USD' asCurrency;
		assert: account1 availableBalance = '$271.49 USD' asCurrency;
		assert: account2 balance = '$91.71 USD' asCurrency;
		assert: account2 availableBalance = '$91.71 USD' asCurrency</body>

<body package="Assignment6" selector="testSimpleCreate">testSimpleCreate

	| account1 account2 bank |
	self createFile: 'simpleCreate'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'simpleCreate'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.
	self
		assert: account1 balance = '$200.00 USD' asCurrency;
		assert: account1 availableBalance = '$200.00 USD' asCurrency;
		assert: account2 balance = '$100.00 USD' asCurrency;
		assert: account2 availableBalance = '$100.00 USD' asCurrency</body>

<body package="Assignment6" selector="testRoutingNumber">testRoutingNumber

	| bank1 bank2 |
	bank1 := Bank routingNumber: '055012581'.
	bank2 := Bank routingNumber: '880644404'.
	self
		assert: bank1 routingNumber = '055012581';
		assert: bank2 routingNumber = '880644404'</body>

<body package="Assignment6" selector="testOutgoingTransactions">testOutgoingTransactions

	| account1 account2 bank outgoingtransactions |
	outgoingtransactions := OrderedCollection new.
	outgoingtransactions
		add: '5945	November 16, 2013 9:28:14 PM	Withdrawal	Check	:999012581:000012348765	122	$5 MXN';
		add: '6742	November 17, 2013 9:28:14 PM	Withdrawal	Check	:999012581:880644404212	432	$16 CAD'.
	self createFile: 'checkDeposits'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'checkDeposits'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.

	self
		assert: account1 balance = '$215.32 USD' asCurrency;
		assert: account1 availableBalance = '$200.00 USD' asCurrency;
		assert: account2 balance = '$100.39 USD' asCurrency;
		assert: account2 availableBalance = '$100.00 USD' asCurrency;
		assert: bank outgoingTransactions = outgoingtransactions</body>

<body package="Assignment6" selector="testAllTransactions">testAllTransactions

	| account1 account2 bank outgoingtransactions |
	outgoingtransactions := OrderedCollection new.
	outgoingtransactions
		add: '4909	December 8, 2013 5:42:59 PM	Deposit	Check	:055012581:880644404212	:999912501:000012348765	1241	$10 MXN';
		add: '6132	December 10, 2013 5:42:58 PM	Withdrawal	Check	:999912581:000012348765	5531	$150 CAD'.
	self createFile: 'allTransactions'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'allTransactions'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.
	self
		assert: account1 balance = '$53.74 USD' asCurrency;
		assert: account1 availableBalance = '$53.74 USD' asCurrency;
		assert: account2 balance = '$421.89 USD' asCurrency;
		assert: account2 availableBalance = '$281.04 USD' asCurrency;
		assert: bank outgoingTransactions = outgoingtransactions;
		assert: bank routingNumber = '055012581'</body>

<body package="Assignment6" selector="testCheckDepositWithdrawals">testCheckDepositWithdrawals

	| account1 account2 bank |
	self createFile: 'checkDepositsWithdrawals'.
	bank := Bank routingNumber: '055012581'.
	bank transactionsFrom: 'checkDepositsWithdrawals'.
	account1 := bank account: '000012348765'.
	account2 := bank account: '880644404212'.
	self
		assert: account1 balance = '$214.93 USD' asCurrency;
		assert: account1 availableBalance = '$199.61 USD' asCurrency;
		assert: account2 balance = '$85.07 USD' asCurrency;
		assert: account2 availableBalance = '$84.68 USD' asCurrency</body>
</methods>

<methods>
<class-id>BankTest</class-id> <category>private</category>

<body package="Assignment6" selector="today">today

	^Timestamp now</body>

<body package="Assignment6" selector="createFile:">createFile: aStringName

	| file fileWrite contents |
	file := aStringName asFilename.
	fileWrite := file writeStream.
	
	[contents := self perform: aStringName asSymbol.
	contents replaceAll: $\ with: Character tab.
	fileWrite nextPutAll: contents]
			ensure: [fileWrite close]</body>
</methods>


<methods>
<class-id>Bank</class-id> <category>accessing</category>

<body package="Assignment6" selector="checkDeposit:">checkDeposit: fileRead

	| fromRouting toRouting holdDays checkClearDate value amount outgoing secondRead time flag |
	flag := 0.
	fromAccount := fileRead upTo: Character tab.
	fromRouting := fromAccount getRoutingNumber.
	toAccount := fileRead upTo: Character tab.
	toRouting := toAccount getRoutingNumber.
	checkNumber := fileRead upTo: Character tab.
	holdDays := (fileRead upTo: Character tab) asNumber.
	checkClearDate := currentTimestamp + holdDays days.
	value := fileRead upTo: Character cr.
	amount := Currency convertToCurrency: value at: currentTimestamp.
	fromRouting = toRouting
		ifTrue: 
			[((self account: fromAccount getAccountId) withdrawal: amount) = true
				ifTrue: 
					[(self account: fromAccount getAccountId)
						updateBalanceInStream: balanceInStream
						for: currentTimestamp.
					(self account: fromAccount getAccountId)
						updateAvailableBalanceInStream: availableBalanceStream
						for: currentTimestamp.
					(self account: toAccount getAccountId) depositCheck: amount.
					(self account: toAccount getAccountId)
						updateBalanceInStream: balanceInStream
						for: currentTimestamp]
				ifFalse: 
					[(self account: fromAccount getAccountId)
						updateBalanceInStream: balanceInStream
						for: currentTimestamp.
					(self account: fromAccount getAccountId)
						updateAvailableBalanceInStream: availableBalanceStream
						for: currentTimestamp]]
		ifFalse: 
			[(self account: toAccount getAccountId) depositCheck: amount.
			(self account: toAccount getAccountId)
				updateBalanceInStream: balanceInStream
				for: currentTimestamp.
			outgoing := (transactionIdAndTimestamp at: currentTimestamp) , '	'
						, currentTimestamp printString , '	'
						, 'Withdrawal' , '	'
						, 'Check' , '	'
						, fromAccount , '	'
						, checkNumber , '	'
						, value.
			outgoing := outgoing reject: [:each | each = Character cr].
			fromRouting = routingNumber ifFalse: [outgoingTransactions add: outgoing]].
	secondRead := file readStream.
	1 to: timestampCollection size
		do: 
			[:each |
			secondRead upTo: Character tab.
			time := Timestamp
						readFromDateAndTime: (secondRead upTo: Character tab) readStream.
			(secondRead upTo: Character tab) = 'Cancel'
				ifTrue: 
					[fromAccount := secondRead upTo: Character tab.
					(secondRead upTo: Character cr)
						= (transactionIdAndTimestamp at: currentTimestamp)
							&amp; (time &lt; checkClearDate) ifTrue: [flag := 1"Transaction is cancelled"]]
				ifFalse: [secondRead nextLine]].
	flag = 0
		ifTrue: 
			[time &gt;= checkClearDate
				ifTrue: 
					[(self account: toAccount getAccountId) depositCash: amount.
					availableBalanceStream
						print: checkClearDate;
						tab;
						print: (self account: toAccount getAccountId) availableBalance;
						cr.
					(self account: toAccount getAccountId) withdrawal: amount]]</body>

<body package="Assignment6" selector="populateTransactionIdAndTimestamp">populateTransactionIdAndTimestamp

	| fileRead value key |
	fileRead := file readStream.
	[fileRead peek = nil] whileFalse: 
			[value := fileRead upTo: Character tab.
			key := (fileRead upTo: Character tab) getTimestamp.
			transactionIdAndTimestamp at: key put: value.
			fileRead nextLine]</body>

<body package="Assignment6" selector="outgoingTransactions">outgoingTransactions
	"Returns a collection of transactions for other banks generated from this bank. If no such transactions exist then return an empty collection."

	^outgoingTransactions</body>

<body package="Assignment6" selector="account:">account: aString
	"aString is an ACCOUNTNUMBER. Returns the bank account with the given account number."

	^bankAccounts at: aString</body>

<body package="Assignment6" selector="handleWithdrawal:">handleWithdrawal: fileRead

	| withdrawalType amount toRouting value outgoing |
	withdrawalType := fileRead upTo: Character tab.
	withdrawalType = 'Cash'
		ifTrue: 
			[fromAccount := fileRead upTo: Character tab.
			amount := Currency convertToCurrency: (fileRead upTo: Character cr)
						at: currentTimestamp.
			(self account: fromAccount getAccountId) withdrawal: amount.
			(self account: fromAccount getAccountId)
				updateBalanceInStream: balanceInStream
				for: currentTimestamp.
			(self account: fromAccount getAccountId)
				updateAvailableBalanceInStream: availableBalanceStream
				for: currentTimestamp].
	withdrawalType = 'Check'
		ifTrue: 
			[fromAccount := fileRead upTo: Character tab.
			toAccount := fileRead upTo: Character tab.
			toRouting := toAccount getRoutingNumber.
			checkNumber := fileRead upTo: Character tab.
			value := fileRead upTo: Character cr.
			amount := Currency convertToCurrency: value at: currentTimestamp.
			toRouting = routingNumber
				ifFalse: 
					[outgoing := (transactionIdAndTimestamp at: currentTimestamp), '	'
								, currentTimestamp printString , '	'
								, 'Deposit' , '	'
								, withdrawalType , '	'
								, fromAccount , '	'
								, toAccount , '	'
								, checkNumber , '	'
								, value.
					outgoing := outgoing reject:[:each | each = Character cr].
					((self account: fromAccount getAccountId) withdrawal: amount) = true
						ifTrue: [outgoingTransactions add: outgoing]]]</body>

<body package="Assignment6" selector="handleDeposit:">handleDeposit: fileRead

	| depositType amount |
	depositType := fileRead upTo: Character tab.
	depositType = 'Cash'
		ifTrue: 
			[toAccount := fileRead upTo: Character tab.
			amount := Currency convertToCurrency: (fileRead upTo: Character cr)
						at: currentTimestamp.
			(self account: toAccount getAccountId) depositCash: amount.
			(self account: toAccount getAccountId)
				updateBalanceInStream: balanceInStream
				for: currentTimestamp.
			(self account: toAccount getAccountId)
				updateAvailableBalanceInStream: availableBalanceStream
				for: currentTimestamp]
		ifFalse: [depositType = 'Check' ifTrue: [self checkDeposit: fileRead]]</body>

<body package="Assignment6" selector="routingNumber">routingNumber

	^routingNumber</body>

<body package="Assignment6" selector="handleCancel:">handleCancel: fileRead

	| transactionId time account amount |
	fileRead upTo: Character tab.
	transactionId := fileRead upTo: Character cr.
	fileRead reset.
	fileRead upToAll: transactionId.
	fileRead upTo: Character tab.
	time := fileRead upTo: Character tab.
	3 timesRepeat: [fileRead upTo: Character tab].
	account := (fileRead upTo: Character tab) getAccountId.
	amount := Currency convertToCurrency: (fileRead upTo: Character cr) at: time getTimestamp.
	(self account: account) withdrawalCancel: amount.
	(self account: account) updateBalanceInStream: balanceInStream
		for: currentTimestamp</body>

<body package="Assignment6" selector="fromFile:">fromFile: aFileName

	| fileRead accountName accountType accountNum value |
	file := aFileName asFilename.
	fileRead := file readStream.
	bankAccounts := Dictionary new.
	[fileRead peek = nil] whileFalse: 
			[(fileRead upTo: Character tab) asString = 'NewAccount'
				ifTrue: 
					[accountNum := fileRead upTo: Character tab.
					accountName := fileRead upTo: Character tab.
					accountType := fileRead upTo: Character tab.
					value := Currency fromString: (fileRead upTo: Character cr).
					bankAccounts at: accountNum
						put: ((BankAccount
								name: accountName
								type: accountType
								accNum: accountNum
								currencyType: value currencyType) depositCash: value)]]</body>

<body package="Assignment6" selector="populateTimestampCollection">populateTimestampCollection

	| fileRead |
	fileRead := file readStream.
	[fileRead peek = nil] whileFalse: 
			[fileRead upTo: Character tab.
			timestampCollection add: (fileRead upTo: Character tab) getTimestamp.
			fileRead nextLine]</body>

<body package="Assignment6" selector="transactionsFrom:">transactionsFrom: aFileName
	"The bank processes the transactions in the file. The file can contain information about multiple accounts. It can contain multiple NewAccount transactions. A NewAccount transaction will occur before any other transactions on that account. This method can be called multiple times."

	| fileRead accountNum |
	file := aFileName asFilename.
	fileRead := file readStream.
	outgoingTransactions := OrderedCollection new.
	balanceInStream := WriteStream on: String new.
	availableBalanceStream := WriteStream on: String new.
	transactionIdAndTimestamp := Dictionary new.
	timestampCollection := SortedCollection new.
	fileRead upTo: Character tab.
	self fromFile: file.
	fileRead reset.
	self populateTransactionIdAndTimestamp.
	fileRead reset.
	self populateTimestampCollection.
	fileRead reset.
	1 to: timestampCollection size
		do: 
			[:each |
			fileRead reset.
			currentTimestamp := timestampCollection at: each.
			fileRead upToAll: (transactionIdAndTimestamp at: currentTimestamp).
			fileRead upTo: Character tab.
			fileRead upTo: Character tab.
			transactionType := (fileRead upTo: Character tab) asString.
			transactionType = 'NewAccount'
				ifTrue: 
					[accountNum := fileRead upTo: Character tab.
					(self account: accountNum) updateBalanceInStream: balanceInStream
						for: currentTimestamp.
					(self account: accountNum)
						updateAvailableBalanceInStream: availableBalanceStream
						for: currentTimestamp].
			transactionType = 'Deposit'
				ifTrue: [self handleDeposit: fileRead]
				ifFalse: 
					[transactionType = 'Withdrawal' ifTrue: [self handleWithdrawal: fileRead]].
			transactionType = 'Cancel' ifTrue: [self handleCancel: fileRead]].
	^self</body>
</methods>

<methods>
<class-id>Bank</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="initialize:">initialize: routingNum
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	routingNumber := routingNum.
	^self</body>

<body package="Assignment6" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Core.Number</class-id> <category>mathematical functions</category>

<body package="Assignment6" selector="asCurrency:">asCurrency: type

	^Currency new: self and: type</body>

<body package="Assignment6" selector="asCurrency">asCurrency

	^Currency new: self</body>
</methods>


<methods>
<class-id>Core.String</class-id> <category>converting</category>

<body package="Assignment6" selector="getDate">getDate

	| stringParts numberParts date |
	stringParts := self tokensBasedOn: $-.
	numberParts := stringParts collect: [:each | each asNumber].
	^date := Date
				newDay: numberParts last
				monthNumber: (numberParts at: 2)
				year: numberParts first</body>

<body package="Assignment6" selector="getTimestamp">getTimestamp

	^Timestamp readFromDateAndTime: self readStream</body>

<body package="Assignment6" selector="getAccountId">getAccountId
	
	| fileRead |
	fileRead := self readStream.
	2 timesRepeat: [fileRead upTo: $:.].
	^fileRead upToEnd.</body>

<body package="Assignment6" selector="asCurrency:">asCurrency: type

	^Currency new: self and: type</body>

<body package="Assignment6" selector="getRoutingNumber">getRoutingNumber

	| fileRead |
	fileRead := self readStream.
	fileRead upTo: $:.
	^fileRead upTo: $:</body>

<body package="Assignment6" selector="asCurrency">asCurrency

	^Currency fromString: self</body>
</methods>


<methods>
<class-id>BankAccount class</class-id> <category>instance creation</category>

<body package="Assignment6" selector="new">new

	^self shouldNotImplement</body>

<body package="Assignment6" selector="name:type:accNum:currencyType:">name: accountName type: accountType accNum: accountNum currencyType: currency

	^super new initialize: accountName type: accountType accountNum: accountNum currencyType: currency</body>

<body package="Assignment6" selector="name:">name: accountName

	^super new initialize: accountName</body>
</methods>


<methods>
<class-id>CurrencyTest</class-id> <category>tests</category>

<body package="Assignment6" selector="testCurrency">testCurrency

	| sumDollars sumPesos|
	
	sumDollars := Currency fromString: '$0.00 USD'.
	1000 timesRepeat: [sumDollars := sumDollars + (Currency fromString: '$0.33 USD')].
	self assert: sumDollars = (Currency fromString: '$330.00 USD').
	
	sumPesos := Currency fromString: '$0.00 MXN'.
	1000 timesRepeat: [sumPesos := sumPesos + (Currency fromString: '$0.33 MXN')].
	self assert: sumPesos = (Currency fromString: '$330.00 MXN')</body>

<body package="Assignment6" selector="testCurrencyAddition">testCurrencyAddition

	| dollars pesos total date bidRate rate testAmount testTotal |
	date := Timestamp now - 28 days.
	dollars := Currency convertToCurrency: '$213.07 USD' at: date.
	pesos := Currency convertToCurrency: '$6.00 MXN' at: date.
	bidRate := BidRate getRateFor: 'USD' and: pesos.
	rate := bidRate getBidRate: pesos timestamp asDate.
	testAmount := pesos amount * rate asNumber.
	testTotal := (testAmount + dollars amount) asCurrency: dollars currencyType.
	total := dollars + pesos.
	self assert: total = testTotal</body>
</methods>


<methods>
<class-id>BankAccount</class-id> <category>accessing</category>

<body package="Assignment6" selector="balance">balance

	^balance</body>

<body package="Assignment6" selector="depositCash:">depositCash: aCurrency

	balance := self balance.
	availableBalance := self availableBalance.
	aCurrency amount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is: $1']
		ifFalse: 
			[balance := balance + aCurrency.
			availableBalance := availableBalance + aCurrency].
	^self</body>

<body package="Assignment6" selector="updateAvailableBalanceInStream:for:">updateAvailableBalanceInStream: stream for: timestamp

	availableBalanceStream := stream
		nextPutAll: timestamp printString;
		tab;
		print: availableBalance;
		cr</body>

<body package="Assignment6" selector="availableBalance">availableBalance
	
	^availableBalance</body>

<body package="Assignment6" selector="availableBalanceIn:">availableBalanceIn: aDuration

	| firstRead secondRead testTime amount |
	testTime := Timestamp now + aDuration.
	firstRead := ReadStream on: availableBalanceStream contents.
	secondRead := ReadStream on: availableBalanceStream contents.
	secondRead nextLine.
	[secondRead peek = nil] whileFalse: 
			[((firstRead upTo: Character tab) getTimestamp &lt;= testTime
				and: [testTime &lt; (secondRead upTo: Character tab) getTimestamp])
					ifTrue: [^amount := Currency fromString: (firstRead upTo: Character cr)]
					ifFalse: 
						[firstRead nextLine.
						secondRead nextLine]].
	firstRead reset.
	testTime &lt; (firstRead upTo: Character tab) getTimestamp
		ifTrue: [^0.0 asCurrency: currencyType]
		ifFalse: [^availableBalance]</body>

<body package="Assignment6" selector="type">type

	^type</body>

<body package="Assignment6" selector="balanceIn:">balanceIn: aDuration

	| firstRead secondRead testTime amount |
	testTime := Timestamp now + aDuration.
	firstRead := ReadStream on: balanceInStream contents.
	secondRead := ReadStream on: balanceInStream contents.
	secondRead nextLine.
	[secondRead peek = nil] whileFalse: 
			[((firstRead upTo: Character tab) getTimestamp &lt;= testTime
				and: [testTime &lt; (secondRead upTo: Character tab) getTimestamp])
					ifTrue: [^amount := Currency fromString: (firstRead upTo: Character cr)]
					ifFalse: 
						[firstRead nextLine.
						secondRead nextLine]].
	firstRead reset.
	testTime &lt; (firstRead upTo: Character tab) getTimestamp
		ifTrue: [^0.0 asCurrency: currencyType]
		ifFalse: [^balance]</body>

<body package="Assignment6" selector="accountId">accountId

	^accountId</body>

<body package="Assignment6" selector="withdrawalCancel:">withdrawalCancel: aCurrency

	balance := balance - aCurrency</body>

<body package="Assignment6" selector="updateBalanceInStream:for:">updateBalanceInStream: stream for: timestamp

	balanceInStream := stream
		nextPutAll: timestamp printString;
		tab;
		print: balance;
		cr</body>

<body package="Assignment6" selector="depositCheck:">depositCheck: aCurrency

	balance := self balance.
	aCurrency amount &lt;= 0.0
		ifTrue: [Exception raiseSignal: 'Minimum amount to be deposited is: $1']
		ifFalse: [balance := balance + aCurrency]</body>

<body package="Assignment6" selector="name">name

	^name</body>

<body package="Assignment6" selector="withdrawal:">withdrawal: aCurrency

	self type = 'Normal'
		ifTrue: 
			[(balance - aCurrency) amount &lt;= 0.0
				ifTrue: 
					[balance := balance - '$5.0 USD' asCurrency.
					availableBalance := availableBalance - '$5.0 USD' asCurrency.
					^false]
				ifFalse: 
					[balance := balance - aCurrency.
					availableBalance := availableBalance - aCurrency.
					^true]].
	self type = 'Preferred'
		ifTrue: 
			[(balance - aCurrency) amount &lt;= 0.0
				ifTrue: 
					[aCurrency &lt; (balance + (1000 asCurrency: aCurrency currencyType))
						ifTrue: 
							[balance := balance - aCurrency.
							availableBalance := availableBalance - aCurrency.
							^true]
						ifFalse: 
							[balance := balance - '$3.0 USD' asCurrency.
							availableBalance := availableBalance - '$3.0 USD' asCurrency.
							^false]]
				ifFalse: 
					[balance := balance - aCurrency.
					availableBalance := availableBalance - aCurrency.
					^true]].
	self type = 'Premium'
		ifTrue: 
			[(balance - aCurrency) amount &lt;= 0.0
				ifTrue: 
					[balance &lt; (-10000 asCurrency: currencyType)
						ifTrue: 
							[balance := balance - '$700.0 USD' asCurrency.
							availableBalance := availableBalance - '$700.0 USD' asCurrency.
							^false]
						ifFalse: 
							[balance := balance - aCurrency.
							availableBalance := availableBalance - aCurrency.
							^true]]
				ifFalse: 
					[balance := balance - aCurrency.
					availableBalance := availableBalance - aCurrency.
					^true]].
	self type = 'Gold'
		ifTrue: 
			[(balance - aCurrency) amount &lt;= 0.0
				ifTrue: 
					[balance &lt; (-100000 asCurrency: currencyType)
						ifTrue: 
							[balance := balance - '$5000.0 USD' asCurrency.
							availableBalance := availableBalance - '$5000.0 USD' asCurrency.
							^false]
						ifFalse: 
							[balance := balance - aCurrency.
							availableBalance := availableBalance - aCurrency.
							^true]]
				ifFalse: 
					[balance := balance - aCurrency.
					availableBalance := availableBalance - aCurrency.
					^true]]</body>
</methods>

<methods>
<class-id>BankAccount</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="initialize:type:accountNum:currencyType:">initialize: accountName type: accountType accountNum: accountNum currencyType: currency

	super initialize.
	availableBalance := balance := 0.0 asCurrency: currency.
	name := accountName.
	type := accountType.
	accountId := accountNum.
	currencyType := currency.
	^self</body>

<body package="Assignment6" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Assignment6" selector="initialize:">initialize: accountName

	super initialize.
	balance := 0.
	name := accountName.
	^self</body>
</methods>


<methods>
<class-id>Currency</class-id> <category>comparing</category>

<body package="Assignment6" selector="-">- aCurrency

	| rate bidRate |
	aCurrency currencyType = self currencyType
		ifTrue: [rate := 1] "No conversion required as both currency types are same"
		ifFalse: 
			[bidRate := BidRate getRateFor: self currencyType and: aCurrency.
			aCurrency timestamp = nil
				ifTrue: [rate := bidRate getLatestRate: aCurrency currencyType , '.csv']
				ifFalse: [rate := bidRate getBidRate: aCurrency timestamp asDate]].	
	^Currency fromNumber: (self amount - (aCurrency amount * rate asNumber)
				roundTo: 0.01)
		as: self currencyType</body>

<body package="Assignment6" selector="&lt;=">&lt;= aCurrency

	^self amount &lt;= aCurrency amount</body>

<body package="Assignment6" selector="&lt;">&lt; aCurrency

	^self amount &lt; aCurrency amount</body>

<body package="Assignment6" selector="&gt;=">&gt;= aCurrency

	^self amount &gt;= aCurrency amount</body>

<body package="Assignment6" selector="+">+ aCurrency

	| rate bidRate |
	aCurrency currencyType = self currencyType
		ifTrue: [rate := 1] "No conversion required as both currency types are same"
		ifFalse: 
			[bidRate := BidRate getRateFor: self currencyType and: aCurrency.
			aCurrency timestamp = nil
				ifTrue: [rate := bidRate getLatestRate: aCurrency currencyType , '.csv']
				ifFalse: [rate := bidRate getBidRate: aCurrency timestamp asDate]].	
	^Currency fromNumber: (self amount + (aCurrency amount * rate asNumber)
				roundTo: 0.01)
		as: self currencyType</body>

<body package="Assignment6" selector="=">= aCurrency

	^self amount = aCurrency amount</body>

<body package="Assignment6" selector="hash">hash
	" *** This method was defined by Magnitude as a subclass responsibility.
	Replace its body with a proper implementation. *** "

	self error: 'Subclass responsibility stub not reimplemented'</body>
</methods>

<methods>
<class-id>Currency</class-id> <category>accessing</category>

<body package="Assignment6" selector="timestamp">timestamp

	^timestamp</body>

<body package="Assignment6" selector="currencyType">currencyType

	^currencyType</body>
</methods>

<methods>
<class-id>Currency</class-id> <category>printing</category>

<body package="Assignment6" selector="printOn:">printOn: aStream

	| negativeBalance |
	amount &lt; 0.0
		ifTrue: 
			[negativeBalance := amount.
			negativeBalance := negativeBalance * -1.0.
			aStream
				nextPutAll: '-$';
				nextPutAll: negativeBalance printString;
				nextPutAll: ' ';
				nextPutAll: currencyType]
		ifFalse: 
			[aStream
				nextPutAll: '$';
				nextPutAll: amount printString;
				nextPutAll: ' ';
				nextPutAll: currencyType]</body>
</methods>

<methods>
<class-id>Currency</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="amount:and:">amount: aNumber and: type

	amount := aNumber roundTo: 0.01.
	currencyType := type</body>

<body package="Assignment6" selector="amount:and:at:">amount: aNumber and: type at: date

	amount := aNumber roundTo: 0.01.
	currencyType := type.
	timestamp := date</body>

<body package="Assignment6" selector="amount">amount

	^amount</body>

<body package="Assignment6" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="Assignment6" selector="initialize:and:">initialize: aNumber and: type
	"Initialize a newly created instance. This method must answer the receiver."

	amount := aNumber roundTo: 0.01.
	currencyType := type</body>

<body package="Assignment6" selector="currencyType:">currencyType: aCurrencyType

	currencyType := aCurrencyType</body>

<body package="Assignment6" selector="initialize:and:at:">initialize: aNumber and: type at: timeStamp
	"Initialize a newly created instance. This method must answer the receiver."

	amount := aNumber roundTo: 0.01.
	currencyType := type.
	timestamp := timeStamp</body>

<body package="Assignment6" selector="initialize:">initialize: aNumber
	"Initialize a newly created instance. This method must answer the receiver."

	amount := aNumber asNumber</body>
</methods>


<methods>
<class-id>BidRate class</class-id> <category>instance creation</category>

<body package="Assignment6" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="Assignment6" selector="getRateFor:and:">getRateFor: currencyType and: anObject

	^(super new initialize: currencyType and: anObject).</body>
</methods>


<methods>
<class-id>BankAccountTests</class-id> <category>initialize-release</category>

<body package="Assignment6" selector="tearDown">tearDown

	"self dataFiles do: 
			[:each |
			| file |
			file := each asFilename.
			file exists ifTrue: [file delete]]"</body>
</methods>

<methods>
<class-id>BankAccountTests</class-id> <category>tests</category>

<body package="Assignment6" selector="testPremiumCustomerWithdrawal">testPremiumCustomerWithdrawal

	| account amount1 amount2 amount3|
	account := BankAccount
				name: 'Rakshit Pithadia'
				type: 'Premium'
				accNum: '880644404212'
				currencyType: 'USD'.
	amount1 := Currency fromString: '$500.00 USD'.
	amount2 := Currency fromString: '$450.00 USD'.
	amount3 := Currency fromString: '$10000.00 USD'.
	account depositCash: amount1.
	account withdrawal: amount2.
	self assert: account balance = '$50.0 USD' asCurrency.
	account withdrawal: amount3.
	self assert: account balance = (-9950.0 asCurrency: 'USD').
	account withdrawal: amount3.
	self assert: account balance = (-19950.0 asCurrency: 'USD').</body>

<body package="Assignment6" selector="testNormalCustomerWithdrawal">testNormalCustomerWithdrawal

	| account amount1 amount2 amount3|
	account := BankAccount
				name: 'Rakshit Pithadia'
				type: 'Normal'
				accNum: '880644404212'
				currencyType: 'USD'.
	amount1 := Currency fromString: '$500.00 USD'.
	amount2 := Currency fromString: '$450.00 USD'.
	amount3 := Currency fromString: '$60.00 USD'.
	account depositCash: amount1.
	account withdrawal: amount2.
	self assert: account balance = '$50.0 USD' asCurrency.
	account withdrawal: amount3.
	self assert: account balance = '$45.0 USD' asCurrency</body>

<body package="Assignment6" selector="testGoldCustomerWithdrawal">testGoldCustomerWithdrawal

	| account amount1 amount2 amount3|
	account := BankAccount
				name: 'Rakshit Pithadia'
				type: 'Gold'
				accNum: '880644404212'
				currencyType: 'USD'.
	amount1 := Currency fromString: '$500.00 USD'.
	amount2 := Currency fromString: '$450.00 USD'.
	amount3 := Currency fromString: '$10000.00 USD'.
	account depositCash: amount1.
	account withdrawal: amount2.
	self assert: account balance = '$50.0 USD' asCurrency.
	account withdrawal: amount3.
	self assert: account balance = (-9950.0 asCurrency: 'USD')</body>

<body package="Assignment6" selector="testPreferredCustomerWithdrawal">testPreferredCustomerWithdrawal

	| account amount1 amount2 amount3|
	account := BankAccount
				name: 'Rakshit Pithadia'
				type: 'Preferred'
				accNum: '880644404212'
				currencyType: 'USD'.
	amount1 := Currency fromString: '$500.00 USD'.
	amount2 := Currency fromString: '$450.00 USD'.
	amount3 := Currency fromString: '$1000.00 USD'.
	account depositCash: amount1.
	account withdrawal: amount2.
	self assert: account balance = '$50.0 USD' asCurrency.
	account withdrawal: amount3.
	self assert: account balance = (-950.0 asCurrency: 'USD')</body>
</methods>

<methods>
<class-id>BankAccountTests</class-id> <category>private</category>

<body package="Assignment6" selector="today">today

	^Timestamp now</body>
</methods>



</st-source>
