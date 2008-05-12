# New ports collection makefile for:	texi2html
# Date created:				5 Nov 1997
# Whom:					Ian Vaudrey <i.vaudrey@bigfoot.com>
#
# $MidnightBSD: mports/textproc/texi2html/Makefile,v 1.1 2006/09/25 16:11:04 laffer1 Exp $
# $FreeBSD: ports/textproc/texi2html/Makefile,v 1.22 2005/02/14 22:05:53 roam Exp $
#

PORTNAME=	texi2html
PORTVERSION=	1.76
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	hrs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Texinfo to HTML converter
LICENSE=        gpl2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PERL=${PERL}
CONFIGURE_ARGS=	--disable-multiplatform
USE_PERL5_RUN=	yes
USE_GMAKE=	yes

PROGRAM_PREFIX?=
PLIST_SUB=	PROGRAM_PREFIX=${PROGRAM_PREFIX}

.if !empty(PROGRAM_PREFIX)
CONFIGURE_ARGS=	--program-prefix="${PROGRAM_PREFIX}"
.endif

MAN1=		${PROGRAM_PREFIX}texi2html.1
INFO=		texi2html

pre-everything::
	@${ECHO} ""
	@${ECHO} "You can define the PROGRAM_PREFIX variable to change the name that"
	@${ECHO} "the texi2html program is installed as."
	@${ECHO} ""

post-patch:
	sleep 2
	${TOUCH} ${WRKSRC}/translations.pl

.include <bsd.port.mk>
