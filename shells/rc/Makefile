# $MidnightBSD$

PORTNAME=	rc
PORTVERSION=	1.7.1
PORTREVISION=	1
CATEGORIES=	shells plan9
MASTER_SITES=	ftp://rc.quanstro.net/pub/ \
		ftp://quenix2.dyndns.org/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UNIX incarnation of the plan9 shell

LICENSE=	other

USES=		tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-history


OPTIONS_DEFINE=	READLINE

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MREADLINE}
USES+=		readline
CONFIGURE_ARGS+=	--with-readline
.else
MAKE_ARGS+=	CFLAGS="$(CFLAGS) -static"
.endif

.include <bsd.port.mk>
