PORTNAME=	libpcap
PORTVERSION=	1.11.0
CATEGORIES=	net
MASTER_SITES=	https://www.tcpdump.org/release/

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
PLIST_SUB+=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	REMOTE

OPTIONS_SUB=	yes

REMOTE_DESC=	Remote packet capture

REMOTE_CONFIGURE_ENABLE=remote

.include <bsd.port.mk>
