# $MidnightBSD$
# $FreeBSD: ports/net/libpcapnav/Makefile,v 1.11 2009/08/22 00:31:30 amdmi3 Exp $

PORTNAME=	libpcapnav
PORTVERSION=	0.8
CATEGORIES=	net
MASTER_SITES=	SF/netdude/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	libpcap wrapper library

LICENSE=	mit

USES=		libtool
CONFIGURE_ARGS=	--disable-gtk-doc --with-html-dir=${DOCSDIR}
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|DOC_MODULE = pcapnav|DOC_MODULE =|' \
	${WRKSRC}/docs/Makefile.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|docs||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
