# Created by: Bruce M Simpson <bms@FreeBSD.org>

PORTNAME=	libpcap
PORTVERSION=	1.9.1
CATEGORIES=	net
MASTER_SITES=	http://www.tcpdump.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ubiquitous network traffic capture library

LICENSE=	bsd3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex

USES=		bison gmake

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=--enable-dbus=no \
		--with-pcap=bpf
CONFIGURE_ENV+=	LEX=${LOCALBASE}/bin/flex
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
CFLAGS_amd64=	-fPIC
CFLAGS_sparc64=	-fPIC
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	IPV6

IPV6_CONFIGURE_ENABLE=	ipv6

.include <bsd.port.mk>
