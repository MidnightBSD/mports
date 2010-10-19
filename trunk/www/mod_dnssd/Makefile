# $MidnightBSD: mports/www/mod_dnssd/Makefile,v 1.1 2010/09/06 20:03:57 laffer1 Exp $

PORTNAME=	mod_dnssd
PORTVERSION=	0.6
CATEGORIES=	www
MASTER_SITES=	http://0pointer.de/lennart/projects/mod_dnssd/
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Apache module that provides DNS-SD capabilities
LICENSE=	apache2

LIB_DEPENDS=	avahi-client.3:${PORTSDIR}/net/avahi-app

MAKE_JOBS_SAFE=	yes

FAKE_MAKEOPTS=	prefixhack
USE_GMAKE=	yes
USE_APACHE=	2.2+
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		APR_CFLAGS="`${LOCALBASE}/bin/apr-1-config --cflags --cppflags --includes`" \
		APR_LIBS="`${LOCALBASE}/bin/apr-1-config --ldflags`"
CONFIGURE_ARGS=	--disable-lynx

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/README ${DOCSDIR}/README
.endif

.include <bsd.port.mk>
