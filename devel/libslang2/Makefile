# New ports collection makefile for:	libslang2
# Date created:		2005-05-16
# Whom:			Renato Botelho <freebsd@galle.com.br>
#
# $FreeBSD: ports/devel/libslang2/Makefile,v 1.20 2008/05/19 20:14:18 garga Exp $
# $MidnightBSD: mports/devel/libslang2/Makefile,v 1.4 2010/05/04 22:44:59 laffer1 Exp $

PORTNAME=	libslang2
PORTVERSION=	2.1.4
CATEGORIES=	devel
MASTER_SITES=	ftp://space.mit.edu/pub/davis/slang/v${PORTVERSION:R}/ \
		ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v${PORTVERSION:R}/ \
		ftp://ftp.ntua.gr/pub/lang/slang/slang/v${PORTVERSION:R}/ \
		ftp://ftp.plig.org/pub/slang/v${PORTVERSION:R}/
DISTNAME=	slang-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines for rapid alpha-numeric terminal applications development
LICENSE=        gpl2     

USE_BZIP2=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

CONFLICTS=	libslang-[0-9]* libslang-1.*.j[0-9]

ALL_TARGET=	all static
INSTALL_TARGET=	install install-static

MAN1=		slsh.1
DOCSDIR=	${PREFIX}/share/doc/slang
DATADIR=	${PREFIX}/share/slsh

OPTIONS=	PCRE	"Include pcre support" on \
		PNG	"Include png support"  on \
		ICONV	"Include iconv support" on \
		ONIG	"Include Oniguruma support" off

PORTDOCS=	*


.include <bsd.port.pre.mk>

PLIST_SUB+=	VERSION=${PORTVERSION}

.if !defined(WITHOUT_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
PLIST_SUB+=	PCRE=""
.else
CONFIGURE_ARGS+=	--without-pcre
PLIST_SUB+=	PCRE="@comment "
.endif

.if !defined(WITHOUT_PNG)
LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png
PLIST_SUB+=	PNG=""
.else
CONFIGURE_ARGS+=	--without-png
PLIST_SUB+=	PNG="@comment "
.endif

.if !defined(WITHOUT_ICONV)
USE_ICONV=	yes
PLIST_SUB+=	ICONV=""
.else
CONFIGURE_ARGS+=	--without-iconv
PLIST_SUB+=	ICONV="@comment "
.endif

.if defined(WITH_ONIG)
LIB_DEPENDS+=	onig.1:${PORTSDIR}/devel/oniguruma4
PLIST_SUB+=	ONIG=""
.else
CONFIGURE_ARGS+=	--without-onig
PLIST_SUB+=	ONIG="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -E 's,doc/slsh,doc/slang/v\@slang_major_version\@,' \
		${WRKSRC}/slsh/Makefile.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's, install[_-]docs,,g; /MKINSDIR.*DEST_SLSH_DOC_DIR/d' \
		${WRKSRC}/src/Makefile.in \
		${WRKSRC}/slsh/Makefile.in
.endif

.include <bsd.port.post.mk>
