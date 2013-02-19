# $MidnightBSD: mports/www/spawn-fcgi/Makefile,v 1.1 2009/10/13 01:27:24 laffer1 Exp $

PORTNAME=	spawn-fcgi
PORTVERSION=	1.6.3
CATEGORIES=	www
MASTER_SITES=	http://www.lighttpd.net/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	spawn-fcgi is used to spawn fastcgi applications
LICENSE=	bsd3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_RC_SUBR=	spawn-fcgi

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		spawn-fcgi.1

PLIST_FILES=	bin/spawn-fcgi

.include <bsd.port.pre.mk>

SUB_LIST+=	REQUIRE="DAEMON"

.include <bsd.port.post.mk>
