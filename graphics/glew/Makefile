

PORTNAME=	glew
PORTVERSION=	2.2.0
PORTREVISION?=	0
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL Extension Wrangler Library

LICENSE=	mit bsd3
LICENSE_COMB=	dual

USES=		gmake gl tar:tgz xorg
USE_XORG?=	x11 xext xi xmu
USE_GL?=	gl glu
USE_LDCONFIG=	yes

MAKE_ENV=     GLEW_DEST=${PREFIX} GLEW_PREFIX=${PREFIX}
INSTALL_TARGET?=install.all

OPTIONS_DEFINE?=DOCS

post-patch:
	${CP} ${WRKSRC}/config/Makefile.freebsd ${WRKSRC}/config/Makefile.midnightbsd
	@${REINPLACE_CMD} -e 's|CFLAGS =|CFLAGS +=|' \
		-e 's|^LIBDIR|GLEW_LIBDIR|' \
		-e 's|$$(LIBDIR)|$$(GLEW_LIBDIR)|' \
		${WRKSRC}/Makefile

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in css html jpg png
	${INSTALL_DATA} ${WRKSRC}/doc/*.${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
