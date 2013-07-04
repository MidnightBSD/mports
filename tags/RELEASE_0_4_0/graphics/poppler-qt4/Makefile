# $MidnightBSD: mports/graphics/poppler-qt4/Makefile,v 1.2 2009/04/08 20:57:45 laffer1 Exp $

PORTREVISION=	0
PKGNAMESUFFIX=	-qt4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt4 bindings to poppler
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../../graphics/poppler
SLAVEPORT=	qt4
PLIST=		${.CURDIR}/pkg-plist

pre-build:
	cd ${WRKSRC}/poppler && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		Makefile ${MAKE_ARGS} ${FAKE_MAKEARGS} libpoppler-arthur.la

.include "${MASTERDIR}/Makefile"
