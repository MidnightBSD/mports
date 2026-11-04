PORTNAME=	xbrightness
PORTVERSION=	0.3
CATEGORIES=	x11
MASTER_SITES=	http://disjunkt.com/xbrightness/ ftp://ftp.motoom.net/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Brightness and gamma correction through the X server
WWW=		http://disjunkt.com/xbrightness/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USE_XORG=	x11 xxf86vm ice xmu xt xaw
USES=		imake xorg

PLIST_FILES=	bin/xbrightness share/man/man1/xbrightness.1.gz

.include <bsd.port.mk>
