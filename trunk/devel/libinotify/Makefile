# $MidnightBSD$

PORTNAME=	libinotify
PORTVERSION=	20140622
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kevent based inotify compatible library

LICENSE=	mit

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	dmatveev
GH_PROJECT=	libinotify-kqueue
GH_COMMIT=	d775062
GH_TAGNAME=	${GH_COMMIT}

WRKSRC=		${WRKDIR}/libinotify-kqueue-d775062

USE_LDCONFIG=	yes

post-patch:
	@${CP} ${FILESDIR}/Makefile ${WRKSRC}
	@${TOUCH} ${WRKSRC}/config.h

.include <bsd.port.mk>
