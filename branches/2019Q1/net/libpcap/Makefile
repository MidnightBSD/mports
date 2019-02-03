# $MidnightBSD$

PORTNAME=	libpcap
PORTVERSION=	1.9.0
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.tcpdump.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ubiquitous network traffic capture library

LICENSE=	bsd3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex

GNU_CONFIGURE=	yes
USES=		bison gmake
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=--enable-dbus=no \
		--with-pcap=bpf
CONFIGURE_ENV+=	LEX=${LOCALBASE}/bin/flex
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
CFLAGS_amd64=	-fPIC
CFLAGS_sparc64=	-fPIC
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	DAG IPV6

DAG_DESC=	Support for Endace DAG hardware

IPV6_CONFIGURE_ENABLE=	ipv6
DAG_CONFIGURE_WITH=	dag
DAG_CFLAGS=		-I${LOCALBASE}/include
DAG_LDFLAGS=		-L${LOCALBASE}/lib
DAG_EXTRA_PATCHES=	${FILESDIR}/dag-patch-pcap-dag.c

post-install:
	-${MKDIR} ${PREFIX}/libdata/pkgconfig
	-${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
