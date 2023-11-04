PORTNAME=	libpcap
PORTVERSION=	1.10.4
CATEGORIES=	net
MASTER_SITES=	http://www.tcpdump.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ubiquitous network traffic capture library
WWW=		https://www.tcpdump.org/

LICENSE=	bsd3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex

USES=		bison cpe gmake ssl

CPE_VENDOR=	tcpdump

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-dbus=no \
		--with-pcap=bpf
CONFIGURE_ENV+=	LEX=${LOCALBASE}/bin/flex
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
CFLAGS_amd64=	-fPIC
CFLAGS_sparc64=	-fPIC
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	IPV6 REMOTE

OPTIONS_SUB=	yes

REMOTE_DESC=	Remote packet capture

IPV6_CONFIGURE_ENABLE=	ipv6
REMOTE_CONFIGURE_ENABLE=remote

.include <bsd.port.mk>
