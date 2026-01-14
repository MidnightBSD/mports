PORTNAME=	openjdk24-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 24 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk24-*

USES=		tar:xz xorg
USE_XORG=       x11 xext xi xrender xt xtst
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

LIB_DEPENDS=    libfontconfig.so:x11-fonts/fontconfig \
                libfreetype.so:print/freetype2 \
                libinotify.so:devel/libinotify \
		libharfbuzz.so:print/harfbuzz \
		libpng16.so:graphics/png \
		libgif.so:graphics/giflib
RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

VER=    24.0.2
DISTFILES=	openjdk24-24.0.2+12.2_2.pkg
ARCH=	amd64

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk24 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk24/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
