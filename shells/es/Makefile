PORTNAME=	es
PORTVERSION=	0.9.2
CATEGORIES=	shells
MASTER_SITES=	https://github.com/wryun/es-shell/releases/download/v0.9.2/
DISTNAME=	es-0.9.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensible shell, derived from plan9's rc
WWW=		http://wryun.github.io/es-shell/

LICENSE=	other

USES=		readline

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	es_cv_abused_getenv=no
CONFIGURE_ARGS= --with-readline
CFLAGS:=	${CFLAGS:N-O*}
ALL_TARGET=	es

NO_WRKSUBDIR=	yes

.include <bsd.port.mk>
