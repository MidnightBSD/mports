PORTNAME=	libtasn1
PORTVERSION=	4.18.0
CATEGORIES=	security
MASTER_SITES=	GNU \
		GNUPG/gnutls/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library

LICENSE=	lgpl2.1 gpl3
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe libtool pathfix pkgconfig
USE_CSTD=	c99
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	DOCS

NO_TEST=	yes

DOCS=		AUTHORS NEWS README.md THANKS doc/TODO
INFO=		libtasn1

DOCS_CONFIGURE_ENABLE=	gtk-doc
DOCS_BUILD_DEPENDS=	gtkdoc-check:textproc/gtk-doc

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
