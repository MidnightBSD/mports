# $MidnightBSD: mports/shells/es/Makefile,v 1.2 2009/03/21 16:15:42 laffer1 Exp $

PORTNAME=	es
PORTVERSION=	0.9.b1
PORTREVISION=	5
CATEGORIES=	shells
MASTER_SITES=	ftp://ftp.sys.toronto.edu/pub/es/
DISTNAME=	es-0.9-beta1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An extensible shell, derived from plan9's rc
LICENSE=	other

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	es_cv_abused_getenv=no
CONFIGURE_ARGS= --with-readline
CFLAGS:=	${CFLAGS:N-O*}

ALL_TARGET=	es
MAN1=		es.1
PLIST_FILES=	bin/es

.include <bsd.port.mk>
