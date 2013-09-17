#
# $MidnightBSD$

PORTNAME=	facile
PORTVERSION=	1.1
CATEGORIES=	math
MASTER_SITES=	http://www.recherche.enac.fr/log/facile/distrib/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Functional Constraint Library
LICENSE=	lgpl

USE_OCAML=	yes
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
ALL_TARGET=	compile


FACILEDIR=	${PREFIX}/lib/ocaml/facile


FAKE_MAKEARGS=  FACILEDIR=${FAKE_DESTDIR}${FACILEDIR}


pre-install:
	@${MKDIR} ${FACILEDIR}

post-patch:
	${REINPLACE_CMD} -e "s,make,${GMAKE},; \
		s,cp,${INSTALL_DATA}," ${WRKSRC}/Makefile



.include <bsd.port.mk>
