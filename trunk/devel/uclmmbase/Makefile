# New ports collection makefile for:	uclmmbase
# Date created:				Thanksgiving Day, 1999
# Whom:	      				Garrett Wollman <wollman@lcs.mit.edu>
#
# $MidnightBSD: mports/devel/uclmmbase/Makefile,v 1.3 2008/10/16 21:55:32 laffer1 Exp $
# $FreeBSD: ports/devel/uclmmbase/Makefile,v 1.12 2005/04/12 17:16:21 mi Exp $
#

PORTNAME=	uclmmbase
PORTVERSION=	1.2.18
CATEGORIES=	devel ipv6
MASTER_SITES=	http://aldan.algebra.com/~mi/port-stuff/
DISTNAME=	common-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common subroutines for UCL mbone applications
LICENSE=	bsd4

WRKSRC=		${WRKDIR}/common
GNU_CONFIGURE=	yes
USE_OPENSSL=	yes

FAKE_OPTS=    trueprefix

.ifndef (NO_INET6)
CONFIGURE_ARGS=	--enable-ipv6
.endif
USE_XZ=		yes
MAKE_JOBS_SAFE=	yes

post-configure:
	@for f in ${FILESDIR}/*.bsd ; do \
		${LN} -sf $$f ${WRKSRC}/src/`${BASENAME} $$f .bsd` ; \
	done

# Run the test, and fail if we hit an error. Don't fail in case of
# the networking-error, which may be due IPv6 (or IPv4) being unavailable
# or some network (mis)configuration:
post-build test:
	cd ${WRKSRC} && tests/test-libcommon 2>&1 | ${AWK} '	\
		/fail$$/ && $$2 != "networking" { code=1 }	\
		{ print } END { exit code }'

do-install:
	${MKDIR} ${PREFIX}/include/uclmmbase
	cd ${WRKSRC}/src && \
		${SET_ENV} ${MAKE_ENV} ${FAKE_SETUP} ${MAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.mk>
