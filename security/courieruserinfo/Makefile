PORTNAME=	courieruserinfo
PORTVERSION=	1.1.2
CATEGORIES=	security mail
MASTER_SITES=	http://www.arda.homeunix.net/software-downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User account information retrieval utility
WWW=		http://www.arda.homeunix.net/store/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	courierauthconfig:security/courier-authlib-base
RUN_DEPENDS=	courierauthconfig:security/courier-authlib-base

GNU_CONFIGURE=	yes
USES=		gmake localbase
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd12.4

PORTDOCS=	AUTHORS ChangeLog INSTALL NEWS README

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} '/chown root/d' ${WRKSRC}/Makefile.in

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
