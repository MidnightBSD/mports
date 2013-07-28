# $MidnightBSD: mports/shells/rc/Makefile,v 1.2 2009/03/21 16:17:17 laffer1 Exp $

PORTNAME=	rc
PORTVERSION=	1.7.1
CATEGORIES=	shells plan9
MASTER_SITES=	ftp://rc.quanstro.net/pub/ \
		ftp://quenix2.dyndns.org/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A unix incarnation of the plan9 shell
LICENSE=	other

USE_BZIP2=	YES
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-history
MAN1=		history.1 rc.1


OPTIONS_DEFINE=	READLINE

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MREADLINE}
USES+=		readline
CONFIGURE_ARGS+=	--with-readline
.else
MAKE_ARGS+=	CFLAGS="$(CFLAGS) -static"
.endif

.include <bsd.port.mk>
