# New ports collection makefile for:	texi2html
# Date created:				5 Nov 1997
# Whom:					Ian Vaudrey <i.vaudrey@bigfoot.com>
#
# $MidnightBSD: mports/textproc/texi2html/Makefile,v 1.2 2008/05/12 18:45:56 crash Exp $
# $FreeBSD: ports/textproc/texi2html/Makefile,v 1.22 2005/02/14 22:05:53 roam Exp $
#

PORTNAME=	texi2html
PORTVERSION=	1.82
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

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
	${TOUCH} ${WRKSRC}/translations.pl
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e 's| install-texinfohtmlDATA||g' ${WRKSRC}/doc/Makefile.in
.endif

.include <bsd.port.mk>
