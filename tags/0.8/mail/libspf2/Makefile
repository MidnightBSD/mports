# $MidnightBSD$

PORTNAME=	libspf2
PORTVERSION=	1.2.10
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.libspf2.org/spf/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Rewriting Scheme 2 C Implementation

LICENSE=	bsd2 lgpl2.1 lgpl3
LICENSE_COMB=	dual

CONFLICTS=	${PORTNAME}-1.0.* p5-Mail-SPF-Query-[0-9]*

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		libtool
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/__VA_ARGS__/ s|format, ||g' ${WRKSRC}/src/include/spf_log.h

.include <bsd.port.mk>
