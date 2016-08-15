# $MidnightBSD$
# $FreeBSD: ports/audio/mikmod/Makefile,v 1.29 2011/01/25 08:39:24 ehaupt Exp $

PORTNAME=	mikmod
PORTVERSION=	3.2.6
CATEGORIES=	audio
MASTER_SITES=	SF \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mod player which plays MTM, STM, XM, MOD, S3M, ULT, UNI and IT mods

LICENSE=	gpl2

LIB_DEPENDS=	libmikmod.so:${PORTSDIR}/audio/libmikmod

USES=		gmake
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mikmod \
		man/man1/mikmod.1.gz \
		%%DATADIR%%/mikmodrc
PORTDOCS=	AUTHORS NEWS README

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
