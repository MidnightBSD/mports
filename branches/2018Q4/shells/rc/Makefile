# $MidnightBSD$

PORTNAME=	rc
PORTVERSION=	1.7.1
PORTREVISION=	2
CATEGORIES=	shells plan9
MASTER_SITES=	ftp://rc.quanstro.net/pub/ \
		ftp://quenix2.dyndns.org/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix incarnation of the plan9 shell

LICENSE=	other

USES=		tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-history


OPTIONS_DEFINE=	READLINE

READLINE_USES=		readline
READLINE_CONFIGURE_WITH=--with-readline
READLINE_MAKE_ARGS_OFF=	CFLAGS="$(CFLAGS) -static"

.include <bsd.port.mk>
