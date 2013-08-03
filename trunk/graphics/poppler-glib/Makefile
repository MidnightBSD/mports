# $MidnightBSD: mports/graphics/poppler-glib/Makefile,v 1.1 2012/02/24 18:45:39 laffer1 Exp $

PORTREVISION=	0
PKGNAMESUFFIX=	-glib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Glib bindings to poppler

MASTERDIR=	${.CURDIR}/../../graphics/poppler
SLAVEPORT=	glib
PLIST=	${.CURDIR}/pkg-plist
MAKE_ENV+=	GI_SCANNER_DISABLE_CACHE=yes

pre-build:
	@cd ${WRKSRC}/poppler && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		Makefile ${MAKE_ARGS} libpoppler-cairo.la

.include "${MASTERDIR}/Makefile"
