PORTNAME=	nvidia-xconfig
PORTVERSION=	525.116.04
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to manipulate X configuration files for the NVidia driver
WWW=		https://www.nvidia.com/object/unix.html

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

LIB_DEPENDS=	libpciaccess.so:devel/libpciaccess

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	NVIDIA

MAKE_ENV=	NV_VERBOSE=1 \
		PCIACCESS_CFLAGS=-I${LOCALBASE}/include \
		PCIACCESS_LDFLAGS=-L${LOCALBASE}/lib \
		INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_MAN="${INSTALL_MAN}" \
		prefix=${TRUE_PREFIX}

PLIST_FILES=	bin/nvidia-xconfig \
		share/man/man1/nvidia-xconfig.1.gz

.include <bsd.port.mk>
