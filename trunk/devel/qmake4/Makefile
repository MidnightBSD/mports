# $MidnightBSD: mports/devel/qmake4/Makefile,v 1.10 2010/01/10 00:28:12 laffer1 Exp $

PORTNAME=	qmake
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The build utility of the Qt project
LICENSE=	gpl3

EXTENSIONS=	qt
QT_NONSTANDARD=	yes
QT_DIST=	yes
REINPLACE_ARGS=	-i ""
WRKSRC=		${WRKDIR}/${DISTNAME}/qmake
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	FILESDIR="${FILESDIR}"

FAKE_OPTS=	trueprefix

MAKE_JOBS_SAFE=	yes
TODAY_CMD=	/bin/date +%Y-%m-%d

EXTRACT_AFTER_ARGS=| ${TAR} -xf - \
	'${DISTNAME}/mkspecs' \
	'${DISTNAME}/include/*/*' \
	'${DISTNAME}/src/*/*.h' \
	'${DISTNAME}/qmake' \
	'${DISTNAME}/src/corelib/tools' \
	'${DISTNAME}/src/corelib/io' \
	'${DISTNAME}/src/corelib/global' \
	'${DISTNAME}/src/corelib/plugin' \
	'${DISTNAME}/src/corelib/kernel' \
	'${DISTNAME}/src/corelib/codecs' \
	'${DISTNAME}/src/corelib/xml' \
	'${DISTNAME}/src/3rdparty/md4' \
	'${DISTNAME}/src/3rdparty/md5' \
	'${DISTNAME}/src/3rdparty/sha1' \
	'${DISTNAME}/tools/shared/symbian' \
	'${DISTNAME}/tools/shared/windows'

post-patch:
	@${REINPLACE_CMD} -e 's|-O2|${CXXFLAGS}|' \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${LOCALBASE}|' \
		-e 's|release|release thread|' \
		-e 's|-pthread -D_THREAD_SAFE|${PTHREAD_CFLAGS}|' \
		-e 's|-pthread|${PTHREAD_LIBS}|' \
		-e 's|uic|uic-qt4|' \
		-e 's|moc|moc-qt4|' \
		${WRKSRC}/../mkspecs/freebsd-*/qmake.conf
	@${REINPLACE_CMD} -e 's|@QMAKE_QTOBJS@||g' ${WRKSRC}/Makefile.unix
	# Add mkspecs for all the available compilers.
	@${CP} ${WRKSRC}/../mkspecs/common/g++.conf ${WRKSRC}/../mkspecs/common/clang.conf
	@${REINPLACE_CMD} -e 's|gcc|clang|g' -e 's|g++|clang++|g' \
		${WRKSRC}/../mkspecs/common/clang.conf
.for c in clang llvm
	@${CP} -PpR ${WRKSRC}/../mkspecs/freebsd-g++ ${WRKSRC}/../mkspecs/freebsd-${c}
	@${REINPLACE_CMD} -e 's|g++|${c}|g' \
		${WRKSRC}/../mkspecs/freebsd-${c}/qmake.conf
.endfor
.for v in 42 43 44 45 46
	@${CP} -PpR ${WRKSRC}/../mkspecs/freebsd-g++40 ${WRKSRC}/../mkspecs/freebsd-g++${v}
	@${REINPLACE_CMD} -e 's|40|${v}|g' \
		${WRKSRC}/../mkspecs/freebsd-g++${v}/qmake.conf
.endfor
	@${RM} -r ${WRKSRC}/../mkspecs/freebsd-g++40

do-configure:
	${SED} -e 's|/usr/local|${PREFIX}|g' \
		-e "s|TODAY|$$(${TODAY_CMD})|g" \
		< ${FILESDIR}/qconfig.cpp \
		> ${WRKSRC:H}/src/corelib/global/qconfig.cpp
	${ECHO} '/* empty */' > ${WRKSRC}/qconfig.h
#	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/../include/QtCore/qconfig.h
	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/../src/corelib/global/qconfig.h
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/qt4

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000 && ${ARCH} == "amd64"
CXXFLAGS+=	-fno-gcse
.endif

post-install:
	${LN} -sf ${PREFIX}/share/qt4/mkspecs/freebsd-${QMAKE_BASE_COMPILER} ${PREFIX}/share/qt4/mkspecs/default

.include <bsd.port.post.mk>
