# $MidnightBSD$

PORTNAME=	daq
PORTVERSION=	2.0.6
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	https://snort.org/downloads/snort/ \
		http://mirrors.rit.edu/zi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data Acquisition abstraction library for snort 2.9+

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdnet.so:${PORTSDIR}/net/libdnet \
		libpcap.so.1:${PORTSDIR}/net/libpcap
BUILD_DEPENDS=	flex:${PORTSDIR}/textproc/flex \
		${LOCALBASE}/lib/libpcap.so:${PORTSDIR}/net/libpcap

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		bison gmake libtool
USE_LDCONFIG=	yes
PLIST_SUB=	PORTVERSION="${PORTVERSION}"
MAKE_JOBS_UNSAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/*.so.* ${PREFIX}/lib/daq/*.so

.include <bsd.port.mk>
