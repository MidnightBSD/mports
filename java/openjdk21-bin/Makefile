PORTNAME=	openjdk21-bin
PORTVERSION=	${VER}
PORTREVISION=	0
CATEGORIES=	java
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/openjdk/${ARCH}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 21 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk21-*

USES=		tar:xz xorg
USE_XORG=       x11 xext xi xrender xt xtst
NO_BUILD=	yes

DISTINFO_FILE=  ${.CURDIR}/distinfo.${ARCH}

LIB_DEPENDS=    libfontconfig.so:x11-fonts/fontconfig \
                libfreetype.so:print/freetype2 \
                libinotify.so:devel/libinotify \
		libharfbuzz.so:print/harfbuzz \
		libpng16.so:graphics/png
RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

PLIST=          ${PKGDIR}/pkg-plist${COMPONENT}

.include <bsd.port.pre.mk>

VER=    21.0.8
DISTFILES=	openjdk21-21.0.8+9.1_1.pkg

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk21 ${FAKE_DESTDIR}/${LOCALBASE}/
	cd ${PREFIX}/openjdk21/include && ${LN} -sf freebsd midnightbsd

.include <bsd.port.post.mk>
