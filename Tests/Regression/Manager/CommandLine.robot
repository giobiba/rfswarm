*** Settings ***
Library 	OperatingSystem

Suite Setup			Clean Up Old Files

*** Test Cases ***
Clean Up Old Files
	# cleanup previous output
	Log To Console    ${OUTPUT DIR}
	Remove File    ${OUTPUT DIR}${/}*.txt
	Remove File    ${OUTPUT DIR}${/}sikuli_captured${/}*.*

Random Offset
	[Documentation] 	This just prevents all the test runners doing git push at the same time
	${random} =	Evaluate	random.randint(0, 60)
	Sleep    ${random}

Manager Version
	[Tags]	ubuntu-latest 	macos-latest 	windows-latest
	${result}= 	Run 	python3 ${EXECDIR}${/}rfswarm_manager${/}rfswarm.py -v
	Log to console 	${\n}${result}
	Should Contain	${result}	Version
	Should Contain	${result}	Manager

Manager Help
	[Tags]	ubuntu-latest 	macos-latest 	windows-latest
	${result}=	Run 	python3 ${EXECDIR}${/}rfswarm_manager${/}rfswarm.py -h
	Log to console 	${\n}${result}
	Should Contain	${result}	IPADDRESS
