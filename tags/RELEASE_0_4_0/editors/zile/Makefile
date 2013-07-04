# New ports collection Makefile for:	zile
# Date created:		28 September 2000
# Whom:			jasone
#
# $FreeBSD: ports/editors/zile/Makefile,v 1.58 2008/05/16 14:10:54 miwi Exp $
# $MidnightBSD: mports/editors/zile/Makefile,v 1.5 2010/04/27 13:08:11 laffer1 Exp $

PORTNAME=	zile
PORTVERSION=	2.4.9
CATEGORIES=	editors
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small emacs-like text editor
LICENSE=        gpl3

LIB_DEPENDS=	gc:${PORTSDIR}/devel/boehm-gc
BUILD_DEPENDS=	${LOCALBASE}/bin/help2man:${PORTSDIR}/misc/help2man

USE_GMAKE=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-included-regex

MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/${PORTNAME} \
		%%DOCSDIR%%/AUTHORS \
		%%DOCSDIR%%/FAQ \
		%%DOCSDIR%%/NEWS \
		%%DOCSDIR%%/dotzile.sample
PLIST_DIRS=	%%DOCSDIR%%

CPPFLAGS+=	-I${LOCALBASE}/include -isystem /usr/include/gnu
LDFLAGS+=	-L${LOCALBASE}/lib -lgnuregex

post-patch:
	@${REINPLACE_CMD} -e \
		'/need_charset_alias=/s|true|false|g' ${WRKSRC}/lib/Makefile.in
	@${REINPLACE_CMD} -e \
		's|@pkgdatadir@|${DOCSDIR}|' ${WRKSRC}/doc/man-extras

.include <bsd.port.mk>
