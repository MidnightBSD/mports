# $MidnightBSD: mports/devel/libdbusmenu-qt/Makefile,v 1.1 2011/07/31 16:55:30 laffer1 Exp $

PORTNAME=	libdbusmenu-qt
PORTVERSION=	0.9.2
CATEGORIES=	devel
MASTER_SITES=	http://launchpad.net/${PORTNAME}/trunk/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt4 implementation of the DBusMenu protocol
LICENSE=	lgpl

USE_QT4=	corelib dbus gui \
		moc_build qmake_build rcc_build uic_build
FETCH_ARGS=	-Fpr
USE_BZIP2=	yes
USES=		cmake:outsource
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	GENDOCS
GENDOCS_DESC=	Build documentation (requires doxygen)
.if defined(PACKAGE_BUILDING)
OPTIONS_DEFAULT+=	GENDOCS
.endif

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGENDOCS}
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
CMAKE_ARGS+=	-DDOC_INSTALL_DIR:PATH="${DOCSDIR_REL}"
PLIST_SUB+=	GENDOCS=""
.else
CMAKE_ARGS+=	-DWITH_DOC:BOOL=OFF
PLIST_SUB+=	GENDOCS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/pkgconfig/ s/$${LIB_SUFFIX}/data/' \
		-e '/tests/ d' -e '/tools/ d' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
