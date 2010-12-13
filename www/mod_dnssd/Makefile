# $MidnightBSD: mports/www/mod_dnssd/Makefile,v 1.2 2010/10/19 20:09:54 laffer1 Exp $

PORTNAME=	mod_dnssd
PORTVERSION=	0.6
CATEGORIES=	www
MASTER_SITES=	http://0pointer.de/lennart/projects/mod_dnssd/
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Apache module that provides DNS-SD capabilities
LICENSE=	apache2

BROKEN=		possible to manual install, but broken on fake

LIB_DEPENDS=	avahi-client.3:${PORTSDIR}/net/avahi-app

MAKE_JOBS_SAFE=	yes

USE_GMAKE=	yes
USE_APACHE=	2.2+
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		APR_CFLAGS="`${LOCALBASE}/bin/apr-1-config --cflags --cppflags --includes`" \
		APR_LIBS="`${LOCALBASE}/bin/apr-1-config --ldflags`"
CONFIGURE_ARGS=	--disable-lynx

pre-install:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/${APACHEMODDIR}

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/README ${DOCSDIR}/README
.endif

.include <bsd.port.mk>
