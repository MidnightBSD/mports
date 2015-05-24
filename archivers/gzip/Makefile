# $MidnightBSD$

PORTNAME=	gzip
PORTVERSION=	1.6
CATEGORIES=	archivers
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compression utility designed to be a replacement for compress

LICENSE=	gpl3

USES=		cpe charsetfix makeinfo

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS+=	--infodir=${LOCALBASE}/info \
		--mandir=${MANPREFIX}/man

INFO=		gzip
CPE_VENDOR=	gnu

DOC_FILES=	AUTHORS COPYING ChangeLog ChangeLog-2007 INSTALL NEWS README \
		THANKS TODO

OPTIONS=	RSYNCABLE	"Include --rsyncable patch"	OFF

.include <bsd.port.pre.mk>

.if defined(WITH_RSYNCABLE)
EXTRA_PATCHES=	${FILESDIR}/extra-patch-gzip-rsyncable.diff
.endif

post-configure:
	@${REINPLACE_CMD} -e 's|^SHELL =.*|SHELL=/bin/sh|' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|need_charset_alias=true|need_charset_alias=false|g' \
		${WRKSRC}/lib/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
