# $MidnightBSD$

PORTNAME=	dconf
PORTREVISION=	0
PKGNAMESUFFIX=	-editor

COMMENT=	configuration editor for dconf

DCONF_SLAVE=	editor

MASTERDIR=	${.CURDIR}/../dconf

PLIST=		${.CURDIR}/pkg-plist

BUILD_WRKSRC=	${WRKSRC}/editor
INSTALL_WRKSRC=	${WRKSRC}/editor

.include "${MASTERDIR}/Makefile"
