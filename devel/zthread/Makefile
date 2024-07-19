PORTNAME=	zthread
PORTVERSION=	2.3.2
PORTREVISION=	6
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/ZThread/${PORTVERSION}
DISTNAME=	ZThread-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Platform-independent object-oriented C++ threading library
WWW=		https://zthread.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
USE_CXXSTD=	c++14
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-ftime --disable-static
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_SCRIPT}"
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO

OPTIONS_DEFINE=	DOCS

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type d -delete

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.orig' -or -name '*.swp' \) -delete
	@${REINPLACE_CMD} -E 's,(bin|data|inlude)dir\),DESTDIR)$$(&,' \
		${WRKSRC}/Makefile.in

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libZThread.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
