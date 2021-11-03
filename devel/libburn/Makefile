

PORTNAME=	libburn
PORTVERSION=	1.5.4
CATEGORIES=	devel
MASTER_SITES=	http://files.libburnia-project.org/releases/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Libburnia library to read/write optical discs

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	LIBS="-lcam" --program-prefix=""
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PORTDOCS=	*.txt

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
