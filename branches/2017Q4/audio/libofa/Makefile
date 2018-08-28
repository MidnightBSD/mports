# $MidnightBSD$

PORTNAME=	libofa
PORTVERSION=	0.9.3
PORTREVISION=	7
CATEGORIES=	audio
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Fingerprint Architecture Library

LICENSE=		APL1 gpl2
LICENSE_COMB=		dual
LICENSE_GROUPS_APL1=	OSI
LICENSE_NAME_APL1=	Adaptive Public License version 1.0
LICENSE_FILE_APL1=	${WRKSRC}/COPYING
LICENSE_PERMS_APL1=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LIB_DEPENDS=	libfftw3.so:${PORTSDIR}/math/fftw3 \
		libexpat.so:${PORTSDIR}/textproc/expat2 \
		libcurl.so:${PORTSDIR}/ftp/curl

PROJECTHOST=	musicip-libofa
USES=		dos2unix libtool pathfix
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

pre-patch: dos2unix

.include <bsd.port.mk>
