# New ports collection makefile for:	poppler-gtk
# Date created:		21 Oct 2007
# Whom:			Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$

PORTREVISION=	0
PKGNAMESUFFIX=	-gtk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk bindings to poppler

MASTERDIR=	${.CURDIR}/../../graphics/poppler
SLAVEPORT=	gtk
PLIST=	${.CURDIR}/pkg-plist

pre-build:
	cd ${WRKSRC}/poppler && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		Makefile ${MAKE_ARGS} libpoppler-cairo.la

.include "${MASTERDIR}/Makefile"
