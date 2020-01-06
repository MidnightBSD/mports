PORTNAME=	tshark
CATEGORIES=	net

CONFLICTS_INSTALL?=	tshark-lite-[0-9]* wireshark-lite-[0-9]* wireshark-[0-9]*

MASTERDIR=	${.CURDIR}/../wireshark

BUILD_DEPENDS+=	python2.7:lang/python27

OPTIONS_EXCLUDE=	GUI

.include "${MASTERDIR}/Makefile"
