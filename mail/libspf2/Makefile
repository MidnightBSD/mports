PORTNAME=	libspf2
PORTVERSION=	1.2.11
PORTREVISION=	2
CATEGORIES=	mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Policy Framework 2 C Implementation
WWW=		https://www.libspf2.org/ \
		https://github.com/shevek/libspf2

LICENSE=	bsd2 lgpl2.1 lgpl3
LICENSE_COMB=	dual

USES=		autoreconf cpe libtool

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	shevek
GH_TAGNAME=	d14abff

post-patch:
	@${REINPLACE_CMD} -e '/__VA_ARGS__/ s|format, ||g' ${WRKSRC}/src/include/spf_log.h

.include <bsd.port.mk>
