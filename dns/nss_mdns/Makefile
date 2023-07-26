PORTNAME=	nss_mdns
PORTVERSION=	0.14.1.20200624
CATEGORIES=	dns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NSS module implementing multicast DNS name resolution
WWW=		https://github.com/lathiat/nss-mdns

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libavahi-client.so:net/avahi-app

USES=		autoreconf gmake libtool pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	lathiat
GH_PROJECT=	nss-mdns
GH_TAGNAME=	99c2f1c
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var \
		--sysconfdir=/etc

INSTALL_TARGET=	install-strip

CONFLICTS_INSTALL=	mDNSResponder_nss-[0-9]*

# TODO: Print a message about the etc directory used for mdns.allow
# being relative to ${PREFIX}.
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

INSTALLED_MODULES=	nss_mdns nss_mdns_minimal \
			nss_mdns4 nss_mdns4_minimal \
			nss_mdns6 nss_mdns6_minimal

post-install:
.for INSTALLED_MODULE in ${INSTALLED_MODULES}
	${LN} -sf lib${INSTALLED_MODULE}.so.2 ${PREFIX}/lib/${INSTALLED_MODULE}.so
.endfor

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${INSTALL_WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
