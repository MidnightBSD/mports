# $MidnightBSD$

PORTNAME=	gzip
PORTVERSION=	1.8
CATEGORIES=	archivers
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compression utility designed to be a replacement for compress

LICENSE=	gpl3

USES=		cpe charsetfix makeinfo

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd9.1
CONFIGURE_ARGS+=	--infodir=${LOCALBASE}/info \
		--mandir=${MANPREFIX}/man

INFO=		gzip
CPE_VENDOR=	gnu

DOC_FILES=	AUTHORS COPYING ChangeLog ChangeLog-2007 INSTALL NEWS README \
		THANKS TODO

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOC_FILES} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
