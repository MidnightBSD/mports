PORTNAME=	libdvdcss
DISTVERSION=	1.4.3
CATEGORIES=	multimedia
MASTER_SITES=	https://download.videolan.org/pub/${PORTNAME}/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable abstraction library for DVD decryption

LICENSE=	gpl2 DMCA
LICENSE_COMB=	multi
LICENSE_NAME_DMCA=	DMCA
LICENSE_TEXT_DMCA=	CSS code may violate the DMCA
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_PERMS_DMCA=	auto-accept

RESTRICTED=   CSS code may violate the DMCA

USES=		libtool pathfix tar:bzip2

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PORTDOCS=	*

OPTIONS_DEFINE=	DOXYGEN DOCS

DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen
DOXYGEN_CONFIGURE_ENABLE=	doc
DOXYGEN_USES=		gmake

post-install-DOXYGEN-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${INSTALL_WRKSRC}/doc/html/* ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
