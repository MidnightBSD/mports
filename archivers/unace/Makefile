PORTNAME=	unace
PORTVERSION=	1.2b
PORTREVISION=	4
CATEGORIES=	archivers
MASTER_SITES=	SUNSITE/utils/compress

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extract, view & test ACE archives
WWW=		http://www.winace.com/

LICENSE=	unknown

MAKE_JOBS_UNSAFE=	yes
USES=		cpe gmake
CPE_VENDOR=	winace
ALL_TARGET=	clean unace
PLIST_FILES=	bin/unace

post-patch:
	@${REINPLACE_CMD} -e "s|CFLAGS =|CFLAGS ?=|" \
			-e "s|CC =|CC ?=|" \
			-e 's|gcc $$(CFLAGS)|$${CC} $$(CFLAGS)|' \
			${WRKSRC}/Makefile
	@${REINPLACE_CMD} 's|(CHAR \* s, thead \* head, INT nopath);|(CHAR \* s, thead \* head, INT nopath, unsigned int size);|' \
			${WRKSRC}/uac_crt.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unace ${TARGETDIR}/bin

.include <bsd.port.mk>
