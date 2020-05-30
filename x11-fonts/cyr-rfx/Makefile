# Created by: mi@aldan.algebra.com

PORTNAME=	cyr-rfx-${CYR_RFX_ENCODING}
PORTVERSION=	1.1
CATEGORIES=	x11-fonts ukrainian russian
MASTER_SITES=	http://www.inp.nsk.su/~bolkhov/files/fonts/cyr-rfx/srctgz/
EXTRACT_SUFX=	.bdfs.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cyrillic X11 bitmap fonts from CYR-RFX project

LICENSE=	unknown

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf \
		mkfontscale>=0:x11-fonts/mkfontscale

USES=		fonts xorg
USE_XORG=	x11

CYR_RFX_ENCODING?=	koi8-o

WRKSRC=		${WRKDIR}/${CYR_RFX_ENCODING}
MAKEFILE=	${FILESDIR}/Makefile.bdf2pcf
MAKE_ENV+=	INST_DIR="${FAKE_DESTDIR}${FONTSDIR}" MKDIR="${MKDIR}"

SUB_FILES=	pkg-message

.include <bsd.port.mk>
