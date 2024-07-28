PORTNAME=	fribidi
DISTVERSION=	1.0.15
CATEGORIES=	converters
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/v${DISTVERSION}/

PATCH_SITES=	https://github.com/fribidi/fribidi/commit/
PATCHFILES=	3826589ea556da613bd42742a169789469e8b635.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Implementation of the Unicode Bidirectional Algorithm
WWW=		https://fribidi.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe meson tar:xz
USE_LDCONFIG=	yes
MESON_ARGS=	-Dtests=false
CPE_VENDOR=	gnu

post-patch:
	@${SED} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' < \
		${FILESDIR}/fribidi-config > ${WRKDIR}/fribidi-config

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/fribidi-config ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
