# New ports collection makefile for:	libcheck
# Date created:		December 4, 2003
# Whom:			mikeh@FreeBSD.org
#
# $FreeBSD: ports/devel/libcheck/Makefile,v 1.4 2006/12/25 22:42:18 mikeh Exp $
# $MidnightBSD: mports/devel/libcheck/Makefile,v 1.1 2007/10/02 21:43:21 ctriv Exp $
#

PORTNAME=	libcheck
PORTVERSION=	0.9.8
CATEGORIES=	devel
MASTER_SITES=	SF/check/check/${PORTVERSION}
DISTNAME=	check-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A unit test framework for C
LICENSE=	gpl

GNU_CONFIGURE=	yes
PLIST_SUB=	CHECK_VERSION=${PORTVERSION}
USE_GMAKE=	yes
USE_LDCONFIG=	yes

DOCSDIR=	${PREFIX}/share/doc/check-${PORTVERSION}
EXAMPLESDIR=	${PREFIX}/share/examples/check-${PORTVERSION}

INFO=		check

post-patch:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} \
		-e '/^install-data-am:/ s/ install-docDATA//' \
		${WRKSRC}/Makefile.in
.endif
.if defined(NOPORTEXAMPLES)
	@${REINPLACE_CMD} \
		-e '/^install-data-am:/ s/ install-exampleDATA//' \
		-e '/^install-data-am:/ s/ install-examplesrcDATA//' \
		-e '/install-exampletestsDATA/ s/install-exampletestsDATA//' \
		${WRKSRC}/doc/Makefile.in
.endif

.include <bsd.port.mk>
