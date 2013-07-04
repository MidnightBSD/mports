# $MidnightBSD: mports/archivers/gzip/Makefile,v 1.6 2010/09/12 22:42:48 laffer1 Exp $

PORTNAME=	gzip
PORTVERSION=	1.4
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A compression utility designed to be a replacement for compress
LICENSE=	gpl3

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS+=	--infodir=${LOCALBASE}/info \
		--mandir=${MANPREFIX}/man

MAN1=	gunzip.1 gzexe.1 gzip.1 zcat.1 zcmp.1 zdiff.1 zforce.1 \
	zgrep.1 zless.1 zmore.1 znew.1
INFO=	gzip

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
