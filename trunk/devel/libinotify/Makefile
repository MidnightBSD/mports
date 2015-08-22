# $MidnightBSD$

PORTNAME=	libinotify
PORTVERSION=	20150516
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kevent based inotify compatible library

LICENSE=	mit

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	dmatveev
GH_PROJECT=	libinotify-kqueue
GH_COMMIT=	f4a092a
GH_TAGNAME=	${GH_COMMIT}

WRKSRC=		${WRKDIR}/libinotify-kqueue-${GH_COMMIT}

USE_LDCONFIG=	yes

post-patch:
	@${CP} ${FILESDIR}/Makefile ${WRKSRC}
	@${TOUCH} ${WRKSRC}/config.h
	@echo "#define HAVE_PTHREAD_BARRIER 1" >> ${WRKSRC}/config.h
	@echo "#define BUILD_LIBRARY 1" >> ${WRKSRC}/config.h
	@echo "#include <sys/tree.h>" >> ${WRKSRC}/config.h

.include <bsd.port.mk>
