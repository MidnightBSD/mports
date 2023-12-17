PORTNAME=	znc-clientbuffer
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.48
CATEGORIES=	irc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client specific buffers module for ZNC
WWW=		https://wiki.znc.in/Clientbuffer

LICENSE=	apache2

BUILD_DEPENDS=	znc:irc/znc
RUN_DEPENDS=	znc:irc/znc

USE_GITHUB=	yes
GH_ACCOUNT=	CyberShadow

ALL_TARGET=	clientbuffer.so

PLIST_FILES=	lib/znc/clientbuffer.so

PORTDOCS=		README.md

OPTIONS_DEFINE=	DOCS

do-install:
	${MKDIR} ${PREFIX}/lib/znc
	${INSTALL_PROGRAM} ${WRKSRC}/clientbuffer.so ${PREFIX}/lib/znc/clientbuffer.so

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md  ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
