# $MidnightBSD: mports/devel/re2c/Makefile,v 1.5 2010/01/30 17:12:31 laffer1 Exp $
# $FreeBSD: ports/devel/re2c/Makefile,v 1.21 2007/06/16 19:43:13 sat Exp $

PORTNAME=	re2c
PORTVERSION=	0.13.5
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile regular expression to C (much faster final code than flex)
LICENSE=	unknown

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		re2c.1

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	${CP} -R ${WRKSRC}/doc/* ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/examples/* ${EXAMPLESDIR}
.endif
.include <bsd.port.mk>
