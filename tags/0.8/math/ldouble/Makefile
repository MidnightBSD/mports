# $MidnightBSD$
# $FreeBSD: ports/math/ldouble/Makefile,v 1.12 2008/04/19 17:51:56 miwi Exp $

PORTNAME=	ldouble
PORTVERSION=	0.1
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
#	http://www.moshier.net/
MASTER_SITE_SUBDIR=	ahze
DISTFILES=	${LDOUBLE_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Long double math precision functions

LICENSE=	unknown

NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386

PLIST_FILES=	lib/libml.a \
		lib/libml.so \
		lib/libml.so.0

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${ARCH}=="i386"
LDOUBLE_DISTFILE=	ldouble.zip
USES+=		zip
EXTRA_PATCHES=	${FILESDIR}/i386-makefile-patch
PORTDOCS=	ldoubdoc.html
PLIST_FILES+=	include/mathl.h
.else
LDOUBLE_DISTFILE=	128bit.tgz
EXTRA_PATCHES=	${FILESDIR}/128-makefile-patch
PORTDOCS=	128bdoc.html
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-msoft-quad-float||' \
		${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e 's|%%CC%%|${CC}|; s|%%CFLAGS%%|${CFLAGS}|' \
		${WRKSRC}/${MAKEFILE}

do-install:
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
	${INSTALL_DATA} ${WRKSRC}/libml.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/libml.so.0 ${PREFIX}/lib
	${LN} -sf libml.so.0 ${PREFIX}/lib/libml.so
	${STRIP_CMD} ${PREFIX}/lib/libml.so
.if ${ARCH}=="i386"
	${INSTALL_DATA} ${WRKSRC}/protos.h ${PREFIX}/include/mathl.h
.endif

.include <bsd.port.post.mk>
