PORTNAME=	u-boot-tools
DISTVERSION=	2020.07
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.denx.de/pub/u-boot/
DISTNAME=	u-boot-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	U-boot related tools
WWW=		https://www.denx.de/wiki/U-Boot

LICENSE=	gpl2

BROKEN_SSL=	libressl
BROKEN_SSL_REASON_libressl=	not supported by the upstream

USES=		bison compiler:c11 gmake python:build ssl tar:bzip2

CONFLICTS_BUILD=	v4l_compat sdl2

CONFLICTS=	uboot-mkimage
ALL_TARGET=	tools-only
MAKE_ARGS=	ARCH=sandbox \
		CC="${CC}" \
		HOSTCC="${CC}" \
		KBUILD_VERBOSE=1 \
		NOSTDINC_FLAGS="" \
		HOSTCFLAGS="${CFLAGS} -I${OPENSSLINC}" \
		HOSTLDFLAGS="${LDFLAGS} -L${OPENSSLLIB}"

PLIST_FILES=	bin/mkimage bin/mkenvimage bin/dumpimage bin/fit_info

do-configure:
	(cd ${WRKSRC}/ && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} tools-only_defconfig)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tools/dumpimage ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tools/fit_info ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tools/mkenvimage ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/tools/mkimage ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
