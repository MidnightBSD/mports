# $FreeBSD: ports/devel/libcheck/Makefile,v 1.4 2006/12/25 22:42:18 mikeh Exp $
# $MidnightBSD$

PORTNAME=	libcheck
PORTVERSION=	0.9.11
CATEGORIES=	devel
MASTER_SITES=	SF/check/check/${PORTVERSION}
DISTNAME=	check-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unit test framework for C

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	DOCS EXAMPLES

CONFIGURE_ENV=	ac_cv_path_AWK_PATH=${AWK}
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gmake pathfix

INFO=		check

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} \
		-e 's|COPYING.LESSER||' \
		-e '/^docdir = / s|$$(PACKAGE)|${PORTNAME}|' \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} \
		-e '/^exampledir = / s|(docdir)/example|(datadir)/examples/${PORTNAME}|' \
		-e '/^example[a-z]*dir = / s|(docdir)/example/|(exampledir)/|' \
			${WRKSRC}/doc/Makefile.in
.if !${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e '/^install-data-am:/ s| install-docDATA||' ${WRKSRC}/Makefile.in
.endif
.if !${PORT_OPTIONS:MEXAMPLES}
	@${REINPLACE_CMD} \
		-e '/^install-data-am:/ s| install-exampleDATA install-examplesrcDATA||' \
		-e 's|install-exampletestsDATA ||' \
			${WRKSRC}/doc/Makefile.in
.endif

post-build:
	@${STRIP_CMD} ${WRKSRC}/src/.libs/libcheck.so.0

.include <bsd.port.mk>
