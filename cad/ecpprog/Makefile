PORTNAME=	ecpprog
DISTVERSION=	g20200725
PORTREVISION=	1
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for FTDI based JTAG probes, to program ECP5 FPGAs
WWW=		https://github.com/gregdavill/ecpprog

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/../COPYING

LIB_DEPENDS=	libftdi1.so:devel/libftdi1

FAKE_OPTS=	trueprefix

USES=		gmake pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	gregdavill
GH_TAGNAME=	2b3e8eaba8faae5ae175ccec36b31e67d24244f7

WRKSRC_SUBDIR=	${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
