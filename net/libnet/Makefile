PORTNAME=	libnet
PORTVERSION=	1.3
PORTEPOCH=	1
CATEGORIES=	net
MASTER_SITES=	https://github.com/libnet/libnet/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for creating IP packets
WWW=		https://github.com/libnet/libnet

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe libtool pathfix

CONFIGURE_ARGS=	--disable-doxygen-doc \
		--disable-doxygen-dot \
		--disable-doxygen-html \
		--disable-doxygen-man
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

CPE_VENDOR=	libnet_project

OPTIONS_DEFINE=	BPF DOCS EXAMPLES
OPTIONS_DEFAULT=BPF
BPF_DESC=	link layer bpf

BPF_CONFIGURE_OFF=	--with-link-layer=none
BPF_CONFIGURE_ON=	--with-link-layer=bpf

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/sample/*.c ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
