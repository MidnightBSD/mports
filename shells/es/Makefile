# $MidnightBSD$

PORTNAME=	es
PORTVERSION=	0.9.b1
PORTREVISION=	6
CATEGORIES=	shells
MASTER_SITES=	ftp://ftp.sys.toronto.edu/pub/es/
DISTNAME=	es-0.9-beta1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensible shell, derived from plan9's rc

LICENSE=	other

USES=		readline

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	es_cv_abused_getenv=no
CONFIGURE_ARGS= --with-readline
CFLAGS:=	${CFLAGS:N-O*}
ALL_TARGET=	es

PLIST_FILES=	bin/es man/man1/es.1.gz

.include <bsd.port.mk>
