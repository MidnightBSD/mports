PORTNAME=	spawn-fcgi
PORTVERSION=	1.6.4
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spawns fastcgi applications
WWW=		http://redmine.lighttpd.net/projects/spawn-fcgi

LICENSE=	bsd3

USES=		cmake
CMAKE_ARGS=	-DCMAKE_MAN_DIR:string=${PREFIX}/share/man
USE_RC_SUBR=	spawn-fcgi

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_FILES=	bin/spawn-fcgi \
		share/man/man1/spawn-fcgi.1.gz

.include <bsd.port.pre.mk>

SUB_LIST+=	REQUIRE="DAEMON"

.include <bsd.port.post.mk>
