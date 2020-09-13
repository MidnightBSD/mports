PORTNAME=	libtasn1
PORTVERSION=	4.16.0
CATEGORIES=	security
MASTER_SITES=	GNU \
		GNUPG/gnutls/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library

LICENSE=	lgpl2.1 gpl3
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe pkgconfig pathfix gmake libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	DOCS

DOCS=		AUTHORS NEWS README.md THANKS doc/TODO \
		doc/libtasn1.html doc/libtasn1.pdf doc/libtasn1.ps
INFO=		libtasn1

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
