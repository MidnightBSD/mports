# New ports collection Makefile for:	zile
# Date created:		28 September 2000
# Whom:			jasone
#
# $FreeBSD: ports/editors/zile/Makefile,v 1.58 2008/05/16 14:10:54 miwi Exp $
# $MidnightBSD: mports/editors/zile/Makefile,v 1.4 2009/05/27 16:55:54 crash Exp $

PORTNAME=	zile
PORTVERSION=	2.3.13
CATEGORIES=	editors
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small emacs-like text editor
LICENSE=        gpl3

USE_GMAKE=      yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS= --without-included-regex
MAN1=		zile.1
PLIST_FILES=	bin/zile %%DATADIR%%/FAQ %%DATADIR%%/dotzile.sample
PLIST_DIRS=	%%DATADIR%%

CPPFLAGS=	-isystem /usr/include/gnu
LDFLAGS=	-lgnuregex

post-patch:
	@${REINPLACE_CMD} -e \
		's|-pedantic||g' ${WRKSRC}/configure
        @${REINPLACE_CMD} -e \
		's|: install-exec-local|:|g' ${WRKSRC}/lib/Makefile.in


	
.include <bsd.port.mk>
