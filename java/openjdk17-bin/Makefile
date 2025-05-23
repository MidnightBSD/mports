PORTNAME=	openjdk17-bin
PORTVERSION=	${VER}
PORTREVISION=	1
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 17 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk17-*

USES=		tar:xz xorg
USE_XORG=       x11 xext xi xrender xt xtst
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

LIB_DEPENDS=    libfontconfig.so:x11-fonts/fontconfig \
                libfreetype.so:print/freetype2 \
                libinotify.so:devel/libinotify \
		libharfbuzz.so:print/harfbuzz
RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
.if ${OSVERSION} >= 300000
VER=    17.0.5
DISTFILES=	openjdk17-17.0.5+8.1_1.pkg
FBSD_PATH=	FreeBSD:12:amd64
COMPONENT=.17
.else
IGNORE=	OS Not Supported
.endif
.else
VER=    17.0.4
DISTFILES=      openjdk17-17.0.4+8.1_1.pkg
FBSD_PATH=      FreeBSD:12:i386
COMPONENT=.17.${ARCH}
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk17 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk17/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
