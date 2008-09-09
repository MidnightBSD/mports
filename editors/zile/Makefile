# New ports collection Makefile for:	zile
# Date created:		28 September 2000
# Whom:			jasone
#
# $FreeBSD: ports/editors/zile/Makefile,v 1.58 2008/05/16 14:10:54 miwi Exp $
# $MidnightBSD: mports/editors/zile/Makefile,v 1.1 2008/05/16 15:47:56 crash Exp $

PORTNAME=	zile
PORTVERSION=	2.2.61
CATEGORIES=	editors
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small emacs-like text editor
LICENSE=        gpl3
USE_GNOME=	gnometarget
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LIBS="-lgnuregex"
CONFIGURE_ARGS= --without-included-regex
MAN1=		zile.1
INFO=		zile
PLIST_FILES=	bin/zile %%DATADIR%%/AUTODOC %%DATADIR%%/FAQ %%DATADIR%%/HELP \
		%%DATADIR%%/TUTORIAL %%DATADIR%%/dotzile.sample
PLIST_DIRS=	%%DATADIR%%

.include <bsd.port.pre.mk>

.if ${OSVERSION} > 502010
GNU_REGEX_H=	gnu/regex.h
.else
GNU_REGEX_H=	gnuregex.h
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|<regex\.h>|<${GNU_REGEX_H}>|g ; \
		 s|-pedantic||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
	    's|"regex\.h"|<${GNU_REGEX_H}>|g' ${WRKSRC}/src/search.c
        @${REINPLACE_CMD} -e \
		's|: install-exec-local|:|g' ${WRKSRC}/lib/Makefile.in
	
.include <bsd.port.post.mk>
