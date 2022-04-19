# Created by: Alexander Nedotsukov <bland@FreeBSD.org>

PORTNAME=	nvidia-xconfig
PORTVERSION=	470.86
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	NVIDIA

MAKE_ENV=	NV_VERBOSE=1 \
		INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_MAN="${INSTALL_MAN}" \
		prefix=${TRUE_PREFIX}

PLIST_FILES=	bin/nvidia-xconfig \
		man/man1/nvidia-xconfig.1.gz

post-patch:	.SILENT
	${REINPLACE_CMD} -e '/^MANDIR/s|share/||' \
		${WRKSRC}/utils.mk

.include <bsd.port.mk>
