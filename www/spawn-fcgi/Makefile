# $MidnightBSD$

PORTNAME=	spawn-fcgi
PORTVERSION=	1.6.3
PORTREVISION=	1
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

PLIST_FILES=	bin/spawn-fcgi \
		man/man1/spawn-fcgi.1.gz

.include <bsd.port.pre.mk>

SUB_LIST+=	REQUIRE="DAEMON"

.include <bsd.port.post.mk>
