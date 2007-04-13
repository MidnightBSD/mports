# New ports collection makefile for:	qmake
# Date created:				2 September 2003
# Whom:					mi@aldan.algebra.com
#
# $FreeBSD: ports/devel/qmake/Makefile,v 1.17 2006/05/04 21:41:04 edwin Exp $
# $MidnightBSD: mports/devel/qmake/Makefile,v 1.1 2006/11/17 19:19:28 laffer1 Exp $
#

PORTNAME=	qmake
PORTVERSION=	3.3.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-free-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The build utility of the Qt project

REINPLACE_ARGS=	-i ""
WRKSRC=		${WRKDIR}/${DISTNAME}/qmake
MAKEFILE=	${FILESDIR}/Makefile.bsd
#MAKE_ARGS+=	-j2
PLIST_SUB+=	_PREFIX="${PREFIX}"
MAKE_ENV+=	FILESDIR="${FILESDIR}"

USE_BZIP2=	yes

EXTRACT_AFTER_ARGS=| ${TAR} -xf - \
	'${DISTNAME}/mkspecs' \
	'${DISTNAME}/src/*/*.h' '${DISTNAME}/qmake' \
	'${DISTNAME}/src/tools'

.if !defined(NOPORTDOCS)
EXTRACT_AFTER_ARGS+='${DISTNAME}/doc/html/qmake*'
DOCSDIR=${PREFIX}/share/doc/qt
PLIST_SUB+=	DOCSDIR='${DOCSDIR}'
post-install:
	${MKDIR} '${DOCSDIR}'
	${CP} -Rp '${WRKSRC:H}/doc/html' '${DOCSDIR}'
.endif

post-patch:
	@${RM} -fr ${WRKSRC}/examples ${WRKSRC}/tutorial
	@${REINPLACE_CMD} -e 's|-O2|${CXXFLAGS}|' \
		-e 's|gcc|${CC}|' \
		-e 's|g++|${CXX}|' \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${X11BASE}|' \
		-e 's|release|release thread|' \
		-e 's|-pthread -D_THREAD_SAFE|${PTHREAD_CFLAGS}|' \
		-e 's|-pthread|${PTHREAD_LIBS}|' \
		${WRKSRC}/../mkspecs/freebsd-g++/qmake.conf
	@${REINPLACE_CMD} -e 's|@QMAKE_QTOBJS@||g' ${WRKSRC}/Makefile.unix

do-configure:
	${SED} -e 's|/usr/local|${PREFIX}|g' \
		< ${FILESDIR}/qconfig.cpp \
		> ${WRKSRC:H}/src/tools/qconfig.cpp
	${ECHO} '/* empty */' > ${WRKSRC}/qconfig.h
	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/qmodules.h
	${LN} -s . ${WRKDIR}/${DISTNAME}/src/tools/private

.include <bsd.port.pre.mk>

.if ${ARCH} == "alpha"
CXXFLAGS+=	-mieee
.endif

.include <bsd.port.post.mk>
