PORTNAME=	wmget
PORTVERSION=	0.6.0
CATEGORIES=	ftp
MASTER_SITES=	http://amtrickey.net/download/ \
		FREEBSD_LOCAL/uqs
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dock app for Window Maker providing wget functionality
WWW=		https://web.archive.org/web/20160322141200/http://amtrickey.net/wmget/

LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		gmake xorg
USE_XORG=	x11 xpm
WRKSRC=		${WRKDIR}/${PORTNAME}

MAKE_ENV+=	${CONFIGURE_ENV}

PLIST_FILES=	bin/wmget \
		share/man/man1/wmget.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmget ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmget.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
