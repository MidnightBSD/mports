# $MidnightBSD$
# $FreeBSD: ports/devel/re2c/Makefile,v 1.21 2007/06/16 19:43:13 sat Exp $

PORTNAME=	re2c
PORTVERSION=	0.14.3
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile regular expression to C (much faster final code than flex)

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/README
# license mention is at the bottom

OPTIONS_DEFINE=	DOCS EXAMPLES

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd9.1

PLIST_FILES=	bin/re2c \
		man/man1/re2c.1.gz
PORTDOCS=	*
PORTEXAMPLES=	*

post-install:
	@${MKDIR} ${DOCSDIR}/
	cd ${WRKSRC}/doc/ && ${COPYTREE_SHARE} . ${DOCSDIR}/
	@${MKDIR} ${EXAMPLESDIR}/
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${EXAMPLESDIR}/

.include <bsd.port.mk>
