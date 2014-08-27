# $MidnightBSD$

PORTNAME=	qmake
PORTVERSION=	3.3.8
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_QT}
MASTER_SITE_SUBDIR=	archive/qt/${PORTVERSION:R:R}
DISTNAME=	qt-x11-free-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The build utility of the Qt project

LICENSE=        gpl2

FAKE_OPTS=	trueprefix

REINPLACE_ARGS=	-i ""
WRKSRC=		${WRKDIR}/${DISTNAME}/qmake
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_JOBS_SAFE=	yes
PLIST_SUB+=	_PREFIX="${PREFIX}"
MAKE_ENV+=	FILESDIR="${FILESDIR}"

USES=		tar:bzip2 uidfix

EXTRACT_AFTER_ARGS= \
	'${DISTNAME}/mkspecs' \
	'${DISTNAME}/src/*/*.h' '${DISTNAME}/qmake' \
	'${DISTNAME}/src/tools'

.if !defined(NOPORTDOCS)
EXTRACT_AFTER_ARGS+='${DISTNAME}/doc/html/qmake*'
DOCSDIR=share/doc/qt
PLIST_SUB+=	DOCSDIR='${DOCSDIR}'
post-install:
	${MKDIR} '${PREFIX}/${DOCSDIR}'
	${CP} -Rp '${WRKSRC:H}/doc/html' '${PREFIX}/${DOCSDIR}'
.endif

post-patch:
	@${RM} -fr ${WRKSRC}/examples ${WRKSRC}/tutorial
	@${REINPLACE_CMD} -e 's|-O2|${CXXFLAGS}|' \
		-e 's|gcc|${CC}|' \
		-e 's|g++|${CXX}|' \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${LOCALBASE}|' \
		-e 's|release|release thread|' \
		${WRKSRC}/../mkspecs/freebsd-g++/qmake.conf
	@${REINPLACE_CMD} -e 's|@QMAKE_QTOBJS@||g' ${WRKSRC}/Makefile.unix

do-configure:
	${SED} -e 's|/usr/local|${PREFIX}|g' \
		< ${FILESDIR}/qconfig.cpp \
		> ${WRKSRC:H}/src/tools/qconfig.cpp
	${ECHO} '/* empty */' > ${WRKSRC}/qconfig.h
	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/qmodules.h
	${LN} -s . ${WRKDIR}/${DISTNAME}/src/tools/private

.include <bsd.port.mk>
