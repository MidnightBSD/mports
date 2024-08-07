PORTNAME=	openjdk11-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 11 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk11-1.11*

USES=		tar:xz xorg
USE_XORG=       x11 xext xi xrender xt xtst
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

LIB_DEPENDS=    libfontconfig.so:x11-fonts/fontconfig \
                libfreetype.so:print/freetype2 \
                libinotify.so:devel/libinotify
RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>


.if ${OSVERSION} < 200000
IGNORE=	OS Not Supported
.endif

.if ${OSVERSION} > 300000
.if ${ARCH} == "amd64"
VER=	11.0.17
DISTFILES=	openjdk11-11.0.17+8.1_1~906dd87924.pkg
FBSD_PATH=	FreeBSD:12:amd64
COMPONENT=.12
.else
VER=	11.0.12
DISTFILES=      openjdk11-11.0.12+7.1.pkg
FBSD_PATH=      FreeBSD:11:i386
COMPONENT=.11.${ARCH}
.endif
.else
.if ${ARCH} == "amd64"
VER=	11.0.7
DISTFILES=	openjdk11-11.0.7+10.2_1.txz
FBSD_PATH=	FreeBSD:11:amd64
COMPONENT=.11
.else
VER=	11.0.12
DISTFILES=      openjdk11-11.0.12+7.1.pkg
FBSD_PATH=      FreeBSD:11:i386
COMPONENT=.11.${ARCH}
.endif
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk11 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk11/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
